<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Main_Frame.master" AutoEventWireup="true" CodeFile="order_management.aspx.cs" Inherits="admin_order_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <div class="content-wrapper pb-0">
        <div class="row">
            <div class="col-xl-12 stretch-card grid-margin">
                <div class="card" style="box-shadow: 5px 10px 18px #000;">
                    <div class="card-body">
                        <h2 class="text-center"> Orders</h2>
                        <div class="table-content table-responsive">
                            <table class="table table-striped table-bordered dt-responsive nowrap" data-search="true" data-filter-control="true" data-show-export="true" data-click-to-select="true">
                                <thead class="text-center">
                                    <tr class="text-center">
                                        <th>Order id</th>
                                        <th>Product Name</th>
                                        <th>User Name</th>
                                        <th>Quantity</th>
                                        <th>Product Size</th>
                                        <th>Order Date</th>
                                        <th>Payment Type</th>
                                        <th>Order Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <asp:Repeater ID="rptrOrderData" runat="server">
                                        <ItemTemplate>
                                            <tr class="text-center">
                                                <td>
                                                    <asp:Label ID="orderid" runat="server" Text='<%#Eval("orderid") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <%#Eval("product_name") %>
                                                </td>
                                                <td>
                                                    <%#Eval("user_name") %>
                                                </td>
                                                <td>
                                                    <%#Eval("qty") %>
                                                </td>
                                                <td>
                                                    <%#Eval("productSize") %>
                                                </td>
                                                <td>
                                                    <%#Eval("orderDate") %>
                                                </td>
                                                <td>
                                                    <%#Eval("paymentType") %>
                                                </td>
                                                <td>
                                                    <asp:Label ID="orderstatus" runat="server" Text='<%#Eval("order_Status") %>'></asp:Label>
                                                    <asp:DropDownList ID="ddlorderstatus" runat="server" AutoPostBack="true" Visible="false">
                                                        <asp:ListItem> --Select Status-- </asp:ListItem>
                                                        <asp:ListItem> In Process </asp:ListItem>
                                                        <asp:ListItem> Delievered </asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:LinkButton ID="lbaction" runat="server" OnClick="lbaction_Click"><i class="mdi mdi-pencil-box-outline"</asp:LinkButton>
                                                    <asp:LinkButton ID="lbupdate" runat="server" OnClick="lbupdate_Click" class="col-sm-6 col-md-4 col-lg-3" Visible="false"><i class="mdi mdi-autorenew"></i></asp:LinkButton>
                                                    <asp:LinkButton ID="lbcancle" runat="server" OnClick="lbcancle_Click" class="col-sm-6 col-md-4 col-lg-3" Visible="false"><i class="mdi mdi-backspace"></i></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




</asp:Content>

