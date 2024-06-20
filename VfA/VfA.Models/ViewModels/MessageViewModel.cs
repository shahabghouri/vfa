using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models.ViewModels
{
    public class MessageViewModel
    {
        public List<Message> messages { get; set; }
        public List<ApplicationUser> Chats { get; set; }
    }
}
