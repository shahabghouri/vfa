using VfA.DataAccess.Repository.IRepository;
using VfA.DataAcess.Data;
using VfA.Models;
using VfA.Models.ViewModels;
using VfA.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Collections.Generic;
using System.Data;

namespace VfAWeb.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = SD.Role_Admin)]
    public class PrivacyController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IWebHostEnvironment _webHostEnvironment;
        public PrivacyController(IUnitOfWork unitOfWork, IWebHostEnvironment webHostEnvironment)
        {
            _unitOfWork = unitOfWork;
            _webHostEnvironment = webHostEnvironment;
        }
        public IActionResult Index()
        {
            List<Privacy> objPrivacyList = _unitOfWork.Privacy.GetAll().ToList();

            return View(objPrivacyList);
        }

        public IActionResult Upsert(int? id)
        {
            PrivacyVM privacyVM = new()
            {
                
                Privacy = new Privacy()
            };
            if (id == null || id == 0)
            {
                //create
                return View(privacyVM);
            }
            else
            {
                //update
                privacyVM.Privacy = _unitOfWork.Privacy.Get(u => u.Id == id, includeProperties: "PrivacyImages");
                return View(privacyVM);
            }

        }
        [HttpPost]
        public IActionResult Upsert(PrivacyVM privacyVM, List<IFormFile> files)
        {
            if (ModelState.IsValid)
            {
                if (privacyVM.Privacy.Id == 0)
                {
                    _unitOfWork.Privacy.Add(privacyVM.Privacy);
                }
                else
                {
                    _unitOfWork.Privacy.Update(privacyVM.Privacy);
                }

                _unitOfWork.Save();


                string wwwRootPath = _webHostEnvironment.WebRootPath;
                if (files != null)
                {

                    foreach (IFormFile file in files)
                    {
                        string fileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
                        string privacyPath = @"images\privacys\privacy-" + privacyVM.Privacy.Id;
                        string finalPath = Path.Combine(wwwRootPath, privacyPath);

                        if (!Directory.Exists(finalPath))
                            Directory.CreateDirectory(finalPath);

                        using (var fileStream = new FileStream(Path.Combine(finalPath, fileName), FileMode.Create))
                        {
                            file.CopyTo(fileStream);
                        }

                        PrivacyImage privacyImage = new()
                        {
                            ImageUrl = @"\" + privacyPath + @"\" + fileName,
                            PrivacyId = privacyVM.Privacy.Id,
                        };

                        if (privacyVM.Privacy.PrivacyImages == null)
                            privacyVM.Privacy.PrivacyImages = new List<PrivacyImage>();

                        privacyVM.Privacy.PrivacyImages.Add(privacyImage);

                    }

                    _unitOfWork.Privacy.Update(privacyVM.Privacy);
                    _unitOfWork.Save();




                }


                TempData["success"] = "Privacy created/updated successfully";
                return RedirectToAction("Index");
            }
            else
            {
                
                return View(privacyVM);
            }
        }


        public IActionResult DeleteImage(int imageId)
        {
            var imageToBeDeleted = _unitOfWork.PrivacyImage.Get(u => u.Id == imageId);
            int privacyId = imageToBeDeleted.PrivacyId;
            if (imageToBeDeleted != null)
            {
                if (!string.IsNullOrEmpty(imageToBeDeleted.ImageUrl))
                {
                    var oldImagePath =
                                   Path.Combine(_webHostEnvironment.WebRootPath,
                                   imageToBeDeleted.ImageUrl.TrimStart('\\'));

                    if (System.IO.File.Exists(oldImagePath))
                    {
                        System.IO.File.Delete(oldImagePath);
                    }
                }

                _unitOfWork.PrivacyImage.Remove(imageToBeDeleted);
                _unitOfWork.Save();

                TempData["success"] = "Deleted successfully";
            }

            return RedirectToAction(nameof(Upsert), new { id = privacyId });
        }

        #region API CALLS

        [HttpGet]
        public IActionResult GetAll()
        {
            List<Privacy> objPrivacyList = _unitOfWork.Privacy.GetAll(includeProperties: "Category").ToList();
            return Json(new { data = objPrivacyList });
        }


        [HttpDelete]
        public IActionResult Delete(int? id)
        {
            var privacyToBeDeleted = _unitOfWork.Privacy.Get(u => u.Id == id);
            if (privacyToBeDeleted == null)
            {
                return Json(new { success = false, message = "Error while deleting" });
            }

            string privacyPath = @"images\privacys\privacy-" + id;
            string finalPath = Path.Combine(_webHostEnvironment.WebRootPath, privacyPath);

            if (Directory.Exists(finalPath))
            {
                string[] filePaths = Directory.GetFiles(finalPath);
                foreach (string filePath in filePaths)
                {
                    System.IO.File.Delete(filePath);
                }

                Directory.Delete(finalPath);
            }


            _unitOfWork.Privacy.Remove(privacyToBeDeleted);
            _unitOfWork.Save();

            return Json(new { success = true, message = "Delete Successful" });
        }

        #endregion
    }
}
