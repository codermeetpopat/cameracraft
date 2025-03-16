<%@ Page Title="" Language="C#" MasterPageFile="~/Main_Frame_Client.master" AutoEventWireup="true" CodeFile="userprofile.aspx.cs" Inherits="userprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <style>
body {font-family: Arial, Helvetica, sans-serif;
     
      
        background-image: url("../Images/bg6.jpg");
background-repeat:no-repeat;
  background-size:120%;

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
.btn {
background-color: #bec602;
  color: black;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  border: 1px solid black;
}

.btn:hover {
  background: linear-gradient(90deg, rgba(94,6,6,1) 0%, rgba(73,14,61,1) 100%, rgba(0,44,255,1) 100%);
  color: white;
  border: 1px solid white;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
 
  cursor: pointer;
  border: 1px solid black;
  
}
.cancelbtn:hover{
    background: linear-gradient(90deg, rgba(94,6,6,1) 0%, rgba(73,14,61,1) 100%, rgba(0,44,255,1) 100%);
    color: #fff;
}


/* Center the image and position the close button */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
     
      background-image: url('.../Images/21.jpg');

  }
  .cancelbtn:hover {
  background: #c0a32b;
 
}
}
</style>
     <div style="padding: 10px 450px 75px 450px; ">
     <!-- <img src="logovs.png" />-->
       <div class="container">
          
           <div style="text-align: center; font-weight: bold; color: #fff;">
      <h1>User Profile</h1>

    </div>
          <label for="uname" style="color:#FFED29;"><b>Username</b></label>
            <asp:TextBox ID="txtUsername" runat="server" placeholder="Enter Username" BackColor="#8B5A2B"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rfvunm" runat="server" ControlToValidate="txtUsername"
               ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
           </asp:RequiredFieldValidator>
           </br>

            <label for="mobile" style="color:#FFED29;"><b>User Mobile No</b></label>
            <asp:TextBox ID="txtMobile" runat="server" placeholder="User Mobile No "  BackColor="#8B5A2B" MaxLength="10" Size="2"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMobile"
               ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
           </asp:RequiredFieldValidator>
           </br>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
               ControlToValidate="txtMobile" ErrorMessage="Please Enter 10 Digit" Display="Dynamic"
               ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator></br>

            <label for="email" style="color:#FFED29;"><b>User Email</b></label>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter Email" BackColor="#8B5A2B" ></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail"
               ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
           </asp:RequiredFieldValidator>
           </br>
           <asp:RegularExpressionValidator ID="revemail" runat="server" ControlToValidate="txtEmail"
               ValidationExpression="\S+@\S+\.\S+" ErrorMessage="Enter Proper Email Address" Display="Dynamic" Style="color: red">
           </asp:RegularExpressionValidator></br>


            <label for="psw" style="color:#FFED29;"><b>Password</b></label>
            <asp:TextBox ID="txtPassword" runat="server"  placeholder="Enter Password"  BackColor="#8B5A2B"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPassword"
               ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
           </asp:RequiredFieldValidator>
           </br>
           <asp:RegularExpressionValidator ID="revpass" runat="server" ControlToValidate="txtPassword"
                                 ValidationExpression="((?=.*\d)(?=.*[a-z])(?=.*[@#$%&*?]).{10})" 
                                 ErrorMessage="Password Must Be 10 Digit & Allows Special Char" Display="Dynamic" Style="color: red">
                            </asp:RegularExpressionValidator><br />


            <label for="fullname" style="color:#FFED29;"><b>Full Name</b></label>
            <asp:TextBox ID="txtFullName" runat="server" placeholder="Enter Full Name" BackColor="#8B5A2B" ></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFullName"
               ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
           </asp:RequiredFieldValidator>
           </br>

            <label for="address" style="color:#FFED29;"><b>Address</b></label>
           <!--<asp:textarea cols="80" rows="5" placeholder="Current Address" value="address" required></asp:textarea>  -->
            <asp:TextBox ID="txtAddress" runat="server" placeholder="Enter Address"  BackColor="#8B5A2B" Columns="80" Rows="5"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtAddress"
               ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
           </asp:RequiredFieldValidator>
           </br>

            <label for="county" style="color:#FFED29;"><b>County</b></label>
            <asp:TextBox ID="txtCounty" runat="server" placeholder="Enter County" BackColor="#8B5A2B" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtCounty"
               ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
           </asp:RequiredFieldValidator>
           </br>

           <label for="pincode" style="color:#FFED29;"><b>State</b></label>
            <asp:TextBox ID="txtstate" runat="server" placeholder="State" BackColor="#8B5A2B" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtstate"
               ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
           </asp:RequiredFieldValidator>
           </br>

            <label for="pincode" style="color:#FFED29;"><b>Pin Code</b></label>
            <asp:TextBox ID="txtPinCode" runat="server" placeholder="Enter Pin Code" BackColor="#8B5A2B"  MaxLength="6"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtPinCode"
               ErrorMessage="Filed Can't Be Empty" Display="Dynamic" Style="color: red">
           </asp:RequiredFieldValidator>
           </br>

           <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn" OnClick="btnUpdate_Click" />

           <div class="container" style="  " >
      <asp:Button ID="button" runat="server" CssClass="cancelbtn" Text="Cancel" OnClick="button_Click"></asp:Button>
     
    </div>
       </div>


    </div>
   
</asp:Content>

