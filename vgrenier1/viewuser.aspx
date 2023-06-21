<%@ Page Title="" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="viewuser.aspx.cs" Inherits="vgrenier1.viewuser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <div>
        <h3>List of User</h3>
        <asp:GridView
            ID="GrdView1"
            AutoGenerateColumns="false"
            OnPageIndexChanging="GrdView1_PageIndexChanging"
            AllowPaging="true"
            PageSize="3"
            CellPadding="20"
            runat="server">

            <Columns>
               
                <asp:BoundField HeaderText="First Name" 
                    DataField="First_Name"/>
               <asp:BoundField HeaderText="Last Name" 
                    DataField="Last_Name"/>
                <asp:BoundField HeaderText="Email Address" 
                    DataField="Email_Address"/>
                <asp:BoundField HeaderText="Phone Number" 
                    DataField="Phone_Num"/>
                <asp:BoundField HeaderText="Address" 
                    DataField="Address"/>
                
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
