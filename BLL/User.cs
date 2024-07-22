using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using System.Data;

namespace BLL
{
    public class User
    {
        private UserDao userDao = new UserDao();

        public bool CheckLogin(string userAccount, string password)
        {
            DataSet ds = userDao.GetUserInfo(userAccount, password);
            if (ds != null)
            {
                DataTable dt = ds.Tables[0];
                if (dt.Rows.Count > 0 && dt.Rows[0]["IsEnabled"].ToString() == "1")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }


        public DataTable LoginInfos(string userAccount, string password)
        {
            DataSet ds = userDao.GetUserInfo(userAccount, password);
            DataTable dt=ds.Tables[0];

            return dt;
           
        }




    }
}
