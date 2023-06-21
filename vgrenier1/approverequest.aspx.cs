using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vgrenier1
{
    public partial class approverequest : System.Web.UI.Page
    {
        private static string _conString =
WebConfigurationManager.ConnectionStrings["VgrenierCS"].ConnectionString;
        SqlConnection con = new SqlConnection(_conString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_name"] == null)
            {
                Response.Redirect("~/home");
            }
            else
            {
                getUserProductDetails();
            }
        }

        void getUserProductDetails()
        {
            SqlConnection con = new SqlConnection(_conString);
            con.Open();
            SqlCommand ccmd = con.CreateCommand();
            ccmd.CommandType = CommandType.Text;
            ccmd.CommandText = "Select tu.user_id as user_id, ";
            ccmd.CommandText += "tu.first_name as fname, ";
            ccmd.CommandText += "tu.last_name as lname, ";
            ccmd.CommandText += "tu.username as uname, ";
            ccmd.CommandText += "tu.profile as image, ";
            ccmd.CommandText += "tu.status as ustatus, ";
            ccmd.CommandText += "tup.product_id as pid, ";
            ccmd.CommandText += "tup.accessdate as accdate, ";
            ccmd.CommandText += "tup.status as tupstatus, ";
            ccmd.CommandText += "tp.product_name as pname, ";
            ccmd.CommandText += "tp.product_status as pstatus ";
            ccmd.CommandText += "from tblUser tu, tblProductUser tup, tblProduct tp ";
            ccmd.CommandText += "where tu.user_id = tup.user_id ";
            ccmd.CommandText += "and tup.product_id = tp.product_id ";
            ccmd.CommandText += "and tu.status = '1' ";
            ccmd.CommandText += "and tp.product_status = '1' ";

            //ccmd.CommandText += "and tup.status = '0' ";
            SqlDataAdapter sqlda = new SqlDataAdapter(ccmd.CommandText, con);
            DataTable dta = new DataTable();
            sqlda.Fill(dta);
            con.Close();
            gvs.DataSource = dta;
            gvs.DataBind();
        }



        protected void gvs_PreRender(object sender, EventArgs e)
        {
            if (gvs.Rows.Count > 0)
            {
                //This replaces <td> with <th> and adds the scope attribute
                gvs.UseAccessibleHeader = true;
                //This will add the <thead> and <tbody> elements
                gvs.HeaderRow.TableSection =
                TableRowSection.TableHeader;
            }
        }

        protected void lnkgrant_Click(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            GridViewRow grvRow = (GridViewRow)lnk.NamingContainer;
            HiddenField hf = grvRow.FindControl("hidpro1") as HiddenField;
            int pro_id = Convert.ToInt32(hf.Value);
            int user_id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            SqlConnection con = new SqlConnection(_conString);
            con.Open();
            SqlCommand ucmd = con.CreateCommand();
            ucmd.CommandType = CommandType.Text;
            ucmd.CommandText = "update tblProductUser set status='1' Where user_id ='"
            + user_id + "' and product_id ='" + pro_id + "'";
            ucmd.ExecuteNonQuery();
            con.Close();
            getUserProductDetails();

        }

        protected void lnkdeny_Click(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            GridViewRow grvRow = (GridViewRow)lnk.NamingContainer;
            HiddenField hf = grvRow.FindControl("hidpro") as HiddenField;
            int pro_id = Convert.ToInt32(hf.Value);
            int user_id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            SqlConnection con = new SqlConnection(_conString);
            con.Open();
            SqlCommand ucmd = con.CreateCommand();
            ucmd.CommandType = CommandType.Text;
            ucmd.CommandText = "update tblProductUser set status='0' Where user_id ='" + user_id + "' and product_id ='" + pro_id + "'";
            ucmd.ExecuteNonQuery();
            con.Close();
            getUserProductDetails();

        }

    }
}