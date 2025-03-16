<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Main_Frame.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="content-wrapper pb-0">
        <div class="page-header flex-wrap">
            <h1 class="text-dark mb-0"> Hi, Welcome  <b style="color:#D84040;"> 
                <asp:Label ID="lblname" runat="server"></asp:Label> 
            </b>
            <br />
            </h1>
        </div>

        <div class="row">
            <div class="col-xl-12 stretch-card grid-margin">
                <div class="card" style=" box-shadow: 5px 10px 18px #1D1616;">
                    <div class="card-body" style="background-color:#8E1616;">
                        <div class="row">
                            <div class="col-xl-5 col-lg-12 stretch-card grid-margin">
                                <div class="row">
                                    <div class="col-xl-12 col-md-6 stretch-card grid-margin grid-margin-sm-0 pb-sm-3">
                                        <div class="card" style="background-color:#D84040;">
                                            <div class="card-body px-3 py-4">
                                                <div class="d-flex justify-content-between align-items-start">
                                                    <div class="color-card">
                                                        <p class="mb-0 color-card-head" style="color:#EEEEEE;">Brands</p>
                                                        <asp:Repeater ID="rptcategory" runat="server">
                                                            <ItemTemplate>
                                                                <h2 class="text-white"><%#Eval("cat") %></h2>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </div>
                                                    <i class="card-icon-indicator mdi mdi-basket bg-inverse-icon-warning" style=" box-shadow: 5px 10px 18px #1D1616;"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-xl-12 col-md-6 stretch-card grid-margin grid-margin-sm-0 pb-sm-3">
                                        <div class="card" style="background-color:#0026ff;">
                                            <div class="card-body px-3 py-4">
                                                <div class="d-flex justify-content-between align-items-start">
                                                    <div class="color-card">
                                                        <p class="mb-0 color-card-head" style="color:#EEEEE;">Product</p>
                                                        <asp:Repeater ID="rptproduct" runat="server">
                                                            <ItemTemplate>
                                                                <h2 class="text-white"><%#Eval("pro") %> </h2>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </div>
                                                    <i class="card-icon-indicator mdi mdi-cube-outline bg-inverse-icon-danger" style=" box-shadow: 5px 10px 18px #1D1616;"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-xl-12 col-md-6 stretch-card grid-margin grid-margin-sm-0 pb-sm-3 pb-lg-0 pb-xl-3">
                                        <div class="card" style="background-color:#ff6a00;">
                                            <div class="card-body px-3 py-4">
                                                <div class="d-flex justify-content-between align-items-start">
                                                    <div class="color-card">
                                                        <p class="mb-0 color-card-head" style="color:#EEEEEE;">Orders</p>
                                                        <asp:Repeater ID="rptorder" runat="server">
                                                            <ItemTemplate>
                                                                <h2 class="text-white"><%#Eval("ord") %></h2>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </div>
                                                    <i class="card-icon-indicator mdi mdi-briefcase-outline bg-inverse-icon-primary" style=" box-shadow: 5px 10px 18px #1D1616;"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>

                            <div class="col-xl-4 col-md-6 stretch-card grid-margin" style="width:600px;">
                                <div class="card">
                                    <div class="card-body" style="box-shadow: 5px 10px 18px #1D1616;">
                                        <div id="inline-datepicker" class="datepicker table-responsive"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
