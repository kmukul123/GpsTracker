using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bool user = (System.Web.HttpContext.Current.User != null);
        bool isauth = user && System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
        if (user && isauth)
        {

        }
        else
        {
            Response.Redirect("Account/Login.aspx");
        }
    }
}