using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DLInauguration.IDL
{
    public partial class InaugurationDetail_IDL : System.Web.UI.Page
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
                DataTable dt = ds.Tables["EmployeeIDL"];
                if (dt != null && dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    this.lblName.Text = dr["Name"].ToString();//中文姓名
                    this.EngName.Text = dr["EngName"].ToString();//中文姓名
                    this.lblGender.Text = dr["Gender"].ToString();//性別
                    this.lblBirthDay.Text = dr["BirthDay"].ToString();//出生日期
                    this.lblMarriage.Text = dr["Marriage"].ToString();//婚姻狀況
                    this.lblIdentityNo.Text = dr["IdentityNo"].ToString();//身份證號碼
                    this.lblBornAddress.Text = dr["Province"].ToString();//出生地
                    this.lblProvince.Text = dr["Province"].ToString();//籍貫
                    this.lblPhoneNumber.Text = dr["PhoneNumber"].ToString();//手機號
                    this.lblPhoneNum.Text = dr["PhoneNumber"].ToString();//電話
                    this.lblCountry.Text = dr["Nationality"].ToString();//國籍
                    this.lblStature.Text = dr["Stature"].ToString()+"CM";//身高
                    this.lblWeight.Text = dr["Weight"].ToString()+"KG";//體重
                    this.lblEmail.Text = dr["Email"].ToString();//電子郵件
                    this.lblNowAddress.Text = dr["Address"].ToString();//現在住址
                    this.lblKosekiAddress.Text = dr["Province"].ToString();//戶籍地址
                    this.lblLanguage.Text = dr["Language"].ToString();//语言
                    this.lbllisten.Text = dr["Languagelevel"].ToString();//语言水平
                    this.lbltalk.Text = dr["Languagelevel"].ToString();//语言水平
                    this.lblread.Text = dr["Languagelevel"].ToString();//语言水平
                    this.lblwrite.Text = dr["Languagelevel"].ToString();//语言水平
                    //this.lblEmpNo.Text = dr["EmpNo"].ToString();//工号

                }

                DataTable dtEmpNo = ds.Tables["EmpNoIDL"];//工號
                if (dtEmpNo != null && dtEmpNo.Rows.Count > 0)
                {
                    DataRow drEmpNo= dtEmpNo.Rows[0];
                    this.lblEmpNo.Text = drEmpNo["EmpNo"].ToString();
                  

                }


                DataTable dtEdu = ds.Tables["EducationIDL"];//教育經歷
                if (dtEdu != null && dtEdu.Rows.Count > 0)
                {
                    DataRow drEdu = dtEdu.Rows[0];
                    this.lblEducation.Text = drEdu["Education"].ToString();
                    this.lblSchool.Text = drEdu["School"].ToString();
                    this.lblSubject.Text = drEdu["Subject"].ToString();
                    this.lblEntranceDate.Text = drEdu["EntranceDate"].ToString();
                    this.lblGraduationDate.Text = drEdu["GraduationDate"].ToString();
                    
                }
                DataTable dtExp = ds.Tables["ExpectWorkIDL"];//期望工作、薪資、愛好
                if (dtExp != null && dtExp.Rows.Count > 0)
                {
                    DataRow drEdu = dtExp.Rows[0];
                    this.lblExpectWorks.Text = drEdu["WorkExperience"].ToString();
                    this.lblHobbies.Text = drEdu["Hobbies"].ToString();
                    this.lblExpectWork.Text = drEdu["Position"].ToString();
                    this.lblLowSalary.Text = drEdu["Salary"].ToString();
                }

                this.rptFamily.DataSource = ds.Tables["FamiliesIDL"];
                this.rptFamily.DataBind();
                this.rptFriend.DataSource = ds.Tables["FriendIDL"];
                this.rptFriend.DataBind();
                this.rptLinkman.DataSource = ds.Tables["LinkmanIDL"];
                this.rptLinkman.DataBind();
                this.RptWorkexperience.DataSource = ds.Tables["WorkExperienceIDL"];
                this.RptWorkexperience.DataBind();
                this.RptLicense.DataSource = ds.Tables["LicenseIDL"];
                this.RptLicense.DataBind();
                this.rptRelatives.DataSource = ds.Tables["RelativesIDL"];
                this.rptRelatives.DataBind();

            }
        }






    }
}