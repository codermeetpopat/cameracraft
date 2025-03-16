using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;



public partial class Login_Registation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString))
        {
            con.Open();

            string ssql = "SELECT user_password, status FROM user_Data WHERE user_email = @Email";
            using (SqlCommand cmd = new SqlCommand(ssql, con))
            {
                cmd.Parameters.AddWithValue("@Email", usernm.Text);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    string storedPassword = dt.Rows[0]["user_password"].ToString();
                    string status = dt.Rows[0]["status"].ToString();

                    if (status == "block")
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Your account is blocked.');", true);
                    }
                    else if (storedPassword == password.Text)
                    {
                        Session["usernm"] = usernm.Text;
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Incorrect password.');", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Incorrect username.');", true);
                }
            }
        }
    }

    protected void btn_registation_Click(object sender, EventArgs e)
    {
        Response.Write("hello");
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        String sqlinsert = "insert into user_Data(user_name,user_mobile,user_email,user_password) values(@user_name,@user_mobile,@user_email,@user_password)";
        SqlCommand cmd = new SqlCommand(sqlinsert, con);
        cmd.Parameters.AddWithValue("@user_name", username.Text);
        Session["usernm"] = username.Text;
        //Session["username"] = username.Text;
        cmd.Parameters.AddWithValue("@user_mobile", usermobile.Text);
        cmd.Parameters.AddWithValue("@user_email", useremail.Text);
        cmd.Parameters.AddWithValue("@user_password", userpass.Text);

        int res = cmd.ExecuteNonQuery();
        if (res > 0)
        {
            Response.Redirect(Request.Url.ToString(), false);
        }
    }
}