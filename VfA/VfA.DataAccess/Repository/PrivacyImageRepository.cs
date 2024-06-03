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
    public class PrivacyImageRepository : Repository<PrivacyImage>, IPrivacyImageRepository 
        {
        private ApplicationDbContext _db;
        public PrivacyImageRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }

        

        public void Update(PrivacyImage obj)
        {
            _db.PrivacyImages.Update(obj);
        }
    }
}
