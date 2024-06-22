﻿// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
#nullable disable

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Text.Encodings.Web;
using System.Threading;
using System.Threading.Tasks;
using VfA.DataAccess.Repository.IRepository;
using VfA.Models;
using VfA.Utility;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.WebUtilities;
using Microsoft.Extensions.Logging;
using System.Diagnostics.CodeAnalysis;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace VfAWeb.Areas.Identity.Pages.Account
{
    public class RegisterMemberModel : PageModel
    {
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IUserStore<IdentityUser> _userStore;
        private readonly IUserEmailStore<IdentityUser> _emailStore;
        private readonly ILogger<RegisterModel> _logger;
        private readonly IEmailSender _emailSender;
        private readonly IUnitOfWork _unitOfWork;

        public RegisterMemberModel(
            UserManager<IdentityUser> userManager,
            RoleManager<IdentityRole> roleManager,
            IUserStore<IdentityUser> userStore,
            SignInManager<IdentityUser> signInManager,
            ILogger<RegisterModel> logger,
            IEmailSender emailSender,
            IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
            _roleManager = roleManager;
            _userManager = userManager;
            _userStore = userStore;
            _emailStore = GetEmailStore();
            _signInManager = signInManager;
            _logger = logger;
            _emailSender = emailSender;
        }

        /// <summary>
        ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
        ///     directly from your code. This API may change or be removed in future releases.
        /// </summary>
        [BindProperty]
        public InputModel Input { get; set; }

        /// <summary>
        ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
        ///     directly from your code. This API may change or be removed in future releases.
        /// </summary>
        public string ReturnUrl { get; set; }
        public bool? IsFormContinue { get; set; }

        /// <summary>
        ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
        ///     directly from your code. This API may change or be removed in future releases.
        /// </summary>
        public IList<AuthenticationScheme> ExternalLogins { get; set; }

        /// <summary>
        ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
        ///     directly from your code. This API may change or be removed in future releases.
        /// </summary>
        public class InputModel
        {
            [AllowNull]
            public string FormTitle { get; set; }
            public bool IsImporter { get; set; }
            public bool IsExporter { get; set; }

            /// <summary>
            ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
            ///     directly from your code. This API may change or be removed in future releases.
            /// </summary>
            //[Required]
            [AllowNull]
            [EmailAddress]
            [Display(Name = "Email")]
            public string Email { get; set; }
            [Required(ErrorMessage = "Email is required.")]
            [EmailAddress]
            public string UserName { get; set; }

            /// <summary>
            ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
            ///     directly from your code. This API may change or be removed in future releases.
            /// </summary>
            [Required]
            [RegularExpression(@"^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$",
                ErrorMessage = "Password must contain at least one number, one uppercase letter, and one special character (@, $, !, %, *, ?, &).")]
            [StringLength(100, ErrorMessage = "The {0} must be at least {2} and at max {1} characters long.", MinimumLength = 6)]
            [DataType(DataType.Password)]
            [Display(Name = "Password")]
            public string Password { get; set; }

            /// <summary>
            ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
            ///     directly from your code. This API may change or be removed in future releases.
            /// </summary>
            [DataType(DataType.Password)]
            [Display(Name = "Confirm password")]
            [Compare("Password", ErrorMessage = "The password and confirmation password do not match.")]
            public string ConfirmPassword { get; set; }


            public string? Role { get; set; }
            [ValidateNever]
            public IEnumerable<SelectListItem> RoleList { get; set; }

            [Display(Name = "First Name")]
            [Required]
            public string Name { get; set; }
            [Required]
            public string? LastName { get; set; }
            [AllowNull]
            public string? MiddleName { get; set; }
            [Required]
            public string? Gender { get; set; }
            [Required]
            public int? CountryId { get; set; }
            [ValidateNever]
            public IEnumerable<SelectListItem> CountryList { get; set; }

            [Required]
            public string? Job { get; set; }

            [Required]
            public string? PhoneNumber { get; set; }
            public int? CompanyId { get; set; }
            [ValidateNever]
            public IEnumerable<SelectListItem> CompanyList { get; set; }
            //CompanyInformation
            [Required]
            public string? CompanyName { get; set; }
            [Required]
            public string? CompanyCEOName { get; set; }
            [Required]
            public int? CompanyActivityId { get; set; }
            [ValidateNever]
            public IEnumerable<SelectListItem> CompanyActivityList { get; set; }
            [Required]
            public int CompanyCountryId { get; set; }
            [ValidateNever]
            public IEnumerable<SelectListItem> CompanyCountryList { get; set; }
            public IEnumerable<SelectListItem> WiliyaList { get; set; }
            [Required]
            public int WilayaID { get; set; }
            [Required]
            public string? StreetAddress { get; set; }
            [Required]
            public string? City { get; set; }
            [Required]
            public int StateProvinceId { get; set; }
            public string State { get; set; }
            [Required]
            public string? PostalCode { get; set; }
            [Required]
            public int? CompanyCategoryId { get; set; }
            [ValidateNever]
            public IEnumerable<SelectListItem> Categories { get; set; }
            [ValidateNever]
            public IEnumerable<SelectListItem> States { get; set; }
            public string AggreeToTermsAndConditions { get; set; }
        }


        public async Task OnGetAsync(string returnUrl = null)
        {
            if (_roleManager.RoleExistsAsync(SD.Role_Visitor).GetAwaiter().GetResult())
            {
                _roleManager.CreateAsync(new IdentityRole(SD.Role_Admin)).GetAwaiter().GetResult();
                _roleManager.CreateAsync(new IdentityRole(SD.Role_Visitor)).GetAwaiter().GetResult();
                _roleManager.CreateAsync(new IdentityRole(SD.Role_Gold)).GetAwaiter().GetResult();
                _roleManager.CreateAsync(new IdentityRole(SD.Role_Silver)).GetAwaiter().GetResult();
                _roleManager.CreateAsync(new IdentityRole(SD.Role_Basic)).GetAwaiter().GetResult();
                _roleManager.CreateAsync(new IdentityRole(SD.Role_Importer)).GetAwaiter().GetResult();
            }

            /* Input = new() {
                RoleList = _roleManager.Roles.Select(x => x.Name).Select(i => new SelectListItem {
                     Text = i,
                     Value = i
                 }),
             };*/

            Input = new()
            {

                RoleList = _roleManager.Roles
                  .Where(x => x.Name != "Admin" && x.Name != "Visitor") // Exclure les rôles "Admin" et "Visitor"
                  .Select(x => x.Name)
                   .Select(i => new SelectListItem
                   {
                       Text = i,
                       Value = i
                   }),
            };
            Input.Categories = _unitOfWork.Category.GetAll().Select(i => new SelectListItem
            {
                Text = i.Name,
                Value = i.Id.ToString()
            });
            Input.CountryList = _unitOfWork.Country.GetAll().Select(i => new SelectListItem
            {
                Text = i.Name,
                Value = i.Id.ToString()
            });
            Input.CompanyCountryList = _unitOfWork.Country.GetAll().Select(i => new SelectListItem
            {
                Text = i.Name,
                Value = i.Id.ToString()
            });
            Input.CompanyActivityList = _unitOfWork.CompanyActivity.GetAll().Select(i => new SelectListItem
            {
                Text = i.Name,
                Value = i.Id.ToString()
            });
            Input.WiliyaList = _unitOfWork.Wilaya.GetAll().Select(i => new SelectListItem
            {
                Text = i.Name,
                Value = i.Id.ToString()
            });
            //    CompanyList = _unitOfWork.Company.GetAll().Select(i => new SelectListItem {
            //        Text = i.Name,
            //        Value = i.Id.ToString()
            //    })



            ReturnUrl = returnUrl;
            IsFormContinue = false;
            ExternalLogins = (await _signInManager.GetExternalAuthenticationSchemesAsync()).ToList();
        }

        public async Task<IActionResult> OnPostAsync(string returnUrl = null)
        {
            returnUrl ??= Url.Content("~/");
            ExternalLogins = (await _signInManager.GetExternalAuthenticationSchemesAsync()).ToList();
            IsFormContinue = true;
            if (ModelState.IsValid)
            {
                var user = CreateUser();

                await _userStore.SetUserNameAsync(user, Input.Email, CancellationToken.None);
                await _emailStore.SetEmailAsync(user, Input.Email, CancellationToken.None);
                user.StreetAddress = Input.StreetAddress;
                user.City = Input.City;
                user.StateProvinceId = Input.StateProvinceId;
                user.PostalCode = Input.PostalCode;

                //Other Properties Start Here
                //personal-info
                user.IsImporter = Input.IsImporter;
                user.IsExporter = Input.IsExporter;
                user.Name = Input.Name;
                user.Gender = Input.Gender;
                user.CountryId = Input.CountryId;
                user.PhoneNumber = Input.PhoneNumber;
                user.Job = Input.Job;
                user.UserName = Input.UserName;
                //user.State = _unitOfWork.StateProvince.GetAll().Where(x => x.Id == Input.StateProvinceId).FirstOrDefault().Name;

                //company-info
                Company company = new Company();
                company.Name = Input.CompanyName;
                company.CEOName = Input.CompanyCEOName;
                company.CompanyActivityId = Input.CompanyActivityId;
                company.CountryId = Input.CompanyCountryId == 0 ? null : Input.CompanyCountryId;
                company.StateProvinceId = Input.StateProvinceId == 0 ? null : Input.StateProvinceId;
                company.WilayaId = Input.WilayaID == 0 ? null : Input.WilayaID;
                company.StreetAddress = Input.StreetAddress;
                company.City = Input.City;
                company.PostalCode = Input.PostalCode;
                company.CategoryId = Input.CompanyCategoryId;

                // Add company if validation passes
                user.CompanyId = (int)_unitOfWork.Company.AddCompany(company);
                //Ends

                if (Input.Role == SD.Role_Company)
                {
                    user.CompanyId = Input.CompanyId;
                }
                var result = await _userManager.CreateAsync(user, Input.Password);

                if (result.Succeeded)
                {
                    _logger.LogInformation("User created a new account with password.");

                    #region ASSIGN ROLE
                    IdentityRole identityRole = new IdentityRole();
                    if (user.IsImporter)
                    {
                        identityRole = _roleManager.Roles.ToList().Where(x => x.Name.Trim().ToLower() == "importer").FirstOrDefault();
                    }
                    if (user.IsExporter)
                    {
                        identityRole = _roleManager.Roles.ToList().Where(x => x.Name.Trim().ToLower() == "expoter").FirstOrDefault();
                    }
                    await _userManager.AddToRoleAsync(user, identityRole.ToString());
                    #endregion
                    var userId = await _userManager.GetUserIdAsync(user);

                    var code = await _userManager.GenerateEmailConfirmationTokenAsync(user);
                    code = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(code));
                    var callbackUrl = Url.Page(
                        "/Account/ConfirmEmail",
                        pageHandler: null,
                        values: new { area = "Identity", userId = userId, code = code, returnUrl = returnUrl },
                        protocol: Request.Scheme);

                    await _emailSender.SendEmailAsync(Input.Email, "Confirm your email",
                        $"Please confirm your account by <a href='{HtmlEncoder.Default.Encode(callbackUrl)}'>clicking here</a>.");

                    if (_userManager.Options.SignIn.RequireConfirmedAccount)
                    {
                        return RedirectToPage("RegisterConfirmation", new { email = Input.Email, returnUrl = returnUrl });
                    }
                    else
                    {
                        if (User.IsInRole(SD.Role_Admin))
                        {
                            TempData["success"] = "New User Created Successfully";
                        }
                        else
                        {
                            await _signInManager.SignInAsync(user, isPersistent: false);
                        }
                        return LocalRedirect(returnUrl);
                    }
                }
                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError(string.Empty, error.Description);
                }
            }
            Input.FormTitle = Input.FormTitle;
            ReturnUrl = null;
            Input.Categories = _unitOfWork.Category.GetAll().Select(i => new SelectListItem
            {
                Text = i.Name,
                Value = i.Id.ToString()
            });
            Input.CountryList = _unitOfWork.Country.GetAll().Select(i => new SelectListItem
            {
                Text = i.Name,
                Value = i.Id.ToString()
            });
            Input.CompanyCountryList = _unitOfWork.Country.GetAll().Select(i => new SelectListItem
            {
                Text = i.Name,
                Value = i.Id.ToString()
            });
            Input.CompanyActivityList = _unitOfWork.CompanyActivity.GetAll().Select(i => new SelectListItem
            {
                Text = i.Name,
                Value = i.Id.ToString()
            });
            Input.WiliyaList = _unitOfWork.Wilaya.GetAll().Select(i => new SelectListItem
            {
                Text = i.Name,
                Value = i.Id.ToString()
            });
            // If we got this far, something failed, redisplay form
            return Page();
        }


        private ApplicationUser CreateUser()
        {
            try
            {
                return Activator.CreateInstance<ApplicationUser>();
            }
            catch
            {
                throw new InvalidOperationException($"Can't create an instance of '{nameof(IdentityUser)}'. " +
                    $"Ensure that '{nameof(IdentityUser)}' is not an abstract class and has a parameterless constructor, or alternatively " +
                    $"override the register page in /Areas/Identity/Pages/Account/Register.cshtml");
            }
        }

        private IUserEmailStore<IdentityUser> GetEmailStore()
        {
            if (!_userManager.SupportsUserEmail)
            {
                throw new NotSupportedException("The default UI requires a user store with email support.");
            }
            return (IUserEmailStore<IdentityUser>)_userStore;
        }
    }
}