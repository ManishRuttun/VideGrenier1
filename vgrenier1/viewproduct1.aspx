<%@ Page Title="View And Search Product" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="viewproduct1.aspx.cs" Inherits="vgrenier1.viewproduct1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <style>

        .viewprod {
            background: linear-gradient(180deg, #c2f0a3 0%, #9f91a9 100%);
            
            margin: auto;
            width:70%;
            
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <section style=" background: linear-gradient(180deg, #c2f0a3 0%, #9f91a9 100%);">
        <div class="viewprod mb-3" style="text-align:center">
                    <h2 class=" text-center mt-" style="padding-top: 10px;">View And Search Product</h2>

     <asp:GridView ID="gvs" runat="server"
        OnPreRender="gvs_PreRender1"
        DataSourceID="srcUsers"
        ClientIDMode="Static"
        AutoGenerateColumns="False" ForeColor="#333333"
        CssClass="table table-striped table-bordered table-hover table-hover">
        <Columns>
             <asp:ImageField DataImageUrlField="Product_Image"
                 ControlStyle-Width="80px"
                DataImageUrlFormatString="~/images/{0}" HeaderText="Product Image"
                SortExpression="Product Image" />
             <asp:BoundField DataField="Product_Name" HeaderText="Product Name"
                SortExpression="Product Name" />
             <asp:BoundField DataField="Product_Des" HeaderText="Product Description"
                SortExpression="Product Description" />
            <asp:BoundField DataField="Product_Price" HeaderText="Product Price"
                SortExpression="Product Price" />
            <asp:BoundField DataField="Product_Status" HeaderText="Status" 
                SortExpression="Status" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource
            ID="srcUsers"
            runat="server" 
            TypeName="DataAccessLayer"
            SelectMethod="GetProduct"
            />
            </div>
        </section>

</asp:Content>
