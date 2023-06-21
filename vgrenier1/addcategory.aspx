<%@ Page Title="" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="addcategory.aspx.cs" Inherits="vgrenier1.addcategory" %>
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
        <h2 class=" text-center mt-">Manage Category</h2>
        <hr />
  

        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label"></asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtcatId" Visible="false"
                    CssClass="form-control" />
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server" CssClass="col-md-2 col-form-label">Category Name</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtcat"
                    CssClass="form-control" />

            </div>
        </div>
       
        
       
       
       
        <div class="form-group row justify-content-center">
            <div class="offset-md-2 col-md-8">
                
                <asp:Button runat="server" ID="btnAddmovies" 
                    OnClick="btnAddmovies_Click" Text="Add Category"
                    CssClass="btn btn-block btn-outline-primary" />

                <asp:Button runat="server" ID="btnupdate" 
                    OnClick="btnupdate_Click" Text="Update Category"
                    Visible="false" CssClass="btn btn-block btn-outline-primary" />
                
                <asp:Button runat="server" ID="btndelete"
                    OnClick="btndelete_Click"  OnClientClick="return confirm('Are you sure you want to delete?')" Text="Delete Category"
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
         
        
        DataKeyNames="Category_Id" 
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
            <asp:TemplateField HeaderText="Category Name" HeaderStyle-ForeColor="#ff6600">
                <ItemTemplate>
                    <!-- display the movie name -->
                    <asp:Label ID="lblcatname" Text='<%#Eval("Category_Name")%>'
                        runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
             
            <%-- add an imagefield here to display the poster--%>
             
        </Columns>
    </asp:GridView>
        
        </section>
</asp:Content>
