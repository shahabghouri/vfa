using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using VfA.DataAccess.Common;
using VfA.DataAccess.Repository.IRepository;
using VfA.Models;
using VfA.Models.ViewModels;
using VfA.Utility;

namespace VfAWeb.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = SD.Role_Admin)]
    public class CompanyActivityController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IWebHostEnvironment _webHostEnvironment;
        ApplicationUser _user;
        public CompanyActivityController(IUnitOfWork unitOfWork, IWebHostEnvironment webHostEnvironment)
        {
            _unitOfWork = unitOfWork;
            _webHostEnvironment = webHostEnvironment;
            _user = UserSession.GetUser();
        }
        public IActionResult Index()
        {
            List<CompanyActivity> objActivityList = _unitOfWork.CompanyActivity.GetAll().ToList();
            return View(objActivityList);
        }
        public IActionResult Upsert(int? id)
        {
            CompanyActivityVM companyActivityVM = new()
            {
                CompanyActivity = new CompanyActivity()
            };
            if (id == null || id == 0)
            {
                //create
                return View(companyActivityVM);
            }
            else
            {
                //update
                companyActivityVM.CompanyActivity = _unitOfWork.CompanyActivity.Get(u => u.Id == id);
                return View(companyActivityVM);
            }

        }
        [HttpPost]
        public IActionResult Upsert(CompanyActivityVM CompanyActivityVM, List<IFormFile> files)
        {
            if (ModelState.IsValid)
            {
                if (CompanyActivityVM.CompanyActivity.Id == 0)
                {
                    _unitOfWork.CompanyActivity.Add(CompanyActivityVM.CompanyActivity);
                }
                else
                {
                    _unitOfWork.CompanyActivity.Update(CompanyActivityVM.CompanyActivity);
                }
                _unitOfWork.Save();
                TempData["success"] = "CompanyActivity created/updated successfully";
                return RedirectToAction("Index");
            }
            else
            {
                return View(CompanyActivityVM);
            }
        }
        #region API CALLS

        [HttpGet]
        public IActionResult GetAll()
        {
            List<CompanyActivity> objCompanyActivityList = _unitOfWork.CompanyActivity.GetAll().ToList();
            return Json(new { data = objCompanyActivityList });
        }


        [HttpDelete]
        public IActionResult Delete(int? id)
        {
            var CompanyActivityToBeDeleted = _unitOfWork.CompanyActivity.Get(u => u.Id == id);
            if (CompanyActivityToBeDeleted == null)
            {
                return Json(new { success = false, message = "Error while deleting" });
            }
            _unitOfWork.CompanyActivity.Remove(CompanyActivityToBeDeleted);
            _unitOfWork.Save();
            return Json(new { success = true, message = "Delete Successful" });
        }
        #endregion
    }
}
