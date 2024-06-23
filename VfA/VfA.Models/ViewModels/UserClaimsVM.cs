using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models.ViewModels
{
    public class UserClaimsVM
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public bool IsImporter { get; set; }
        public bool IsExporter { get; set; }
        public int? CompanyId { get; set; }
        public long SubscribedPlanId { get; set; }
    }
}
