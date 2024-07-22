using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;
using Common;

namespace DLInauguration.DL
{
    public partial class InaugurationDetailVaccine : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request["ID"].ToString();
            if (!IsPostBack)
            {
                InitData(id);
            }
        }
        private void InitData(string id)
        {
            Inauguration inau = new Inauguration();
            DataSet ds = inau.GetInaugurationDetail(id);
            if (ds != null && ds.Tables.Count > 0)
            {
                DataTable dt = ds.Tables["Vaccine"];
                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    this.lblIdentityNo.Text = dr["IdentityNo"].ToString();
                    //this.lblIsVaccination.Text = dr["IsVaccination"].ToString();
                    this.lblVaccination1.Text = dr["Vaccination1"].ToString();
                    this.lblVaccination1Date.Text = dr["Vaccination1Date"].ToString();
                    this.lblVaccination2.Text = dr["Vaccination2"].ToString();
                    this.lblVaccination2Date.Text = dr["Vaccination2Date"].ToString();
                    this.lblVaccination3.Text = dr["Vaccination3"].ToString();
                    this.lblVaccination3Date.Text = dr["Vaccination3Date"].ToString();
                    //this.lblRemark.Text = dr["Remark"].ToString();
                }
            }
        }
    }
}