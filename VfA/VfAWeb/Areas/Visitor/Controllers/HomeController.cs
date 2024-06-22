using VfA.DataAccess.Repository.IRepository;
using VfA.Models;
using VfA.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Security.Claims;
using VfA.DataAccess.Common;
using VfA.Models.ViewModels;

namespace VfAWeb.Areas.Visitor.Controllers
{
    [Area("Visitor")]
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
    }
}