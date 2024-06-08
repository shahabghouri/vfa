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
    public class WilayaRepository : Repository<Wilaya>, IWilayaRepository
    {
        private ApplicationDbContext _db;
        public WilayaRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }
        public List<Wilaya> GetAll()
        {
            return _db.Wilayas.ToList();
        }
    }
}
