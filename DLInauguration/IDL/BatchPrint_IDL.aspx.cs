using BLL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DLInauguration.IDL
{
    public partial class BatchPrint_IDL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<String> ids = (List<String>)Session["ID"];
            if (!IsPostBack)
            {
                getData(ids);
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
                DataTable dt = ds.Tables["EmployeeIDL"];
                DataRow dr = dt.Rows[0];
                ((Label)e.Item.FindControl("lblName")).Text = dr["Name"].ToString();
                ((Label)e.Item.FindControl("EngName")).Text = dr["EngName"].ToString();
                ((Label)e.Item.FindControl("lblGender")).Text = dr["Gender"].ToString();
                ((Label)e.Item.FindControl("lblBirthDay")).Text = dr["BirthDay"].ToString();
                ((Label)e.Item.FindControl("lblMarriage")).Text = dr["Marriage"].ToString();
                ((Label)e.Item.FindControl("lblIdentityNo")).Text = dr["IdentityNo"].ToString();
                ((Label)e.Item.FindControl("lblBornAddress")).Text = dr["Province"].ToString();
                ((Label)e.Item.FindControl("lblProvince")).Text = dr["Province"].ToString();
                ((Label)e.Item.FindControl("lblCountry")).Text = dr["Nationality"].ToString();
                ((Label)e.Item.FindControl("lblPhoneNumber")).Text = dr["PhoneNumber"].ToString();
                ((Label)e.Item.FindControl("lblPhoneNum")).Text = dr["PhoneNumber"].ToString();
                ((Label)e.Item.FindControl("lblStature")).Text = dr["Stature"].ToString()+"CM";
                ((Label)e.Item.FindControl("lblWeight")).Text = dr["Weight"].ToString()+"KG";
                ((Label)e.Item.FindControl("lblEmail")).Text = dr["Email"].ToString();
                ((Label)e.Item.FindControl("lblNowAddress")).Text = dr["Address"].ToString();
                ((Label)e.Item.FindControl("lblKosekiAddress")).Text = dr["Province"].ToString();
                ((Label)e.Item.FindControl("lblLanguage")).Text = dr["Language"].ToString();
                ((Label)e.Item.FindControl("lbllisten")).Text = dr["Languagelevel"].ToString();
                ((Label)e.Item.FindControl("lbltalk")).Text = dr["Languagelevel"].ToString();
                ((Label)e.Item.FindControl("lblread")).Text = dr["Languagelevel"].ToString();
                ((Label)e.Item.FindControl("lblwrite")).Text = dr["Languagelevel"].ToString();


                DataSet dsEmpNo = (DataSet)dsList[i];
                DataTable dtEmpNo = dsEmpNo.Tables["EmpNoIDL"];
                if (dtEmpNo.Rows.Count > 0)
                {
                    DataRow drEmpNo = dtEmpNo.Rows[0];
                    ((Label)e.Item.FindControl("lblEmpNo")).Text = drEmpNo["EmpNo"].ToString();
                }
               
        
                DataSet dsEdu = (DataSet)dsList[i];
                DataTable dtEdu = dsEdu.Tables["EducationIDL"];
                if(dtEdu.Rows.Count>0)
                {
                    DataRow drEdu = dtEdu.Rows[0];
                    ((Label)e.Item.FindControl("lblEducation")).Text = drEdu["Education"].ToString();
                    ((Label)e.Item.FindControl("lblSchool")).Text = drEdu["School"].ToString();
                    ((Label)e.Item.FindControl("lblSubject")).Text = drEdu["Subject"].ToString();
                    ((Label)e.Item.FindControl("lblEntranceDate")).Text = drEdu["EntranceDate"].ToString();
                    ((Label)e.Item.FindControl("lblGraduationDate")).Text = drEdu["GraduationDate"].ToString();
                }
               



                DataSet dsExp = (DataSet)dsList[i];
                DataTable dtExp = dsExp.Tables["ExpectWorkIDL"];
                if(dtExp.Rows.Count>0)
                {
                    DataRow drExp = dtExp.Rows[0];
                    ((Label)e.Item.FindControl("lblExpectWorks")).Text = drExp["WorkExperience"].ToString();
                    ((Label)e.Item.FindControl("lblHobbies")).Text = drExp["Hobbies"].ToString();
                    ((Label)e.Item.FindControl("lblExpectWork")).Text = drExp["Position"].ToString();
                    ((Label)e.Item.FindControl("lblLowSalary")).Text = drExp["Salary"].ToString();
                }
              



                Repeater rptFamily = ((Repeater)e.Item.FindControl("rptFamily"));
                rptFamily.DataSource = ds.Tables["FamiliesIDL"];
                rptFamily.DataBind();
                Repeater rptFriend = ((Repeater)e.Item.FindControl("rptFriend"));
                rptFriend.DataSource = ds.Tables["FriendIDL"];
                rptFriend.DataBind();
                Repeater rptLinkman = ((Repeater)e.Item.FindControl("rptLinkman"));
                rptLinkman.DataSource = ds.Tables["LinkmanIDL"];
                rptLinkman.DataBind();
                Repeater RptWorkexperience = ((Repeater)e.Item.FindControl("RptWorkexperience"));
                RptWorkexperience.DataSource = ds.Tables["WorkExperienceIDL"];
                RptWorkexperience.DataBind();
                Repeater RptLicense = ((Repeater)e.Item.FindControl("RptLicense"));
                RptLicense.DataSource = ds.Tables["LicenseIDL"];
                RptLicense.DataBind();
                Repeater rptRelatives = ((Repeater)e.Item.FindControl("rptRelatives"));
                rptRelatives.DataSource = ds.Tables["RelativesInCompanyIDL"];
                rptRelatives.DataBind();
            }
        }


    }
}