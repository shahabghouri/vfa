using VfA.DataAccess.Repository.IRepository;
using VfA.DataAcess.Data;
using VfA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace VfA.DataAccess.Repository
{
    public class CompanyRepository : Repository<Company>, ICompanyRepository
    {
        private ApplicationDbContext _db;
        public CompanyRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }
        public long AddCompany(Company company)
        {
            _db.Companies.Add(company);
            _db.SaveChanges();
            return company.Id;
        }

        public void Update(Company obj)
        {
            _db.Companies.Update(obj);
        }
    }
}
