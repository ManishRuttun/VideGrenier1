using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace vgrenier1
{
    public partial class searchcat : System.Web.UI.Page
    {
        private string _conString = WebConfigurationManager.ConnectionStrings["VgrenierCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM tblCategory";
            //Create DataReader
            SqlDataReader dr;
            //open connection 
            con.Open();
            //execute sql statememt
            dr = cmd.ExecuteReader();
            //Bind the reader to the repeater control
            rptProductCategories.DataSource = dr;
            rptProductCategories.DataBind();
            dr.Close();

            int qs = Convert.ToInt32(Request.QueryString["id"]);
            SqlCommand cmd2 = new SqlCommand();
            cmd2.Connection = con;
            cmd2.CommandType = CommandType.Text;
            cmd2.CommandText = "SELECT * FROM tblproduct where category_id = " + qs;
            //Create DataReader
            SqlDataReader dr2;
            //open connection 

            //execute sql statememt
            dr2 = cmd2.ExecuteReader();
            //Bind the reader to the repeater control
            dlstProductDetails.DataSource = dr2;
            dlstProductDetails.DataBind();
            con.Close();
        }
    }
}