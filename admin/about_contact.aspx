<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Main_Frame.master" AutoEventWireup="true" CodeFile="about_contact.aspx.cs" Inherits="admin_about_contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="content-wrapper pb-0">
        <div class="row">
            <div class="col-xl-12 stretch-card grid-margin">
                <div class="card" style="box-shadow: 5px 10px 18px #000;">
                    <div class="card-body">
                        <h4 class="card-title">About us</h4>
                        <br />
                        <form class="forms-sample">
                            <asp:Repeater ID="rptabout" runat="server">
                                <ItemTemplate>
                                    <div class="form-group">
                                        <asp:Label runat="server"> Enter Name   </asp:Label>
                                        <br />
                                        <asp:TextBox runat="server" ID="txtdetail" type="text" TextMode="MultiLine" Rows="5" class="form-control" Text='<%#Eval("details") %>'> </asp:TextBox>
                                    </div>

                                    <div class="form-group text-center">
                                        <asp:Button ID="btnabout" runat="server" Text="Update" OnClick="btnabout_Click" class="btn btn-primary mr-2"></asp:Button>
                                    </div>

                                </ItemTemplate>
                            </asp:Repeater>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="content-wrapper pb-0">
        <div class="row">
            <div class="col-xl-12 stretch-card grid-margin">
                <div class="card" style="box-shadow: 5px 10px 18px #000;">
                    <div class="card-body">
                        <h3 class="card-title"><i class="mdi mdi-account-box"></i> Contact us </h3>
                        <br />
                        
                        <formview class="forms-sample">
                            <asp:Repeater ID="rptcontact" runat="server">
                                <ItemTemplate>
                                    <div class="form-group">
                                        <asp:Label runat="server"> Enter Name   </asp:Label>
                                        <br />
                                        <asp:TextBox runat="server" ID="txtnm" type="text" class="form-control" Text='<%#Eval("name") %>'> </asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <asp:Label runat="server"> Enter Email  </asp:Label>
                                        <br />
                                        <asp:TextBox runat="server" ID="txtemail" type="text" class="form-control" Text='<%#Eval("email") %>'> </asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <asp:Label runat="server"> Enter Phone No.   </asp:Label>
                                        <br />
                                        <asp:TextBox runat="server" ID="txtphone" type="text" class="form-control" Text='<%#Eval("phone") %>'> </asp:TextBox>
                                    </div>

                                    <div class="form-group">
                                        <asp:Label runat="server"> Enter Address </asp:Label>
                                        <br />
                                        <asp:TextBox runat="server" ID="txtaddress" type="text" class="form-control" Text='<%#Eval("address") %>'> </asp:TextBox>
                                    </div>

                                    <div class="form-group text-center">
                                        <asp:Button ID="btncontact" runat="server" Text="Update" OnClick="btncontact_Click" class="btn btn-primary mr-2"></asp:Button>
                                    </div>

                                </ItemTemplate>
                            </asp:Repeater>
                        </formview>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="content-wrapper pb-0">
        <div class="row">
            <div class="col-xl-12 stretch-card grid-margin">
                <div class="card"style="box-shadow: 5px 10px 18px #000;">
                    <div class="card-body">
                        <h5 class="card-title"> <i class="mdi mdi-account-card-details"></i> Manage Contact</h5>

                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTable">
                                <thead>
                                    <tr>
                                        
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Message</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="rptcontactquery" runat="server">
                                        <ItemTemplate>
                                            <tr class="odd gradex">
                                                
                                                <td><%#Eval("name") %></td>
                                                <td><%#Eval("email") %></td>
                                                <td><%#Eval("message") %></td>

                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

