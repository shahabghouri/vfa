using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json.Linq;
using System.Text.Json;
using VfA.DataAccess.Common;
using VfA.DataAccess.Repository.IRepository;
using VfA.Models;
using VfA.Models.ViewModels;

namespace VfAWeb.Areas.Visitor.Controllers
{
    [Area("Visitor")]
    public class ProfileController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        ApplicationUser? _user;

        public ProfileController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
            _user = UserSession.GetUser();
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
                    Company company = new Company();
                    company = _unitOfWork.Company.GetAll(includeProperties: "CompanyImages").Where(x => x.Id == _user.CompanyId).FirstOrDefault();
                    profileViewModel.CompnayName = company.Name;
                    var Logo = company.CompanyImages.FirstOrDefault();
                    if (Logo != null)
                    {
                        profileViewModel.CompnayLogo = Logo.ImageUrl;
                    }
                    if (_user.IsImporter)
                    {
                        profileViewModel.CountryName = _unitOfWork.Country.GetAll().Where(x => x.Id == company.CountryId).FirstOrDefault().Name;
                    }
                    if (_user.IsExporter)
                    {
                        profileViewModel.WilayaName = _unitOfWork.Wilaya.GetAll().Where(x => x.Id == company.WilayaId).FirstOrDefault().Name;
                    }
                    profileViewModel.ActivityName = _unitOfWork.CompanyActivity.GetAll().Where(x => x.Id == company.CompanyActivityId).FirstOrDefault().Name;
                    profileViewModel.UserType = _user.IsImporter ? "Impoter" : _user.IsExporter ? "Expoter" : "";
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
