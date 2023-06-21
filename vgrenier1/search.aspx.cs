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
    public partial class search : System.Web.UI.Page
    {
        private string _conString =
WebConfigurationManager.ConnectionStrings["VgrenierCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtproductname_TextChanged(object sender, EventArgs e)
        {
                //Add the following codes in a TextChanged event
                SqlConnection con = new SqlConnection(_conString);
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                //create the movieid parameter
                cmd.Parameters.AddWithValue("@productname", txtproductname.Text);

                //assign the parameter to the sql statement
                cmd.CommandText = "SELECT Product_Image, Product_Name, Product_Des, Product_Price FROM tblProduct where Product_Name=@productname";
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                //Create a DataTable
                DataTable dt = new DataTable();
                using (da)
                {
                    //Populate the DataTable
                    da.Fill(dt);
                }
                //Set the DataTable as the DataSource
                gvs.DataSource = dt;
                gvs.DataBind();
            

        }
    }
}