using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;
using Microsoft.Ajax.Utilities;
using System.Net.NetworkInformation;

namespace vgrenier1
{
    public partial class usermangeproduct : System.Web.UI.Page
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
                if (!Page.IsPostBack)
                {
                    BindProductData();
                    BindCategory();
                    ListItem li = new ListItem("Select Category", "-1");
                    ddlcat.Items.Insert(0, li);

                }
            }

            //SqlConnection con = new SqlConnection(_conString);
            //SqlCommand cmd = new SqlCommand();
            //cmd.Connection = con;
            //cmd.CommandType = CommandType.Text;
            //cmd.CommandText = "SELECT * FROM tblproduct where user_id = '" + Session["userid"] + "'";
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            ////Create a DataTable
            //DataTable dt = new DataTable();
            //using (da)
            //{
            //    //Populate the DataTable
            //    da.Fill(dt);
            //}

            ////Set the DataTable as the DataSource
            //gvs.DataSource = dt;
            //gvs.DataBind();
        }

        private void BindProductData()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM tblProduct where user_id = '" + Session["userid"] + "'";
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

        private void BindCategory()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM tblCategory";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            //Create a DataTable
            DataTable dt = new DataTable();

            using (da)
            {
                //Populate the DataTable
                da.Fill(dt);

            }
            //Set the DataTable as the DataSource
            ddlcat.DataSource = dt;
            //assign the FIELD values to the dropdown 
            ddlcat.DataTextField = "Category_Name";
            ddlcat.DataValueField = "Category_Id";
            ddlcat.DataBind();
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            //check whether the moviename textbox is empty
            if (string.IsNullOrWhiteSpace(txtproductname.Text))
            {
                lblMsg.Text = "Please select record to update";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsUpdated = false;
            //get the movieid from the textbox
            int productid = Convert.ToInt32(txtproductId.Text);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add UPDATE statement to update the movie
            cmd.CommandText = "update tblproduct set Product_Name=@Pname, Product_Des=@des, /*Product_Image=@image*/ Product_Status=@status, Product_Price=@price where product_id=@pid ";
            //Create the parameterized queries 
            cmd.Parameters.AddWithValue("@pid", productid);
            cmd.Parameters.AddWithValue("@Pname", txtproductname.Text.Trim());
            cmd.Parameters.AddWithValue("@des", txtdesc.Text.Trim());
            cmd.Parameters.AddWithValue("@price", txtproductprice.Text.Trim());
            //String filen = Image1.ImageUrl.Substring(8);

            //if (fuimage.HasFile)
            //{
            //    filen = Path.GetFileName(fuimage.PostedFile.FileName);
            //    fuimage.PostedFile.SaveAs(Server.MapPath("~/images/") + filen);
            //}

            //cmd.Parameters.AddWithValue("@image", filen);

            cmd.Parameters.AddWithValue("@status", chkstatus.Checked);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute UPDATE statement and return 
            //boolean if number of records UPDATED is greater than zero
            IsUpdated = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsUpdated)
            {
                lblMsg.Text = txtproductname.Text + " Product updated successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the
                BindProductData();
            }
            else
            {
                lblMsg.Text = "Error while updating product " + txtproductname.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            ResetAll();
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            //check whether the txtmoviename textbox is empty
            if (string.IsNullOrWhiteSpace(txtproductname.Text))
            {
                lblMsg.Text = "Please select record to delete";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsDeleted = false;
            //get the movieid from the textbox
            int productid = Convert.ToInt32(txtproductId.Text);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add DELETE statement to delete the selected movie
            cmd.CommandText = "delete from tblproduct where product_id=@pid";
            //Create a parametererized query 
            cmd.Parameters.AddWithValue("@pid", productid);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute DELETE statement and return 
            //Boolean True if number of records DELETED is greater than zero
            IsDeleted = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsDeleted)
            {
                lblMsg.Text = txtproductname.Text + " Product deleted successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindMovieData()
                BindProductData();
            }

            else
            {
                lblMsg.Text = "Error while deleting product " + txtproductname.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            ResetAll();
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            ResetAll();
        }

        private void ResetAll()
        {

            btncancel.Visible = false;
            btnupdate.Visible = false;
            btndelete.Visible = false;
            ddlcat.SelectedIndex = 0;
            txtproductname.Text = "";
            txtdesc.Text = "";
            txtproductprice.Text = "";
            chkstatus.Checked = false;
            Image1.ImageUrl = "";
        }

        protected void gvs_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            Image1.Visible = false;

            txtproductId.Text =
           (gvs.DataKeys[gvs.SelectedIndex].Value.ToString());

            txtproductname.Text =
           ((Label)gvs.SelectedRow.FindControl("lblproductname")).Text;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            //create the movieid parameter
            cmd.Parameters.AddWithValue("@pid", txtproductId.Text);
            //assign the parameter to the sql statement
            //cmd.CommandText = "SELECT * FROM tblProduct where product_id = @pid";
            cmd.CommandText = "SELECT * FROM tblProduct where user_id ='" + Session["userid"] + "'";
            cmd.Parameters.AddWithValue("user_id", Convert.ToInt32(Session["userid"]));
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())

            {
                //retrieving FIELD values and assign the form controls
                ddlcat.SelectedIndex = Convert.ToInt32(dr["Category_id"]);
                txtproductname.Text = dr["Product_Name"].ToString();
                txtdesc.Text = dr["Product_Des"].ToString();
                txtproductprice.Text = dr["Product_Price"].ToString();
                chkstatus.Checked = (Boolean)dr["Product_Status"];
                Image1.ImageUrl = "../images/" + dr["Product_Image"].ToString();
            }
            con.Close();
            btnupdate.Visible = true;
            btndelete.Visible = true;
            btncancel.Visible = true;
        }
    }
}