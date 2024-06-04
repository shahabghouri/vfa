using VfA.DataAccess.Repository.IRepository;
using VfA.Models;
using VfA.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using System.Security.Claims;

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
            
            IEnumerable<Product> productList = _unitOfWork.Product.GetAll(includeProperties: "Category,ProductImages");
            return View(productList);
            
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
    }
}