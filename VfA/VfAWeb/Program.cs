using VfA.DataAccess.Repository;
using VfA.DataAccess.Repository.IRepository;
using VfA.DataAcess.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using VfA.Utility;
using Stripe;
using VfA.DataAccess.DbInitializer;
using Microsoft.AspNetCore.Localization;
using System.Collections.Generic;
using System.Globalization;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Microsoft.AspNetCore.Mvc.Razor;
using VfA.DataAccess.Common;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.MicrosoftAccount;
using VfA.Models;


var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews().AddViewLocalization(LanguageViewLocationExpanderFormat.Suffix);
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

builder.Services.Configure<StripeSettings>(builder.Configuration.GetSection("Stripe"));

builder.Services.AddDefaultIdentity<ApplicationUser>(options =>
    {
        options.Password.RequireDigit = false;
        options.SignIn.RequireConfirmedAccount = false;
    }
    )
    .AddRoles<IdentityRole>()
    .AddEntityFrameworkStores<ApplicationDbContext>().AddDefaultTokenProviders();

builder.Services.ConfigureApplicationCookie(options =>
{
    options.LoginPath = $"/Identity/Account/Login";
    options.LogoutPath = $"/Identity/Account/Logout";
    options.AccessDeniedPath = $"/Identity/Account/AccessDenied";
});
/*
builder.Services.AddAuthentication().AddFacebook(option => {
    option.AppId = "193813826680436";
    option.AppSecret = "8fc42ae3f4f2a4986143461d4e2da919";
});
*/
// Add authentication services
builder.Services.AddAuthentication(options =>
{
    options.DefaultScheme = CookieAuthenticationDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = MicrosoftAccountDefaults.AuthenticationScheme;
})
.AddMicrosoftAccount(options =>
{
    options.ClientId = "ec4d380d-d631-465d-b473-1e26ee706331";
    options.ClientSecret = "qMW8Q~LlEEZST~SDxDgcEVx_45LJQF2cQ_rEKcSQ";
})
.AddCookie(CookieAuthenticationDefaults.AuthenticationScheme, options =>
{
    options.Cookie.Name = "YourAppCookieName"; // Set your cookie name
    options.Cookie.HttpOnly = true;
    options.ExpireTimeSpan = TimeSpan.FromMinutes(60); // Adjust expiration as needed
    options.LoginPath = "/Identity/Account/Login"; // Set your login path
    options.LogoutPath = "/Identity/Account/Logout"; // Set your logout path
});
builder.Services.AddDistributedMemoryCache();
builder.Services.AddSession(options =>
{
    options.IdleTimeout = TimeSpan.FromMinutes(100);
    options.Cookie.HttpOnly = true;
    options.Cookie.IsEssential = true;
});
builder.Services.AddScoped<IDbInitializer, DbInitializer>();
builder.Services.AddScoped<IUserClaimsService, UserClaimsService>();
builder.Services.AddRazorPages().AddRazorRuntimeCompilation();
builder.Services.AddScoped<IUnitOfWork, UnitOfWork>();
builder.Services.AddScoped<IEmailSender, EmailSender>();
builder.Services.AddScoped<IUserClaimsPrincipalFactory<ApplicationUser>, CustomClaimsFactory>();

builder.Services.AddLocalization(opts => { opts.ResourcesPath = "Resources"; });

builder.Services.Configure<RequestLocalizationOptions>(options =>
{
    var supportedCultures = new[]
        {
            new CultureInfo("en-US"),
            new CultureInfo("fr-FR"),
            new CultureInfo("ar-SA"),
        };

    options.DefaultRequestCulture = new RequestCulture("en-US");
    options.SupportedCultures = supportedCultures;
    options.SupportedUICultures = supportedCultures;
});
var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
StripeConfiguration.ApiKey = builder.Configuration.GetSection("Stripe:SecretKey").Get<string>();
app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();
app.UseSession();
// Register the IHttpContextAccessor instance with your static class
//var httpContextAccessor = app.Services.GetRequiredService<IHttpContextAccessor>();
//UserSession.Configure(httpContextAccessor);
SeedDatabase();
app.MapRazorPages();
app.MapControllerRoute(
    name: "area-route",
    pattern: "{area=Visitor}/{controller=Home}/{action=Index}/{id?}");
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");
app.UseRequestLocalization();
app.Run();


void SeedDatabase()
{
    using (var scope = app.Services.CreateScope())
    {
        var dbInitializer = scope.ServiceProvider.GetRequiredService<IDbInitializer>();
        dbInitializer.Initialize();
    }
}
