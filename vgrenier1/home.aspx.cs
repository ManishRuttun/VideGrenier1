using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Reflection;
using System.Security.Cryptography;
using System.Web.Management;

namespace vgrenier1
{
    public partial class home : System.Web.UI.Page
    {
        private static string _conString =
WebConfigurationManager.ConnectionStrings["VgrenierCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategory();

                TextBox1_TextChanged(sender, null);
            }
        }

        private void LoadCategory()
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(_conString))
            {
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter("SELECT * from tblCategory", _conString);

                    da.Fill(dt);
                    ddlCategory.DataSource = dt;
                    ddlCategory.DataTextField = "category_name";
                    ddlCategory.DataValueField = "category_id";
                    ddlCategory.DataBind();
                }
                catch (Exception )
                {

                }
            }
            ddlCategory.Items.Insert(0, new ListItem("Select Category", "-1"));
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            String CatIDs = ddlCategory.SelectedValue;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            String sqlParam = "";
            String sqlParamCat = "";

            if (TextBox1.Text.Trim() != null)
                sqlParam = " and Product_Name LIKE '%' + @pname + '%'";
            if (CatIDs != "-1")
                sqlParamCat = " and tblProduct.category_id = @CatID";
            cmd.CommandText = "SELECT Product_Id, Product_Name, Product_Des, Product_Price, " +
                "Product_Image FROM tblProduct WHERE Product_Status = 1 " + sqlParam + sqlParamCat;
            cmd.Parameters.AddWithValue("@pname", TextBox1.Text.Trim());
            cmd.Parameters.AddWithValue("@CatID", CatIDs);
            DataTable table = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(table);
            lvProduct.DataSource = table;
            lvProduct.DataBind();

        }

        protected void lvProduct_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (lvProduct.FindControl("DataPager1") as
DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            TextBox1_TextChanged(TextBox1, null);

        }


        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

        }



        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            {
                Response.Redirect("login1");
            }
            else
            {
                LinkButton btn = (LinkButton)sender;
                int x = Convert.ToInt32(btn.CommandArgument.ToString());
                if (chkexist(x))
                {

                    lblmsg.Text = "Already sent request for this Product!";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    btn.Text = "Already Order!";
                    btn.CssClass = "btn btn-danger";
                }
                else
                {
                    SqlConnection con = new SqlConnection(_conString);
                    SqlCommand cmd = new SqlCommand();
                    //add INSERT statement to request access to movie
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "insert into tblProductUser(Product_id, User_id, accessdate, status) " +
                    "values (@pid, @uid, @dateaccess, @status)";
                    cmd.Parameters.AddWithValue("@uid", Session["userid"]);
                    cmd.Parameters.AddWithValue("@pid", x);
                    cmd.Parameters.AddWithValue("@dateaccess", DateTime.Now);
                    cmd.Parameters.AddWithValue("@status", 0);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    btn.Text = "Request sent";
                    lblmsg.Text = "Request sent!";
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                    btn.CssClass = "btn btn-success";
                }
            }
        }

        private Boolean chkexist(int x)
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //search for user
            cmd.CommandText = "select * from tblProductUser where product_id=@pid and user_id = @uid";
            cmd.Connection = con;
            //create a parameterized query
            cmd.Parameters.AddWithValue("@uid", Session["userid"]);
            cmd.Parameters.AddWithValue("@pid", x);
            //Create DataReader
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            //Check if user subscription already exists in the table
            if (dr.HasRows)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


    }
}