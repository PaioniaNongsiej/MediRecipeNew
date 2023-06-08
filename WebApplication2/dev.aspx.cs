using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication2
{
    public partial class dev : System.Web.UI.Page
    {
        string cnstr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {

               
                this.BindData();
            }
            else
            {
                con = new SqlConnection(cnstr);
                con.Close();
             
              
            }
        }

        private void BindData()
        {
            string strQuery = "select * from appointment";
            SqlCommand cmd = new SqlCommand(strQuery);
            GridView1.DataSource = GetData(cmd);
            GridView1.DataBind();
        }

        private DataTable GetData(SqlCommand cmd)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(cnstr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    con.Open();
                    sda.SelectCommand = cmd;
                    sda.Fill(dt);
                    return dt;
                }
            }
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            this.BindData();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void Edit(object sender, EventArgs e)
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                txtappointmentID.ReadOnly = true;
                txtappointmentID.Text = row.Cells[0].Text;
                txtstartdate.Text = row.Cells[1].Text;
                txtend_dates.Text = row.Cells[2].Text;
                treatment_fees.Text = row.Cells[3].Text;
                popup.Show();
            }
        }

        protected void Add(object sender, EventArgs e)
        {
            txtappointmentID.ReadOnly = false;
            txtappointmentID.Text = string.Empty;
            txtstartdate.Text = string.Empty;
            txtend_dates.Text = string.Empty;
            treatment_fees.Text = string.Empty;
            popup.Show();
        }

        protected void Save(object sender, EventArgs e)
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "startTreatments";
                cmd.Parameters.AddWithValue("@appointment_id", txtappointmentID.Text);
                cmd.Parameters.AddWithValue("@start_date", txtstartdate.Text);
                cmd.Parameters.AddWithValue("@end_date", txtend_dates.Text);
                cmd.Parameters.AddWithValue("@fees", treatment_fees.Text);
                GridView1.DataSource = this.GetData(cmd);
                GridView1.DataBind();
            }
        }
    }
}