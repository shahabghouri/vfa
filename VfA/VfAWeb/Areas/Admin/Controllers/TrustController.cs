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
    public class TrustController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IWebHostEnvironment _webHostEnvironment;
        public TrustController(IUnitOfWork unitOfWork, IWebHostEnvironment webHostEnvironment)
        {
            _unitOfWork = unitOfWork;
            _webHostEnvironment = webHostEnvironment;
        }
        public IActionResult Index()
        {
            List<Trust> objTrustList = _unitOfWork.Trust.GetAll().ToList();

            return View(objTrustList);
        }

        public IActionResult Upsert(int? id)
        {
            TrustVM trustVM = new()
            {
                
                Trust = new Trust()
            };
            if (id == null || id == 0)
            {
                //create
                return View(trustVM);
            }
            else
            {
                //update
                trustVM.Trust = _unitOfWork.Trust.Get(u => u.Id == id, includeProperties: "TrustImages");
                return View(trustVM);
            }

        }
        [HttpPost]
        public IActionResult Upsert(TrustVM trustVM, List<IFormFile> files)
        {
            if (ModelState.IsValid)
            {
                if (trustVM.Trust.Id == 0)
                {
                    _unitOfWork.Trust.Add(trustVM.Trust);
                }
                else
                {
                    _unitOfWork.Trust.Update(trustVM.Trust);
                }

                _unitOfWork.Save();


                string wwwRootPath = _webHostEnvironment.WebRootPath;
                if (files != null)
                {

                    foreach (IFormFile file in files)
                    {
                        string fileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
                        string trustPath = @"images\trusts\trust-" + trustVM.Trust.Id;
                        string finalPath = Path.Combine(wwwRootPath, trustPath);

                        if (!Directory.Exists(finalPath))
                            Directory.CreateDirectory(finalPath);

                        using (var fileStream = new FileStream(Path.Combine(finalPath, fileName), FileMode.Create))
                        {
                            file.CopyTo(fileStream);
                        }

                        TrustImage trustImage = new()
                        {
                            ImageUrl = @"\" + trustPath + @"\" + fileName,
                            TrustId = trustVM.Trust.Id,
                        };

                        if (trustVM.Trust.TrustImages == null)
                            trustVM.Trust.TrustImages = new List<TrustImage>();

                        trustVM.Trust.TrustImages.Add(trustImage);

                    }

                    _unitOfWork.Trust.Update(trustVM.Trust);
                    _unitOfWork.Save();




                }


                TempData["success"] = "Trust created/updated successfully";
                return RedirectToAction("Index");
            }
            else
            {
                
                return View(trustVM);
            }
        }


        public IActionResult DeleteImage(int imageId)
        {
            var imageToBeDeleted = _unitOfWork.TrustImage.Get(u => u.Id == imageId);
            int trustId = imageToBeDeleted.TrustId;
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

                _unitOfWork.TrustImage.Remove(imageToBeDeleted);
                _unitOfWork.Save();

                TempData["success"] = "Deleted successfully";
            }

            return RedirectToAction(nameof(Upsert), new { id = trustId });
        }

        #region API CALLS

        [HttpGet]
        public IActionResult GetAll()
        {
            List<Trust> objTrustList = _unitOfWork.Trust.GetAll().ToList();
            return Json(new { data = objTrustList });
        }


        [HttpDelete]
        public IActionResult Delete(int? id)
        {
            var trustToBeDeleted = _unitOfWork.Trust.Get(u => u.Id == id);
            if (trustToBeDeleted == null)
            {
                return Json(new { success = false, message = "Error while deleting" });
            }

            string trustPath = @"images\trusts\trust-" + id;
            string finalPath = Path.Combine(_webHostEnvironment.WebRootPath, trustPath);

            if (Directory.Exists(finalPath))
            {
                string[] filePaths = Directory.GetFiles(finalPath);
                foreach (string filePath in filePaths)
                {
                    System.IO.File.Delete(filePath);
                }

                Directory.Delete(finalPath);
            }


            _unitOfWork.Trust.Remove(trustToBeDeleted);
            _unitOfWork.Save();

            return Json(new { success = true, message = "Delete Successful" });
        }

        #endregion
    }
}