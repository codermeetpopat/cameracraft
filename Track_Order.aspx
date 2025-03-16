<%@ Page Title="" Language="C#" MasterPageFile="~/Main_Frame_Client.master" AutoEventWireup="true" CodeFile="Track_Order.aspx.cs" Inherits="Track_Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/bootstrap.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />

    <div class="container mb-4">
        <div class="row">
            <div class="col-12">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead class="text-center font-weight-bold">
                            <tr>
                                <th> Order Id </th>
                                <th> Product </th>
                                <th> Name </th>
                                <th> Size </th>
                                <th> Quantity </th>
                                <th> Price per Unit</th>
                                <%--<th> Total </th>--%>
                                <th> Order Date </th>
                                <th> Order Status </th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody class="text-center">
                            <asp:Repeater ID="rpttrackorder" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                                    <asp:Label ID="orderid" runat="server" Text='<%#Eval("orderid") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <a href="product_details.aspx?product_id=<%#Eval("product_id") %>">
                                                    <img src="Images/<%#Eval("product_id")%>/<%#Eval("Name")%>" height="100" width="150" alt="" />
                                            </a>
                                        </td>
                                        <td><%#Eval("product_name") %></td>
                                        <td><%#Eval("productSize") %></td>
                                        <td><%#Eval("qty") %></td>
                                        <td><%#Eval("product_price") %></td>
                                        <%--<td><%#(Convert.ToInt32(DataBinder.Eval(Container,"DataItem.product_price"))) + (Convert.ToInt32(DataBinder.Eval(Container,"DataItem.qty"))) %></td>--%>
                                        <td><%#Eval("orderDate") %></td>
                                        <td><%#Eval("order_Status") %></td>
                                        <td><asp:Button ID="btncancel" runat="server" Text="Cancel Order"  ForeColor="black"  BackColor="#DBD3D8" OnClick="btncancel_Click"  /> </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

