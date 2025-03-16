<%@ Page Language="C#" AutoEventWireup="true" CodeFile="invoice.aspx.cs" Inherits="invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CameraCraft</title>
 <style>
        body {
            background-color: #F6F6F6;
            margin: 0;
            padding: 0;
        }
        img {
            display: block;
            margin-left: 87%;
            margin-right: auto;
            width: 25%;
            height: 100%;
        }
        h3 {
            font-size: 85%;
        }
        h4, h5, h6 {
            margin: 0;
            padding: 0;
        }
        p {
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin-right: auto;
            margin-left: auto;
        }
        .brand-section {
            background-color: #fff;
            padding: 10px 40px;
            border: 1px solid black;
            height: 50%;
        }
        .logo {
            width: 50%;
        }
        .row {
            display: flex;
            flex-wrap: wrap;
        }
        .col-6 {
            width: 50%;
            flex: 0 0 auto;
            font-size: 200%;
            text-align: left;
        }
        .text-white {
            color: #fff;
        }
        .company-details {
            float: right;
            text-align: right;
        }
        .body-section {
            padding: 25px;
            border: 1px solid gray;
        }
        .heading {
            font-size: 40px;
            margin-bottom: 08px;
        }
        .sub-heading {
            color: #262626;
            margin-bottom: 05px;
        }
        table {
            background-color: #fff;
            width: 100%;
            border-collapse: collapse;
        }
        table thead tr {
            border: 1px solid #111;
            background-color: black;
            color: #fff;
        }
        table td {
            vertical-align: middle !important;
            text-align: center;
        }
        table th, table td {
            padding-top: 08px;
            padding-bottom: 08px;
        }
        .table-bordered {
            box-shadow: 0px 0px 5px 0.5px gray;
        }
        .table-bordered td, .table-bordered th {
            border: 1px solid #dee2e6;
        }
        .text-right {
            text-align: end;
        }
        .w-20 {
            width: 20%;
        }
        .float-right {
            float: right;
        }
        .button {
  background-color: #04AA6D; /* Green */
  border: none;
  color: white;
  padding: 20px;
  width: 10%;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 5px;
  cursor: pointer;
  display: block;
 margin-left: 50%;

}
            
        .btn{
              background-color: #04AA6D; /* Green */
  border: none;
  color: white;
  padding: 20px;
  width: 10%;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 5px;
  cursor: pointer;
  display: block;
 margin-left: 50%;
        }



    </style>

</head>
<body runat="server">
        <form runat="server">
 
    
     <div class="container">
        <div class="brand-section">
            <div class="row">
                <div class="col-6">
                    <img src="logovs.png" />
                    <!-- <h1 class="text-white">FABCART</h1> -->
                </div>
             
                <asp:Repeater ID="contact" runat="server">
                    <ItemTemplate>
                 </div>
                 <br />
                <br />
            <p style="text-align:center;"><b> <%#Eval("email") %>, <%#Eval("phone") %>, <%#Eval("address") %></b></p>
        </div>
             </ItemTemplate>
            </asp:Repeater>
                <!-- <div class="col-6">
                     <div class="company-details">
                        <p class="text-white">assdad asd  asda asdad a sd</p>
                        <p class="text-white">assdad asd asd</p>

                        <p class="text-white">+91 888555XXXX</p>
                    </div>
                </div> -->
            </div>
        </div>

        <div class="body-section">
            <asp:Repeater ID="rpt" runat="server">
            <ItemTemplate>
            <div class="row">
                <div class="col-6">
                    <p class="sub-heading">Full Name:<%#Eval("Fullname") %>  </p>
                    <p class="sub-heading">Address:<%#Eval("Address") %>   </p>
                     <p class="sub-heading">Pincode:<%#Eval("Pin_code") %> </p>
                     <p class="sub-heading">State: <%#Eval("State") %> </p>
                    <p class="sub-heading">Country: <%#Eval("Country") %>  </p>
                     <p class="sub-heading">Phone Number:<%#Eval("user_mobile") %>   </p>
                  
                </div>
                  </ItemTemplate>
                  </asp:Repeater>

                <div class="col-6">


                </div>
            </div>
        </div>

        <div class="body-section">
            <h3 class="heading">Ordered Items</h3>
            <br>
            <table class="table-bordered">
                <thead>
                    <tr>
                        <th>Product Name</th>
                        <th>Order Date</th>
                        <th class="w-20">Price </th>
                        <th class="w-20">Quantity</th>
                       
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="reptry" runat="server">
                        <ItemTemplate>
                            <tr>
             <td><%# Eval("product_name") != DBNull.Value ? Eval("product_name") : "No Name" %></td>
             <td><%# Eval("orderDate") != DBNull.Value ? Eval("orderDate") : "-" %></td>
            <td><%# Eval("product_price") != DBNull.Value ? Eval("product_price") : "0" %></td>
            <td><%# Eval("qty") != DBNull.Value ? Eval("qty") : "0" %></td>

                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                 
                    <!--<tr>
                        <td colspan="3" class="text-right">Grand Total</td>
                        <td> </td>
                    </tr>-->
                </tbody>
            </table>
            <br>
            <h3 class="heading">Grand total:<asp:Label ID="gt" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label> </h3>
<!-- 
            <h3 class="heading">Payment Status: Paid</h3>
            <h3 class="heading">Payment Mode: Cash on Delivery</h3>
 -->        </div>

      
    </div>  
                    <button class="button" onclick="window.print()">Print</button>
    
            <asp:Button ID="cancel" runat="server" Text="Cancel" CssClass="btn" OnClick="cancel_Click" /> 

    </form>

</body>
</html>