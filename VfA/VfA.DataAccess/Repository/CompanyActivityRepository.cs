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
    public class CompanyActivityRepository : Repository<CompanyActivity>, ICompanyActivityRepository
    {
        private ApplicationDbContext _db;
        public CompanyActivityRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }
        public List<CompanyActivity> GetAll()
        {
            return _db.CompanyActivites.ToList();
        }
    }
}
