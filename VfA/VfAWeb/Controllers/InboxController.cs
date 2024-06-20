using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VfA.DataAccess.Common;
using VfA.DataAccess.Repository.IRepository;
using VfA.Models;
using VfA.Models.ViewModels;

namespace VfAWeb.Controllers
{
    [Authorize]
    public class InboxController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        ApplicationUser? _user;
        public InboxController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
            _user = UserSession.GetUser();
        }
        public IActionResult Index()
        {
            var viewModel = new MessageViewModel();
            if (_user != null)
            {
                var allUsers = _unitOfWork.ApplicationUser.GetAll(x => x.Id != _user.Id);
                var messages = _unitOfWork.Message.GetAll(x => x.SenderUserId == _user.Id || x.ReceiverUserId == _user.Id);
                var chats1 = (from user in allUsers join message in messages on user.Id equals message.SenderUserId select user);
                var chats2 = (from user in allUsers join message in messages on user.Id equals message.ReceiverUserId select user);
                chats1.ToList().AddRange(chats2);
                var chats = chats1.Distinct().ToList();
                viewModel.Chats = chats;
            }
            return View(viewModel);
        }
        [HttpPost]
        public IActionResult Add(Message message)
        {
            message.IsRead = false;
            message.SenderUserId = _user.Id;
            message.Timestamp = DateTime.Now;
            _unitOfWork.Message.Add(message);
            return Ok();
        }
        [HttpGet]
        public IActionResult GetMessages(string userId)
        {
            var messages = _unitOfWork.Message.GetAll(x => x.SenderUserId == userId || x.ReceiverUserId == userId);
            return Ok(messages);
        }
    }
}
