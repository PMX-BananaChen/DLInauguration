using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using System.Data;
using System.Data.SqlClient;
using System.Transactions;
using Common;

namespace BLL
{
    public class Inauguration
    {
        private InaugurationDao inDao = new InaugurationDao();
        public DataSet GetSchema()
        {
            return inDao.GetSchema();
        }

        public bool BatchInsertBySqlBulkCopy(DataSet dsTarget)
        {
            return inDao.BatchInsertBySqlBulkCopy(dsTarget);
        }

        public DataSet GetInaugurationRecords(string idNo, string name, string startDate, string endDate,string area,string titleid, int currentPage, int pageSize)
        {
            return inDao.GetInaugurationRecords(idNo, name, startDate, endDate,area,titleid, currentPage, pageSize);
        }

        public DataSet GetInaugurationDetail(string id)
        {
            return inDao.GetInaugurationDetail(id);
        }

        public string GetDetailById(string id)
        {
            DataSet ds = inDao.GetDetailById(id);
            string json = "";
            if (ds != null && ds.Tables.Count > 0)
            {
                ds.Tables[0].TableName = "employeeInfo";
                ds.Tables[1].TableName = "family";
                ds.Tables[2].TableName = "relatives";
                ds.Tables[3].TableName = "linkman";
                ds.Tables[4].TableName = "workExperience";
                ds.Tables[5].TableName = "vaccine";

                ds.Tables[6].TableName = "employeeInfo_IDL";
                ds.Tables[7].TableName = "education_IDL";
                ds.Tables[8].TableName = "workExperience_IDL";
                ds.Tables[9].TableName = "expectWork_IDL";
                ds.Tables[10].TableName = "RelativesInCompany_IDL";
                ds.Tables[11].TableName = "license_IDL";
                ds.Tables[12].TableName = "Family_IDL";
                //ds.Tables[13].TableName = "linkman_IDL";
                //ds.Tables[14].TableName = "friend_IDL";
                //ds.Tables[15].TableName = "vaccine_IDL";

                json = JsonHelper.ToJson(ds);
            }
            return json;
        }

        public String GetChannelInfo()
        {
            String sql = "select LTrim(RTrim(attribute_key)) as label,attribute_value as value, attribute_type as type from Channel_Dictionary where attribute_type in ('B','C')";
            DataSet ds = DBUtil.GetData(sql);
            String json = JsonHelper.ToJson(ds);
            return json;
        }
    }
}
