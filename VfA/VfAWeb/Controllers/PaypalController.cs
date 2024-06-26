using Microsoft.AspNetCore.Mvc;
using VfA.DataAccess.Repository.IRepository;
using VfA.Models;
using VfA.Models.ViewModels;
using VfAWeb.Utilities;

namespace VfAWeb.Controllers
{
    public class PaypalController : Controller
    {
        private readonly PaypalClient _paypalClient;
        private readonly IUnitOfWork _unitOfWork;
        UserClaimsVM _user;

        public PaypalController(IUnitOfWork unitOfWork, PaypalClient paypalClient, IUserClaimsService userClaimsService)
        {
            _unitOfWork = unitOfWork;
            this._paypalClient = paypalClient;
            _user = userClaimsService.GetUserClaims();
        }

        public IActionResult Index()
        {
            // ViewBag.ClientId is used to get the Paypal Checkout javascript SDK
            ViewBag.ClientId = _paypalClient.ClientId;

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Order(CancellationToken cancellationToken, int months, int subscriptionPlanId)
        {
            try
            {
                var subscriptionPlan = _unitOfWork.SubscriptionPlan.Get(x => x.Id == subscriptionPlanId);
                if (subscriptionPlan == null)
                {
                    var error = new
                    {
                        Message = "Subscription Plan not found!"
                    };

                    return BadRequest(error);
                }
                var currentUserId = _user.Id;
                var lastOrderNumber = _unitOfWork.PaymentOrder.GetAll().OrderByDescending(x => x.OrderNumber).FirstOrDefault()?.OrderNumber;
                lastOrderNumber++;
                var orderNumber = lastOrderNumber ?? 1;
                var amount = months == 1 ? (long)(subscriptionPlan.MonthlyAmount * 100) :
                    months == 3 ? (long)(subscriptionPlan._3MonthAmount * 100) :
                    months == 6 ? (long)(subscriptionPlan._6MonthAmount * 100) :
                    (long)(subscriptionPlan._12MonthAmount * 100);
                // set the transaction price and currency
                var price = amount.ToString() ;
                var currency = "USD";

                // "reference" is the transaction key
                var reference = ""+orderNumber;

                var response = await _paypalClient.CreateOrder(price, currency, reference);
                var paymentOrder = new PaymentOrder()
                {
                    OrderDate = DateTime.Now,
                    Amount = amount,
                    Description = subscriptionPlan.Description,
                    SubscriptionPlanId = subscriptionPlanId,
                    Months = months,
                    Status = "Created",
                    IsConfirmed= false,
                    OrderNumber = orderNumber,
                    UserId = currentUserId
                };
                _unitOfWork.PaymentOrder.Add(paymentOrder);
                _unitOfWork.Save();
                return Ok(response);
            }
            catch (Exception e)
            {
                var error = new
                {
                    e.GetBaseException().Message
                };

                return BadRequest(error);
            }
        }

        public async Task<IActionResult> Capture(string orderId, CancellationToken cancellationToken)
        {
            try
            {
            var currentUserId = _user.Id;
                var response = await _paypalClient.CaptureOrder(orderId);

                var reference = Convert.ToUInt32(response.purchase_units[0].reference_id);
                var paymentOrder = _unitOfWork.PaymentOrder.Get(x => x.OrderNumber == reference);
                if (paymentOrder != null)
                {
                    // Put your logic to save the transaction here
                    // You can use the "reference" variable as a transaction key
                    var paymentHistory = new PaymentHistory()
                    {
                        Tenure = paymentOrder.Months + " Months",
                        Description = paymentOrder.Description,
                        SubscriptionPlanId = paymentOrder.SubscriptionPlanId,
                        PaidAmount = paymentOrder.Amount,
                        PaymentDate = DateTime.Now,
                        PaymentIdentifier = reference.ToString()
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
                }
                return Ok(response);
            }
            catch (Exception e)
            {
                var error = new
                {
                    e.GetBaseException().Message
                };

                return BadRequest(error);
            }
        }

        public IActionResult Success()
        {
            return View();
        }
    }
}
