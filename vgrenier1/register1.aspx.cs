using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.IO;
using System.Security.Cryptography;
using System.Net.Mail;
using System.Net.Configuration;
using System.Configuration;
using System.Net;
using Antlr.Runtime.Tree;
using System.EnterpriseServices.CompensatingResourceManager;
using System.Threading.Tasks;
namespace vgrenier1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private string _conString =
WebConfigurationManager.ConnectionStrings["VgrenierCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
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

        protected void CompareValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Length >= 7 && args.Value.Length <= 12)
                args.IsValid = true;
            else
                args.IsValid = false;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //String filen = "avatar.jpg";
            ////check if the fileupload contains a file before uploading
            //if (fuimage.HasFile)
            //{
            //    filen = Path.GetFileName(fuimage.PostedFile.FileName);
            //    fuimage.PostedFile.SaveAs(Server.MapPath("~/images/") + filen);
            //}



            string filen = "avatar.jpg";
            //Check whether the fileupload contains a file
            if (fuimage.HasFile)
            {
                if (CheckFileType(fuimage.FileName))
                {
                    filen = Path.GetFileName(fuimage.PostedFile.FileName);
                    fuimage.PostedFile.SaveAs(Server.MapPath("~/images/") +
                    filen);
                }
            }


            // Create Connection
            SqlConnection con = new SqlConnection(_conString);

            // Create Command
            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;

            //create a parameterized query for the username


            //search for username from tbluser
            cmd.CommandText = "SELECT * FROM tbluser WHERE username = @un";
            cmd.Parameters.AddWithValue("@un", txtUsername.Text.Trim());

            //Create DataReader
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();

            //Check if username already exists in the DB
            if (dr.HasRows)
            {
                lblMsg.Text = "Username Already Exist, Please Choose Another";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                txtUsername.Focus();
            }
            else
            {
                //Ensure the DataReader is closed
                dr.Close();

                string strDate = txtDOB.Text;
                //DateTime dt = Convert.ToDateTime(strDate);
                // Create another Command object for the insert statement
                SqlCommand cmd1 = new SqlCommand();
                cmd1.Connection = con;
                cmd1.CommandText = "INSERT INTO tblUser(First_Name, Last_Name, Email_Address, Phone_Num, Password, Address, Profile, DOB, Username, Status) VALUES (@firstname, @lastname, @email, @num, @password, @address, @image, @dob, @username, @status)";
                cmd1.Parameters.AddWithValue("@firstname", txtFirstName.Text);
                cmd1.Parameters.AddWithValue("@lastname", txtLastName.Text);

                //retrieve the country dropdown list value
                cmd1.Parameters.AddWithValue("@dob", strDate);
                cmd1.Parameters.AddWithValue("@num", txtnum.Text);

                cmd1.Parameters.AddWithValue("@address", txtAddress.Text);
                cmd1.Parameters.AddWithValue("@image", filen);

                cmd1.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd1.Parameters.AddWithValue("@username", txtUsername.Text);
                //add a method to encrypt your password
                cmd1.Parameters.AddWithValue("@password", Encrypt(txtpass.Text));

                //set the status to active or inactive
                cmd1.Parameters.AddWithValue("@status", 1);
                cmd1.CommandType = CommandType.Text;
                cmd1.ExecuteNonQuery();
                //call the sendemail method
                sendemail();
                con.Close();
                Response.Redirect("login1.aspx");
            }

        }

        //check file format before uploading
        bool CheckFileType(string fileName)
        {
            string ext = Path.GetExtension(fileName);
            switch (ext.ToLower())
            {
                case ".gif":
                    return true;
                case ".png":
                    return true;
                case ".jpg":
                    return true;
                case ".jpeg":
                    return true;
                default:
                    return false;
            }
        }

        private object Encrypt(string clearText)
        {
            // defining encrytion key
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new
                byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    // encoding using key
                    using (CryptoStream cs = new CryptoStream(ms,
                    encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }


        //Sending an email to notify and welcome user
        private void sendemail()
        {
            String filen = Path.GetFileName(fuimage.PostedFile.FileName);
            SmtpSection smtpSection =
            (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
            using (MailMessage m = new MailMessage(smtpSection.From, txtEmail.Text.Trim()))
            {
                SmtpClient sc = new SmtpClient();
                try
                {
                    m.Subject = "This is a Test Mail";
                    m.IsBodyHtml = true;
                    StringBuilder msgBody = new StringBuilder();
                    msgBody.Append("Dear " + txtUsername.Text + ", your registration is                  successful, thank you for signing up on Vide Grenier.");
                    //msgBody.Append(txtbody.Text.Trim());
                    m.Attachments.Add(new Attachment(Server.MapPath("~/images/") + filen));
                    msgBody.Append("<a href='https://" +
                    HttpContext.Current.Request.Url.Authority + "login1'>Click               here to login to Vide Grenier.</ a > ");
                    m.Body = msgBody.ToString();
                    sc.Host = smtpSection.Network.Host;
                    sc.EnableSsl = smtpSection.Network.EnableSsl;
                    NetworkCredential networkCred = new
                    NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password);
                    sc.UseDefaultCredentials = smtpSection.Network.DefaultCredentials;
                    sc.Credentials = networkCred;
                    sc.Port = smtpSection.Network.Port;
                    sc.Send(m);
                    Response.Write("Email Sent successfully");
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }

        protected void gvs_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}