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
    public class ServiceController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IWebHostEnvironment _webHostEnvironment;
        public ServiceController(IUnitOfWork unitOfWork, IWebHostEnvironment webHostEnvironment)
        {
            _unitOfWork = unitOfWork;
            _webHostEnvironment = webHostEnvironment;
        }
        public IActionResult Index()
        {
            List<Service> objServiceList = _unitOfWork.Service.GetAll(includeProperties: "Category").ToList();

            return View(objServiceList);
        }

        public IActionResult Upsert(int? id)
        {
            ServiceVM serviceVM = new()
            {
                CategoryList = _unitOfWork.Category.GetAll().Select(u => new SelectListItem
                {
                    Text = u.Name,
                    Value = u.Id.ToString()
                }),
                Service = new Service()
            };
            if (id == null || id == 0)
            {
                //create
                return View(serviceVM);
            }
            else
            {
                //update
                serviceVM.Service = _unitOfWork.Service.Get(u => u.Id == id, includeProperties: "ServiceImages");
                return View(serviceVM);
            }

        }
        [HttpPost]
        public IActionResult Upsert(ServiceVM serviceVM, List<IFormFile> files)
        {
            if (ModelState.IsValid)
            {
                if (serviceVM.Service.Id == 0)
                {
                    _unitOfWork.Service.Add(serviceVM.Service);
                }
                else
                {
                    _unitOfWork.Service.Update(serviceVM.Service);
                }
                _unitOfWork.Save();
                string wwwRootPath = _webHostEnvironment.WebRootPath;
                if (files != null)
                {
                    foreach (IFormFile file in files)
                    {
                        string fileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
                        string servicePath = @"images\services\service-" + serviceVM.Service.Id;
                        string finalPath = Path.Combine(wwwRootPath, servicePath);

                        if (!Directory.Exists(finalPath))
                            Directory.CreateDirectory(finalPath);

                        using (var fileStream = new FileStream(Path.Combine(finalPath, fileName), FileMode.Create))
                        {
                            file.CopyTo(fileStream);
                        }

                        ServiceImage serviceImage = new()
                        {
                            ImageUrl = @"\" + servicePath + @"\" + fileName,
                            ServiceId = serviceVM.Service.Id,
                        };

                        if (serviceVM.Service.ServiceImages == null)
                            serviceVM.Service.ServiceImages = new List<ServiceImage>();

                        serviceVM.Service.ServiceImages.Add(serviceImage);

                    }

                    _unitOfWork.Service.Update(serviceVM.Service);
                    _unitOfWork.Save();




                }


                TempData["success"] = "Service created/updated successfully";
                return RedirectToAction("Index");
            }
            else
            {
                serviceVM.CategoryList = _unitOfWork.Category.GetAll().Select(u => new SelectListItem
                {
                    Text = u.Name,
                    Value = u.Id.ToString()
                });
                return View(serviceVM);
            }
        }


        public IActionResult DeleteImage(int imageId)
        {
            var imageToBeDeleted = _unitOfWork.ServiceImage.Get(u => u.Id == imageId);
            int serviceId = imageToBeDeleted.ServiceId;
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

                _unitOfWork.ServiceImage.Remove(imageToBeDeleted);
                _unitOfWork.Save();

                TempData["success"] = "Deleted successfully";
            }

            return RedirectToAction(nameof(Upsert), new { id = serviceId });
        }

        #region API CALLS

        [HttpGet]
        public IActionResult GetAll()
        {
            List<Service> objServiceList = _unitOfWork.Service.GetAll(includeProperties: "Category").ToList();
            return Json(new { data = objServiceList });
        }


        [HttpDelete]
        public IActionResult Delete(int? id)
        {
            var serviceToBeDeleted = _unitOfWork.Service.Get(u => u.Id == id);
            if (serviceToBeDeleted == null)
            {
                return Json(new { success = false, message = "Error while deleting" });
            }

            string servicePath = @"images\services\service-" + id;
            string finalPath = Path.Combine(_webHostEnvironment.WebRootPath, servicePath);

            if (Directory.Exists(finalPath))
            {
                string[] filePaths = Directory.GetFiles(finalPath);
                foreach (string filePath in filePaths)
                {
                    System.IO.File.Delete(filePath);
                }

                Directory.Delete(finalPath);
            }


            _unitOfWork.Service.Remove(serviceToBeDeleted);
            _unitOfWork.Save();

            return Json(new { success = true, message = "Delete Successful" });
        }

        #endregion
    }
}
