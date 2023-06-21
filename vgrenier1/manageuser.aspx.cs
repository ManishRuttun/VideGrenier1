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
    public partial class manageuser : System.Web.UI.Page
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
                BindProductData();
                
            }

        }

        private void BindProductData()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM tblUser";
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

       

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            //check whether the moviename textbox is empty
            if (string.IsNullOrWhiteSpace(txtfirstname.Text))
            {
                lblMsg.Text = "Please select record to update";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsUpdated = false;
            //get the movieid from the textbox
            int userid = Convert.ToInt32(txtuserid.Text);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add UPDATE statement to update the movie
            cmd.CommandText = "update tblUser set First_Name=@fname, Last_Name=@lname, Email_Address=@email, Phone_Num=@num where user_id=@uid ";
            //Create the parameterized queries 
            cmd.Parameters.AddWithValue("@uid", userid);
            cmd.Parameters.AddWithValue("@fname", txtfirstname.Text.Trim());
            cmd.Parameters.AddWithValue("@lname", txtlastname.Text.Trim());
            cmd.Parameters.AddWithValue("@email", txtemailaddress.Text.Trim());
            cmd.Parameters.AddWithValue("@num", txtphonenum.Text.Trim());

            cmd.Connection = con;
            con.Open();
            //use Command method to execute UPDATE statement and return 
            //boolean if number of records UPDATED is greater than zero
            IsUpdated = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsUpdated)
            {
                lblMsg.Text = txtfirstname.Text + " User updated successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the
                BindProductData();
            }
            else
            {
                lblMsg.Text = "Error while updating user " + txtfirstname.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            ResetAll();

        }

    

        protected void btndelete_Click(object sender, EventArgs e)
        {
            //check whether the txtmoviename textbox is empty
            if (string.IsNullOrWhiteSpace(txtfirstname.Text))
            {
                lblMsg.Text = "Please select record to delete";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsDeleted = false;
            //get the movieid from the textbox
            int userid = Convert.ToInt32(txtuserid.Text);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add DELETE statement to delete the selected movie
            cmd.CommandText = "delete from tblUser where user_id=@uid";
            //Create a parametererized query 
            cmd.Parameters.AddWithValue("@uid", userid);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute DELETE statement and return 
            //Boolean True if number of records DELETED is greater than zero
            IsDeleted = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsDeleted)
            {
                lblMsg.Text = txtfirstname.Text + " User deleted successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindMovieData()
                BindProductData();
            }

            else
            {
                lblMsg.Text = "Error while deleting user " + txtfirstname.Text;
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
            txtfirstname.Text = "";
            txtlastname.Text = "";
            txtemailaddress.Text = "";
            txtphonenum.Text = "";
            Image1.ImageUrl = "";
        }

        protected void gvs_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            Image1.Visible = false;
            txtuserid.Text =
           (gvs.DataKeys[gvs.SelectedIndex].Value.ToString());

            txtfirstname.Text =
           ((Label)gvs.SelectedRow.FindControl("lblfirstname")).Text;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            //create the movieid parameter
            cmd.Parameters.AddWithValue("@uid", txtuserid.Text);
            //assign the parameter to the sql statement
            cmd.CommandText = "SELECT * FROM tblUser where user_id = @uid";
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())

            {
                //retrieving FIELD values and assign the form controls
                txtfirstname.Text = dr["First_Name"].ToString();
                txtlastname.Text = dr["Last_Name"].ToString();
                txtemailaddress.Text = dr["Email_Address"].ToString();
                txtphonenum.Text = dr["Phone_Num"].ToString();
                Image1.ImageUrl = "../images/" + dr["Profile"].ToString();

            }
            con.Close();
            btnupdate.Visible = true;
            btndelete.Visible = true;
            btncancel.Visible = true;

        }
    }
}