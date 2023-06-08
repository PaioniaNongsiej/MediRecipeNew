using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;

namespace WebApplication2
{
    public partial class popform : System.Web.UI.Page
    {
        string constr = ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.BindData();
            }
        }

        private void BindData()
        {
            string strQuery = "select * from category";
            SqlCommand cmd = new SqlCommand(strQuery);
            GridView1.DataSource = GetData(cmd);
            GridView1.DataBind();
        }
        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            this.BindData();
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }


        private DataTable GetData(SqlCommand cmd)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(constr))
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
        protected void Add(object sender, EventArgs e)
        {
            id.ReadOnly = false;
            id.Text = string.Empty;
            category_name.Text = string.Empty;
            imagePreview.ImageUrl = string.Empty;
            popup.Show();
        }
        protected void Edit(object sender, EventArgs e)
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                id.ReadOnly = true;
                id.Text = row.Cells[0].Text;
                category_name.Text = row.Cells[1].Text;
                imagePreview.ImageUrl = row.Cells[2].Text;
                popup.Show();
            }
        }
        protected void Save(object sender, EventArgs e)
        {
            string filename = Path.GetFileName(first_file_upload_btn.PostedFile.FileName);
            string filepath = "~/pictures/category/" + first_file_upload_btn.FileName;
            first_file_upload_btn.PostedFile.SaveAs(Server.MapPath("~/pictures/category/") + filename);
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "AddUpdateCategory";
                cmd.Parameters.AddWithValue("@id", id.Text);
                cmd.Parameters.AddWithValue("@category_name", category_name.Text);
                cmd.Parameters.AddWithValue("@category_icon", filename);
                cmd.Parameters.AddWithValue("@category_icon", "Images/" + filename);
                GridView1.DataSource = this.GetData(cmd);
                GridView1.DataBind();
            }
        }

    }
}