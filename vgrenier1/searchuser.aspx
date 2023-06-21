<%@ Page Title="" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="searchuser.aspx.cs" Inherits="vgrenier1.searchuser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

        <div class="container">
        <asp:Label ID="Label1" runat="server" Text="Search User:"></asp:Label>

        <asp:TextBox ID="txtusername" OnTextChanged="txtusername_TextChanged" runat="server" AutoPostBack="true"></asp:TextBox>
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



     <asp:GridView ID="GridView1" runat="server"
        OnPreRender="GridView1_PreRender"
        DataSourceID="srcUsers"
        ClientIDMode="Static"
        HeaderStyle-BackColor="blue"
        AutoGenerateColumns="False" ForeColor="#333333" 
         CssClass="table table-striped table-bordered table-hover table-danger">

         </asp:GridView>

    <asp:ObjectDataSource
            ID="srcUsers"
            runat="server" 
            TypeName="DataAccessLayer"
            SelectMethod="GetUsers"
            />
</asp:Content>
