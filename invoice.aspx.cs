using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data;

public partial class invoice : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["usernm"] != null)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
            con.Open();
            SqlCommand cmd5 = new SqlCommand("SELECT * FROM contact_us ", con);
            SqlDataAdapter da5 = new SqlDataAdapter(cmd5);
            System.Data.DataTable dt5 = new System.Data.DataTable();
            da5.Fill(dt5);
            contact.DataSource = dt5;
            contact.DataBind();
            con.Close();
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM user_Data WHERE user_email='" + Session["usernm"] + "' ", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            System.Data.DataTable dt = new System.Data.DataTable();
            da.Fill(dt);
            rpt.DataSource = dt;
            rpt.DataBind();
            con.Close();
            //ordertable
            con.Open();
            //DateTime derDate = DateTime.Now;

            //Response.Write(der);
            SqlCommand cmd2 = new SqlCommand("SELECT user_id FROM user_Data WHERE user_email='" + Session["usernm"] + "' ", con);
            int UID = Convert.ToInt32(cmd2.ExecuteScalar().ToString());
            //Response.Write(UID);
            SqlCommand cmd3 = new SqlCommand(@"SELECT orders_Data.qty,orders_Data.orderDate, product.product_name, product.product_price, (orders_Data.qty * product.product_price) AS total_price FROM orders_Data JOIN product ON orders_Data.product_id = product.product_id JOIN user_Data ON orders_Data.user_id = user_Data.user_id WHERE  orders_Data.order_Status = 'In Process' AND orders_Data.orderDate >= @startOfDay AND orders_Data.orderDate <= @endOfDay AND user_Data.user_id = @UID ORDER BY orders_Data.orderDate DESC", con);
            cmd3.Parameters.AddWithValue("@startOfDay", DateTime.Today);
            cmd3.Parameters.AddWithValue("@endOfDay", DateTime.Today.AddDays(1).AddSeconds(-1));
            cmd3.Parameters.AddWithValue("@UID", UID);
            SqlDataAdapter da1 = new SqlDataAdapter(cmd3);
            DataTable dt1 = new DataTable();
            da1.Fill(dt1);
            if (dt1.Rows.Count == 0)
            {
                //Response.Write("No orders found for the current time.");
                gt.Text = "0";  // If no orders, grand total is 0
                return;
            }
            decimal grandTotal = dt1.AsEnumerable()
                                .Sum(row => row["total_price"] == DBNull.Value ? 0 : Convert.ToDecimal(row["total_price"]));
            gt.Text = "₹" + grandTotal.ToString("F2");
            reptry.DataSource = dt1;
            reptry.DataBind();

            con.Close();



        }
        else
        {
            Response.Redirect("Login_Registation.aspx");
        }
    }
    protected void cancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}