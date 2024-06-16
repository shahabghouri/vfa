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
    public class RequestRepository : Repository<Request>, IRequestRepository
    {
        private ApplicationDbContext _db;
        public RequestRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }



        public void Update(Request obj)
        {
            var objFromDb = _db.Requests.FirstOrDefault(u => u.Id == obj.Id);
            if (objFromDb != null)
            {
                objFromDb.Name = obj.Name;
                objFromDb.Category = obj.Category;
                objFromDb.Description = obj.Description;
                objFromDb.RequestImages = obj.RequestImages;
                objFromDb.UserId = obj.UserId;
            }
        }
    }
}
