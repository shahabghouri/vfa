using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Models {
    public class Company {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? CEOName { get; set; }
        public string? StreetAddress { get; set; }
        public string? City { get; set; }
        public string? State { get; set; }
        public string? PostalCode { get; set; }
        public string? PhoneNumber { get; set; }
        public int? CompanyActivityId { get; set; }
        [ForeignKey("CompanyActivityId")]
        [ValidateNever]
        public CompanyActivity? CompanyActivity { get; set; }
        public int? CountryId { get; set; }
        [ForeignKey("CountryId")]
        [ValidateNever]
        public Country? Country { get; set; }
        public int? StateProvinceId { get; set; }
        [ForeignKey("StateProvinceId")]
        [ValidateNever]
        public StateProvince? StateProvince { get; set; }
        public int? CategoryId { get; set; }
        [ForeignKey("CategoryId")]
        [ValidateNever]
        public Category? Category { get; set; }
        public int? WilayaId { get; set; }
    }
}
