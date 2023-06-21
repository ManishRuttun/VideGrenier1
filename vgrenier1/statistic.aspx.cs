using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace vgrenier1
{
    public partial class statistic : System.Web.UI.Page
    {
        private string _conString =
WebConfigurationManager.ConnectionStrings["VgrenierCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_name"] == null)
            {
                Response.Redirect("~/home");
            }
            else
            {
                productcount();
                usercount();
                catcount();

            }
            
        }

        private void productcount()
        {
            SqlConnection dbconn = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();
            scmd.CommandType = CommandType.StoredProcedure;
            scmd.CommandText = "productcount";
            scmd.Connection = dbconn;
            dbconn.Open();
            hyproduct.Text = scmd.ExecuteScalar().ToString();
            dbconn.Close();
        }

        private void usercount()
        {
            SqlConnection dbconn = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();
            scmd.CommandType = CommandType.StoredProcedure;
            scmd.CommandText = "usercount";
            scmd.Connection = dbconn;
            dbconn.Open();
            hyuser.Text = scmd.ExecuteScalar().ToString();
            dbconn.Close();
        }

        private void catcount()
        {
            SqlConnection dbconn = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();
            scmd.CommandType = CommandType.StoredProcedure;
            scmd.CommandText = "catcount";
            scmd.Connection = dbconn;
            dbconn.Open();
            hycat.Text = scmd.ExecuteScalar().ToString();
            dbconn.Close();
        }

        
    }
}