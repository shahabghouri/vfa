using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using System.Diagnostics.Metrics;
using System.Text.Json;
using VfA.DataAccess.Repository.IRepository;
using VfA.Models;
using VfA.Models.ViewModels;

namespace VfAWeb.Areas.Visitor.Controllers
{
    [Area("Visitor")]
    public class ProfileController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IUserClaimsService _userClaimsService;
        //ApplicationUser? _user;
        UserClaimsVM _user;

        public ProfileController(IUnitOfWork unitOfWork, IUserClaimsService userClaimsService)
        {
            _unitOfWork = unitOfWork;
            //_user = UserSession.GetUser();
            _user = userClaimsService.GetUserClaims();
        }
        public IActionResult Index()
        {
            ProfileViewModel profileViewModel = new ProfileViewModel();
            try
            {
                if (_user != null)
                {
                    var products = _unitOfWork.Product.GetAll(includeProperties: "Category,ProductImages").Where(x => x.UserId == _user.Id).ToList();
                    var services = _unitOfWork.Service.GetAll(includeProperties: "Category,ServiceImages").Where(x => x.UserId == _user.Id).ToList();
                    var requests = _unitOfWork.Request.GetAll(includeProperties: "Category,RequestImages").Where(x => x.UserId == _user.Id).ToList();
                    profileViewModel.Products = products;
                    profileViewModel.Services = services;
                    profileViewModel.Requests = requests;
                    var company = _unitOfWork.Company.Get(x => x.Id == _user.CompanyId,includeProperties: "CompanyActivity,Category,CompanyImages");
                    profileViewModel.Company = company;
                    if (company != null)
                    {
                        profileViewModel.CompnayName = company.Name;
                        if (company.CompanyImages != null && company.CompanyImages.Count != 0)
                        {
                            var logo = company.CompanyImages.FirstOrDefault();
                            if (logo != null)
                            {
                                profileViewModel.CompnayLogo = logo.ImageUrl;
                            }
                        }
                        if (_user.IsImporter)
                        {
                            var country = _unitOfWork.Country.Get(x => x.Id == company.CountryId);
                            profileViewModel.CountryName = country != null ? country.Name : ""; 
                        }
                        if (_user.IsExporter)
                        {
                            var wilaya = _unitOfWork.Wilaya.Get(x => x.Id == company.WilayaId);
                            profileViewModel.WilayaName = wilaya != null ? wilaya.Name : "";
                        }
                        var companyActivity = _unitOfWork.CompanyActivity.Get(x => x.Id == company.CompanyActivityId);
                        profileViewModel.ActivityName = companyActivity != null ? companyActivity.Name : "";
                        profileViewModel.UserType = _user.IsImporter ? "Importer" : "Exporter";
                    }
                }
            }
            catch (Exception ex)
            {
                throw;
            }
            return View(profileViewModel);

        }
    }
}
