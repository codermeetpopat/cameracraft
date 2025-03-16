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



public partial class Track_Order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindTrackOrder();
        }
    }

    private void BindTrackOrder()
    {
        if (Session["usernm"] != null)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
            con.Open();

            SqlCommand cmd2 = new SqlCommand("SELECT user_id FROM user_Data WHERE user_email='" + Session["usernm"] + "' ", con);
            int UID = Convert.ToInt32(cmd2.ExecuteScalar().ToString());

            SqlCommand cmd = new SqlCommand("select orders_Data.orderid, orders_Data.qty, orders_Data.productSize, orders_Data.orderDate, orders_Data.order_Status, product.product_name, product.product_id, product.product_price, (SELECT TOP(1) product_image.Name from product_image where product.product_id = product_image.product_id) AS Name from orders_Data, product, user_Data where orders_Data.product_id = product.product_id and orders_Data.user_id = user_Data.user_id and user_Data.user_id=" + UID, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            rpttrackorder.DataSource = dt;
            rpttrackorder.DataBind();
        }
        else
        {
            Response.Redirect("Login_Registation.aspx");
        }
    }
    protected void btncancel_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as Button).Parent as RepeaterItem;
        Label orderid = (Label)item.FindControl("orderid");
        String os="cancel";
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();
        SqlCommand cmd5 = new SqlCommand("UPDATE orders_data SET order_Status=@Status WHERE orderid=@oid", con);
        cmd5.Parameters.AddWithValue("@Status",os);
        cmd5.Parameters.AddWithValue("@oid",orderid.Text);
        int res1 = cmd5.ExecuteNonQuery();
        if (res1 > 0)
        {
            Response.Redirect("Track_Order.aspx");
            con.Close();
        }




    }
}