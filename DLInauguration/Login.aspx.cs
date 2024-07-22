using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using BLL;
using System.Data;

namespace DLInauguration
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string UserLogin(string userAccount, string password)
        {
            User user = new User();
            string account = HttpUtility.UrlDecode(userAccount);
            string pwd = HttpUtility.UrlDecode(password);
            bool result = user.CheckLogin(account, pwd);


            string emptype = "";
            string titleid = "";
            DataTable da = user.LoginInfos(account, pwd);
            if (da.Rows.Count > 0 && da.Rows[0]["IsEnabled"].ToString() == "1")
            {
                if (da.Rows[0]["EmpType"].ToString() == "DL")
                {
                    emptype = "DL";
                    titleid = "W0";
                }
                else if(da.Rows[0]["EmpType"].ToString()=="IDL")
                {
                    emptype = "IDL";
                    if (da.Rows[0]["TitleId"].ToString() == "NW0")
                    {
                        titleid = "NW0";
                    }
                    else
                    {
                        titleid = "IDL";
                    }
                }
            }

            HttpContext.Current.Session["User"] = account;
            HttpContext.Current.Session.Timeout = 10;

            if (result && emptype=="DL")
            {
                return " {  \"result\":\"true\",\"emptype\":\"DL\",\"titleid\":\"\"   }     ";
            }
            else if(result && emptype=="IDL"&& titleid=="NW0")
            {
                return " {  \"result\":\"true\",\"emptype\":\"IDL\",\"titleid\":\"NW0\"    }     ";
            }
            else if (result && emptype == "IDL" && titleid == "IDL")
            {
                return " {  \"result\":\"true\",\"emptype\":\"IDL\",\"titleid\":\"\"   }     ";
            }
            else
            {
                return "{\"result\":\"false\"}";
            }

            //if (result)
            //{
            //    return " {  \"result\":\"true\"   }     ";
            //}
            //else
            //{
            //    return "{\"result\":\"false\"}";
            //}

        }
    }
}