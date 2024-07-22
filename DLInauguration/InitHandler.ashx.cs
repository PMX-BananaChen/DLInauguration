using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Common;
using BLL;

namespace DLInauguration
{
    /// <summary>
    /// InitHandler 的摘要说明
    /// </summary>
    public class InitHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
           var idNo= context.Request.Form["ID"];
            Inauguration inau = new Inauguration();
            string json = inau.GetDetailById(idNo);
            json = Conversion.ToSimplified(json);
            context.Response.Write(json);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}