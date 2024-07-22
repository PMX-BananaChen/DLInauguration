using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DAL
{
    public class UserDao
    {
        public DataSet GetUserInfo(string userAccount, string password) {
            String sql = "select * from Sys_user where UserAccount='" + userAccount + "' and Password='" + password + "'";
            DataSet ds = DBUtil.GetData(sql);
            return ds;
        }
    }
}
