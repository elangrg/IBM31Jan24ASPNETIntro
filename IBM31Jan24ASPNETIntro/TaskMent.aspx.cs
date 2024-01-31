using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IBM31Jan24ASPNETIntro
{
    public partial class TaskMent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtSearchName_TextChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select * from Employee", new SqlConnection("Data Source=(localdb)\\mssqllocaldb;Initial Catalog=IBM25Jan24Db;Integrated Security=True"));
            cmd.Connection.Open();

            DataTable dt = new DataTable();
            SqlDataAdapter _da = new SqlDataAdapter(cmd);




            if (txtSearchName.Text.Trim().Length>0)
            {
                cmd.CommandText = $"select * from Employee where empname like  '%{txtSearchName.Text}%'";


            }

            _da.Fill(dt);

            GridView1.DataSource = dt.DefaultView;
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
        }
    }
}