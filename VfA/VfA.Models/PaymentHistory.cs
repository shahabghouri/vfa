using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models
{
    public class PaymentHistory
    {
        public long Id { get; set; }
        public string Description { get; set; }
        public string PaymentIdentifier { get; set; }
        public string Tenure { get; set; }
        public decimal PaidAmount { get; set; }
        public DateTime PaymentDate { get; set; }
        public long SubscriptionPlanId { get; set; }
    }
}
