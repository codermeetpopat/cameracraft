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


public partial class admin_about_contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Bindaboutdata();
            bindrptcontact();
            bindrptshowcontact();
        }
    }

    private void Bindaboutdata()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        SqlCommand cmd = new SqlCommand("SELECT * FROM about_us", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        rptabout.DataSource = dt;
        rptabout.DataBind();
    }


    public void bindrptcontact()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        SqlCommand cmd = new SqlCommand("SELECT * FROM contact_us", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        rptcontact.DataSource = dt;
        rptcontact.DataBind();
    }

    public void bindrptshowcontact()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        SqlCommand cmd = new SqlCommand("SELECT * FROM contact_query", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        rptcontactquery.DataSource = dt;
        rptcontactquery.DataBind();
    }

    protected void btncontact_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        RepeaterItem item = (sender as Button).Parent as RepeaterItem;
        TextBox txtnm = (TextBox)item.FindControl("txtnm");
        TextBox txtemail = (TextBox)item.FindControl("txtemail");
        TextBox txtphone = (TextBox)item.FindControl("txtphone");
        TextBox txtaddress = (TextBox)item.FindControl("txtaddress");

        SqlCommand cmd = new SqlCommand("update contact_us set name=@name, email=@email, phone=@phone, address=@address", con);

        cmd.Parameters.AddWithValue("@name", txtnm.Text);
        cmd.Parameters.AddWithValue("@email", txtemail.Text);
        cmd.Parameters.AddWithValue("@phone", txtphone.Text);
        cmd.Parameters.AddWithValue("@address", txtaddress.Text);

        int res = cmd.ExecuteNonQuery();
        if (res > 0)
        {
            Response.Redirect(Request.Url.ToString(), false);
            con.Close();
        }
    }
    protected void btnabout_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        RepeaterItem item = (sender as Button).Parent as RepeaterItem;
        TextBox txtdetail = (TextBox)item.FindControl("txtdetail");

        SqlCommand cmd = new SqlCommand("update about_us set details=@details", con);

        cmd.Parameters.AddWithValue("@details", txtdetail.Text);
        
        int res = cmd.ExecuteNonQuery();
        if (res > 0)
        {
            Response.Redirect(Request.Url.ToString(), false);
            con.Close();
        }
    }
}