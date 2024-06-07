using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VfA.Common.DTO;
using VfA.DataAcess.Data;

namespace VfA.Services.Aggregates
{
    public interface IStateProviceService
    {
        Task<List<StateProvinceDTO>> GetAll();
        Task<StateProvinceDTO> Get(long Id);
        Task<StateProvinceDTO> GetByCountryId(long countryId);
    }
}
