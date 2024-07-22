using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BLL;
using Common;

namespace DLInauguration.DL
{
    public partial class InaugrationRecords : BasePage
    {
        string f_startDay = "";
        string f_endDay = "";
        string f_name = "";
        string f_idNo = "";
        int f_page = 1;
        int pageSize = 50;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["StartDay"] == null)
                {
                    f_startDay = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd");
                }
                else
                {
                    f_startDay = Convert.ToString(Session["StartDay"]);
                }

                if (Session["EndDay"] == null)
                {
                    f_endDay = DateTime.Now.ToString("yyyy-MM-dd");
                }
                else
                {
                    f_endDay = Convert.ToString(Session["EndDay"]);
                }
                if (Session["Name"] == null)
                {
                    f_name = "";
                }
                else
                {
                    f_name = Convert.ToString(Session["Name"]);
                }
                if (Session["No"] == null)
                {
                    f_idNo = "";
                }
                else
                {
                    f_idNo = Convert.ToString(Session["No"]);
                }
                if (Session["Page"] == null)
                {
                    f_page = 1;
                }
                else
                {
                    f_page = Convert.ToInt32(Session["Page"]);
                }
                this.txtStartDay.Value = f_startDay;
                this.txtEndDay.Value = f_endDay;
                this.txtName.Value = f_name;
                this.txtNo.Value = f_idNo;
                int page = f_page;
                GetData(f_page);
            }
        }

        protected void btnSeach_Click(object sender, EventArgs e)
        {
            int currentPage = 1;
            GetData(currentPage);
        }

        private void SeachData(string startDay, string endDay, string idNo, string name, string area, string titleid, int pageSize, int currentPage)
        {
            Inauguration insu = new Inauguration();
            DataSet dsInauguration = insu.GetInaugurationRecords(idNo, name, startDay, endDay, area,titleid, currentPage, pageSize);
            if (dsInauguration != null)
            {
                this.rptInauRecords.DataSource = dsInauguration.Tables[0];
                this.rptInauRecords.DataBind();
                // int count = this.rptInauRecords.Items.Count;
                //PagedDataSource pds = new PagedDataSource();
                //pds.DataSource = dsInauguration.Tables[0].DefaultView;
                //pds.AllowPaging = true;
                //pds.CurrentPageIndex = currentPage - 1;
                //pds.PageSize = pageSize;

                //this.rptInauRecords.DataSource = pds;
                //this.rptInauRecords.DataBind();

                DataTable dtRecord = dsInauguration.Tables[1];
                DataRow dr = dtRecord.Rows[0];
                this.lblTotal.Text = dr["TtlRecord"].ToString();
                this.lblCurrPage.Text = dr["CurrentPage"].ToString();
                this.lblTttPage.Text = dr["TtlPage"].ToString();
            }
        }


        /// <summary>
        /// 首頁
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbFirst_Click(object sender, EventArgs e)
        {
            int currentPage = 1;
            GetData(currentPage);
        }

        /// <summary>
        /// 上一頁
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbPrevious_Click(object sender, EventArgs e)
        {
            int currentPage = Convert.ToInt32(this.lblCurrPage.Text);
            GetData((currentPage - 1));
        }

        /// <summary>
        /// 下一頁
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbNext_Click(object sender, EventArgs e)
        {
            int currentPage = Convert.ToInt32(this.lblCurrPage.Text);
            GetData((currentPage + 1));
        }

        /// <summary>
        /// 末頁
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbLast_Click(object sender, EventArgs e)
        {
            int lastPage = Convert.ToInt32(lblTttPage.Text);
            GetData(lastPage);
            //int lastPage = 0;
            //int leftRecord = Convert.ToInt32(lblTotal.Text) % pageSize;
            //if (leftRecord != 0)
            //{
            //    lastPage = Convert.ToInt32(lblTotal.Text) / pageSize + 1;
            //}
            //else
            //{
            //    lastPage = Convert.ToInt32(lblTotal.Text) / pageSize;
            //}
            // GetData(lastPage);
        }

        private void GetData(int page)
        {
            string startDay = this.txtStartDay.Value;
            string endDay = this.txtEndDay.Value;
            string name = this.txtName.Value.Trim();
            string no = this.txtNo.Value.Trim();
            string area = this.ddlArea.SelectedValue.Trim();
            string titleid = "";
            pageSize = 50;
            f_startDay = startDay;
            f_endDay = endDay;
            f_name = name;
            f_idNo = no;
            f_page = page;
            SeachData(startDay, endDay, f_idNo, f_name, area,titleid, pageSize, page);
        }

        public string GetDetailURL(object idObj)
        {
            string id = idObj.ToString();
            string url = "InaugurationDetail.aspx?ID=" + id;
            return url;
        }

        public string GetDetailVaccineURL(object idObj)
        {
            string id = idObj.ToString();
            string url = "InaugurationDetailVaccine.aspx?ID=" + id;
            return url;
        }

        public string GetEditURL(object idObj)
        {
            string id = idObj.ToString();
            string url = "../Register.html?ID=" + id;
            return url;
        }

        protected void btnBatchPrint_Click(object sender, EventArgs e)
        {
            int count = this.rptInauRecords.Items.Count;
            string id = "";
            List<String> list = new List<String>();
            foreach (RepeaterItem item in this.rptInauRecords.Items)
            {
                CheckBox ckbox = (CheckBox)item.FindControl("cbPrint");
                if (ckbox.Checked)
                {
                    id = ckbox.ToolTip;
                    list.Add(id);
                }
            }
            //int totalPageCount = Convert.ToInt32(this.lblTttPage.Text);
            //for (int i = 2; i <= totalPageCount; i++)
            //{
            //    GetData(i);

            //}

            Session["ID"] = list;
            //  int currentPage = Convert.ToInt32(this.lblCurrPage.Text);
            //   GetData(currentPage);
            Response.Write("<script>window.open('BatchPrint.aspx','_blank')</script>");
        }
    }
}