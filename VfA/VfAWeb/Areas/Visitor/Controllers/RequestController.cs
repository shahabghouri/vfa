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
using VfA.DataAccess.Common;

namespace VfAWeb.Areas.Visitor.Controllers
{
    [Area("Visitor")]
    [Authorize(Roles = $"{SD.Role_Importer},{SD.Role_Exporter}")]
    public class RequestController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IWebHostEnvironment _webHostEnvironment;
        ApplicationUser _user;
        public RequestController(IUnitOfWork unitOfWork, IWebHostEnvironment webHostEnvironment)
        {
            _unitOfWork = unitOfWork;
            _webHostEnvironment = webHostEnvironment;
            _user = UserSession.GetUser();
        }
        public IActionResult Index() 
        {
            List<Request> objRequestList = _unitOfWork.Request.GetAll(includeProperties:"Category").Where(x=>x.UserId == _user.Id).ToList();
           
            return View(objRequestList);
        }

        public IActionResult Upsert(int? id)
        {
            RequestVM requestVM = new()
            {
                CategoryList = _unitOfWork.Category.GetAll().Select(u => new SelectListItem
                {
                    Text = u.Name,
                    Value = u.Id.ToString()
                }),
                Request = new Request()
            };
            if (id == null || id == 0)
            {
                //create
                return View(requestVM);
            }
            else
            {
                //update
                requestVM.Request = _unitOfWork.Request.Get(u=>u.Id==id,includeProperties:"RequestImages");
                return View(requestVM);
            }
            
        }
        [HttpPost]
        public IActionResult Upsert(RequestVM requestVM, List<IFormFile> files)
        {
            if (ModelState.IsValid)
            {
                requestVM.Request.UserId = _user.Id;
                if (requestVM.Request.Id == 0) {
                    _unitOfWork.Request.Add(requestVM.Request);
                }
                else {
                    _unitOfWork.Request.Update(requestVM.Request);
                }
                _unitOfWork.Save();
                string wwwRootPath = _webHostEnvironment.WebRootPath;
                if (files != null)
                {
                    foreach(IFormFile file in files) 
                    {
                        string fileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
                        string requestPath = @"images\requests\request-" + requestVM.Request.Id;
                        string finalPath = Path.Combine(wwwRootPath, requestPath);

                        if (!Directory.Exists(finalPath))
                            Directory.CreateDirectory(finalPath);

                        using (var fileStream = new FileStream(Path.Combine(finalPath, fileName), FileMode.Create)) {
                            file.CopyTo(fileStream);
                        }

                        RequestImage requestImage = new() {
                            ImageUrl = @"\" + requestPath + @"\" + fileName,
                            RequestId=requestVM.Request.Id,
                        };

                        if (requestVM.Request.RequestImages == null)
                            requestVM.Request.RequestImages = new List<RequestImage>();

                        requestVM.Request.RequestImages.Add(requestImage);

                    }
                    _unitOfWork.Request.Update(requestVM.Request);
                    _unitOfWork.Save();
                }
                TempData["success"] = "Request created/updated successfully";
                return RedirectToAction("Index");
            }
            else
            {
                requestVM.CategoryList = _unitOfWork.Category.GetAll().Select(u => new SelectListItem
                {
                    Text = u.Name,
                    Value = u.Id.ToString()
                });
                return View(requestVM);
            }
        }


        public IActionResult DeleteImage(int imageId) {
            var imageToBeDeleted = _unitOfWork.RequestImage.Get(u => u.Id == imageId);
            int requestId = imageToBeDeleted.RequestId;
            if (imageToBeDeleted != null) {
                if (!string.IsNullOrEmpty(imageToBeDeleted.ImageUrl)) {
                    var oldImagePath =
                                   Path.Combine(_webHostEnvironment.WebRootPath,
                                   imageToBeDeleted.ImageUrl.TrimStart('\\'));

                    if (System.IO.File.Exists(oldImagePath)) {
                        System.IO.File.Delete(oldImagePath);
                    }
                }

                _unitOfWork.RequestImage.Remove(imageToBeDeleted);
                _unitOfWork.Save();

                TempData["success"] = "Deleted successfully";
            }

            return RedirectToAction(nameof(Upsert), new { id = requestId });
        }

        #region API CALLS

        [HttpGet]
        public IActionResult GetAll()
        {
            List<Request> objRequestList = _unitOfWork.Request.GetAll(includeProperties: "Category").Where(x => x.UserId == _user.Id).ToList();
            return Json(new { data = objRequestList });
        }


        [HttpDelete]
        public IActionResult Delete(int? id)
        {
            var requestToBeDeleted = _unitOfWork.Request.Get(u => u.Id == id);
            if (requestToBeDeleted == null)
            {
                return Json(new { success = false, message = "Error while deleting" });
            }

            string requestPath = @"images\requests\request-" + id;
            string finalPath = Path.Combine(_webHostEnvironment.WebRootPath, requestPath);

            if (Directory.Exists(finalPath)) {
                string[] filePaths = Directory.GetFiles(finalPath);
                foreach (string filePath in filePaths) {
                    System.IO.File.Delete(filePath);
                }

                Directory.Delete(finalPath);
            }


            _unitOfWork.Request.Remove(requestToBeDeleted);
            _unitOfWork.Save();

            return Json(new { success = true, message = "Delete Successful" });
        }

        #endregion
    }
}
