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

public partial class admin_usermanage : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)

        {
            user();
        }
    }
    private void user()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();
        //select orders_Data.orderid, orders_Data.qty, orders_Data.productSize, orders_Data.orderDate, orders_Data.order_Status, orders_Data.paymentType, user_Data.user_name, user_Data.user_email, user_Data.user_mobile, user_Data.Address, product.product_name, product.product_price, orders_Data.paymentType FROM orders_Data, product, user_Data WHERE orders_Data.product_id = product.product_id AND orders_Data.user_id = user_Data.user_id
        SqlCommand cmd = new SqlCommand("SELECT * from user_data", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        rpt.DataSource = dt;
        rpt.DataBind();
        con.Close();
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
         Label orderid = (Label)item.FindControl("userid");
        LinkButton lbaction = (LinkButton)item.FindControl("lbaction");
        LinkButton lbupdate = (LinkButton)item.FindControl("lbupdate");
        LinkButton lbcancle = (LinkButton)item.FindControl("lbcancle");


        ddlorderstatus.Visible = false;
        orderstatus.Visible = true;
        lbaction.Visible = true;
        lbcancle.Visible = false;
        lbupdate.Visible = false;
        //Response.Write("orderid.Text");
        Response.Write("<script>alert('User ID: " + orderid.Text + "');</script>");
        Response.Write("<script>alert('New Status: " + ddlorderstatus.SelectedItem.Value + "');</script>");
     
        String newstatus=ddlorderstatus.SelectedItem.Value;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();

        SqlCommand cmd2 = new SqlCommand("UPDATE user_Data SET status=@Status WHERE user_id=@userid", con);
        cmd2.Parameters.AddWithValue("@Status",newstatus);
             cmd2.Parameters.AddWithValue("@userid",orderid.Text);
        int res2 = cmd2.ExecuteNonQuery();
        if (res2 > 0)
        {
            Response.Redirect("usermanage.aspx");
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


     protected void btndelete_Click(object sender, EventArgs e)
     {
         RepeaterItem item = (sender as Button).Parent as RepeaterItem;
         Label orderid = (Label)item.FindControl("userid");
         SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
         con.Open();

         SqlCommand cmd3 = new SqlCommand("DELETE FROM user_Data WHERE user_id=" + orderid.Text, con);
         int res3 = cmd3.ExecuteNonQuery();
         if (res3 > 0)
         {
             Response.Redirect("usermanage.aspx");

         }
         con.Close();

     }
}