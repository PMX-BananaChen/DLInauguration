using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Common;
using Newtonsoft.Json;
using BLL;


namespace DLInauguration
{
    /// <summary>
    /// RegisterHandler 的摘要说明
    /// </summary>
    public class RegisterHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            try
            {
                var jsonStr = context.Request.Form["dataObj"];
                DataSet dsSource = JsonConvert.DeserializeObject<DataSet>(jsonStr);
                // DataTable dt = data.Tables["family"];
                // dt.Columns.Add(new DataColumn("ParentId",typeof(System.Guid)));
                // dt.Columns.RemoveAt(0);

                //// dt.Columns.Add(new DataColumn("CreateTime", typeof(DateTime)));

                // DBUtil.BatchInsertBySqlBulkCopy(dt, "Families");

                Inauguration inau = new Inauguration();
                DataSet dsTarget = inau.GetSchema();
                Guid id = System.Guid.NewGuid();
                for (int i = 0; dsSource != null && i < dsSource.Tables.Count; i++)
                {
                    DataTable dtSource = dsSource.Tables[i];
                    String tblName = dtSource.TableName;
                    DataTable dtTarget = dsTarget.Tables[tblName];
                    for (int j = 0; dtSource != null && j < dtSource.Rows.Count; j++)
                    {
                        DataRow drSource = dtSource.Rows[j];
                        DataRow drTarget = dtTarget.NewRow();
                        for (int x = 0; x < dtTarget.Columns.Count; x++)
                        {
                            string colName = dtTarget.Columns[x].ColumnName;
                            if ("ID".Equals(colName) || "ParentId".Equals(colName))
                            {
                                drTarget[colName] = id;
                            }
                            else if ("CreateTime".Equals(colName) || "UpdateTime".Equals(colName))
                            {
                                drTarget[colName] = DateTime.Now;
                            }
                            else if (!"DetailId".Equals(colName))
                            {
                                drTarget[colName] = Conversion.ToTraditional(Convert.ToString(drSource[colName]));
                            }
                        }
                        dtTarget.Rows.Add(drTarget);
                    }
                }
                bool result = inau.BatchInsertBySqlBulkCopy(dsTarget);
                if (result)
                {
                    context.Response.Write("{\"result\":\"true\"}");
                }
                else
                {
                    context.Response.Write("{\"result\":\"false\"}");
                }
            }
            catch (Exception e) {
               LogHelper.WriteLog( e.Message);
            }
            

            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
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