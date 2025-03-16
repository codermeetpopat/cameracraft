<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Main_Frame.master" AutoEventWireup="true" CodeFile="Add_Category.aspx.cs" Inherits="admin_Add_Category" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="content-wrapper pb-0">
        
     <div class="row" >
            <div class="col-xl-12 stretch-card grid-margin" >
                <div class="card" style="box-shadow: 5px 10px 18px #000;">
                    <div class="card-body">

                            <h4 class="card-title">Create Category Form</h4>
                        <br />
                        <form class="forms-sample">
                            <div class="form-group">
                                <asp:Label runat="server" for="categoryName">Category Name </asp:Label>
                                <br />
                                <br />
                                <asp:TextBox runat="server" ID="txtcatnm" type="text" class="form-control" placeholder="Category Name" autocomplete="off" />
                            </div>
                            <div class="form-group text-center">
                                <asp:Button ID="btnaddcat" runat="server" Text="Submit" OnClick="btn_addcat" class="btn btn-primary mr-2"></asp:Button>
                            </div>
                        </form>
                      <br />

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

                        <h4 class="card-title">Manage Category</h4>
                        <br />
                        <div class="table-responsive">
                            
                            <asp:GridView ID="grd_product_data" runat="server"
                                AutoGenerateColumns="false"
                                OnRowDeleting="grddata_RowDeleting" DataKeyNames="cat_id" Width="500"
                                OnRowCancelingEdit="grddata_RowCancleEdit"
                                OnRowUpdating="grddata_RowUpdating"
                                OnRowEditing="grddata_RowEditing"
                                AllowPaging="true" PageSize="20" OnPageIndexChanging="grddata_PageIndexChanging"
                                OnPreRender="grddata_PreRender"
                                class="table table-striped table-bordered dt-responsive nowrap">


                                <Columns>
                                    <asp:TemplateField HeaderText="ID">
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" Text='<%# Bind("cat_id") %>' ID="TextBox1" Enabled="false"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("cat_id") %>' ID="Label1"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Category Name">
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" Text='<%# Bind("cat_name") %>' ID="TextBox2" autocomplete="off"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("cat_name") %>' ID="Label2"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    
                                    <asp:CommandField ButtonType="Button" ShowDeleteButton="true" ShowEditButton="true" HeaderText="Action" ControlStyle-BorderColor="black" ControlStyle-BackColor="Red" ControlStyle-ForeColor="white" /> 
                                       
                                </Columns>
                            </asp:GridView>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    
</asp:Content>

