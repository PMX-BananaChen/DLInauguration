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
    public partial class InaugurationDetail : BasePage
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
                DataTable dt = ds.Tables["Employee"];
                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    this.lblName.Text = dr["Name"].ToString();
                    this.lblGender.Text = dr["Gender"].ToString();
                    this.lblBirthDay.Text = dr["BirthDay"].ToString();
                    this.lblMarriage.Text = dr["Marriage"].ToString();
                    this.lblIdentityNo.Text = dr["IdentityNo"].ToString();
                    this.lblHousehold.Text = dr["Household"].ToString();
                    this.lblAddress.Text = dr["Address"].ToString();
                    this.lblProvince.Text = dr["Province"].ToString();
                    this.lblPhoneNumber.Text = dr["PhoneNumber"].ToString();
                    this.lblEducation.Text = dr["Education"].ToString();
                    this.lblSchool.Text = dr["School"].ToString();
                    this.lblCertificate.Text = dr["Certificate"].ToString();
                    this.lblEntranceDate.Text = dr["EntranceDate"].ToString();
                    this.lblGraduationDate.Text = dr["GraduationDate"].ToString();
                    this.lblIsReligiousBelief.Text = dr["IsReligiousBelief"].ToString();
                    this.lblReligiousBelief.Text = dr["ReligiousBelief"].ToString();
                    //this.lblYPXD.Text = dr["ApplyChannel"].ToString();//应聘渠道
                    //this.lblXCGD.Text = dr["Propaganda"].ToString();//宣传管道
                    //this.lblEmpNo.Text = dr["EmpNo"].ToString();//工号
                }
                DataTable dtEmpNo = ds.Tables["EmpNo"];//工號
                if (dtEmpNo != null && dtEmpNo.Rows.Count > 0)
                {
                    DataRow drEmpNo = dtEmpNo.Rows[0];
                    this.lblEmpNo.Text = drEmpNo["EmpNo"].ToString();


                }

                this.rptFamily.DataSource = ds.Tables["Families"];
                this.rptFamily.DataBind();
                this.rptRelatives.DataSource = ds.Tables["RelativesInCompany"];
                this.rptRelatives.DataBind();
                this.rptLinkman.DataSource = ds.Tables["Linkman"];
                this.rptLinkman.DataBind();
                this.rptWorkExperience.DataSource = ds.Tables["WorkExperience"];
                this.rptWorkExperience.DataBind();

            }
        }
    }
}