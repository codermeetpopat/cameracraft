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


public partial class filter_product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
            if (!IsPostBack)
            {
                BindProductDetails();
            }
        
        else
        {
            Response.Redirect("Default.aspx");
        }
    }

    private void BindProductDetails()
    {
        Int64 catId = Convert.ToInt64(Request.QueryString["cat_id"]);
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        SqlCommand cmd = new SqlCommand("SELECT product.product_id, product.product_name, product.product_price, (SELECT TOP (1) product_image.Name FROM product_image WHERE product.product_id = product_image.product_id) AS name FROM product join category ON category.cat_id = product.cat_id WHERE product.cat_id = " + catId + " OR product.product_id = " + catId + " ORDER BY product.product_id DESC", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        rptpro.DataSource = dt;
        rptpro.DataBind();
    }

}