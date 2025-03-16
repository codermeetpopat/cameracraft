<%@ Page Title="" Language="C#" MasterPageFile="~/Main_Frame_Client.master" AutoEventWireup="true" CodeFile="my-cart.aspx.cs" Inherits="my_cart" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">--%>

    <%--<script type="text/javascript">
        function keyPressed(txt)
        {
            console.log("VAL ===");
            var qty = txt.value;
            console.log("VAL ===" + qty);
            document.getElementById('<%=hidqty.ClientID%>').value = txt.value;
        }
    </script>--%>


    <style>
        .bloc_left_price {
            color: #c01508;
            text-align: center;
            font-weight: bold;
            font-size: 150%;
        }

        .category_block li:hover {
            background-color: #007bff;
        }

            .category_block li:hover a {
                color: #ffffff;
            }

        .category_block li a {
            color: #343a40;
        }

        .add_to_cart_block .price {
            color: #c01508;
            text-align: center;
            font-weight: bold;
            font-size: 200%;
            margin-bottom: 0;
        }

        .add_to_cart_block .price_discounted {
            color: #343a40;
            text-align: center;
            text-decoration: line-through;
            font-size: 140%;
        }

        .product_rassurance {
            padding: 10px;
            margin-top: 15px;
            background: #ffffff;
            border: 1px solid #6c757d;
            color: #6c757d;
        }

            .product_rassurance .list-inline {
                margin-bottom: 0;
                text-transform: uppercase;
                text-align: center;
            }

                .product_rassurance .list-inline li:hover {
                    color: #343a40;
                }

        .reviews_product .fa-star {
            color: gold;
        }

        .pagination {
            margin-top: 20px;
        }

        footer {
            background: #343a40;
            padding: 40px;
        }

            footer a {
                color: #f8f9fa !important;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--<section class="jumbotron text-center">
        <div class="container">
            <h1 class="heading">MY CART</h1>
        </div>
    </section>--%>

    <br />
    <br />

    

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("[id*=txtQuantity]").val("0");
        });
        $("body").on("change keyup", "[id*=txtQuantity]", function () {
            //Check whether Quantity value is valid Float number. 
            var quantity = parseFloat($.trim($(this).val()));
            if (isNaN(quantity)) {
                quantity = 0;
            }

            //Update the Quantity TextBox.
            $(this).val(quantity);

            //Calculate and update Row Total.
            var row = $(this).closest("tr");
            $("[id*=lblTotal]", row).html(parseFloat($(".price", row).html()) * parseFloat($(this).val()));

            //Calculate and update Grand Total.
            var grandTotal = 0;
            $("[id*=lblTotal]").each(function () {
                grandTotal = grandTotal + parseFloat($(this).html());
            });
            $("[id*=lblGrandTotal]").html(grandTotal.toString());
        });
    </script>


    <div class="container mb-4">
        <div class="row">
            <div class="col-12">
                <div class="table-responsive">
                    <h5 class="proNameViewCart" runat="server" id="h5NoItems"></h5> <br />
                    <table class="table table-striped">
                        <%--<thead>
                            <tr>
                                <th scope="col" class="text-center">Image</th>
                                <th scope="col" class="text-center">Product</th>
                                <th scope="col" class="text-center">Size</th>
                                <th scope="col" class="text-center">Price</th>
                                <th scope="col" class="text-center">Quantity</th>
                                <th scope="col" class="text-center">Total</th>
                                <th></th>
                            </tr>
                        </thead>--%>
                        <tbody>
                           <%-- <tr>
                                <div class="col-md-3 pt-5" runat="server" id="divPriceDetails">
                                <div style="border-bottom: 1px solid #eaeaec;">
                                    <h5 class="proNameViewCart">PRICE DETAILS</h5>
                                    <div>
                                        <label>Cart Total</label>
                                        
                                    </div>
                                    <div>
                                        <label>Cart Discount</label>
                                        
                                    </div>
                                </div>
                                <div>
                                    <div class="proPriceView">
                                        <label>Total</label>
                                        
                                    </div>
                                    <div>
                                        
                                    </div>
                                </div>
                            </div>
                            </tr>--%>

                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ShowHeader="true" ShowFooter="true" class="table table-fixed table-hover text-center">
                                <HeaderStyle CssClass="font-weight-bold text-center" />
                                <Columns>
                                    
                                    <asp:BoundField DataField="product_name" HeaderText="Item" />
                                    <asp:BoundField DataField="ssize" HeaderText="Size" />
                                    <asp:BoundField DataField="product_price" HeaderText="Price" ItemStyle-CssClass="price" />
                                    <asp:TemplateField HeaderText="Quantity">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Total">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTotal" runat="server" Text="0" CssClass="font-weight-bold"></asp:Label>
                                        </ItemTemplate>

                                        <FooterTemplate>
                                               <asp:Label runat="server" ID="lblsub" Text="Total" CssClass="font-weight-bold"></asp:Label>
                                        </FooterTemplate>
                                        
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton CommandArgument='<%#Eval("product_id")+"-"+Eval("ssize")%>' ID="btnRemoveItem" OnClick="btnRemoveItem_Click1" CssClass="btn btn-sm btn-danger btn-block" runat="server" Text="Remove"></asp:LinkButton>
                                        </ItemTemplate>

                                        <FooterTemplate>
                                            <%--<asp:Label ID="lblGrandTotal" runat="server" CssClass="font-weight-bold" Text="0.00"></asp:Label>--%>
                                            <%--<span id="lblGrandTotal" runat="server"></span>--%>
                                            <asp:Panel ID="lblGrandTotal" runat="server"></asp:Panel>
                                        </FooterTemplate>

                                    </asp:TemplateField>

                                </Columns>
                                
                            </asp:GridView>
                           

                            <%--<asp:Repeater ID="rptrCartProducts" runat="server" OnItemCommand="rptrCartProducts_ItemCommand">
                                <ItemTemplate>
                                    <tr class="text-center">
                                        <td>
                                            <a href="product_details.aspx?product_id=<%#Eval("product_id") %>">
                                                    <img width="110px" class="media-object" src="Images/<%#Eval("product_id") %>/<%#Eval("Name") %>" alt="" >
                                            </a>
                                        </td>
                                        <td><%#Eval("product_name") %></td>
                                        <td><%#Eval("ssize") %></td>
                                        <td><%#Eval("product_price","{0:c}") %></td>

                                        <td>
                                           <asp:TextBox ID="txtqty" runat="server" Text="1" onchange="keyPressed(this.value)"></asp:TextBox>
                                        </td>

                                        <td><asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox></td>

                                        <td><asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label></td>

                                        <td class="text-right">
                                            <asp:LinkButton CommandArgument='<%#Eval("product_id")%>' CommandName="cartup" ID="btnUpdateItem" OnClick="btnUpdateItem_Click" CssClass="btn btn-primary btn-block" runat="server">Update</asp:LinkButton>
                                            
                                            <asp:LinkButton CommandArgument='<%#Eval("product_id")+"-"+Eval("ssize")%>' ID="btnRemoveItem" OnClick="btnRemoveItem_Click1" CssClass="btn btn-sm btn-danger btn-block" runat="server" Text="REMOVE" />
                                        </td>
                                        
                                        
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>--%>
                            
                            <%--<input type="hidden" runat="server" id="hidqty" />--%>
                            <%--<tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>Sub-Total</td>
                                <td class="text-right"><span class="float-right priceGray" id="spanCartSubTotal" runat="server"></span></td>
                            </tr>
                             <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>Discount</td>
                            <td class="text-right"><span class="float-right priceGreen" id="spanDiscount" runat="server">00.00</span></td>
                        </tr> 
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><strong>Total</strong></td>
                                <td class="text-right"><strong><span class="float-right" id="spanTotal" runat="server"></span></strong></td>
                            </tr>--%>
                        </tbody>
                    </table>
                </div>
            </div>

            
            <div class="col mb-2">
                <div class="row">
                    <div class="col-sm-12  col-md-6">
                        <asp:Button ID="btnshop" OnClick="btnshop_Click" runat="server" CssClass="btn btn-block btn-dark" style="padding:2%" Text="Continue Shopping" />
                        <%--<button class="btn btn-block btn-light">Continue Shopping</button>--%>
                    </div> 
                    <div class="col-sm-12 col-md-6 text-right">
                        <asp:Button ID="btnBuyNow" OnClick="btnBuyNow_Click" class="btn btn-block btn-success " style="padding:2%" runat="server" Text="Buy Now" />
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

