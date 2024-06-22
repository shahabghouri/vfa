using Microsoft.AspNetCore.Mvc;
using VfA.DataAccess.Repository.IRepository;
using VfA.Models;
using VfA.Models.ViewModels;
using VfAWeb.Utilities;

namespace VfAWeb.Controllers
{
    public class PaymentController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        public PaymentController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        public IActionResult Index()
        {
            var currentSubscriptionPlan = 0;
            var viewModel = new PaymentViewModel();
            viewModel.SubscriptionPlan = _unitOfWork.SubscriptionPlan.Get(x=>x.Id == currentSubscriptionPlan);
            viewModel.PaymentHistory = _unitOfWork.PaymentHistory.GetAll().ToList();
            return View(viewModel);
        }
        public IActionResult Pricing()
        {
            var viewModel = new PaymentViewModel();
            viewModel.SubscriptionPlans = _unitOfWork.SubscriptionPlan.GetAll();
            return View(viewModel);
        }
        public async Task<IActionResult> ChargeClient(long subscriptionPlanId, int months)
        {
            var subscriptionPlan = _unitOfWork.SubscriptionPlan.Get(x => x.Id == subscriptionPlanId);
            if (subscriptionPlan != null)
            {
                SatimPayment satimPayment = new();
                var lastOrderNumber = _unitOfWork.PaymentOrder.GetAll().OrderByDescending(x => x.OrderNumber).FirstOrDefault()?.OrderNumber;
                lastOrderNumber++;
                var orderNumber = lastOrderNumber ?? 1;
                var amount = months == 1 ? (long)(subscriptionPlan.MonthlyAmount * 100) :
                    months == 3 ? (long)(subscriptionPlan._3MonthAmount * 100) :
                    months == 6 ? (long)(subscriptionPlan._6MonthAmount * 100) :
                    (long)(subscriptionPlan._12MonthAmount * 100);
                var response = await satimPayment.Subscribe(amount, orderNumber, subscriptionPlan+" for "+ months+ " months");
                if (response != null)
                {
                    var paymentOrder = new PaymentOrder()
                    {
                        OrderDate = DateTime.Now,
                        Amount = amount,
                        Description = subscriptionPlan.Description + " ",
                        SubscriptionPlanId = subscriptionPlanId,
                        Status = "Created",
                        IsConfirmed= true,
                        OrderNumber = orderNumber,
                        UserId = ""
                    };
                    _unitOfWork.PaymentOrder.Add(paymentOrder);
                    _unitOfWork.Save();
                    return Redirect(response.formUrl);
                }
            }
            return RedirectToAction("Fail");
        }
        public IActionResult Success(int orderNumber)
        {
            var paymentOrder = _unitOfWork.PaymentOrder.Get(x=>x.OrderNumber == orderNumber);
            if (paymentOrder != null)
            {
                var paymentHistory = new PaymentHistory()
                {
                    Description = "",
                    SubscriptionPlanId = paymentOrder.SubscriptionPlanId,
                    PaidAmount = paymentOrder.Amount,
                    PaymentDate = DateTime.Now,
                    PaymentIdentifier = orderNumber.ToString()
                };
                return View();
            }
            return Ok("Payment Order not found.");
        }
        public IActionResult Fail()
        {
            return RedirectToAction();
        }
    }
}
