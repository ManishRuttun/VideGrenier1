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
    public partial class addcategory : System.Web.UI.Page
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
                BindCategory();
            }
           
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
            gvs.DataSource = dt;
            gvs.DataBind();
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
           
            txtcat.Text = "";

        }

        protected void btnAddmovies_Click(object sender, EventArgs e)
        {
            
            //check if the fileupload contains a file before uploading//

            Boolean IsAdded = false;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //add INSERT statement to create new movie
            cmd.CommandText = "insert into tblCategory (Category_Name) values (@cat) ";
            //create Parameterized query to prevent sql injection by
            cmd.Parameters.AddWithValue("@cat", txtcat.Text.Trim());

            cmd.Connection = con;
            con.Open();
            //use Command method to execute INSERT statement and return 
            //Boolean true if number of records inserted is greater than zero
            IsAdded = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsAdded)
            {
                lblMsg.Text = txtcat.Text + " Category added successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the
                BindCategory();

            }
            else
            {
                lblMsg.Text = "Error while adding Category" + txtcat.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            ResetAll();
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            //check whether the txtmoviename textbox is empty
            if (string.IsNullOrWhiteSpace(txtcat.Text))
            {
                lblMsg.Text = "Please select record to delete";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsDeleted = false;
            //get the movieid from the textbox
            int productid = Convert.ToInt32(txtcatId.Text);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add DELETE statement to delete the selected movie
            cmd.CommandText = "delete from tblcategory where category_id=@cid";
            //Create a parametererized query 
            cmd.Parameters.AddWithValue("@cid", productid);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute DELETE statement and return 
            //Boolean True if number of records DELETED is greater than zero
            IsDeleted = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsDeleted)
            {
                lblMsg.Text = txtcat.Text + " Category deleted successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindMovieData()
                BindCategory();
            }

            else
            {
                lblMsg.Text = "Error while deleting Category " + txtcat.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            ResetAll();
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            //check whether the moviename textbox is empty
            if (string.IsNullOrWhiteSpace(txtcat.Text))
            {
                lblMsg.Text = "Please select record to update";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsUpdated = false;
            //get the movieid from the textbox
            int productid = Convert.ToInt32(txtcatId.Text);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add UPDATE statement to update the movie
            cmd.CommandText = "update tblcategory set Category_Name=@cat where category_id=@cid ";
            //Create the parameterized queries 
            cmd.Parameters.AddWithValue("@cid", productid);
            cmd.Parameters.AddWithValue("@cat", txtcat.Text.Trim());
            
            
            cmd.Connection = con;
            con.Open();
            //use Command method to execute UPDATE statement and return 
            //boolean if number of records UPDATED is greater than zero
            IsUpdated = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsUpdated)
            {
                lblMsg.Text = txtcat.Text + " Category updated successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the
                BindCategory();
            }
            else
            {
                lblMsg.Text = "Error while updating Category " + txtcat.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            ResetAll();
        }

        protected void gvs_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            

            txtcatId.Text =
           (gvs.DataKeys[gvs.SelectedIndex].Value.ToString());

            txtcat.Text =
           ((Label)gvs.SelectedRow.FindControl("lblcatname")).Text;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            //create the movieid parameter
            cmd.Parameters.AddWithValue("@cid", txtcatId.Text);
            //assign the parameter to the sql statement
            cmd.CommandText = "SELECT * FROM tblCategory where Category_id = @cid";
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())

            {
                //retrieving FIELD values and assign the form controls

                txtcat.Text = dr["Category_Name"].ToString();
                
                
                
            }
            con.Close();
            btnAddmovies.Visible = false;
            btnupdate.Visible = true;
            btndelete.Visible = true;
            btncancel.Visible = true;
        }

        
    }
}