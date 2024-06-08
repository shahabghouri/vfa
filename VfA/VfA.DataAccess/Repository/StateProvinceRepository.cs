using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VfA.DataAccess.Repository.IRepository;
using VfA.DataAcess.Data;
using VfA.Models;

namespace VfA.DataAccess.Repository
{
    public class StateProvinceRepository : Repository<StateProvince>, IStateProvinceRepository
    {
        private ApplicationDbContext _db;
        public StateProvinceRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }
        public List<StateProvince> GetAll(long countryId)
        {
            return _db.StateProvince.Where(x=>x.CountryId == countryId).ToList();
        }
    }
}
