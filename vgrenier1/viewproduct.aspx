<%@ Page Title="" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="viewproduct.aspx.cs" Inherits="vgrenier1.viewproduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .content {
            
           
            border: solid 0px black;
            margin:auto;
            background-color:aquamarine;
            width:50%;

        
        }

    </style>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <section style="background-color: blanchedalmond">
    <h3 class="text-center mt-2 mb-2">List of Product</h3>

    <div class="content mt-3 mb-3">
        
        <asp:GridView
            ID="GrdView1"
            AutoGenerateColumns="false"
            OnPageIndexChanging="GrdView1_PageIndexChanging"
            AllowPaging="true"
            PageSize="3"
            CellPadding="25"
            runat="server"
            HeaderStyle-BackColor="#fcffcf" >

            <Columns>
                <asp:ImageField DataImageUrlField="Product_Image"
                    DataImageUrlFormatString="../images/{0}"
                    HeaderText="Picture" SortExpression="Picture"
                    ControlStyle-Width="150" />
                <asp:TemplateField HeaderText="Price">
                    <ItemTemplate>
                        <strong>
                            <%# Eval("Product_Price", "{0:c}") %>
                        </strong>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="Product Description" 
                    DataField="Product_Des"/>
                <asp:HyperLinkField HeaderText="Product Name" 
                    DataTextField="Product_Name" 
                    DataNavigateUrlFields="Product_Id" 
                    DataNavigateUrlFormatString="details.aspx?id={0}" />


            </Columns>
        </asp:GridView>
    </div>
        </section>
</asp:Content>
