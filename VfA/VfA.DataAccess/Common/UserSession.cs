using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using VfA.Models;

namespace VfA.DataAccess.Common
{
    public static class UserSession
    {
        private static IHttpContextAccessor _httpContextAccessor;

        public static void Configure(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }

        public static ApplicationUser? GetUser()
        {
            var session = _httpContextAccessor.HttpContext?.Session;
            if (session == null)
            {
                return null;
            }

            var userJson = session.GetString("user");
            return !String.IsNullOrEmpty(userJson) ? JsonSerializer.Deserialize<ApplicationUser>(userJson) : null;
        }
    }
}
