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
    public class PaymentOrderRepository : Repository<PaymentOrder>, IPaymentOrderRepository
    {
        private ApplicationDbContext _db;
        public PaymentOrderRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }

        

        public void Update(PaymentOrder obj)
        {
            var objFromDb = _db.PaymentOrders.FirstOrDefault(u => u.Id == obj.Id);
            if (objFromDb != null)
            {
                //if (obj.ImageUrl != null)
                //{
                //    objFromDb.ImageUrl = obj.ImageUrl;
                //}
            }
        }
    }
}
