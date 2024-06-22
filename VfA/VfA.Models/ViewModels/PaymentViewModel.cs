using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models.ViewModels
{
    public class PaymentViewModel
    {
        public List<SubscriptionPlan> SubscriptionPlans { get; set; }
        public List<PaymentHistory> PaymentHistory { get; set; }
        public SubscriptionPlan SubscriptionPlan { get; set; }
        public ApplicationUser ApplicationUser { get; set; }
    }
}
