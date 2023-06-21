<%@ Page Title="View and Search User" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="viewuser1.aspx.cs" Inherits="vgrenier1.viewuser1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <style>

        .viewprod {
            background: linear-gradient(180deg, #9de39c 0%, #80b3e5 100%) ;
            
            margin: auto;
            width:70%;
            
        }


    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <section style="background: linear-gradient(180deg, #9de39c 0%, #80b3e5 100%)">
        <div class="viewprod mb-3" style="text-align:center">
                    <h2 class=" text-center mt-" style="padding-top: 10px;">List of Users</h2>


     <asp:GridView ID="gvs" runat="server"
        OnPreRender="gvs_PreRender"
        DataSourceID="srcUsers"
        ClientIDMode="Static"
        
        AutoGenerateColumns="False" ForeColor="#333333" 
         CssClass="table table-striped table-bordered table-hover ">
        <Columns>
            <asp:ImageField DataImageUrlField="Profile"
                 ControlStyle-Width="80px"
                DataImageUrlFormatString="~/images/{0}" HeaderText="Profile Picture"
                SortExpression="Profile" />
             <asp:BoundField DataField="first_name" HeaderText="First Name"
                SortExpression="First Name" />
             <asp:BoundField DataField="Last_Name" HeaderText="Last Name"
                SortExpression="Last Name" />
            <asp:BoundField DataField="username" HeaderText="Username"
                SortExpression="username" />
            <asp:BoundField DataField="Status" HeaderText="Status" 
                SortExpression="Status" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource
            ID="srcUsers"
            runat="server" 
            TypeName="DataAccessLayer"
            SelectMethod="GetUsers"
            />

</div>
        </section>
</asp:Content>
