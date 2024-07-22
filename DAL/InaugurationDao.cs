using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;
using System.Data;
using System.Data.SqlClient;
using System.Transactions;

namespace DAL
{
    public class InaugurationDao
    {
        public DataSet GetSchema()
        {
            string sql = "select * from dbo.Employee where 1=0 "
                        + "select * from dbo.Families where 1=0 "
                        + "select * from dbo.RelativesInCompany where 1=0 "
                        + "select * from dbo.Linkman where 1=0 "
                        + "select * from dbo.WorkExperience where 1=0 "
                        + "select * from dbo.Vaccine where 1=0 "

                        + "select * from dbo.Employee_IDL where 1=0 "
                        + "select * from dbo.Education_IDL where 1=0 "
                        + "select * from dbo.ExpectWork_IDL where 1=0 "
                        + "select * from dbo.Families_IDL where 1=0 "
                        + "select * from dbo.RelativesInCompany_IDL where 1=0 "
                        + "select * from dbo.Friend_IDL where 1=0 "
                        + "select * from dbo.License_IDL where 1=0 "
                        + "select * from dbo.Linkman_IDL where 1=0 "
                        + "select * from dbo.WorkExperience_IDL where 1=0 "
                        + "select * from dbo.Vaccine_IDL where 1=0 "
                        ;
            DataSet ds = DBUtil.GetData(sql);
            //
            if (ds != null && ds.Tables.Count > 0)
            {
                ds.Tables[0].TableName = "Employee";
                ds.Tables[1].TableName = "Families";
                ds.Tables[2].TableName = "RelativesInCompany";
                ds.Tables[3].TableName = "Linkman";
                ds.Tables[4].TableName = "WorkExperience";
                ds.Tables[5].TableName = "Vaccine";

                ds.Tables[6].TableName = "Employee_IDL";
                ds.Tables[7].TableName = "Education_IDL";
                ds.Tables[8].TableName = "ExpectWork_IDL";
                ds.Tables[9].TableName = "Families_IDL";
                ds.Tables[10].TableName = "RelativesInCompany_IDL";
                ds.Tables[11].TableName = "Friend_IDL";
                ds.Tables[12].TableName = "License_IDL";
                ds.Tables[13].TableName = "Linkman_IDL";
                ds.Tables[14].TableName = "WorkExperience_IDL";
                ds.Tables[15].TableName = "Vaccine_IDL";
            }
            return ds;
        }

        public bool BatchInsertBySqlBulkCopy(DataSet dsTarget)
        {
            int count = 0;
            using (TransactionScope ts = new TransactionScope(TransactionScopeOption.Required))
            {
                for (int i = 0; dsTarget != null && i < dsTarget.Tables.Count; i++)
                {
                    DataTable dt = dsTarget.Tables[i];
                    string tblName = dt.TableName;
                    DBUtil.BatchInsertBySqlBulkCopy(dt, tblName);
                    count++;
                }
                ts.Complete();
            }
            return count == dsTarget.Tables.Count ? true : false;
        }

        public DataSet GetInaugurationRecords(string idNo, string name, string startDate, string endDate,string area,string titleid,int currentPage, int pageSize)
        {
            SqlParameter[] parameters = new SqlParameter[8];
            SqlParameter parIdNo = new SqlParameter("@idNo", SqlDbType.VarChar, 18);
            parIdNo.Value = idNo;
            SqlParameter parName = new SqlParameter("@name", SqlDbType.NVarChar, 20);
            parName.Value = name;
            SqlParameter parStartDate = new SqlParameter("@startDate", SqlDbType.VarChar, 10);
            parStartDate.Value = startDate;
            SqlParameter parEndDate = new SqlParameter("@endDate", SqlDbType.VarChar, 10);
            parEndDate.Value = endDate;
            SqlParameter parArea = new SqlParameter("@area", SqlDbType.VarChar, 10);
            parArea.Value = area;
            SqlParameter parTitleid = new SqlParameter("@titleid", SqlDbType.VarChar, 10);
            parTitleid.Value = titleid;
            SqlParameter parCurrentPage = new SqlParameter("@CurrentPage", SqlDbType.Int, 4);
            parCurrentPage.Value = currentPage;
            SqlParameter parPageSize = new SqlParameter("@pageSize", SqlDbType.Int, 4);
            parPageSize.Value = pageSize;
            parameters[0] = parIdNo;
            parameters[1] = parName;
            parameters[2] = parStartDate;
            parameters[3] = parEndDate;
            parameters[4] = parArea;
            parameters[5] = parTitleid;
            parameters[6] = parCurrentPage;
            parameters[7] = parPageSize;
            DataSet ds = DBUtil.execProcedure("proc_getInaugrationRecords", parameters);
            return ds;
        }

        public DataSet GetInaugurationDetail(string id)
        {
            SqlParameter[] parameters = new SqlParameter[1];
            SqlParameter parId = new SqlParameter("@id", SqlDbType.VarChar);
            parId.Value = id;
            parameters[0] = parId;
            DataSet ds = DBUtil.execProcedure("proc_getInaugrationDetails", parameters);
            if (ds != null && ds.Tables.Count > 0)
            {
                ds.Tables[0].TableName = "Employee";
                ds.Tables[1].TableName = "Families";
                ds.Tables[2].TableName = "RelativesInCompany";
                ds.Tables[3].TableName = "Linkman";
                ds.Tables[4].TableName = "WorkExperience";
                ds.Tables[5].TableName = "EmpNo";
                ds.Tables[6].TableName = "Vaccine";

                ds.Tables[7].TableName = "EmployeeIDL";
                ds.Tables[8].TableName = "EducationIDL";
                ds.Tables[9].TableName = "FamiliesIDL";
                ds.Tables[10].TableName = "RelativesIDL";
                ds.Tables[11].TableName = "FriendIDL";
                ds.Tables[12].TableName = "LinkmanIDL";
                ds.Tables[13].TableName = "WorkExperienceIDL";
                ds.Tables[14].TableName = "LicenseIDL";
                ds.Tables[15].TableName = "ExpectWorkIDL";
                ds.Tables[16].TableName = "EmpNoIDL";
                ds.Tables[17].TableName = "VaccineIDL";

            }
            return ds;
        }

        public DataSet GetDetailById(string id) {
            SqlParameter[] parameters = new SqlParameter[1];
            SqlParameter parId = new SqlParameter("@id", SqlDbType.VarChar);
            parId.Value = id;
            parameters[0] = parId;
            DataSet ds = DBUtil.execProcedure("proc_getDetailById", parameters);
            return ds;
        }
    }
}
