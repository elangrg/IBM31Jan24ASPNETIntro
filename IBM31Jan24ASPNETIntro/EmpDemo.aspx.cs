using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IBM31Jan24ASPNETIntro
{
    public partial class EmpDemo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.Items.Add("Select All");
                SqlCommand cmd = new SqlCommand( "select * from Employee",new SqlConnection("Data Source=(localdb)\\mssqllocaldb;Initial Catalog=IBM25Jan24Db;Integrated Security=True"));
                cmd.Connection.Open();

                DataTable dt = new DataTable();
                SqlDataAdapter _da= new SqlDataAdapter(cmd);
                _da.Fill(dt);

                dt.Select().Select(d=> d[2].ToString()).ToList().ForEach(s=>DropDownList1.Items.Add(s));

            }
            else
            { }



        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            SqlCommand cmd = new SqlCommand("select * from Employee", new SqlConnection("Data Source=(localdb)\\mssqllocaldb;Initial Catalog=IBM25Jan24Db;Integrated Security=True"));
            cmd.Connection.Open();

            DataTable dt = new DataTable();
            SqlDataAdapter _da = new SqlDataAdapter(cmd);


          

            if (DropDownList1.SelectedIndex!=0)
            {
                cmd.CommandText = $"select * from Employee where salary ={DropDownList1.SelectedItem}" ;


            }
            


  _da.Fill(dt);

            GridView1.DataSource = dt.DefaultView;
            GridView1.DataBind();

        }

        protected void DropDownList1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}