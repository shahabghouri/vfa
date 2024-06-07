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
    public class CompanyActivity : ICompanyActivity
    {
        private readonly ApplicationDbContext ctx;
        private readonly IMapper mapper;
        public CompanyActivity(ApplicationDbContext ctx, IMapper mapper)
        {
            this.ctx = ctx;
            this.mapper = mapper;
        }
        public async Task<List<CompanyActivityDTO>> GetAll()
        {
            var companyActivities = await ctx.CompanyActivities.AsNoTracking().ToListAsync();
            var companyActivityDTOs = mapper.Map<List<CompanyActivityDTO>>(companyActivities);
            return companyActivityDTOs;
        }
        public async Task<CompanyActivityDTO> Get(long Id)
        {
            var companyActivities = await ctx.CompanyActivities.Where(x => x.Id == Id).FirstOrDefaultAsync();
            var companyActivityDTO = mapper.Map<CompanyActivityDTO>(companyActivities);
            return companyActivityDTO;
        }
    }
}
