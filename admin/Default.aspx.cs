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

public partial class admin_Login_Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_login(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        string unm = txtname.Text;
        string pass = txtpass.Text;

        SqlCommand cmd = new SqlCommand("select * from admin_login where username =@username and password=@password", con);
        cmd.Parameters.AddWithValue("@username", txtname.Text);
        cmd.Parameters.AddWithValue("@password", txtpass.Text);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count != 0)
        {
            Session["username"] = txtname.Text;
            Response.Redirect("Dashboard.aspx");
        }
        else
        {
            Response.Write("Errror");
        }
    }
}