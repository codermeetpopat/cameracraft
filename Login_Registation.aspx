<%@ Page Title="" Language="C#" MasterPageFile="~/Main_Frame_Client.master" AutoEventWireup="true" CodeFile="Login_Registation.aspx.cs" Inherits="Login_Registation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%--<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>--%>

    <!--Bootsrap 4 CDN-->
        <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">--%>
        <link rel="stylesheet" href="css/bootstrap.min.css" />

        <!--Fontawesome CDN-->
        <%--<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">--%>
    
        <!--Custom styles-->
        <link rel="stylesheet" type="text/css" href="css/style_Login.css">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="container login-container">
            <div class="row" style="box-shadow: rgba(0, 0, 0, 0.25) 0px 14px 28px, rgba(0, 0, 0, 0.22) 0px 10px 10px;">
                <div class="col-md-6 login-form-1">
                    <h1>Login</h1>
                    <asp:FormView>
                        <div class="form-group">
                            <asp:TextBox ID="usernm" runat="server" class="form-control" placeholder="Your Email *"></asp:TextBox>

                            <%--<asp:RequiredFieldValidator ID="rfvunm" runat="server" ControlToValidate="usernm" 
                                ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
                            </asp:RequiredFieldValidator>--%>

                            <%--<asp:RegularExpressionValidator ID="revemail" runat="server" ControlToValidate="usernm"
                                 ValidationExpression="\S+@\S+\.\S+" ErrorMessage="Enter Proper Email Address" Display="Dynamic"  Style="color: red">
                            </asp:RegularExpressionValidator>--%>

                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="password" runat="server" class="form-control" TextMode="Password" placeholder="Your Password *"></asp:TextBox>
                            
                            <%--<asp:RequiredFieldValidator ID="rfvpw" runat="server" ControlToValidate="password" 
                                ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
                            </asp:RequiredFieldValidator>--%>

                            <%--<asp:RegularExpressionValidator ID="revpass" runat="server" ControlToValidate="password"
                                 ValidationExpression="((?=.*\d)(?=.*[a-z])(?=.*[@#$%&*?]).{10})" 
                                 ErrorMessage="Password Must Be 10 Digit & Allows Special Char" Display="Dynamic" Style="color: red">
                            </asp:RegularExpressionValidator> --%>
                        </div>
                        <div class="form-group text-center">
                            <asp:Button ID="btn_login" runat="server" Text="Login" Class="btn btn-light" Style="padding:2% !important" OnClick="btn_login_Click" />
                        </div>
                    </asp:FormView>
                </div>
                <div class="col-md-6 login-form-2">
                    <div class="login-logo">
                        <img src="as.png" alt="" />
                    </div>
                    <h1> <b>Registration</b></h1>
                      
                        <div class="form-group">
                            <asp:TextBox ID="username" runat="server" class="form-control" placeholder="Your Name *"></asp:TextBox>
                        
                            <%--<asp:RequiredFieldValidator ID="rfvnm" runat="server" ControlToValidate="username" 
                                ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
                            </asp:RequiredFieldValidator>--%>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="usermobile" runat="server" class="form-control" MaxLength="10" placeholder="Your Mobile *"></asp:TextBox>
                            
                            <%--<asp:RequiredFieldValidator ID="rfvmob" runat="server" ControlToValidate="usermobile" 
                                ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
                            </asp:RequiredFieldValidator>--%>

                            <%--<asp:RangeValidator ID="rvmob" runat="server" ControlToValidate="usermobile" 
                                ErrorMessage="Enter Proper 10 Digit Number" Display="Dynamic" MaximumValue="10" MinimumValue="10" Type="Integer">
                            </asp:RangeValidator>--%>


                            <asp:RegularExpressionValidator ID="revmob" runat="server" ControlToValidate="usermobile" 
                                ValidationExpression="\d{10}" ErrorMessage="Enter Proper 10 Digit Number" Display="Dynamic" Style="color: red">
                            </asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="useremail" runat="server" class="form-control" placeholder="Your Email *"></asp:TextBox>
                        
                            <%--<asp:RequiredFieldValidator ID="rfvmail" runat="server" ControlToValidate="useremail" 
                                ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
                            </asp:RequiredFieldValidator>--%>

                            <asp:RegularExpressionValidator ID="revmail" runat="server" ControlToValidate="useremail"
                                 ValidationExpression="\S+@\S+\.\S+" ErrorMessage="Enter Proper Email Address" Display="Dynamic"  Style="color: red">
                            </asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="userpass" runat="server" class="form-control" TextMode="Password" placeholder="Your Password *"></asp:TextBox>
                        
                            <%--<asp:RequiredFieldValidator ID="rfvpass" runat="server" ControlToValidate="userpass" 
                                ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
                            </asp:RequiredFieldValidator>--%>

                            <%--<asp:RegularExpressionValidator ID="revpasss" runat="server" ControlToValidate="userpass"
                                 ValidationExpression="((?=.*\d)(?=.*[a-z])(?=.*[@#$%&*?]).{10})" 
                                 ErrorMessage="Password Must Be 8 Digit Or Above & Allows Special Char" Display="Dynamic" Style="color: red">
                            </asp:RegularExpressionValidator>--%> 
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="conpass" runat="server" class="form-control" TextMode="Password" placeholder="Your Confirm Password *"></asp:TextBox>
                            
                            <asp:CompareValidator ID="cvconf" runat="server" ControlToCompare="userpass" 
                                Operator="Equal" ControlToValidate="conpass" ErrorMessage="Not Match Password or Conform Password" Display="Dynamic" Style="color: red">
                            </asp:CompareValidator>

                             <%--<asp:RequiredFieldValidator ID="rfvcpass" runat="server" ControlToValidate="conpass" 
                                ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
                            </asp:RequiredFieldValidator>--%>
                        </div>
                        <div class="form-group text-center">
                            <asp:Button ID="btn_registation" runat="server" Text="Registation" Class="btn btn-dark" Style="padding:2% !important" OnClick="btn_registation_Click" />
                        </div>
                    
                </div>
            </div>
        </div>


</asp:Content>

