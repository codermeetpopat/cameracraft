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



public partial class payment : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["usernm"]!=null)
        { 
            //Response.Write(Session["usernm"]);
        }
        else
        {
            //Response.Write("not found");
        }
    }
    protected void btncheckout_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        string sqlinsert = "INSERT INTO payment(Name, CardNumber, ExpMonth, ExpYear, cvv) VALUES(@Name, @CardNumber, @ExpMonth, @ExpYear, @cvv)";
        SqlCommand cmd2 = new SqlCommand(sqlinsert, con);

        cmd2.Parameters.AddWithValue("@Name", txtcardowner.Text);
        cmd2.Parameters.AddWithValue("@CardNumber", txtcdnumber.Text);
        cmd2.Parameters.AddWithValue("@ExpMonth", txtmm.Text);
        cmd2.Parameters.AddWithValue("@ExpYear", txtyy.Text);
        cmd2.Parameters.AddWithValue("@cvv", txtcvv.Text);

        int res = cmd2.ExecuteNonQuery();

        if (Request.Cookies["CartPID"] != null)
        {
            string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
            string[] CookieDataArray = CookieData.Split(',');
            if (CookieDataArray.Length > 0)
            {
                DataTable dtBrands = new DataTable();
                for (int i = 0; i < CookieDataArray.Length; i++)
                {
                    string PID = CookieDataArray[i].ToString().Split('-')[0];
                    string SizeID = CookieDataArray[i].ToString().Split('-')[1];
                    string qty = Session["txtQuantity"].ToString();

                    if (res > 0)
                    {
                        Response.Redirect(Request.Url.ToString(), false);

                        SqlCommand cmd4 = new SqlCommand("SELECT user_id FROM user_Data WHERE user_email='" + Session["usernm"] + "' ", con);
                        int UID = Convert.ToInt32(cmd4.ExecuteScalar().ToString());

                        string insert = "INSERT INTO orders_Data(user_id, product_id, qty, productSize, orderDate, paymentType, order_Status) VALUES(@user_id, @product_id, @qty, @productSize, @orderDate, @paymentType, @order_Status)";
                        SqlCommand cmd3 = new SqlCommand(insert, con);

                        Int32 USERID = UID;
                        string paymentType = "CREDIT / DEBIT CARD";
                        string orderStatus = "In Process";
                        string prosize = Convert.ToString(SizeID);
                        DateTime oderDate = DateTime.Now;

                        cmd3.Parameters.AddWithValue("@user_id", USERID);
                        cmd3.Parameters.AddWithValue("@product_id", PID);
                        cmd3.Parameters.AddWithValue("@qty", qty);
                        cmd3.Parameters.AddWithValue("@productSize", prosize);
                        cmd3.Parameters.AddWithValue("@orderDate", oderDate);
                        cmd3.Parameters.AddWithValue("@paymentType", paymentType);
                        cmd3.Parameters.AddWithValue("@order_Status", orderStatus);

                       

                        int res2 = cmd3.ExecuteNonQuery();
                        if (res2 > 0)
                        {
                            Response.Redirect(Request.Url.ToString(), false);
                            //Response.Redirect("Default.aspx");
                            HttpCookie CartProducts = Request.Cookies["CartPID"];
                            CartProducts.Values["CartPID"] = null;
                            CartProducts.Expires = DateTime.Now.AddDays(-1);
                            Response.Cookies.Add(CartProducts);

                        }
                    }
                }
                Response.Redirect("invoice.aspx");
            }
        }


    }
}