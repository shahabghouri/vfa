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
    public class PartnerController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IWebHostEnvironment _webHostEnvironment;
        public PartnerController(IUnitOfWork unitOfWork, IWebHostEnvironment webHostEnvironment)
        {
            _unitOfWork = unitOfWork;
            _webHostEnvironment = webHostEnvironment;
        }
        public IActionResult Index() 
        {
            List<Partner> objPartnerList = _unitOfWork.Partner.GetAll().ToList();
           
            return View(objPartnerList);
        }

        public IActionResult Upsert(int? id)
        {
            PartnerVM partnerVM = new()
            {
                
                Partner = new Partner()
            };
            if (id == null || id == 0)
            {
                //create
                return View(partnerVM);
            }
            else
            {
                //update
                partnerVM.Partner = _unitOfWork.Partner.Get(u=>u.Id==id,includeProperties:"PartnerImages");
                return View(partnerVM);
            }
            
        }
        [HttpPost]
        public IActionResult Upsert(PartnerVM partnerVM, List<IFormFile> files)
        {
            if (ModelState.IsValid)
            {
                if (partnerVM.Partner.Id == 0) {
                    _unitOfWork.Partner.Add(partnerVM.Partner);
                }
                else {
                    _unitOfWork.Partner.Update(partnerVM.Partner);
                }

                _unitOfWork.Save();


                string wwwRootPath = _webHostEnvironment.WebRootPath;
                if (files != null)
                {

                    foreach(IFormFile file in files) 
                    {
                        string fileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
                        string partnerPath = @"images\partners\partner-" + partnerVM.Partner.Id;
                        string finalPath = Path.Combine(wwwRootPath, partnerPath);

                        if (!Directory.Exists(finalPath))
                            Directory.CreateDirectory(finalPath);

                        using (var fileStream = new FileStream(Path.Combine(finalPath, fileName), FileMode.Create)) {
                            file.CopyTo(fileStream);
                        }

                        PartnerImage partnerImage = new() {
                            ImageUrl = @"\" + partnerPath + @"\" + fileName,
                            PartnerId=partnerVM.Partner.Id,
                        };

                        if (partnerVM.Partner.PartnerImages == null)
                            partnerVM.Partner.PartnerImages = new List<PartnerImage>();

                        partnerVM.Partner.PartnerImages.Add(partnerImage);

                    }

                    _unitOfWork.Partner.Update(partnerVM.Partner);
                    _unitOfWork.Save();




                }

                
                TempData["success"] = "Partner created/updated successfully";
                return RedirectToAction("Index");
            }
            else
            {
                
                return View(partnerVM);
            }
        }


        public IActionResult DeleteImage(int imageId) {
            var imageToBeDeleted = _unitOfWork.PartnerImage.Get(u => u.Id == imageId);
            int partnerId = imageToBeDeleted.PartnerId;
            if (imageToBeDeleted != null) {
                if (!string.IsNullOrEmpty(imageToBeDeleted.ImageUrl)) {
                    var oldImagePath =
                                   Path.Combine(_webHostEnvironment.WebRootPath,
                                   imageToBeDeleted.ImageUrl.TrimStart('\\'));

                    if (System.IO.File.Exists(oldImagePath)) {
                        System.IO.File.Delete(oldImagePath);
                    }
                }

                _unitOfWork.PartnerImage.Remove(imageToBeDeleted);
                _unitOfWork.Save();

                TempData["success"] = "Deleted successfully";
            }

            return RedirectToAction(nameof(Upsert), new { id = partnerId });
        }

        #region API CALLS

        [HttpGet]
        public IActionResult GetAll()
        {
            List<Partner> objPartnerList = _unitOfWork.Partner.GetAll().ToList();
            return Json(new { data = objPartnerList });
        }


        [HttpDelete]
        public IActionResult Delete(int? id)
        {
            var partnerToBeDeleted = _unitOfWork.Partner.Get(u => u.Id == id);
            if (partnerToBeDeleted == null)
            {
                return Json(new { success = false, message = "Error while deleting" });
            }

            string partnerPath = @"images\partners\partner-" + id;
            string finalPath = Path.Combine(_webHostEnvironment.WebRootPath, partnerPath);

            if (Directory.Exists(finalPath)) {
                string[] filePaths = Directory.GetFiles(finalPath);
                foreach (string filePath in filePaths) {
                    System.IO.File.Delete(filePath);
                }

                Directory.Delete(finalPath);
            }


            _unitOfWork.Partner.Remove(partnerToBeDeleted);
            _unitOfWork.Save();

            return Json(new { success = true, message = "Delete Successful" });
        }

        #endregion
    }
}
