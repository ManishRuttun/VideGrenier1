<%@ Page Title="" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="listproduct.aspx.cs" Inherits="vgrenier1.listproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div>
        <asp:GridView
            ID="gvs"
            DataSourceID="srcProduct"
            OnPreRender="gvs_PreRender"
            ClientIDMode="Static"
            runat="server">

                <Columns>
            <asp:ImageField
                 ControlStyle-Width="80px"
                DataImageUrlFormatString="../images/{0}" HeaderText="Profile Picture"
                SortExpression="Profile" />
           
        </Columns>
        </asp:GridView>

        <asp:ObjectDataSource
            ID="srcProduct"
            runat="server" 
            TypeName="DataAccessLayer"
            SelectMethod="GetProduct"
            />
    </div>
</asp:Content>
