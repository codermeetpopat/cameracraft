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


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindProductReapeter();
        //Response.Write(Session["usernm"]);
    }


    private void BindProductReapeter()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        //SELECT TOP 6 product.product_id, product.product_name,category.cat_name ,product.product_price, (SELECT TOP(1) product_image.Name FROM product_image WHERE product.product_id=product_image.product_id) AS Name FROM product, category ORDER BY product.product_id DESC;
        SqlCommand cmd = new SqlCommand("SELECT TOP 3 product.product_id, product.product_name,product.product_price, (SELECT TOP(1) product_image.Name FROM product_image WHERE product.product_id=product_image.product_id) AS Name FROM product ORDER BY product.product_id DESC", con);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        rptpro.DataSource = dt;
        rptpro.DataBind();

        SqlCommand cmd1 = new SqlCommand("SELECT * FROM (SELECT product.product_id, product.product_name,product.product_price, (SELECT TOP(1) product_image.Name FROM product_image WHERE product.product_id=product_image.product_id) AS Name FROM product) AS Tab ORDER BY product_id DESC OFFSET 3 ROWS FETCH NEXT 6 ROWS ONLY ", con);

        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        DataTable dt1 = new DataTable();
        da1.Fill(dt1);
        rptpro2.DataSource = dt1;
        rptpro2.DataBind();

       
    }

}
