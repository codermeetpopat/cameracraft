<%@ Page Title="" Language="C#" MasterPageFile="~/Main_Frame_Client.master" AutoEventWireup="true" CodeFile="payment.aspx.cs" Inherits="payment" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="css/style.min.css" rel="stylesheet">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <body class="grey lighten-3">
        <!-- Main layout -->
        <main class="mt-5 pt-4">
            <div class="container wow fadeIn">
                <!-- Heading -->
                <h2 class="my-5 h2 text-center">Payment</h2>
                <!-- Payment Method Images -->
                <div class="text-center mb-4">
                    <img src="Images/rupay.svg" alt="Rupay" style="width: 100px; margin-right: 40px;" />
                    <img src="Images/visa.svg" alt="Visa" style="width: 100px;" />
                </div>
                <!-- Grid row -->
                <div class="row">
                    <!-- Grid column -->
                    <div class="col-md-12 mb-0">
                        <!-- Card -->
                        <!-- Card content -->
                        <form class="card-body">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <asp:TextBox ID="txtcardowner" runat="server" CssClass="form-control" placeholder="Card Owner Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvcon" runat="server" ControlToValidate="txtcardowner" 
                                        ErrorMessage="Field Can't Be Empty" Display="Dynamic" Style="color: red">
                                    </asp:RequiredFieldValidator>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <asp:TextBox ID="txtcdnumber" runat="server" CssClass="form-control" placeholder="Card Number" MaxLength="16"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvcn" runat="server" ControlToValidate="txtcdnumber" 
                                        ErrorMessage="Field Can't Be Empty" Display="Dynamic" Style="color: red">
                                    </asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="revcn" runat="server" ControlToValidate="txtcdnumber"
                                        ValidationExpression="\d{16}" ErrorMessage="Enter Valid Number" Display="Dynamic" Style="color: red">
                                    </asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3 mb-3">
                                    <asp:TextBox ID="txtmm" runat="server" CssClass="form-control" placeholder="MM" MaxLength="2"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvm" runat="server" ControlToValidate="txtmm" 
                                        ErrorMessage="Field Can't Be Empty" Display="Dynamic" Style="color: red">
                                    </asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="rvm" runat="server" ControlToValidate="txtmm" 
                                        ErrorMessage="Enter Valid Month(1-12)" MaximumValue="12" MinimumValue="1" 
                                        Type="Integer" Display="Dynamic" Style="color: red">
                                    </asp:RangeValidator>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <asp:TextBox ID="txtyy" runat="server" CssClass="form-control" placeholder="YY" MaxLength="4"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvy" runat="server" ControlToValidate="txtyy" 
                                        ErrorMessage="Field Can't Be Empty" Display="Dynamic" Style="color: red">
                                    </asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="rvy" runat="server" ControlToValidate="txtyy" 
                                        ErrorMessage="Enter Valid Year(Ex.2000)" MaximumValue="2100" MinimumValue="1900" 
                                        Type="Integer" Display="Dynamic" Style="color: red">
                                    </asp:RangeValidator>
                                </div>
                                <div class="col-md-3 mb-3">
                                    <asp:TextBox ID="txtcvv" runat="server" CssClass="form-control" placeholder="CVV" MaxLength="3"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvcv" runat="server" ControlToValidate="txtcvv" 
                                        ErrorMessage="Field Can't Be Empty" Display="Dynamic" Style="color: red">
                                    </asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="rvcv" runat="server" ControlToValidate="txtcvv" 
                                        ErrorMessage="Enter Valid CVV No." MaximumValue="999" MinimumValue="100" 
                                        Type="Integer" Display="Dynamic" Style="color: red">
                                    </asp:RangeValidator>
                                </div>
                            </div>
                            <hr class="mb-5">
                            <asp:Button CssClass="btn btn-primary btn-block mb-5" style="padding:1%" ID="btncheckout" OnClick="btncheckout_Click" runat="server" Text="Payment" />
                            <hr class="mb-5">
                        </form>
                    </div>
                </div>
                <!-- Grid row -->
            </div>
        </main>
    </body>
</asp:Content>