using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VfA.Common.DTO;

namespace VfA.Services.Aggregates
{
    public interface ICompanyService
    {
        Task<List<CompanyDTO>> GetAll();
        Task<CompanyDTO> Get(long Id);
    }
}
