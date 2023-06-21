using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.WebControls.WebParts;


namespace vgrenier1
{
    public partial class posteditem : System.Web.UI.Page
    {
        private string _conString =
WebConfigurationManager.ConnectionStrings["VgrenierCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("~/home");
            }
            else
            {
                SqlConnection con = new SqlConnection(_conString);
                // Create Command
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM tblProductUser INNER JOIN tblProduct ON tblProductUser.product_id = tblProduct.product_id WHERE tblProductUser.user_id ='" + Session["userid"] + "'";

                //Create DataReader
                SqlDataReader dr;
                //open connection
                con.Open();
                //execute sql statememt
                dr = cmd.ExecuteReader();
                //Bind the reader to the repeater control
                rptProducts.DataSource = dr;
                rptProducts.DataBind();
                con.Close();
            }

        }
    }
}