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



public partial class product_details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["product_id"]!=null)
        {
            if(!IsPostBack)
            {
                BindProductImage();
                BindProductDetails();
                rptreleatedpro();
                bindcategory();
            }
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }

   

    private void BindProductImage()
    {
        Int64 PID = Convert.ToInt64(Request.QueryString["product_id"]);
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM product_image WHERE product_id="+PID+"",con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        rptpro.DataSource = dt;
        rptpro.DataBind();
    }


    protected string getActiveClass(int ItemIndex)
    {
        if(ItemIndex == 0)
        {
            return "active";
        }
        else
        {
            return "";
        }
    }

    private void BindProductDetails()
    {
        Int64 PID = Convert.ToInt64(Request.QueryString["product_id"]);
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        SqlCommand cmd = new SqlCommand("SELECT * FROM product WHERE product_id=" + PID + "", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        rptprodata.DataSource = dt;
        rptprodata.DataBind();
    }


    protected void rptprodata_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Int64 PID = Convert.ToInt64(Request.QueryString["product_id"]);
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            RadioButtonList rblsize = (RadioButtonList) e.Item.FindControl("radiosize") ;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
            con.Open();

            SqlCommand cmd = new SqlCommand("SELECT product_size FROM product WHERE product_id=" + PID + "", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
           // rptprodata.DataSource = dt;
           // rptprodata.DataBind();

            if (dt.Rows.Count > 0)
            {
                string chkvalues = dt.Rows[0]["product_size"].ToString();
                //Int64 chkvalues = Convert.ToInt64(dt.Rows[0]["product_size"];
                foreach (string psize in chkvalues.Split(','))
                {
                    ListItem items = new ListItem();
                    items.Text = psize;
                    items.Value = psize;
                    //Response.Write(rblsize.ToString());
                    //Response.End();
                    rblsize.Items.Add(items);
                }
            }
            con.Close();
        }
        
    }
    protected void rptprodata_DataBinding(object sender, EventArgs e)
    {
       
    }
    protected void rptprodata_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        
    }
    protected void btnaddcart_Click(object sender, EventArgs e)
    {
        if (Session["usernm"] != null)
        {
            string SelectedSize = string.Empty;
            foreach (RepeaterItem item in rptprodata.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    var rbList = item.FindControl("radiosize") as RadioButtonList;
                    SelectedSize = rbList.SelectedValue;

                    var lblError = item.FindControl("lblError") as Label;
                    lblError.Text = "";
                }
            }

            if (SelectedSize != "")
            {
                Int64 PID = Convert.ToInt64(Request.QueryString["product_id"]);
                Response.Write(PID.ToString());
                //Response.End();
                if (Request.Cookies["CartPID"] != null)
                {
                    string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
                    CookiePID = CookiePID + "," + PID + "-" + SelectedSize;

                    HttpCookie CartProducts = new HttpCookie("CartPID");
                    CartProducts.Values["CartPID"] = CookiePID;
                    CartProducts.Expires = DateTime.Now.AddDays(30);
                    Response.Cookies.Add(CartProducts);
                }
                else
                {
                    HttpCookie CartProducts = new HttpCookie("CartPID");
                    CartProducts.Values["CartPID"] = PID.ToString() + "-" + SelectedSize;
                    CartProducts.Expires = DateTime.Now.AddDays(30);
                    Response.Cookies.Add(CartProducts);
                }
                //Response.Redirect("~/product_details.aspx?PID=" + PID);
                Response.Redirect("my-cart.aspx?PID=" + PID);
            }
            else
            {
                foreach (RepeaterItem item in rptprodata.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {
                        var lblError = item.FindControl("lblError") as Label;
                        lblError.Text = "Please select a size";
                    }
                }
            }

        }

        else
        {
            Response.Redirect("Login_Registation.aspx");
        }

    }
    protected void lbwishlist_Click(object sender, EventArgs e)
    {
        if (Session["usernm"] != null)
        {

        string SelectedSize = string.Empty;
        foreach (RepeaterItem item in rptprodata.Items)
        {
            if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
            {
                var rbList = item.FindControl("radiosize") as RadioButtonList;
                SelectedSize = rbList.SelectedValue;

                var lblError = item.FindControl("lblError") as Label;
                lblError.Text = "";
            }
        }

        if (SelectedSize != "")
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["product_id"]);

            if (Request.Cookies["WPID"] != null)
            {
                string CookiePID = Request.Cookies["WPID"].Value.Split('=')[1];
                CookiePID = CookiePID + "," + PID + "-" + SelectedSize;

                HttpCookie CartProducts = new HttpCookie("WPID");
                CartProducts.Values["WPID"] = CookiePID;
                CartProducts.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(CartProducts);
            }
            else
            {
                HttpCookie CartProducts = new HttpCookie("WPID");
                CartProducts.Values["WPID"] = PID.ToString() + "-" + SelectedSize;
                CartProducts.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(CartProducts);
            }
            //Response.Redirect("~/product_details.aspx?PID=" + PID);
            Response.Redirect("wishlist.aspx?PID=" + PID);
        }
        else
        {
            foreach (RepeaterItem item in rptprodata.Items)
            {
                if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                {
                    var lblError = item.FindControl("lblError") as Label;
                    lblError.Text = "Please select a size";
                }
            }
        }

        }

        else
        {
            Response.Redirect("Login_Registation.aspx");
        }
    }


    public void rptreleatedpro()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        SqlCommand cmd = new SqlCommand("SELECT TOP 10 product.product_id, product.product_name,product.product_price, (SELECT TOP(1) product_image.Name FROM product_image WHERE product.product_id=product_image.product_id) AS Name FROM product ORDER BY product.product_id DESC", con);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        rptreleatedproduct.DataSource = dt;
        rptreleatedproduct.DataBind();
    }


    public void bindcategory()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        SqlCommand cmd = new SqlCommand("SELECT * FROM category", con);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        rptcategory.DataSource = dt;
        rptcategory.DataBind();
    }
}