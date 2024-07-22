﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace Common
{
    public class LogHelper
    {
        #region write log file
        /// <summary>
        /// wirte errors info to log file
        /// </summary>
        /// <param name="info">errors info</param>
        public static void WriteLog(string message)
        {
            lock (typeof(LogHelper))
            {
                string filePath = GetLogPath();
                FileInfo fi = new FileInfo(filePath);
                if (fi.Exists)
                {
                    //設置文件屬性
                    fi.Attributes = FileAttributes.Normal;
                }
                StreamWriter sw = null;
                try
                {
                    sw = new StreamWriter(filePath, true);
                    sw.WriteLine(DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss") + "::" + message);
                    sw.WriteLine();
                    sw.Flush();
                }
                catch (Exception e)
                {
                    throw e;
                }
                finally
                {
                    if (sw != null)
                    {
                        sw.Dispose();
                        sw.Close();
                    }
                }
            }
        }

        /// <summary>
        /// wirte errors info to log file
        /// </summary>
        /// <param name="ex">Exception object</param>
        public static void WriteLog(Exception ex)
        {
            lock (typeof(LogHelper))
            {
                string filePath = GetLogPath();
                FileInfo fi = new FileInfo(filePath);
                if (fi.Exists)
                {
                    //設置文件屬性
                    fi.Attributes = FileAttributes.Normal;
                }
                StreamWriter sw = null;
                try
                {
                    sw = new StreamWriter(filePath, true);
                    sw.WriteLine(DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss") + "==> Errors Description:" + ex.Message.ToString() + "Errors Location:" + ex.StackTrace);
                    sw.WriteLine();
                    sw.Flush();
                }
                catch (Exception e)
                {
                    throw e;
                }
                finally
                {
                    if (sw != null)
                    {
                        sw.Dispose();
                        sw.Close();
                    }
                }
            }
        }
        #endregion

        #region get log file path
        public static string GetLogPath()
        {
            //get log file path
            string FiePath = AppDomain.CurrentDomain.BaseDirectory + "Log\\";
            StringBuilder sb = new StringBuilder();
            sb.Append(DateTime.Now.Year.ToString() + "-");
            sb.Append(DateTime.Now.Month.ToString().PadLeft(2, '0') + "-");
            sb.Append(DateTime.Now.Day.ToString().PadLeft(2, '0'));
            sb.Append(".log");

            //如果目錄不存在則創建它
            if (!Directory.Exists(FiePath))
                Directory.CreateDirectory(FiePath);

            //return System.Web.HttpContext.Current.Server.MapPath("~\\Log\\" + sb.ToString());
            return AppDomain.CurrentDomain.BaseDirectory + "Log\\" + sb.ToString();
        }
        #endregion
    }
}
