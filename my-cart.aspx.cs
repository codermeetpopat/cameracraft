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


public partial class my_cart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //BindCartProducts();
            BindGrid();
        }

    }

    private void BindGrid()
    {
        if (Session["usernm"] != null)
        {   
            if (Request.Cookies["CartPID"] != null)
            {
                string CookieData = Request.Cookies["CartPID"].Value.Split('=')[1];
                string[] CookieDataArray = CookieData.Split(',');
                if (CookieDataArray.Length > 0)
                {
                    h5NoItems.InnerText = "MY CART (" + CookieDataArray.Length + " Items)";
                    DataTable dtBrands = new DataTable();
                    Int64 CartTotal = 0;
                    Int64 Total = 0;
                    for (int i = 0; i < CookieDataArray.Length; i++)
                    {
                        string PID = CookieDataArray[i].ToString().Split('-')[0];
                        string SizeID = CookieDataArray[i].ToString().Split('-')[1];
                        //string UID = CookieDataArray[i].ToString().Split('-')[2];

                        String CS = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
                        using (SqlConnection con = new SqlConnection(CS))
                        {
                            //SELECT product.product_id, product.product_name, product.product_price, product.product_size, (SELECT TOP(1) product_image.Name FROM product_image WHERE product.product_id = product_image.product_id) AS Name FROM product WHERE product.product_id
                            using (SqlCommand cmd = new SqlCommand("SELECT (SELECT '" + SizeID + "') AS ssize, product.product_id, product.product_name, product.product_price, product.product_size, (SELECT TOP(1) product_image.Name FROM product_image WHERE product.product_id = product_image.product_id) AS Name FROM product WHERE product.product_id =" + PID + " ", con))
                            {
                                cmd.CommandType = CommandType.Text;
                                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                                {
                                    sda.Fill(dtBrands);
                                }
                            }
                        }
                       // CartTotal += Convert.ToInt64(dtBrands.Rows[i]["product_price"]);
                        //Total += Convert.ToInt64(dtBrands.Rows[i]["PSelPrice"]);
                        Total = CartTotal;
                    }

                    GridView1.DataSource = dtBrands;
                    GridView1.DataBind();

                    //spanCartSubTotal.InnerText = CartTotal.ToString();
                    //spanTotal.InnerText = "Rs. " + Total.ToString();
                    //spanDiscount.InnerText = "- " + (CartTotal - Total).ToString();

                    //lblGrandTotal.InnerText = Session["total"].ToString();


                    //DataTable dt = new DataTable();
                    //dt.Columns.AddRange(new DataColumn[2] { new DataColumn("Item"), new DataColumn("Price") });
                    //dt.Rows.Add("Shirt", 200);
                    //dt.Rows.Add("Football", 30);
                    //dt.Rows.Add("Bat", 22.5);
                    //GridView1.DataSource = dt;
                    //GridView1.DataBind();
                }
                else
                {
                    h5NoItems.InnerText = "Your Shopping Cart is Empty";
                    //divPriceDetails.Visible = false;
                }
            }
            else
            {
                h5NoItems.InnerText = "Your Shopping Cart is Empty";
                //divPriceDetails.Visible = false;

            }
        }
        else
        {
            Response.Redirect("Login_Registation.aspx");
        }
    }




    protected void btnRemoveItem_Click(object sender, EventArgs e)
    {
        string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
        LinkButton lb = (LinkButton)(sender);
        string PID = lb.CommandArgument;

        List<string> CookiePIDList = CookiePID.Split(',').Select(i => i.Trim()).Where(i => i != string.Empty).ToList();
        CookiePIDList.Remove(PID);
        string CookiePIDUpdated = String.Join(",", CookiePIDList.ToArray());
        if (CookiePIDUpdated == "")
        {
            HttpCookie CartProducts = Request.Cookies["CartPID"];
            CartProducts.Values["CartPID"] = null;
            CartProducts.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(CartProducts);

        }
        else
        {
            HttpCookie CartProducts = Request.Cookies["CartPID"];
            CartProducts.Values["CartPID"] = CookiePIDUpdated;
            CartProducts.Expires = DateTime.Now.AddDays(30);
            Response.Cookies.Add(CartProducts);
        }
        Response.Redirect("my-cart.aspx");
    }
    protected void btnBuyNow_Click(object sender, EventArgs e)
    {
        TextBox txtQuantity = (TextBox)GridView1.Rows[0].FindControl("txtQuantity");
        Session["txtQuantity"] = txtQuantity.Text;

        //Label lblGrandTotal1 = (Label)GridView1.Rows[1].FindControl("lblGrandTotal");
        //Response.Write(lblGrandTotal1);
        //Session["grandtotal"] = lblGrandTotal1;
        

        Response.Redirect("checkout.aspx");
        //if (Session["USERNAME"] != null)
        //{
        //    Response.Redirect("~/Payment.aspx");
        //}
        //else
        //{
        //    Response.Redirect("Login_Registration.aspx?rurl=cart");
        //}
    }
    protected void btnUpdateItem_Click(object sender, EventArgs e)
    {
        //for (int i = 0; i < rptrCartProducts.Items.Count; i++)
        //{

        //    TextBox quantity = (TextBox)rptrCartProducts.Items[i].FindControl("QuantityTextBox");
        //    Label productid = (Label)rptrCartProducts.Items[i].FindControl("ProductIDLabel");
        //    //ShoppingCart.ShoppingCart.Instance.SetItemQuantity(Convert.ToInt32(productid.Text), Convert.ToInt32(quantity.Text));
        //}
        //BindCartProducts();
    }
    protected void btnshop_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void btnRemoveItem_Click1(object sender, EventArgs e)
    {
        string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
        LinkButton lb = (LinkButton)(sender);
        string PID = lb.CommandArgument;

        List<string> CookiePIDList = CookiePID.Split(',').Select(i => i.Trim()).Where(i => i != string.Empty).ToList();
        CookiePIDList.Remove(PID);
        string CookiePIDUpdated = String.Join(",", CookiePIDList.ToArray());
        if (CookiePIDUpdated == "")
        {
            HttpCookie CartProducts = Request.Cookies["CartPID"];
            CartProducts.Values["CartPID"] = null;
            CartProducts.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(CartProducts);

        }
        else
        {
            HttpCookie CartProducts = Request.Cookies["CartPID"];
            CartProducts.Values["CartPID"] = CookiePIDUpdated;
            CartProducts.Expires = DateTime.Now.AddDays(30);
            Response.Cookies.Add(CartProducts);
        }
        Response.Redirect("my-cart.aspx");
    }
    protected void rptrCartProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int PPID = 0;
        int Pqty = 0;
        if(e.CommandName == "cartup")
        {
            PPID = Int32.Parse(e.CommandArgument.ToString());
            //Pqty = Int32.Parse(hidqty.Value);
            Session["qty"] = Pqty;
        }

        string cookiesData = Request.Cookies["CartProID"].Value.Split('=')[1];
        string[] cookieDataArray = cookiesData.Split(',');
        if(cookieDataArray.Length>0)
        {
            DataTable dt = new DataTable();
            Int64 subTotal = 0;
            Int64 cartTotal = 0;

            for(int i=0; i<cookieDataArray.Length; i++)
            {
                string PID = cookieDataArray[i].ToString().Split('-')[0];
                string sizeID = cookieDataArray[i].ToString().Split('-')[1];
                int pid2 = Int32.Parse(PID);

                if(PPID == pid2)
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT (SELECT '" + sizeID + "') AS ssize, product.product_id, product.product_name, product.product_price, product.product_size, (SELECT TOP(1) product_image.Name FROM product_image WHERE product.product_id = product_image.product_id) AS Name FROM product WHERE product.product_id =" + PID + " ", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);

                    subTotal += Convert.ToInt64(dt.Rows[i]["product_price"]) * Pqty;
                    cartTotal += subTotal;

                   // rptrCartProducts.DataSource = dt;

                   // rptrCartProducts.DataBind();
                    //spanCartSubTotal.InnerText = "₹" + subTotal.ToString();
                    //spanTotal.InnerText = "₹" + (cartTotal).ToString();

                }
                else
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT (SELECT '" + sizeID + "') AS ssize, product.product_id, product.product_name, product.product_price, product.product_size, (SELECT TOP(1) product_image.Name FROM product_image WHERE product.product_id = product_image.product_id) AS Name FROM product WHERE product.product_id =" + PID + " ", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);

                    subTotal += Convert.ToInt64(dt.Rows[i]["product_price"]);
                    cartTotal += subTotal;

                 //   rptrCartProducts.DataSource = dt;

                  //  rptrCartProducts.DataBind();
                    //spanCartSubTotal.InnerText = "₹" + subTotal.ToString();
                    //spanTotal.InnerText = "₹" + (cartTotal).ToString();
                }
            }
        }
    }
}