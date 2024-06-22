using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models
{
    public class PaymentOrder
    {
        public long Id { get; set; }
        public long SubscriptionPlanId { get; set; }
        public string UserId { get; set; }
        public int OrderNumber { get; set; }
        public long Amount { get; set; }
        public DateTime OrderDate { get; set; }
        public bool IsConfirmed { get; set; }
        public string Status { get; set; }

    }
}
