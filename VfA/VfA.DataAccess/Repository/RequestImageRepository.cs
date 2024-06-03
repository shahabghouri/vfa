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
    public class RequestImageRepository : Repository<RequestImage>, IRequestImageRepository 
        {
        private ApplicationDbContext _db;
        public RequestImageRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }

        

        public void Update(RequestImage obj)
        {
            _db.RequestImages.Update(obj);
        }
    }
}
