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
    public class CountryRepository : Repository<Country>, ICountryRepository
    {
        private ApplicationDbContext _db;
        public CountryRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }
        public List<Country> GetAll()
        {
            return _db.Countries.ToList();
        }
    }
}
