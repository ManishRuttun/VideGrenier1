﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace vgrenier1
{
    public partial class guestmaster : System.Web.UI.MasterPage
    {
        private string _conString =
WebConfigurationManager.ConnectionStrings["VgrenierCS"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            //verify if session username is not null
            if (Session["username"] != null)
            {
                pnllog.Style.Add("visibility", "hidden");
                Page.Controls.Remove(pnllog);
                lgregis.CssClass = "nav navbar-nav navbar-right";
                lbllgged.CssClass = "btn btn-outline-info";
                //add the session name 
                lbllgged.Text = "Welcome " + Session["username"];
                btnlgout.Visible = true;
                pnlprofile.Visible = true;
                hyregister.Visible = false;
                pnluser.Visible = true;

                //Retrieve the User Id Session
                //int user_id = Convert.ToInt32( );

                //hyuser.Attributes["href"]=ResolveUrl("~/tutorials/week5/updateprofile?id="+user_id + "");

            }
            if (!IsPostBack)
            {
                if (Request.Cookies["admin_name"] != null &&
                Request.Cookies["admin_password"] != null)
                {
                    adminlogin.Username = Request.Cookies["admin_name"].Value;
                    adminlogin.Password = Request.Cookies["admin_password"].Value;
                }
            }

            if (Session["admin_name"] != null)
            {
                hyregister.Visible = false;
                lgregis.CssClass = "nav navbar-nav navbar-right";
                lbllgged.CssClass = "btn btn-outline-info ";
                lbllgged.Text = "Welcome " + Session["admin_name"];
                btnlgout.Visible = true;
                pnlprofile.Style.Add("visibility", "hidden");
                Page.Controls.Remove(pnlprofile);
                pnllog.Style.Add("visibility", "hidden");
                Page.Controls.Remove(pnllog);
                pnladmin.Visible = true;
                pnlstats.Visible = true;

            }
        }

        protected void btnlgout_Click(object sender, EventArgs e)
        {
            lgout();
        }

        void lgout()
        {
            if (Session["username"] != null || Session["admin_name"] != null)
            {
                //Remove all session
                Session.Clear();
                //Destroy all Session objects
                Session.Abandon();
                //Redirect to homepage or login page
                Response.Redirect("login1");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //admin login form
            string username = adminlogin.Username;
            string password = adminlogin.Password;
            bool chk = adminlogin.Chk;
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            //searching for a record containing matching username & password with
            //an active status
            cmd.CommandText = " select * from tbladmin where admin_name=@uname and admin_password=@pass";
            //create two parameterized query for the above select statement
            //use above variables
            cmd.Parameters.AddWithValue("@uname", username);
            cmd.Parameters.AddWithValue("@pass", password);
            //Create DataReader
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            // check if the DataReader contains a record
            if (dr.HasRows)
            {
                if (dr.Read())
                {
                    //create a memory cookie to store username and pwd
                    Response.Cookies["uname"].Value = username;
                    Response.Cookies["pass"].Value = password;

                    if (chk)
                    {
                        //if checkbox is checked, make cookies persistent
                        Response.Cookies["uname"].Expires = DateTime.Now.AddDays(100);
                        Response.Cookies["pass"].Expires = DateTime.Now.AddDays(100);
                    }
                    else
                    {
                        //delete the cookies if checkbox is unchecked
                        //delete content of password field
                        Response.Cookies["uname"].Expires = DateTime.Now.AddDays(-100);
                        Response.Cookies["pass"].Expires = DateTime.Now.AddDays(-100);
                    }
                    //create and save adminuname in a session variable
                    //create and save username in a session variable
                    Session["admin_name"] = username;
                    //create and save userid in a session variable
                    Session["admin_id"] = dr["admin_id"].ToString();
                    //redirect to the corresponding page
                    Response.Redirect("home.aspx");
                    //redirect to the dashboard page
                }
                con.Close();
            }
            else
            {
                //delete content of password field
                lblmsg.Style.Add("margin-left", "10%");
                lblmsg.ForeColor = System.Drawing.Color.Red;
                username = "admin_name";
                password = "admin_password";
                lblmsg.Text = "You are not registered or your account has been suspended!";

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "adminModal();", true);
            }
        }
    }
}