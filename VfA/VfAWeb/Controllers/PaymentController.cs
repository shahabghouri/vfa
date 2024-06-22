using Humanizer.Localisation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using VfA.DataAccess.Repository.IRepository;
using VfA.Models;
using VfA.Models.ViewModels;
using VfAWeb.Utilities;

namespace VfAWeb.Controllers
{
    [Authorize]
    public class PaymentController : Controller
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly SatimPayment _satimPayment;
        public PaymentController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
            _satimPayment = new();
        }
        public IActionResult Index()
        {
            var currentSubscriptionPlan = 0;
            var viewModel = new PaymentViewModel();
            viewModel.SubscriptionPlan = _unitOfWork.SubscriptionPlan.Get(x => x.Id == currentSubscriptionPlan);
            viewModel.PaymentHistory = _unitOfWork.PaymentHistory.GetAll().ToList();
            viewModel.ApplicationUser = _unitOfWork.ApplicationUser.Get(x => x.UserName == User.Identity.Name);
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
                var currentUserId = "";
                var lastOrderNumber = _unitOfWork.PaymentOrder.GetAll().OrderByDescending(x => x.OrderNumber).FirstOrDefault()?.OrderNumber;
                lastOrderNumber++;
                var orderNumber = lastOrderNumber ?? 1;
                var amount = months == 1 ? (long)(subscriptionPlan.MonthlyAmount * 100) :
                    months == 3 ? (long)(subscriptionPlan._3MonthAmount * 100) :
                    months == 6 ? (long)(subscriptionPlan._6MonthAmount * 100) :
                    (long)(subscriptionPlan._12MonthAmount * 100);
                try
                {
                    var response = await _satimPayment.Subscribe(amount, orderNumber, subscriptionPlan+" for "+ months+ " months");
                    if (response != null)
                    {
                        if (response.errorCode != 0)
                        {
                            var paymentOrder = new PaymentOrder()
                            {
                                OrderDate = DateTime.Now,
                                Amount = amount,
                                Description = subscriptionPlan.Description,
                                SubscriptionPlanId = subscriptionPlanId,
                                Months = months,
                                Status = "Created",
                                IsConfirmed= true,
                                OrderNumber = orderNumber,
                                UserId = currentUserId
                            };
                            _unitOfWork.PaymentOrder.Add(paymentOrder);
                            _unitOfWork.Save();
                            return Redirect(response.formUrl);
                        }
                        else
                        {
                            return RedirectToAction("Fail", new { error = response.errorMessage });
                        }
                    }
                }
                catch (Exception e)
                {
                    return RedirectToAction("Fail","Payment", new { error = e.Message });
                }
            }
            return RedirectToAction("Fail", new { error = "Subscription Plan not found!" });
        }
        public async Task<IActionResult> Success(int orderNumber)
        {
            var currentUserId = "";
            var paymentOrder = _unitOfWork.PaymentOrder.Get(x => x.OrderNumber == orderNumber);
            if (paymentOrder != null)
            {
                var response = await _satimPayment.ConfirmOrder(orderNumber);
                if (response != null)
                {
                    if (response.errorCode == 0)
                    {
                        var paymentHistory = new PaymentHistory()
                        {
                            Tenure = paymentOrder.Months + " Months",
                            Description = paymentOrder.Description,
                            SubscriptionPlanId = paymentOrder.SubscriptionPlanId,
                            PaidAmount = paymentOrder.Amount,
                            PaymentDate = DateTime.Now,
                            PaymentIdentifier = orderNumber.ToString()
                        };
                        _unitOfWork.PaymentHistory.Add(paymentHistory);
                        var currentUser = _unitOfWork.ApplicationUser.Get(x => x.Id == currentUserId);
                        currentUser.LastPaymentDate = DateTime.Now;
                        currentUser.NextPaymentDate = DateTime.Now.AddMonths(paymentOrder.Months);
                        currentUser.SubscribedPlanId = paymentOrder.SubscriptionPlanId;
                        _unitOfWork.ApplicationUser.Update(currentUser);
                        paymentOrder.IsConfirmed = true;
                        paymentOrder.Status = "Confirmed";
                        _unitOfWork.PaymentOrder.Update(paymentOrder);
                        _unitOfWork.Save();
                        return View();
                    }
                    else
                    {
                        return RedirectToAction("Fail", new { error = response.errorMessage });
                    }

                }
            }
            return RedirectToAction("Fail", new { error = "Payment Order not found." });
        }
        public IActionResult Fail(string? error)
        {
            return View("Fail",error);
        }
    }
}
