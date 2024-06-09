using Microsoft.AspNetCore.Mvc;

namespace VfAWeb.Areas.Visitor.Controllers
{
    [Area("Visitor")]
    public class ProfileController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
