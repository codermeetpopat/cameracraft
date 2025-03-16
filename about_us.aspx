<%@ Page Title="" Language="C#" MasterPageFile="~/Main_Frame_Client.master" AutoEventWireup="true" CodeFile="about_us.aspx.cs" Inherits="about_us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/bootstrap.min.css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br /><br />
    <div class="container">
    <div class="row">
        <div class="col">
            <div class="card">
                <div class="card-header bg-success text-white"><i class="fa fa-envelope"></i> About us
                </div>
                <div class="card-body">
                    <asp:Repeater ID="aboutusdata" runat="server">
                        <ItemTemplate>
                            <p><%#Eval("details") %></p>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        
    </div>
</div>

    <br />
    <br />
</asp:Content>

