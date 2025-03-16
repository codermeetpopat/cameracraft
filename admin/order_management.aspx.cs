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

public partial class admin_order_management : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        { 
            BindOrderData();
        }
    }

    private void BindOrderData()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();
        //select orders_Data.orderid, orders_Data.qty, orders_Data.productSize, orders_Data.orderDate, orders_Data.order_Status, orders_Data.paymentType, user_Data.user_name, user_Data.user_email, user_Data.user_mobile, user_Data.Address, product.product_name, product.product_price, orders_Data.paymentType FROM orders_Data, product, user_Data WHERE orders_Data.product_id = product.product_id AND orders_Data.user_id = user_Data.user_id
        SqlCommand cmd = new SqlCommand("SELECT orders_Data.orderid, orders_Data.qty, orders_Data.productSize, orders_Data.orderDate, orders_Data.order_Status, user_Data.user_name, user_Data.user_email, user_Data.user_mobile, user_Data.Address, product.product_name, product.product_price, orders_Data.paymentType FROM orders_Data, product, user_Data WHERE orders_Data.product_id = product.product_id AND orders_Data.user_id = user_Data.user_id", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        rptrOrderData.DataSource = dt;
        rptrOrderData.DataBind();
    }
    protected void lbaction_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        Label orderstatus = (Label)item.FindControl("orderstatus");
        DropDownList ddlorderstatus = (DropDownList)item.FindControl("ddlorderstatus");
        LinkButton lbaction = (LinkButton)item.FindControl("lbaction");
        LinkButton lbupdate = (LinkButton)item.FindControl("lbupdate");
        LinkButton lbcancle = (LinkButton)item.FindControl("lbcancle");

        ddlorderstatus.Visible = true;
        orderstatus.Visible = false;
        lbaction.Visible = false;
        lbcancle.Visible = true;
        lbupdate.Visible = true;
    }
    protected void lbupdate_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        DropDownList ddlorderstatus = (DropDownList)item.FindControl("ddlorderstatus");
        Label orderstatus = (Label)item.FindControl("orderstatus");
        Label orderid = (Label)item.FindControl("orderid");
        LinkButton lbaction = (LinkButton)item.FindControl("lbaction");
        LinkButton lbupdate = (LinkButton)item.FindControl("lbupdate");
        LinkButton lbcancle = (LinkButton)item.FindControl("lbcancle");

        ddlorderstatus.Visible = false;
        orderstatus.Visible = true;
        lbaction.Visible = true;
        lbcancle.Visible = false;
        lbupdate.Visible = false;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        SqlCommand cmd2 = new SqlCommand("UPDATE orders_Data SET order_Status=@order_Status WHERE orderid=" + orderid.Text, con);
        cmd2.Parameters.AddWithValue("@order_Status", ddlorderstatus.SelectedItem.Value);
        int res2 = cmd2.ExecuteNonQuery();
        if(res2>0)
        {
            Response.Redirect(Request.Url.ToString(), false);
            con.Close();
        }
    }
    protected void lbcancle_Click(object sender, EventArgs e)
    {
        RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
        DropDownList ddlorderstatus = (DropDownList)item.FindControl("ddlorderstatus");
        Label orderstatus = (Label)item.FindControl("orderstatus");
        LinkButton lbaction = (LinkButton)item.FindControl("lbaction");
        LinkButton lbupdate = (LinkButton)item.FindControl("lbupdate");
        LinkButton lbcancle = (LinkButton)item.FindControl("lbcancle");

        ddlorderstatus.Visible = false;
        orderstatus.Visible = true;
        lbaction.Visible = true;
        lbcancle.Visible = false;
        lbupdate.Visible = false;
    }
}