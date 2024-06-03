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
    public class AboutController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IWebHostEnvironment _webHostEnvironment;
        public AboutController(IUnitOfWork unitOfWork, IWebHostEnvironment webHostEnvironment)
        {
            _unitOfWork = unitOfWork;
            _webHostEnvironment = webHostEnvironment;
        }
        public IActionResult Index()
        {
            List<About> objAboutList = _unitOfWork.About.GetAll().ToList();

            return View(objAboutList);
        }

        public IActionResult Upsert(int? id)
        {
            AboutVM aboutVM = new()
            {
                
                About = new About()
            };
            if (id == null || id == 0)
            {
                //create
                return View(aboutVM);
            }
            else
            {
                //update
                aboutVM.About = _unitOfWork.About.Get(u => u.Id == id, includeProperties: "AboutImages");
                return View(aboutVM);
            }

        }
        [HttpPost]
        public IActionResult Upsert(AboutVM aboutVM, List<IFormFile> files)
        {
            if (ModelState.IsValid)
            {
                if (aboutVM.About.Id == 0)
                {
                    _unitOfWork.About.Add(aboutVM.About);
                }
                else
                {
                    _unitOfWork.About.Update(aboutVM.About);
                }

                _unitOfWork.Save();


                string wwwRootPath = _webHostEnvironment.WebRootPath;
                if (files != null)
                {

                    foreach (IFormFile file in files)
                    {
                        string fileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
                        string aboutPath = @"images\abouts\about-" + aboutVM.About.Id;
                        string finalPath = Path.Combine(wwwRootPath, aboutPath);

                        if (!Directory.Exists(finalPath))
                            Directory.CreateDirectory(finalPath);

                        using (var fileStream = new FileStream(Path.Combine(finalPath, fileName), FileMode.Create))
                        {
                            file.CopyTo(fileStream);
                        }

                        AboutImage aboutImage = new()
                        {
                            ImageUrl = @"\" + aboutPath + @"\" + fileName,
                            AboutId = aboutVM.About.Id,
                        };

                        if (aboutVM.About.AboutImages == null)
                            aboutVM.About.AboutImages = new List<AboutImage>();

                        aboutVM.About.AboutImages.Add(aboutImage);

                    }

                    _unitOfWork.About.Update(aboutVM.About);
                    _unitOfWork.Save();




                }


                TempData["success"] = "About created/updated successfully";
                return RedirectToAction("Index");
            }
            else
            {
                
                return View(aboutVM);
            }
        }


        public IActionResult DeleteImage(int imageId)
        {
            var imageToBeDeleted = _unitOfWork.AboutImage.Get(u => u.Id == imageId);
            int aboutId = imageToBeDeleted.AboutId;
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

                _unitOfWork.AboutImage.Remove(imageToBeDeleted);
                _unitOfWork.Save();

                TempData["success"] = "Deleted successfully";
            }

            return RedirectToAction(nameof(Upsert), new { id = aboutId });
        }

        #region API CALLS

        [HttpGet]
        public IActionResult GetAll()
        {
            List<About> objAboutList = _unitOfWork.About.GetAll().ToList();
            return Json(new { data = objAboutList });
        }


        [HttpDelete]
        public IActionResult Delete(int? id)
        {
            var aboutToBeDeleted = _unitOfWork.About.Get(u => u.Id == id);
            if (aboutToBeDeleted == null)
            {
                return Json(new { success = false, message = "Error while deleting" });
            }

            string aboutPath = @"images\abouts\about-" + id;
            string finalPath = Path.Combine(_webHostEnvironment.WebRootPath, aboutPath);

            if (Directory.Exists(finalPath))
            {
                string[] filePaths = Directory.GetFiles(finalPath);
                foreach (string filePath in filePaths)
                {
                    System.IO.File.Delete(filePath);
                }

                Directory.Delete(finalPath);
            }


            _unitOfWork.About.Remove(aboutToBeDeleted);
            _unitOfWork.Save();

            return Json(new { success = true, message = "Delete Successful" });
        }

        #endregion
    }
}
