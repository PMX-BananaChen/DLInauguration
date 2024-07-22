using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Common;

namespace DAL
{
    public class DBUtil
    {
        private static string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["InaugurationDb"].ToString();
        private static SqlConnection connection;
        private static DataSet ds;

        public static SqlConnection GetConnection()
        {
            if (connection == null)
            {
                connection = new SqlConnection(connStr);
            }
            if (connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
            return connection;
        }

        public static void CloseConnection() {
            if (connection != null && connection.State == ConnectionState.Open) {
                connection.Close();
            }
        }

        public static DataSet GetData(String sql)
        {
            try
            {
                connection = GetConnection();
                SqlDataAdapter dataAdapter = new SqlDataAdapter(sql, connection);
                ds = new DataSet();
                dataAdapter.Fill(ds);
                CloseConnection();
                dataAdapter.Dispose();
                return ds;
            }
            catch (Exception e)
            {
                LogHelper.WriteLog(e.Message);
                return null;
            }
        }

        public static void BatchInsertBySqlBulkCopy(DataTable dt, string tableName)
        {
            try
            {
                using (SqlBulkCopy sbc = new SqlBulkCopy(connStr))
                {
                    sbc.BatchSize = dt.Rows.Count;
                    sbc.BulkCopyTimeout = 100;
                    sbc.DestinationTableName = tableName;
                    for (int i = 0; i < dt.Columns.Count; i++)
                    {
                        sbc.ColumnMappings.Add(dt.Columns[i].ColumnName, dt.Columns[i].ColumnName);
                    }
                    //全部写入数据库
                    sbc.WriteToServer(dt);
                    sbc.Close();
                    CloseConnection();
                }
            }
            catch (Exception e)
            {
                LogHelper.WriteLog(e.Message);
                throw new Exception(e.Message);
            }
        }

        public static DataSet execProcedure(string procedureName, SqlParameter[] parameters)
        {
            connection = GetConnection();
            SqlCommand cmd = connection.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = procedureName;
            for (int i = 0; i < parameters.Length; i++)
            {
                cmd.Parameters.Add(parameters[i]);
            }
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(ds);
            CloseConnection();
            return ds;
        }
    }
}
