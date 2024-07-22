using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;
using System.Collections;
using Common;

namespace DLInauguration.DL
{
    public partial class BatchPrint : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            List<String> ids = (List<String>)Session["ID"];
            //string id = Request["ID"].ToString();
            if (!IsPostBack)
            {
                getData(ids);
                // InitData(ids);
            }
        }

        private void getData(List<String> ids)
        {
            ArrayList dsList = new ArrayList();
            Inauguration inau = new Inauguration();
            string[] idArr = null;
            if (ids != null)
            {
                idArr = ids.ToArray();
            }

            for (int i = 0; i < idArr.Length; i++)
            {
                string id = idArr[i];
                DataSet ds = inau.GetInaugurationDetail(id);
                if (ds != null)
                {
                    dsList.Add(ds);
                }
            }
            this.rptForm.DataSource = dsList;
            this.rptForm.DataBind();
        }

        protected void rptForm_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            ArrayList dsList = (ArrayList)rptForm.DataSource;
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                int i = e.Item.ItemIndex;
                DataSet ds = (DataSet)dsList[i];
                DataTable dt = ds.Tables["Employee"];
                DataRow dr = dt.Rows[0];
                ((Label)e.Item.FindControl("lblName")).Text = dr["Name"].ToString();
                ((Label)e.Item.FindControl("lblGender")).Text = dr["Gender"].ToString();
                ((Label)e.Item.FindControl("lblBirthDay")).Text = dr["BirthDay"].ToString();
                ((Label)e.Item.FindControl("lblMarriage")).Text = dr["Marriage"].ToString();
                ((Label)e.Item.FindControl("lblIdentityNo")).Text = dr["IdentityNo"].ToString();
                ((Label)e.Item.FindControl("lblHousehold")).Text = dr["Household"].ToString();
                ((Label)e.Item.FindControl("lblAddress")).Text = dr["Address"].ToString();
                ((Label)e.Item.FindControl("lblProvince")).Text = dr["Province"].ToString();
                ((Label)e.Item.FindControl("lblPhoneNumber")).Text = dr["PhoneNumber"].ToString();
                ((Label)e.Item.FindControl("lblEducation")).Text = dr["Education"].ToString();
                ((Label)e.Item.FindControl("lblSchool")).Text = dr["School"].ToString();
                ((Label)e.Item.FindControl("lblCertificate")).Text = dr["Certificate"].ToString();
                ((Label)e.Item.FindControl("lblEntranceDate")).Text = dr["EntranceDate"].ToString();
                ((Label)e.Item.FindControl("lblGraduationDate")).Text = dr["GraduationDate"].ToString();
                ((Label)e.Item.FindControl("lblIsReligiousBelief")).Text = dr["IsReligiousBelief"].ToString();
                ((Label)e.Item.FindControl("lblReligiousBelief")).Text = dr["ReligiousBelief"].ToString();

                //((Label)e.Item.FindControl("lblYPXD")).Text = dr["ApplyChannel"].ToString();//应聘渠道
                //((Label)e.Item.FindControl("lblXCGD")).Text = dr["Propaganda"].ToString();//宣传管道

                DataSet dsEmpNo = (DataSet)dsList[i];
                DataTable dtEmpNo = dsEmpNo.Tables["EmpNo"];
                if (dtEmpNo != null && dtEmpNo.Rows.Count > 0)
                {
                    DataRow drEmpNo = dtEmpNo.Rows[0];
                    ((Label)e.Item.FindControl("lblEmpNo")).Text = drEmpNo["EmpNo"].ToString();
                }


                Repeater rptFamily = ((Repeater)e.Item.FindControl("rptFamily"));
                rptFamily.DataSource = ds.Tables["Families"];
                rptFamily.DataBind();
                Repeater rptRelatives = ((Repeater)e.Item.FindControl("rptRelatives"));
                rptRelatives.DataSource = ds.Tables["RelativesInCompany"];
                rptRelatives.DataBind();
                Repeater rptLinkman = ((Repeater)e.Item.FindControl("rptLinkman"));
                rptLinkman.DataSource = ds.Tables["Linkman"];
                rptLinkman.DataBind();
                Repeater rptWorkExperience = ((Repeater)e.Item.FindControl("rptWorkExperience"));
                rptWorkExperience.DataSource = ds.Tables["WorkExperience"];
                rptWorkExperience.DataBind();
            }
        }

        /**
        private void InitData(List<String> ids)
        {
            String id = "";
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
    **/
    }
}