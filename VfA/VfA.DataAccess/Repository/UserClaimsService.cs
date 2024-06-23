﻿using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using VfA.DataAccess.Repository.IRepository;
using VfA.Models.ViewModels;

namespace VfA.DataAccess.Repository
{
    public class UserClaimsService : IUserClaimsService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;

        public UserClaimsService(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }

        public UserClaimsVM GetUserClaims()
        {
            var userId = _httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            var email = _httpContextAccessor.HttpContext.User.FindFirst(ClaimTypes.Email)?.Value;
            var name = _httpContextAccessor.HttpContext.User.FindFirst("Name")?.Value;
            var isImporterClaim = _httpContextAccessor.HttpContext.User.FindFirst("IsImporter")?.Value;
            var isExporterClaim = _httpContextAccessor.HttpContext.User.FindFirst("IsExporter")?.Value;
            var companyId = _httpContextAccessor.HttpContext.User.FindFirst("CompanyId")?.Value;
            var SubscribedPlanId = _httpContextAccessor.HttpContext.User.FindFirst("SubscribedPlanId")?.Value;

            bool.TryParse(isImporterClaim, out bool isImporter);
            bool.TryParse(isExporterClaim, out bool isExporter);

            var userClaims = new UserClaimsVM
            {
                Id = userId,
                Email = email ?? "",
                Name = name ?? "",
                IsImporter = isImporter,
                IsExporter = isExporter,
                CompanyId = int.Parse(companyId ?? "0"),
                SubscribedPlanId = long.Parse(SubscribedPlanId ?? "0"),
                // Add other properties as needed
            };

            return userClaims;
        }
    }
}
