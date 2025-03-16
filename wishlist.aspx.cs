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


public partial class wishlist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindWishlistProducts();
    }


    private void BindWishlistProducts()
    {
        if (Request.Cookies["WPID"] != null)
        {
            string CookieData = Request.Cookies["WPID"].Value.Split('=')[1];
            string[] CookieDataArray = CookieData.Split(',');
            if (CookieDataArray.Length > 0)
            {
                h5NoItems.InnerText = "My Wishlist (" + CookieDataArray.Length + " Items)";
                DataTable dtBrands = new DataTable();
                Int64 CartTotal = 0;
                Int64 Total = 0;
                for (int i = 0; i < CookieDataArray.Length; i++)
                {
                    string PID = CookieDataArray[i].ToString().Split('-')[0];
                    string SizeID = CookieDataArray[i].ToString().Split('-')[1];

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
                    //CartTotal += Convert.ToInt64(dtBrands.Rows[i]["product_price"]);
                    //Total += Convert.ToInt64(dtBrands.Rows[i]["PSelPrice"]);
                    //Total = CartTotal;
                }
                rptrWishlistProducts.DataSource = dtBrands;
                rptrWishlistProducts.DataBind();
                //divPriceDetails.Visible = true;

                //spanCartTotal.InnerText = CartTotal.ToString();
                //spanTotal.InnerText = "Rs. " + Total.ToString();
                //spanDiscount.InnerText = "- " + (CartTotal - Total).ToString();
            }
            else
            {
                //TODO Show Empty Cart
                h5NoItems.InnerText = "Your Shopping Wishlist is Empty";
                //divPriceDetails.Visible = false;
            }
        }
        else
        {
            //TODO Show Empty Cart
            h5NoItems.InnerText = "Your Shopping Wishlist is Empty";
            //divPriceDetails.Visible = false;

        }
    }


    protected void btnaddcart_Click(object sender, EventArgs e)
    {
        //string SelectedSize = string.Empty;
        
        //if (SelectedSize != "")
        //{
        //    Int64 PID = Convert.ToInt64(Request.QueryString["product_id"]);

        //    if (Request.Cookies["CartPID"] != null)
        //    {
        //        string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
        //        CookiePID = CookiePID + "," + PID + "-" + SelectedSize;

        //        HttpCookie CartProducts = new HttpCookie("CartPID");
        //        CartProducts.Values["CartPID"] = CookiePID;
        //        CartProducts.Expires = DateTime.Now.AddDays(30);
        //        Response.Cookies.Add(CartProducts);
        //    }
        //    else
        //    {
        //        HttpCookie CartProducts = new HttpCookie("CartPID");
        //        CartProducts.Values["CartPID"] = PID.ToString() + "-" + SelectedSize;
        //        CartProducts.Expires = DateTime.Now.AddDays(30);
        //        Response.Cookies.Add(CartProducts);
        //    }
        //    //Response.Redirect("~/product_details.aspx?PID=" + PID);
        //    Response.Redirect("my-cart.aspx?PID=" + PID);
        //}
        //else
        //{
        //    foreach (RepeaterItem item in rptrWishlistProducts.Items)
        //    {
        //        if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
        //        {
        //            var lblError = item.FindControl("lblError") as Label;
        //            lblError.Text = "Please select a size";
        //        }
        //    }
        //}

        if (Request.Cookies["WPID"] != null)
        {
            string cookiesData = Request.Cookies["WPID"].Value.Split('=')[1];
            string[] cookieDataArray = cookiesData.Split(',');
            if (cookieDataArray.Length > 0)
            {

                DataTable dt = new DataTable();

                for (int i = 0; i < cookieDataArray.Length; i++)
                {
                    string PID = cookieDataArray[i].ToString().Split('-')[0];
                    string sizeID = cookieDataArray[i].ToString().Split('-')[1];

                    if (Request.Cookies["CartPID"] != null) // IF THE COOKIE ALREADY CREATED
                    {
                        string cookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
                        cookiePID = cookiePID + "," + PID + "-" + sizeID;


                        HttpCookie cartProducts = new HttpCookie("CartPID");
                        cartProducts.Values["CartPID"] = cookiePID;
                        cartProducts.Expires = DateTime.Now.AddDays(30);
                        Response.Cookies.Add(cartProducts);
                    }
                    else
                    {
                        HttpCookie cartProducts = new HttpCookie("CartPID");
                        cartProducts.Values["CartPID"] = PID.ToString() + "-" + sizeID;
                        //cartProducts.Values["CartProID"] = PID.ToString();
                        cartProducts.Expires = DateTime.Now.AddDays(30);
                        Response.Cookies.Add(cartProducts);
                    }

                }

            }

            else
            {
            }

        }
    }
    protected void wishlistRemove_Click(object sender, EventArgs e)
    {
        string CookiePID = Request.Cookies["WPID"].Value.Split('=')[1];
        LinkButton lb = (LinkButton)(sender);
        string PID = lb.CommandArgument;

        List<string> CookiePIDList = CookiePID.Split(',').Select(i => i.Trim()).Where(i => i != string.Empty).ToList();
        CookiePIDList.Remove(PID);
        string CookiePIDUpdated = String.Join(",", CookiePIDList.ToArray());
        if (CookiePIDUpdated == "")
        {
            HttpCookie CartProducts = Request.Cookies["WPID"];
            CartProducts.Values["WPID"] = null;
            CartProducts.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(CartProducts);

        }
        else
        {
            HttpCookie CartProducts = Request.Cookies["WPID"];
            CartProducts.Values["WPID"] = CookiePIDUpdated;
            CartProducts.Expires = DateTime.Now.AddDays(30);
            Response.Cookies.Add(CartProducts);
        }
        Response.Redirect("wishlist.aspx");
    }
}