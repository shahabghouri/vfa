using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VfA.DataAccess.Repository.IRepository;
using VfA.Models;
using VfA.Models.ViewModels;

namespace VfAWeb.Controllers
{
    [Authorize]
    public class InboxController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IUserClaimsService _userClaimsService;
        //ApplicationUser? _user;
        UserClaimsVM _user;
        public InboxController(IUnitOfWork unitOfWork, IUserClaimsService userClaimsService)
        {
            _unitOfWork = unitOfWork;
            _user = userClaimsService.GetUserClaims();
        }
        public IActionResult Index()
        {
            var viewModel = new MessageViewModel();
            if (_user != null)
            {
                var allUsers = _unitOfWork.ApplicationUser.GetAll(x => x.Id != _user.Id).ToList();
                var messages = _unitOfWork.Message.GetAll(x => x.SenderUserId == _user.Id || x.ReceiverUserId == _user.Id).ToList();
                //var chats1 = (from user in allUsers join message in messages on user.Id equals message.SenderUserId select user);
                //var chats2 = (from user in allUsers join message in messages on user.Id equals message.ReceiverUserId select user);
                //chats1.ToList().AddRange(chats2);
                //var chats = chats1.Distinct().ToList();
                viewModel.Chats = allUsers;
                viewModel.Messages = messages;
            }
            return View(viewModel);
        }
        [HttpPost]
        public IActionResult Add(Message message)
        {
            message.IsRead = false;
            message.SenderUserId = _user.Id;
            message.Timestamp = DateTime.Now;
            message.AttachmentUrl = "";
            _unitOfWork.Message.Add(message);
            _unitOfWork.Save();
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
