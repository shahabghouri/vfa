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
    public class MessageRepository : Repository<Message>, IMessageRepository
    {
        private ApplicationDbContext _db;
        public MessageRepository(ApplicationDbContext db) : base(db)
        {
            _db = db;
        }
        public void MarkAsRead(Message obj)
        {
            var objFromDb = _db.Messages.FirstOrDefault(u => u.MessageId == obj.MessageId);
            if (objFromDb != null)
            {
                objFromDb.IsRead = true;

            }
        }
    }
}
