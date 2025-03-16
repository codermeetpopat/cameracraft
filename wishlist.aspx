<%@ Page Title="" Language="C#" MasterPageFile="~/Main_Frame_Client.master" AutoEventWireup="true" CodeFile="wishlist.aspx.cs" Inherits="wishlist" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" href="css/bootstrap.min.css" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <br /><br />
    <div class="container mb-4">
        <div class="row">
            <div class="col-12">
                <div class="table-responsive">
                            <form action="#">
                                <h5 class="proNameViewWishlist" runat="server" id="h5NoItems"></h5> <br />
                                <div class=" table-content table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                            <tr class="text-center">
                                                <th class="plantmore-product-remove">Remove</th>
                                                <th class="plantmore-product-thumbnail">Images</th>
                                                <th class="cart-product-name">Product</th>
                                                <th class="plantmore-product-price">Size</th>
                                                <th class="plantmore-product-stock-status">Price</th>
                                               
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                            <asp:Repeater ID="rptrWishlistProducts" runat="server">
                                                <ItemTemplate>
                                                    <tr class="text-center">
                                                        <td>
                                                            <asp:LinkButton ID="wishlistRemove" CommandArgument='<%#Eval("product_id")+"-"+Eval("ssize")%>' OnClick="wishlistRemove_Click" runat="server"><i class="fa fa-times"> Remove</i></asp:LinkButton>
                                                        </td>
                                                        <td>
                                                            <a href="ProductView.aspx?PID=<%#Eval("product_id") %>" target="_blank">
                                                                <img width="110px" class="media-object" src="Images/<%#Eval("product_id") %>/<%#Eval("Name") %>" alt="<%#Eval("Name") %>" onerror="this.src='images/noimage.jpg'">
                                                            </a>
                                                        </td>
                                                        <td><%#Eval("product_name") %></td>
                                                        <td><%#Eval("ssize") %></td>
                                                        <td><%#Eval("product_price","{0:c}") %></td>
                                                        
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            
                                                            
                                        </tbody>
                                    </table>
                                    <%--<asp:Button  ID="btnaddcart" runat="server" OnClick="btnaddcart_Click" Text="Add To Cart" />--%>
                                </div>
                            </form>
                            </div>
                    </div>
                </div>
            </div>


</asp:Content>

