using Microsoft.AspNetCore.Mvc;

namespace VfAWeb.Controllers
{
    public class InboxController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
