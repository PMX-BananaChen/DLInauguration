using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace Common
{
    public class BasePage : System.Web.UI.Page
    {
        protected override void OnInit(EventArgs e)
        {
            if (HttpContext.Current.Session["User"] == null) {
                RedirectLoginPage();
            }
        }

        private void RedirectLoginPage()
        {
            string script = this.Request.ApplicationPath + @"/Login.aspx";
            script = script.Replace(@"//", "/");
            Response.Redirect(script);
        }
    }
}
