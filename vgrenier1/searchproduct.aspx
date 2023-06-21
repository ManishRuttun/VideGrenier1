<%@ Page Title="" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="searchproduct.aspx.cs" Inherits="vgrenier1.searchproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">



    <div class="container">
        <asp:Label ID="Label1" runat="server" Text="Search User:"></asp:Label>

        <asp:TextBox ID="txtuproductname" OnTextChanged="txtuproductname_TextChanged" runat="server" AutoPostBack="true"></asp:TextBox>
        <asp:GridView AutoGenerateColumns="false" ID="gvs" runat="server">
            <Columns>
                <asp:BoundField HeaderText="First name" DataField="First_Name" />
                <asp:BoundField HeaderText="Last name" DataField="Last_Name" />
                <asp:BoundField HeaderText="Email Address" DataField="Email_Address" />
                <asp:BoundField HeaderText="Phone Number" DataField="Phone_Num" />
                <asp:BoundField HeaderText="Address" DataField="Address" />

            </Columns>
        </asp:GridView>
    </div>


     <%--<asp:Label ID="Label1" runat="server" Text="Search Product by Category:"></asp:Label>
    <asp:TextBox ID="txtproductname" runat="server"   OnTextChanged="txtproductname_TextChanged" AutoPostBack="true"></asp:TextBox>
    <asp:GridView ID="gvs" runat="server">
                           <div class="form-group row justify-content-center">
            <asp:Label runat="server" CssClass="col-md-2 col-form-label">Select 
a Category</asp:Label>
            <div class="col-md-8">
                <asp:DropDownList ID="DropDownList1" runat="server"
                    CssClass="form-control">
                </asp:DropDownList>
            </div>
        </div>

        <Columns>
             
                   

                <asp:BoundField HeaderText="Product name" DataField="Product_Name" />
                <asp:BoundField HeaderText="Description" DataField="Product_Des" />

            </Columns>

    </asp:GridView>--%>
</asp:Content>
