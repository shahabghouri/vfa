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
    public class PrivacyRepository : Repository<Privacy>, IPrivacyRepository
    {
        private ApplicationDbContext _db;
        public PrivacyRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }

        

        public void Update(Privacy obj)
        {
            var objFromDb = _db.Privacies.FirstOrDefault(u => u.Id == obj.Id);
            if (objFromDb != null)
            {
                objFromDb.Title = obj.Title;
                objFromDb.Topic = obj.Topic;
                objFromDb.PrivacyImages = obj.PrivacyImages;


            }
        }
    }
}
