<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Main_Frame.master" AutoEventWireup="true" CodeFile="usermanage.aspx.cs" Inherits="admin_usermanage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


 
    <div class="content-wrapper pb-0">
        <div class="row">
            <div class="col-xl-12 stretch-card grid-margin">
                <div class="card" style="box-shadow: 5px 10px 18px #000;">
                    <div class="card-body">
                        <h2 class="text-center"> Users</h2>
                        <div class="table-content table-responsive">
                            <table class="table table-striped table-bordered dt-responsive nowrap" data-search="true" data-filter-control="true" data-show-export="true" data-click-to-select="true">
                                <thead class="text-center">
                                    <tr class="text-center">
                                        <th>User id</th>
                                        <th>User Name</th>
                                        <th>User Mobile No. </th>
                                        <th>User Email</th>
                                        <th>User Password</th>
                                        <th>Full Name</th>
                                        <th>Address</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                        <th>Action2</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    <asp:Repeater ID="rpt" runat="server">
                                        <ItemTemplate>
                                            <tr class="text-center">
                                                <td>
                                                    <asp:Label ID="userid" runat="server" Text='<%#Eval("user_id") %>'></asp:Label>
                                                </td>
                                                <td>
                                                    <%#Eval("user_name") %>
                                                </td>
                                                <td>
                                                    <%#Eval("user_mobile") %>
                                                </td>
                                                <td>
                                                    <%#Eval("user_email") %>
                                                </td>
                                                <td>
                                                    <%#Eval("user_password") %>
                                                </td>
                                                <td>
                                                   <%#Eval("Fullname") %>
                                                </td>
                                                <td>
                                                    <%#Eval("Address") %>
                                                </td>
                                                <td>
                                                    <asp:Label ID="orderstatus" runat="server" Text='<%#Eval("status")%>'></asp:Label>
                                                    <asp:DropDownList ID="ddlorderstatus" runat="server" AutoPostBack="true" Visible="false">
                                                        <asp:ListItem> --Select Status-- </asp:ListItem>
                                                        <asp:ListItem Value="block">block</asp:ListItem>
                                                         <asp:ListItem Value="unblock">unblock</asp:ListItem>

                                                       
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:LinkButton ID="lbaction" runat="server" OnClick="lbaction_Click"><i class="mdi mdi-pencil-box-outline">up</i></asp:LinkButton>
                                                    <asp:LinkButton ID="lbupdate" runat="server" OnClick="lbupdate_Click" class="col-sm-6 col-md-4 col-lg-3" Visible="false"><i class="mdi mdi-autorenew"></i></asp:LinkButton>
                                                    <asp:LinkButton ID="lbcancle" runat="server" OnClick="lbcancle_Click" class="col-sm-6 col-md-4 col-lg-3" Visible="false"><i class="mdi mdi-backspace"></i></asp:LinkButton>
                                                </td>
                                                 <td>
                                                   <asp:Button ID="btndelete" runat="server" Font-Bold="true" BackColor="red" ForeColor="white" Text="Delete" OnClick="btndelete_Click" />
                                                </td>
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

