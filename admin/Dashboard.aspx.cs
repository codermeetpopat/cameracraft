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



public partial class admin_Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            categorydata();
            productdata();
            orderdata();
        }

        if (Session["username"] == null)
        {
            //Go to Error Page or Default page  
            Response.Write("Session is null");
            return;
        }
        else
        {
            lblname.Text = Session["username"].ToString();
        }  
        
    }

    public void categorydata()
    {
        String strcon = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        string ssql = "SELECT COUNT(cat_id) AS cat FROM category";
        SqlDataAdapter da = new SqlDataAdapter(ssql, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        rptcategory.DataSource = ds;
        rptcategory.DataBind();
    }

    public void productdata()
    {
        String strcon = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        string ssql = "SELECT COUNT(product_id) AS pro FROM product";
        SqlDataAdapter da = new SqlDataAdapter(ssql, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        rptproduct.DataSource = ds;
        rptproduct.DataBind();
    }

    public void orderdata()
    {
        String strcon = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
        SqlConnection con = new SqlConnection(strcon);
        con.Open();
        string ssql = "SELECT COUNT(orderid) AS ord FROM orders_Data";
        SqlDataAdapter da = new SqlDataAdapter(ssql, con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        rptorder.DataSource = ds;
        rptorder.DataBind();
    }
}