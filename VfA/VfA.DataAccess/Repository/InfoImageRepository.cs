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
    public class InfoImageRepository : Repository<InfoImage>, IInfoImageRepository 
        {
        private ApplicationDbContext _db;
        public InfoImageRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }

        

        public void Update(InfoImage obj)
        {
            _db.InfoImages.Update(obj);
        }
    }
}
