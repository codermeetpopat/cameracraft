using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;




public partial class checkout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            //total.Text = Session["grandtotal"].ToString(); 
        }
    }
    protected void btncheckout_Click(object sender, EventArgs e)
    {
        string strcon = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        if(Session["usernm"]!=null)
        { 
          string username = Session["usernm"].ToString();
          string fullname = txtfullnm.Text;
          string address = txtadd.Text;
          string country = txtcountry.Text;
          string state = txtstate.Text;
          string pincode = txtpin.Text;

          string sqlup = "update user_Data set FullName=@fullname,Address=@address,Country=@country,State=@state,Pin_code=@pincode where user_email='" + username + "' ";

          SqlCommand cmd = new SqlCommand(sqlup, con);
          cmd.Parameters.AddWithValue("@fullname", fullname);
          cmd.Parameters.AddWithValue("@address", address);
          cmd.Parameters.AddWithValue("@country", country);
          cmd.Parameters.AddWithValue("@state", state);
          cmd.Parameters.AddWithValue("@pincode", pincode);

          int res = cmd.ExecuteNonQuery();

          if (res > 0)
          {
              Response.Redirect(Request.Url.ToString(), false);
              Response.Redirect("payment.aspx");
              
          }
        }

        else
        {
            Response.Redirect("Login_Registation.aspx");
        }


    }
}