using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VfA.DataAccess.Repository.IRepository;
using VfA.DataAcess.Data;
using VfA.Models;

namespace VfA.DataAccess.Repository
{
    public class SubscriptionPlanRepository : Repository<SubscriptionPlan>, ISubscriptionPlanRepository
    {
        private ApplicationDbContext _db;
        public SubscriptionPlanRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }
        public List<SubscriptionPlan> GetAll()
        {
            return _db.SubscriptionPlans.ToList();
        }
    }
}
