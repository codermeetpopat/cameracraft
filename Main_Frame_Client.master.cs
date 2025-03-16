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



public partial class Main_Frame_Client : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindcategory();
        }
        if(Session["usernm"]==null)
        {
            btnsign.Text = "Log In";
        }
        else
        {
            //unm.Text = Session["usernm"].ToString();
            btnsign.Text = "Logout";
        }
    }

    public void bindcategory()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        SqlCommand cmd = new SqlCommand("SELECT * FROM category", con);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        rptcategory.DataSource = dt;
        rptcategory.DataBind();
    }


    protected void btnsign_Click(object sender, EventArgs e)
    {

        if (Session["usernm"] == null)
        {
            Response.Redirect("Login_Registation.aspx");

        }

        else
        {
            //btnsign.Text = "SIGNOUT";
            Response.Redirect("logout.aspx");
        }
    }
}
