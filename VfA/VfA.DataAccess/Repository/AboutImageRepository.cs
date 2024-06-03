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
    public class AboutImageRepository : Repository<AboutImage>, IAboutImageRepository 
        {
        private ApplicationDbContext _db;
        public AboutImageRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }

        

        public void Update(AboutImage obj)
        {
            _db.AboutImages.Update(obj);
        }
    }
}
