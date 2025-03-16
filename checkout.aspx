<%@ Page Title="" Language="C#" MasterPageFile="~/Main_Frame_Client.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="checkout" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Material Design Bootstrap</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="css/style.min.css" rel="stylesheet">
</head>

<body class="grey lighten-3">

  <!-- Navbar -->
  
  <!-- Navbar -->

  <!--Main layout-->
  <main class="mt-5 pt-4">
    <div class="container wow fadeIn">

      <!-- Heading -->
      <h2 class="my-5 h2 text-center">Checkout form</h2>

      <!--Grid row-->
      <div class="row ">

        <!--Grid column-->
        <div class="col-md-12 mb-0">

          <!--Card-->
            <asp:Label ID="total" runat="server"></asp:Label>

            <!--Card content-->
            <form class="card-body">

              <!--Grid row-->
              <div class="row">
                  <div class="md-form col-lg-12 mb-4"> 
                      <asp:Label ID="lblnm" runat="server">Full Name</asp:Label>
                      <asp:TextBox ID="txtfullnm" runat="server" CssClass="form-control" placeholder="Full Name"></asp:TextBox>
                      
                      <asp:RequiredFieldValidator ID="rfvnm" runat="server" ControlToValidate="txtfullnm" 
                            ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
                      </asp:RequiredFieldValidator>
                  </div>

                  <div class="md-form col-lg-12 mb-4">
                      <asp:Label ID="lbladd" runat="server">Address</asp:Label>
                      <asp:TextBox ID="txtadd" runat="server" CssClass="form-control" placeholder="Address"></asp:TextBox>
                    
                      <asp:RequiredFieldValidator ID="rfvadd" runat="server" ControlToValidate="txtadd" 
                            ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
                      </asp:RequiredFieldValidator>
                  </div>

                  </div>
                  <!--Grid row-->
              <div class="row">

                <!--Grid column-->
                 <div class="col-lg-4 col-md-12 mb-4">
                      <asp:Label ID="lblcountry" runat="server">Country</asp:Label>
                       <asp:TextBox ID="txtcountry" runat="server" CssClass="form-control" placeholder="country"></asp:TextBox>

                     <asp:RequiredFieldValidator ID="rfvctry" runat="server" ControlToValidate="txtcountry" 
                            ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
                      </asp:RequiredFieldValidator>
                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-lg-4 col-md-6 mb-4">
                    <asp:Label ID="lblstate" runat="server">State</asp:Label>
                       <asp:TextBox ID="txtstate" runat="server" CssClass="form-control" placeholder="state"></asp:TextBox>
                
                    <asp:RequiredFieldValidator ID="rfvst" runat="server" ControlToValidate="txtstate" 
                            ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
                      </asp:RequiredFieldValidator>
                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-lg-4 col-md-6 mb-4">

                   <asp:Label ID="lblpin" runat="server">Pincode</asp:Label>
                       <asp:TextBox ID="txtpin" runat="server" CssClass="form-control" placeholder="Pincode"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="rfvpin" runat="server" ControlToValidate="txtpin" 
                            ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
                      </asp:RequiredFieldValidator>

                    <asp:RangeValidator ID="rvpin" runat="server" ControlToValidate="txtpin" 
                        ErrorMessage="Enter Your Pincode" MaximumValue="999999" MinimumValue="100000"
                        Type="Integer" Display="Dynamic" Style="color: red">
                    </asp:RangeValidator>
                </div>
                <!--Grid column-->

              </div>
              <!--Grid row-->
              
              <hr class="mb-4">
                <asp:Button CssClass="btn btn-primary btn-lg btn-block mb-3" ID="btncheckout" runat="server" OnClick="btncheckout_Click" Text="checkout" />
               <hr class="mb-5 mt-4">
            </form>

         

        </div>
        <!--Grid column-->

        <!--Grid column-->
        
        <!--Grid column-->

      </div>
      <!--Grid row-->

    </div>
  </main>
  <!--Main layout-->

  <!--Footer-->
  
  <!--/.Footer-->

  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="js/mdb.min.js"></script>
  <!-- Initializations -->
  <script type="text/javascript">
      // Animations initialization
      new WOW().init();
  </script>
</body>

</html>

</asp:Content>

