<%@ Page Title="Manage User" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="manageuser.aspx.cs" Inherits="vgrenier1.manageuser" %>

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
        <h2 class="text-center">Manage User</h2>
    <hr />
    <div class="form-group row justify-content-center">
        <asp:Label runat="server"
            CssClass="col-md-2 col-form-label"></asp:Label>
        <div class="col-md-8">
            <asp:TextBox runat="server" ID="txtuserid" Visible="false"
                CssClass="form-control" />
        </div>
    </div>
    <div class="form-group row justify-content-center">
        <asp:Label runat="server" CssClass="col-md-2 col-form-label">First Name</asp:Label>
        <div class="col-md-8">
            <asp:TextBox runat="server" ID="txtfirstname"
                CssClass="form-control" />
        </div>
    </div>
    <div class="form-group row justify-content-center">
        <asp:Label runat="server"
            CssClass="col-md-2 col-form-label">Last Name</asp:Label>
        <div class="col-md-8">
            <asp:TextBox runat="server" ID="txtlastname"
                CssClass="form-control" />
        </div>
    </div>
    <div class="form-group row justify-content-center">
        <asp:Label runat="server" CssClass="col-md-2 col-form-label">Email Address</asp:Label>
        <div class="col-md-8">
            <asp:TextBox runat="server" ID="txtemailaddress"
                CssClass="form-control" />
        </div>
    </div>

          <div class="form-group row justify-content-center">
        <asp:Label runat="server" CssClass="col-md-2 col-form-label">Phone Number</asp:Label>
        <div class="col-md-8">
            <asp:TextBox runat="server" ID="txtphonenum"
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
        <div class="offset-md-2 col-md-8">
            <asp:Button runat="server" ID="btnupdate"
                OnClick="btnupdate_Click" Text="Update User"
                Visible="false" CssClass="btn btn-block btn-outline-primary" />
            <asp:Button runat="server" ID="btndelete"
                OnClick="btndelete_Click" OnClientClick="return confirm('Are you sure you want to delete?')" Text="Delete User"
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
        DataKeyNames="User_Id"
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
            <asp:TemplateField HeaderText="First Name" HeaderStyle-ForeColor="#ff6600">
                <ItemTemplate>
                    <!-- display the movie name -->
                    <asp:Label ID="lblfirstname" Text='<%#Eval("First_Name")%>'
                        runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Last Name" HeaderStyle-ForeColor="#ff6600">
                <ItemTemplate>
                    <!-- display the movie name -->
                    <asp:Label ID="lblastname" Text='<%#Eval("Last_Name")%>'
                        runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <%-- add an imagefield here to display the poster--%>

            <asp:ImageField DataImageUrlField="Profile" 
                    DataImageUrlFormatString="../images/{0}"
                    HeaderText="Profile Picture" HeaderStyle-ForeColor="#ff6600" SortExpression="Profile Picture"
                    ControlStyle-Width="150" />
        </Columns>
    </asp:GridView>
           </div>
        </section>

</asp:Content>
