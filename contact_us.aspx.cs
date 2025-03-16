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


public partial class contact_us : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getdata();
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (Session["usernm"] != null)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
            con.Open();

            String sqlinsert = "insert into contact_query values(@name, @email, @message)";
            SqlCommand cmd = new SqlCommand(sqlinsert, con);
            cmd.Parameters.AddWithValue("@name", txtname.Text);
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@message", txtmsg.Text);

            int res = cmd.ExecuteNonQuery();
            if (res > 0)
            {
                Response.Redirect(Request.Url.ToString(), false);
                txtname.Text = "";
                txtemail.Text = "";
                txtmsg.Text = "";
            }
        }
        else
        {
            Response.Redirect("Login_Registation.aspx");
        }
    }

    public void getdata()
    {
        String strcon = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        string ssql = "select * from contact_us";
        SqlDataAdapter da = new SqlDataAdapter(ssql, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        contactusdata.DataSource = ds;
        contactusdata.DataBind();
    }
}