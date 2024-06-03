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
    public class ServiceImageRepository : Repository<ServiceImage>, IServiceImageRepository 
        {
        private ApplicationDbContext _db;
        public ServiceImageRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }

        

        public void Update(ServiceImage obj)
        {
            _db.ServiceImages.Update(obj);
        }
    }
}
