<%@ Page Title="" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="vgrenier1.search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">



    <asp:Label ID="Label1" runat="server" Text="Search by Product Name:"></asp:Label>
    <asp:TextBox ID="txtproductname" runat="server"   OnTextChanged="txtproductname_TextChanged" AutoPostBack="true"></asp:TextBox>
    <asp:GridView ID="gvs" runat="server">

        <Columns>
                <asp:ImageField DataImageUrlField="Product_Image"
                    DataImageUrlFormatString="../images/{0}"
                    HeaderText="Product image" SortExpression="picture"
                    ControlStyle-Width="200" />

                <asp:BoundField HeaderText="Product name" DataField="Product_Name" />
                <asp:BoundField HeaderText="Description" DataField="Product_Des" />

            </Columns>


    </asp:GridView>

</asp:Content>
