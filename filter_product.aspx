<%@ Page Title="" Language="C#" MasterPageFile="~/Main_Frame_Client.master" AutoEventWireup="true" CodeFile="filter_product.aspx.cs" Inherits="filter_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
<div class="main">
        <div class="wrap">
            <div class="content-bottom">
    <div class="box1">
        <asp:Repeater ID="rptpro" runat="server">
            <ItemTemplate>
                <div class="col_1_of_3 span_1_of_3">
                    <a href="product_details.aspx?product_id=<%#Eval("product_id") %>">
                        <div class="view view-fifth">
                            <div class="top_box">
                                <h3 class="m_1"><%#Eval("product_name") %></h3>
                                <%--<p class="m_2"> <%#Eval("cat_name") %> </p>--%>
                                <div class="grid_img">
                                    <div class="css3">
                                        <img src="Images/<%#Eval("product_id")%>/<%#Eval("Name")%>" alt="Not Work" />
                                    </div>
                                    <div class="mask">
                                        <div class="info">Quick View</div>
                                    </div>
                                </div>
                                <div class="price">Rs. <%#Eval("product_price") %></div>
                            </div>
                        </div>
                    </a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="clear"></div>
    </div>

    </div>
            </div>
    </div>


</asp:Content>

