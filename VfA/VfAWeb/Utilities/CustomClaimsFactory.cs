using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Options;
using System.Security.Claims;
using System.Threading.Tasks;
using VfA.Models;

public class CustomClaimsFactory : UserClaimsPrincipalFactory<ApplicationUser, IdentityRole>
{
    private readonly UserManager<ApplicationUser> _userManager;

    public CustomClaimsFactory(
        UserManager<ApplicationUser> userManager,
        RoleManager<IdentityRole> roleManager,
        IOptions<IdentityOptions> optionsAccessor)
        : base(userManager, roleManager, optionsAccessor)
    {
        _userManager = userManager;
    }

    protected override async Task<ClaimsIdentity> GenerateClaimsAsync(ApplicationUser user)
    {
        var identity = await base.GenerateClaimsAsync(user);

        // Fetch additional user properties
        var customUser = await _userManager.FindByIdAsync(user.Id);

        identity.AddClaim(new Claim(ClaimTypes.NameIdentifier, customUser.Id));
        identity.AddClaim(new Claim(ClaimTypes.Email, customUser.Email ?? customUser.UserName));
        identity.AddClaim(new Claim("Name", customUser.Name));
        identity.AddClaim(new Claim("IsImporter", customUser.IsImporter.ToString()));
        identity.AddClaim(new Claim("IsExporter", customUser.IsExporter.ToString()));
        identity.AddClaim(new Claim("CompanyId", customUser.CompanyId.ToString()));
        identity.AddClaim(new Claim("SubscribedPlanId", (customUser.SubscribedPlanId ?? 0).ToString()));

        // Add any other necessary claims

        return identity;
    }
}