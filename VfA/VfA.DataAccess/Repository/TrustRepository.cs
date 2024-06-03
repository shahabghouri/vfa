using VfA.DataAcess.Data;
using VfA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using VfA.DataAccess.Repository.IRepository;

namespace VfA.DataAccess.Repository
{
    public class TrustRepository : Repository<Trust>, ITrustRepository
    {
        private ApplicationDbContext _db;
        public TrustRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }

        

        public void Update(Trust obj)
        {
            var objFromDb = _db.Trusts.FirstOrDefault(u => u.Id == obj.Id);
            if (objFromDb != null)
            {
                objFromDb.Name = obj.Name;
                objFromDb.TrustImages= obj.TrustImages;



            }
        }
    }
}
