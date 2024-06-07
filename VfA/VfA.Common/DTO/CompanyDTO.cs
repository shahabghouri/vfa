using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VfA.Common.DTO
{
    public class CompanyDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string? CEOName { get; set; }
        public string? StreetAddress { get; set; }
        public string? City { get; set; }
        public string? State { get; set; }
        public string? PostalCode { get; set; }
        public string? PhoneNumber { get; set; }
        public int? CompanyActivityId { get; set; }
        [ForeignKey("CompanyActivityId")]
        //[ValidateNever]
        public CompanyActivityDTO? CompanyActivity { get; set; }
        public int? CountryId { get; set; }
        [ForeignKey("CountryId")]
        //[ValidateNever]
        public CountryDTO? Country { get; set; }
        public int? StateProvinceId { get; set; }
        [ForeignKey("StateProvinceId")]
        //[ValidateNever]
        public StateProvinceDTO? StateProvince { get; set; }
        public int? CategoryId { get; set; }
        [ForeignKey("CategoryId")]
        //[ValidateNever]
        public CategoryDTO? Category { get; set; }
    }
}
