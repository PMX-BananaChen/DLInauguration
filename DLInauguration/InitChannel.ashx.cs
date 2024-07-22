using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Common;
using BLL;

namespace DLInauguration
{
    /// <summary>
    /// InitChannel 的摘要说明
    /// </summary>
    public class InitChannel : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            Inauguration inau = new Inauguration();
            String json = inau.GetChannelInfo();
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