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
using System.Drawing;


namespace vgrenier1
{
    public partial class test : System.Web.UI.Page
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
            

        }

        private void BindProductData()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM tblProduct";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            //Create a DataTable
            DataTable dt = new DataTable();

            using (da)
            {
                //Populate the DataTable
                da.Fill(dt);

            }

            //Set the DataTable as the DataSource
           
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



        protected void btnAddproduct_Click1(object sender, EventArgs e)
        {
            String filen = "avatar.jpg";
            //check if the fileupload contains a file before uploading
            if (fuimage.HasFile)
            {
                filen = Path.GetFileName(fuimage.PostedFile.FileName);
                fuimage.PostedFile.SaveAs(Server.MapPath("~/images/") + filen);
            }
            //check if the fileupload contains a file before uploading//

            Boolean IsAdded = false;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //add INSERT statement to create new movie
            cmd.CommandText = "insert into tblProduct (Product_Name, Product_Des, Product_Image, Usage_time, Product_Status, Product_Price, User_Id, Category_Id) values (@Pname, @des, @image, @usage, @status, @price, @admin, @cid )";
            //create Parameterized query to prevent sql injection by
            cmd.Parameters.AddWithValue("@Pname", txtPName.Text.Trim());
            cmd.Parameters.AddWithValue("@des", txtpdes.Text.Trim());
            cmd.Parameters.AddWithValue("@image", filen);
            cmd.Parameters.AddWithValue("@usage", txtusage.Text.Trim());
            cmd.Parameters.AddWithValue("@status", chkstatus.Checked);
            cmd.Parameters.AddWithValue("@price", txtprice.Text.Trim());
            cmd.Parameters.AddWithValue("@admin", Session["userid"]);
            cmd.Parameters.AddWithValue("@cid", ddlcat.SelectedValue);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute INSERT statement and return 
            //Boolean true if number of records inserted is greater than zero
            IsAdded = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsAdded)
            {
                lblMsg.Text = txtPName.Text + " Product added successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the
                BindProductData();

            }
            else
            {
                lblMsg.Text = "Error while adding product " + txtPName.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
          

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //check whether the moviename textbox is empty
            if (string.IsNullOrWhiteSpace(txtPName.Text))
            {
                lblMsg.Text = "Please select record to update";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsUpdated = false;
            //get the movieid from the textbox
            //int productid = Convert.ToInt32(txtproductId.Text); ////////////////////////////////     TO CHECK
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add UPDATE statement to update the movie
            cmd.CommandText = "update tblproduct set Product_Name=@Pname, Product_Des=@des, Product_Image=@image, Product_Status=@status, Product_Price=@price where product_id=@pid ";
            //Create the parameterized queries 
            //cmd.Parameters.AddWithValue("@pid", productid); //////////////////////////     TO CHECK
            cmd.Parameters.AddWithValue("@Pname", txtPName.Text.Trim());
            cmd.Parameters.AddWithValue("@des", txtpdes.Text.Trim());
            cmd.Parameters.AddWithValue("@price", txtprice.Text.Trim());
            String filen = Image1.ImageUrl.Substring(8);

            if (fuimage.HasFile)
            {
                filen = Path.GetFileName(fuimage.PostedFile.FileName);
                fuimage.PostedFile.SaveAs(Server.MapPath("~/images/") + filen);
            }

            cmd.Parameters.AddWithValue("@image", filen);

            cmd.Parameters.AddWithValue("@status", chkstatus.Checked);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute UPDATE statement and return 
            //boolean if number of records UPDATED is greater than zero
            IsUpdated = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsUpdated)
            {
                lblMsg.Text = txtPName.Text + " Product updated successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the
                BindProductData();
            }
            else
            {
                lblMsg.Text = "Error while updating product " + txtPName.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            
        }
    }
}