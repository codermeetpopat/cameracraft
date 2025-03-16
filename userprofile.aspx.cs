using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class userprofile : System.Web.UI.Page
{
    public void display()
    {
        
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
            con.Open();
            SqlCommand cmd2 = new SqlCommand("SELECT user_id FROM user_Data WHERE user_email='" + Session["usernm"] + "' ", con);
            int UID = Convert.ToInt32(cmd2.ExecuteScalar().ToString());
            //Response.Write(UID);
            SqlCommand cmd1 = new SqlCommand("SELECT * FROM user_Data WHERE user_id=" +UID+"",con);
            SqlDataReader r = cmd1.ExecuteReader();
            if(r.HasRows)
            {
                while (r.Read())
                {
                    //Response.Write(r[1].ToString());
                    txtUsername.Text = r[1].ToString();
                    txtMobile.Text = r[2].ToString();
                    txtEmail.Text=r[3].ToString();
                    txtPassword.Text = r[4].ToString();
                    txtFullName.Text = r[5].ToString();
                    txtAddress.Text = r[6].ToString();
                    txtCounty.Text = r[7].ToString();
                    txtstate.Text = r[8].ToString();
                    txtPinCode.Text = r[9].ToString();

                    
                }
            }
            con.Close();

      

    }
    protected void Page_Load(object sender, EventArgs e)
    {
       if (Session["usernm"] != null)
        {
            if (!IsPostBack)
            {

                display();
            }
            //Response.Write("");
        }
        else
        {
            Response.Redirect("Login_Registation.aspx");
        }
    }
    protected void button_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();
        SqlCommand cmd3 = new SqlCommand("SELECT user_id FROM user_Data WHERE user_email='" + Session["usernm"] + "' ", con);
        int UID = Convert.ToInt32(cmd3.ExecuteScalar().ToString());
        SqlCommand cmd4 = new SqlCommand("update user_data set user_name=@name,user_mobile=@mobile,user_email=@email,user_password=@password,Fullname=@fname,Address=@address,Country=@country,State=@state,Pin_code=@pincode where user_id=@id", con);
        cmd4.Parameters.AddWithValue("@name", txtUsername.Text);
        cmd4.Parameters.AddWithValue("@mobile", txtMobile.Text);
        cmd4.Parameters.AddWithValue("@email", txtEmail.Text);
        cmd4.Parameters.AddWithValue("@password", txtPassword.Text);
        cmd4.Parameters.AddWithValue("@fname", txtFullName.Text);
        cmd4.Parameters.AddWithValue("@address", txtAddress.Text);
        cmd4.Parameters.AddWithValue("@country", txtCounty.Text);
        cmd4.Parameters.AddWithValue("@state", txtstate.Text);
        cmd4.Parameters.AddWithValue("@pincode", txtPinCode.Text);
        cmd4.Parameters.AddWithValue("@id", UID);
       int k= cmd4.ExecuteNonQuery();
        if(k==1)
        {
            Response.Redirect("Login_Registation.aspx");
        }
        con.Close();



        /*Response.Write(txtUsername.Text.ToString()+"<br>");
        Response.Write(txtMobile.Text.ToString() + "<br>");
        Response.Write(txtEmail.Text.ToString() + "<br>");
        Response.Write(txtFullName.Text.ToString() + "<br>");
        Response.Write(txtPassword.Text.ToString() + "<br>");
        Response.Write(txtAddress.Text.ToString() + "<br>");
        Response.Write(txtCounty.Text.ToString() + "<br>");
        Response.Write(txtstate.Text.ToString() + "<br>");
        Response.Write(txtPinCode.Text.ToString() + "<br>");*/

    }
}