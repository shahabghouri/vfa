using VfA.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.DataAccess.Repository.IRepository
{
    public interface IMessageRepository : IRepository<Message>
    {
        void MarkAsRead(Message obj);
    }
}
