<%@ Page Title="" Language="C#" MasterPageFile="~/Main_Frame_Client.master" AutoEventWireup="true" CodeFile="contact_us.aspx.cs" Inherits="contact_us" EnableEventValidation="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <%--<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">--%>
<%--<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>--%>
<%--<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>
    <%--<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">--%>

    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br /><br />
    

<div class="container">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header bg-success text-white text-uppercase"><i class="fa fa-envelope"></i> Contact us
                </div>
                <div class="card-body">
                    <form>
                        <div class="form-group">
                            <asp:Label>Name</asp:Label>
                            <asp:TextBox ID="txtname" runat="server" class="form-control" placeholder="Enter name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvnm" runat="server" ControlToValidate="txtname" 
                                ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <asp:Label>Email Address</asp:Label>
                            <asp:TextBox ID="txtemail" runat="server" class="form-control" placeholder="Enter email"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="rfvemail" runat="server" ControlToValidate="txtemail" 
                                ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
                            </asp:RequiredFieldValidator>

                            <asp:RegularExpressionValidator ID="revemail" runat="server" ControlToValidate="txtemail"
                                 ValidationExpression="\S+@\S+\.\S+" ErrorMessage="Enter Proper Email Address" Display="Dynamic"  Style="color: red">
                            </asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <asp:Label>Message</asp:Label>
                            <asp:TextBox ID="txtmsg" runat="server" TextMode="MultiLine" Rows="6" class="form-control"></asp:TextBox>
                        </div>
                        <div class="mx-auto text-center">
                            <asp:Button ID="btnsubmit" runat="server" class="card-header bg-success text-white text-uppercase" Style="" OnClick="btnsubmit_Click" Text="Submit" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-12 col-sm-4">
            <div class="card bg-light mb-3">
                <div class="card-header bg-success text-white text-uppercase"><i class="fa fa-home"></i> Website Info.</div>
                <asp:Repeater ID="contactusdata" runat="server">
                    <ItemTemplate>
                        <div class="card-body">
                            <h2 class="font-weight-bold"><%#Eval("name") %></h2>
                            <p>Email : <%#Eval("email") %></p>
                            <p>Contact No : <%#Eval("phone") %></p>
                            <p>Address : <%#Eval("address") %></p>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</div>

<br />



</asp:Content>

