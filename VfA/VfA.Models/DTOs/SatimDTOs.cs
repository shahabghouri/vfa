using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models.DTOs
{
    public class SatimDTOs
    {
    }
    public class SatimRegisterOrderResponse
    {
        public string orderId { set; get; }
        public string formUrl { set; get; }
        public int errorCode { set; get; }
        public string errorMessage { set; get; }
    }
    public class SatimConfirmOrderResponse
    {
        public int? orderStatus { get; set; } // N2, Optional
        public int? errorCode { get; set; } // N3, Optional
        public string errorMessage { get; set; } // AN..512, Optional
        public string orderNumber { get; set; } // AN..20, Mandatory
        public int actionCode { get; set; } // N3, Mandatory
        public string actionCodeDescription { get; set; } // AN..512, Mandatory
        public string pan { get; set; } // N..19, Optional
        public string expiration { get; set; } // N6, Optional, YYYYMM format
        public string cardholderName { get; set; } // A..64, Optional
        public long amount { get; set; } // N..20, Mandatory, in minimal currency units (e.g. cents)
        public int? currency { get; set; } // N3, Optional, ISO 4217 code
        public string approvalCode { get; set; } // AN6, Optional, fixed length of 6 characters
        public int? authCode { get; set; } = 2; // N3, Optional, deprecated, always "2"
        public string ip { get; set; } // AN..20, Optional
        public BindingInfo bindingInfo { get; set; } // Optional, consists of clientId and bindingId elements

        public class BindingInfo
        {
            public string clientId { get; set; } // AN..255, Optional
            public string bindingId { get; set; } // AN..255, Optional
        }
    }

    public class SatimSuccessDTO
    {
        public string orderId { set; get; }
        public string formUrl { set; get; }
        public string errorCode { set; get; }
        public string errorMessage { set; get; }
    }
}
