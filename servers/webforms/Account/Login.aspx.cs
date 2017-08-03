using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using webforms;

public partial class Account_Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        RegisterHyperLink.NavigateUrl = "Register";
        OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
        var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        if (!String.IsNullOrEmpty(returnUrl))
        {
            RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
        }
    }
    protected void LogIn(object sender, EventArgs e)
    {
        if (IsValid)
        {
            // Validate the user password
            var manager = new UserManager();
            ApplicationUser user = manager.Find(UserName.Text, Password.Text);
            if (user != null)
            {
                IdentityHelper.SignIn(manager, user, RememberMe.Checked);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else
            {
                FailureText.Text = "Invalid username or password.";
                ErrorMessage.Visible = true;
            }
        }
    }

    protected void LoginControl_Authenticate(object sender, EventArgs e)
    {
        //bool authenticated = this.ValidateCredentials(LoginControl.UserName, LoginControl.Password);


        ////if (authenticated)
        //{
        //    // The default expiration timeout is taken from Web.config
        //    // and is 30 minutes only (for both persistent and non-persistent cookies). This is well documented
        //    // design flaw in ASP.NET Forms Authentication framework and should be manually workarounded!

        //    FormsAuthentication.RedirectFromLoginPage(LoginControl.UserName, LoginControl.RememberMeSet);

        //}
    }

    private bool IsAlphaNumeric(string text)
    {
        return Regex.IsMatch(text, "^[a-zA-Z0-9]+$");
    }

    private bool ValidateCredentials(string userName, string password)
    {
        bool returnValue = false;

        if (this.IsAlphaNumeric(userName) && userName.Length <= 50 && password.Length <= 50)
        {
            SqlConnection conn = null;

            try
            {
                string sql = "select count(*) from users where username = @username and password = @password";

                conn = new SqlConnection(ConfigurationManager.ConnectionStrings["MembershipSiteConStr"].ConnectionString);
                SqlCommand cmd = new SqlCommand(sql, conn);

                SqlParameter user = new SqlParameter();
                user.ParameterName = "@username";
                user.Value = userName.Trim();
                cmd.Parameters.Add(user);

                SqlParameter pass = new SqlParameter();
                pass.ParameterName = "@password";
                pass.Value = HashLibrary.Hasher.HashString(password.Trim());
                cmd.Parameters.Add(pass);

                conn.Open();

                int count = (int)cmd.ExecuteScalar();

                if (count > 0) returnValue = true;
            }
            catch (Exception ex)
            {
                // Log your error
            }
            finally
            {
                if (conn != null) conn.Close();
            }
        }
        else
        {
            // Log error - user name not alpha-numeric or 
            // username or password exceed the length limit!
        }

        return returnValue;
    }
}