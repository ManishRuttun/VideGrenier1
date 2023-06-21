﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;


namespace vgrenier1
{
    public partial class unblockeruser : System.Web.UI.Page
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
                getUnactiveUsers();
            }
            
        }

        void getUnactiveUsers()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Select user_id, first_name, last_name, username, profile from tbluser where status = 0";
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvs.DataSource = dt;
            gvs.DataBind();
        }



        protected void lnkunblock_Click(object sender, EventArgs e)
        {
            //Retrieving the UserID from the command argument link button 
            int uid = Convert.ToInt32((sender as LinkButton).CommandArgument);
            //open Connection
            con.Open();
            //Create Command
            SqlCommand ucmd = new SqlCommand();
            ucmd.CommandType = CommandType.Text;
            ucmd.CommandText = "update tblUser set status='1' where user_id = " + uid;
            ucmd.Connection = con;
            ucmd.ExecuteNonQuery();
            con.Close();
            getUnactiveUsers();

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
    }
}