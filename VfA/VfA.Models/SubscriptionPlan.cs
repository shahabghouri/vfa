using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models
{
    public class SubscriptionPlan
    {
        [Key]
        public long Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int PlanType { get; set; } //For Importer or Exporter
        public decimal MonthlyAmount {set;get;}
        public decimal _3MonthAmount {set;get; }
        public decimal _6MonthAmount {set;get; }
        public decimal _12MonthAmount { set;get; }
        public int NumberOfProducts { set;get; }
        public int NumberOfServices { set;get; }
        public int NumberOfRequests { set;get; }
        public int NumberOfImagesForProducts { set;get; }
        public int NumberOfImagesForServices { set;get; }
        public int NumberOfImagesForRequests { set;get; }
    }
}
