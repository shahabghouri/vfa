using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VfA.Common.DTO;
using VfA.DataAcess.Data;
using VfA.Services.Aggregates;

namespace VfA.Services.Implements
{
    public class CompanyService : ICompanyService
    {
        private readonly ApplicationDbContext ctx;
        private readonly IMapper mapper;
        public CompanyService(ApplicationDbContext ctx, IMapper mapper)
        {
            this.ctx = ctx;
            this.mapper = mapper;
        }
        public async Task<List<CompanyDTO>> GetAll()
        {
            var companys = await ctx.Companies.AsNoTracking().ToListAsync();
            var companyDTOs = mapper.Map<List<CompanyDTO>>(companys);
            return companyDTOs;
        }
        public async Task<CompanyDTO> Get(long Id)
        {
            var company = await ctx.Companies.Where(x => x.Id == Id).FirstOrDefaultAsync();
            var companyDTO = mapper.Map<CompanyDTO>(company);
            return companyDTO;
        }
    }
}
