using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VfA.Common.DTO;
using VfA.Models;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace VfA.Services.Helper
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<CategoryDTO, Category>().ReverseMap();
            CreateMap<CompanyActivityDTO, CompanyActivity>().ReverseMap();
            CreateMap<CompanyDTO, Company>().ReverseMap();
            CreateMap<CountryDTO, Country>().ReverseMap();
            CreateMap<StateProvinceDTO, StateProvince>().ReverseMap();
        }
    }
}
