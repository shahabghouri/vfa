using VfA.DataAccess.Repository.IRepository;
using VfA.Models;
using VfA.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Security.Claims;
using VfA.Models.ViewModels;
using System.Collections.Generic;
using Microsoft.IdentityModel.Tokens;

namespace VfAWeb.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IUnitOfWork _unitOfWork;

        public HomeController(ILogger<HomeController> logger, IUnitOfWork unitOfWork)
        {
            _logger = logger;
            _unitOfWork = unitOfWork;
        }

        public IActionResult Index()
        {
            HomeVM homeVm = new HomeVM();
            try
            {
                var products = _unitOfWork.Product.GetAll(includeProperties: "Category,ProductImages").ToList();
                var services = _unitOfWork.Service.GetAll(includeProperties: "Category,ServiceImages").ToList();
                var requests = _unitOfWork.Request.GetAll(includeProperties: "Category,RequestImages").ToList();
                homeVm.Products = products;
                homeVm.Services = services;
                homeVm.Requests = requests;
                homeVm.Partners = _unitOfWork.Partner.GetAll(includeProperties: "PartnerImages").ToList();
                homeVm.Trusts = _unitOfWork.Trust.GetAll(includeProperties: "TrustImages").ToList();
            }
            catch (Exception ex)
            {
                throw;
            }
            return View(homeVm);
        }

        public IActionResult Services()
        {

            IEnumerable<Service> serviceList = _unitOfWork.Service.GetAll(includeProperties: "Category,ServiceImages");
            return View(serviceList);
        }

        public IActionResult Requests()
        {

            IEnumerable<Request> requestList = _unitOfWork.Request.GetAll(includeProperties: "Category,RequestImages");
            return View(requestList);
        }

        public IActionResult Products()
        {
            IEnumerable<Product> requestList = _unitOfWork.Product.GetAll(includeProperties: "Category,ProductImages");
            return View(requestList);
        }
        public IActionResult About()
        {
            return View();
        }
        public IActionResult Info()
        {
            return View();
        }
        public IActionResult Privacy()
        {
            return View();
        }
        public IActionResult Terms()
        {
            return View();
        }
        public IActionResult Partner()
        {
            return View();
        }
        public IActionResult Trust()
        {
            return View();
        }
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
        public IActionResult ProductDetails(int Id)
        {
            Product objProduct = _unitOfWork.Product.Get(x => x.Id == Id, includeProperties: "Category,ProductImages");
            return View(objProduct);
        }
        public IActionResult ServiceDetails(int Id)
        {
            Service objService = _unitOfWork.Service.Get(x => x.Id == Id, includeProperties: "Category,ServiceImages");
            return View(objService);
        }
        public IActionResult RequestDetails(int Id)
        {
            Request objRequest = _unitOfWork.Request.Get(x => x.Id == Id, includeProperties: "Category,RequestImages");
            return View(objRequest);
        }
        public IActionResult search(SearchVM searchVm)
        {
            try
            {
                string searchKeyword = searchVm.searchkeyword.ToLower(); // Ensure search keyword is lowercase
                searchVm.GenericModelList = new List<GenericModelPSR>();
                List<Product> Products = new List<Product>();
                List<Service> Services = new List<Service>();
                List<Request> Requests = new List<Request>();
                switch (searchVm.SearchKeyword.ToLower())
                {
                    case "product":
                        Products = _unitOfWork.Product.GetAll(includeProperties: "Category,ProductImages").Where(x => x.Name.ToLower().Contains(searchKeyword)).ToList();
                        searchVm.GenericModelList = Products.Select(s => new GenericModelPSR
                        {
                            Id = s.Id,
                            Name = s.Name,
                            CatName = s.Category != null ? s.Category.Name : null,
                            ImgUrl = s.ProductImages != null && s.ProductImages.Any() ? s.ProductImages.FirstOrDefault().ImageUrl : null
                        }).ToList();
                        break;
                    case "service":
                        Services = _unitOfWork.Service.GetAll(includeProperties: "Category,ServiceImages").Where(x => x.Name.ToLower().Contains(searchKeyword)).ToList();
                        searchVm.GenericModelList = Services.Select(s => new GenericModelPSR
                        {
                            Id = s.Id,
                            Name = s.Name,
                            CatName = s.Category != null ? s.Category.Name : null,
                            ImgUrl = s.ServiceImages != null && s.ServiceImages.Any() ? s.ServiceImages.FirstOrDefault().ImageUrl : null
                        }).ToList();
                        break;
                    case "request":
                        Requests = _unitOfWork.Request.GetAll(includeProperties: "Category,RequestImages").Where(x => x.Name.ToLower().Contains(searchKeyword)).ToList();
                        searchVm.GenericModelList = Requests.Select(s => new GenericModelPSR
                        {
                            Id = s.Id,
                            Name = s.Name,
                            CatName = s.Category != null ? s.Category.Name : null,
                            ImgUrl = s.RequestImages != null && s.RequestImages.Any() ? s.RequestImages.FirstOrDefault().ImageUrl : null
                        }).ToList();
                        break;
                    default:
                        break;
                }
                if (!searchVm.GenericModelList.Any())
                {
                    return Json(new { status = "failed" });
                }
            }
            catch (Exception)
            {
                return Json(new { status = "failed" });
                //throw;
            }
            // Now you can use listContent which will contain the filtered list based on the switch case
            return View(searchVm);
        }
    }
}