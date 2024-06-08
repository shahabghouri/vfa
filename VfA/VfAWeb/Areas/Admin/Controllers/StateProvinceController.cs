using Microsoft.AspNetCore.Mvc;
using VfA.DataAccess.Repository.IRepository;
using VfA.Models;

namespace VfAWeb.Areas.Admin.Controllers
{
    [Area("Identity")]
    public class StateProvinceController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        public StateProvinceController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        [HttpGet]
        public List<StateProvince> GetStates(long countryId)
        {
            List<StateProvince> StateProvinces = _unitOfWork.StateProvince.GetAll(countryId);
            return StateProvinces;
        }
    }
}
