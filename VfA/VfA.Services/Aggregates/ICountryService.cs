using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VfA.Common.DTO;

namespace VfA.Services.Aggregates
{
    public interface ICountryService
    {
        Task<List<CountryDTO>> GetAll();
        Task<CountryDTO> Get(long Id);

    }
}
