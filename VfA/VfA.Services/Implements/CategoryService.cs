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
    public class CategoryService : ICategoryService
    {
        private readonly ApplicationDbContext ctx;
        private readonly IMapper mapper;
        public CategoryService(ApplicationDbContext ctx, IMapper mapper)
        {
            this.ctx = ctx;
            this.mapper = mapper;
        }
        public async Task<List<CategoryDTO>> GetAll()
        {
            var categories = await ctx.Categories.AsNoTracking().ToListAsync();
            var categoryDTOs = mapper.Map<List<CategoryDTO>>(categories);
            return categoryDTOs;
        }
        public async Task<CategoryDTO> Get(long Id)
        {
            var categories = await ctx.Categories.Where(x => x.Id == Id).FirstOrDefaultAsync();
            var categoryDTO = mapper.Map<CategoryDTO>(categories);
            return categoryDTO;
        }
    }
}
