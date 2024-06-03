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
    public class PartnerRepository : Repository<Partner>, IPartnerRepository
    {
        private ApplicationDbContext _db;
        public PartnerRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }

        

        public void Update(Partner obj)
        {
            var objFromDb = _db.Partners.FirstOrDefault(u => u.Id == obj.Id);
            if (objFromDb != null)
            {
                objFromDb.Name = obj.Name;
                objFromDb.PartnerImages = obj.PartnerImages;



            }
        }
    }
}
