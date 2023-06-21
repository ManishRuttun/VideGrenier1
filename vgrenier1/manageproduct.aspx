<%@ Page Title="Manager Product" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="manageproduct.aspx.cs" Inherits="vgrenier1.manageproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

         .container1{
            background-color:#f4efee ;
            margin: auto;
            width:62%;
         }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <section style="background-color:#f4efee">
    <div class="container1 mb-3">
    <div class="form-horizontal">
        <h2 class=" text-center mt-">Manage Product</h2>
        <hr />
        <div class="form-group row justify-content-center">
            <asp:Label runat="server" CssClass="col-md-2 col-form-label">Select 
a Category</asp:Label>
            <div class="col-md-8">
                <asp:DropDownList ID="ddlcat" runat="server"
                    CssClass="form-control">
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label"></asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtproductId" Visible="false"
                    CssClass="form-control" />
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server" CssClass="col-md-2 col-form-label">Product 
name</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtproductname"
                    CssClass="form-control" />

            </div>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label">Description</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtdesc"
                    CssClass="form-control" />
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server" CssClass="col-md-2 col-form-label">Product Price</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtproductprice"
                    CssClass="form-control" />
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label" Visible="false">Image</asp:Label>
            <div class="col-md-8">
                <asp:FileUpload ID="fuimage" runat="server" CssClass="" Visible="false" />
                <asp:Image ID="Image1" runat="server" Visible="false" Width="75"
                    Height="100" />
            </div>
        </div>
       
        <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label"></asp:Label>
            <div class="col-md-8">
                <div class="form-check-inline">
                    <asp:CheckBox runat="server" ID="chkstatus"
                        CssClass="form-check-input" />
                    <asp:Label runat="server"
                        CssClass="form-check-label">Status</asp:Label>
                </div>
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <div class="offset-md-2 col-md-8">
                        
                <asp:Button runat="server" ID="btnupdate" 
                     OnClick="btnupdate_Click" Text="Update Product"
                    Visible="false" CssClass="btn btn-block btn-outline-primary" />
                
                <asp:Button runat="server" ID="btndelete"
                    OnClick="btndelete_Click"  OnClientClick="return confirm('Are you sure you want to delete?')" Text="Delete Product"
                    Visible="false" CssClass="btn btn-block btn-outline-primary" />
                
                <asp:Button runat="server" ID="btncancel" 
                    OnClick="btncancel_Click" Text="Cancel"
                    Visible="false" CssClass="btn btn-block btn-outline-primary" />
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
    <hr />
    <asp:GridView ID="gvs" AutoGenerateColumns="false"
         
        
        DataKeyNames="Product_Id" 
        OnSelectedIndexChanged="gvs_SelectedIndexChanged"
        ClientIDMode="Static"
        Width="800" runat="server">
        <HeaderStyle BackColor="#eeeeee" ForeColor="White" Font-Bold="true"
            Height="30" />

        <AlternatingRowStyle BackColor="#f5f5f5" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnSelect" runat="server"
                        CssClass="btn btn-outline-info" CommandName="Select" Text="Select" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product Name" HeaderStyle-ForeColor="#ff6600">
                <ItemTemplate>
                    <!-- display the movie name -->
                    <asp:Label ID="lblProductName" Text='<%#Eval("Product_Name")%>'
                        runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
              <%--<asp:TemplateField HeaderText="Product Image" HeaderStyle-ForeColor="#ff6600">
                <ItemTemplate>
                    <!-- display the movie name -->
                    <asp:Label ID="lblProductImage" Text='<%#Eval("Product_Image")%>'
                        runat="server" />
                </ItemTemplate>
            </asp:TemplateField>--%>


            <%-- add an imagefield here to display the poster--%>
             <asp:ImageField DataImageUrlField="Product_Image" 
                    DataImageUrlFormatString="../images/{0}"
                    HeaderText="Product Image" HeaderStyle-ForeColor="#ff6600" SortExpression="Product_Image"
                    ControlStyle-Width="150" />


        </Columns>
    </asp:GridView>
        </div>
        </section>

</asp:Content>
