using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["usernm"] != null)
        {
            Session.Abandon();
            Session.RemoveAll();

            Session["usernm"] = null;
            if (Request.Cookies["CartPID"] != null)
            {
                HttpCookie CartProducts = Request.Cookies["CartPID"];
                CartProducts.Values["CartPID"] = null;
                CartProducts.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(CartProducts);

                if(Request.Cookies["WPID"] != null)
                {
                    HttpCookie WishProducts = Request.Cookies["WPID"];
                    WishProducts.Values["WPID"] = null;
                    WishProducts.Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies.Add(WishProducts);
                }
            }

            else if (Request.Cookies["WPID"] != null)
            {
                HttpCookie WishProducts = Request.Cookies["WPID"];
                WishProducts.Values["WPID"] = null;
                WishProducts.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(WishProducts);
            }

            Response.Redirect("Default.aspx");
        }
    }
}