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
    public class InfoController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IWebHostEnvironment _webHostEnvironment;
        public InfoController(IUnitOfWork unitOfWork, IWebHostEnvironment webHostEnvironment)
        {
            _unitOfWork = unitOfWork;
            _webHostEnvironment = webHostEnvironment;
        }
        public IActionResult Index()
        {
            List<Info> objInfoList = _unitOfWork.Info.GetAll().ToList();

            return View(objInfoList);
        }

        public IActionResult Upsert(int? id)
        {
            InfoVM infoVM = new()
            {
                
                Info = new Info()
            };
            if (id == null || id == 0)
            {
                //create
                return View(infoVM);
            }
            else
            {
                //update
                infoVM.Info = _unitOfWork.Info.Get(u => u.Id == id, includeProperties: "InfoImages");
                return View(infoVM);
            }

        }
        [HttpPost]
        public IActionResult Upsert(InfoVM infoVM, List<IFormFile> files)
        {
            if (ModelState.IsValid)
            {
                if (infoVM.Info.Id == 0)
                {
                    _unitOfWork.Info.Add(infoVM.Info);
                }
                else
                {
                    _unitOfWork.Info.Update(infoVM.Info);
                }

                _unitOfWork.Save();


                string wwwRootPath = _webHostEnvironment.WebRootPath;
                if (files != null)
                {

                    foreach (IFormFile file in files)
                    {
                        string fileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
                        string infoPath = @"images\infos\info-" + infoVM.Info.Id;
                        string finalPath = Path.Combine(wwwRootPath, infoPath);

                        if (!Directory.Exists(finalPath))
                            Directory.CreateDirectory(finalPath);

                        using (var fileStream = new FileStream(Path.Combine(finalPath, fileName), FileMode.Create))
                        {
                            file.CopyTo(fileStream);
                        }

                        InfoImage infoImage = new()
                        {
                            ImageUrl = @"\" + infoPath + @"\" + fileName,
                            InfoId = infoVM.Info.Id,
                        };

                        if (infoVM.Info.InfoImages == null)
                            infoVM.Info.InfoImages = new List<InfoImage>();

                        infoVM.Info.InfoImages.Add(infoImage);

                    }

                    _unitOfWork.Info.Update(infoVM.Info);
                    _unitOfWork.Save();




                }


                TempData["success"] = "Info created/updated successfully";
                return RedirectToAction("Index");
            }
            else
            {

                return View(infoVM);
            }
        }


        public IActionResult DeleteImage(int imageId)
        {
            var imageToBeDeleted = _unitOfWork.InfoImage.Get(u => u.Id == imageId);
            int infoId = imageToBeDeleted.InfoId;
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

                _unitOfWork.InfoImage.Remove(imageToBeDeleted);
                _unitOfWork.Save();

                TempData["success"] = "Deleted successfully";
            }

            return RedirectToAction(nameof(Upsert), new { id = infoId });
        }

        #region API CALLS

        [HttpGet]
        public IActionResult GetAll()
        {
            List<Info> objInfoList = _unitOfWork.Info.GetAll(includeProperties: "Category").ToList();
            return Json(new { data = objInfoList });
        }


        [HttpDelete]
        public IActionResult Delete(int? id)
        {
            var infoToBeDeleted = _unitOfWork.Info.Get(u => u.Id == id);
            if (infoToBeDeleted == null)
            {
                return Json(new { success = false, message = "Error while deleting" });
            }

            string infoPath = @"images\infos\info-" + id;
            string finalPath = Path.Combine(_webHostEnvironment.WebRootPath, infoPath);

            if (Directory.Exists(finalPath))
            {
                string[] filePaths = Directory.GetFiles(finalPath);
                foreach (string filePath in filePaths)
                {
                    System.IO.File.Delete(filePath);
                }

                Directory.Delete(finalPath);
            }


            _unitOfWork.Info.Remove(infoToBeDeleted);
            _unitOfWork.Save();

            return Json(new { success = true, message = "Delete Successful" });
        }

        #endregion
    }
}
