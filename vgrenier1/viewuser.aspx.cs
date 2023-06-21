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
    public partial class viewuser : System.Web.UI.Page
    {
        private string _conString =
WebConfigurationManager.ConnectionStrings["VgrenierCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getUserlist();
            }

        }

        private void getUserlist()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand scmd = new SqlCommand();
            scmd.CommandText = "SELECT * FROM tblUser";
            scmd.Connection = con;
            // Create DataAdapter named dad (Refer to slide 7)
            SqlDataAdapter da = new SqlDataAdapter(scmd);
            scmd.CommandText = "SELECT * FROM tblUser";
            scmd.Connection = con;
            //Create DataSet/DataTable named dtMovies
            DataTable dt = new DataTable();
            //Populate the datatable using the Fill()
            using (da)
            {
                da.Fill(dt);
            }


            //Bind datatable to gridview
            GrdView1.DataSource = dt;
            GrdView1.DataBind();
        }

        protected void GrdView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GrdView1.PageIndex = e.NewPageIndex;
            getUserlist();

        }
    }
}