<%@ Page Title="List of Product" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="viewdetails.aspx.cs" Inherits="vgrenier1.viewdetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>

        .viewprod {
           /* background-color:#d5c0ff ;*/
            background: linear-gradient(180deg, #e7d6a0 0%, #c988e7 100%);
            margin: auto;
            width:60%;

        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <section style="background: linear-gradient(180deg, #d1a1e8 0%, #88c3e7 100%)">
    <h3 class="text-center mt-2 mb-2">View Products</h3>
    <div class="viewprod mb-3" style="text-align:center">
        
        <asp:GridView
            ID="Grd"
            AutoGenerateColumns="false"
            OnPageIndexChanging="Grd_PageIndexChanging"
            AllowPaging="true"
            PageSize="3"
            CellPadding="25"            
            AlternatingRowStyle-BorderWidth="1px"
            runat="server" 
            HeaderStyle-BackColor="#daddad">
           

            <Columns>

                <asp:ImageField DataImageUrlField="Product_Image"
                    DataImageUrlFormatString="../images/{0}"
                    HeaderText="Product Image" SortExpression="Product_Image"
                    ControlStyle-Width="150" />

                 <asp:TemplateField HeaderText="Product Name">

                    <ItemTemplate>

                        <h6>
                            <%# Eval("Product_Name") %>
                        </h6>

                    </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="Product Description">

                    <ItemTemplate>

                        <h6>
                            <%# Eval("Product_Des") %>
                        </h6>

                    </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="Price">

                    <ItemTemplate>

                        <h6>
                            <%# Eval("Product_Price", "{0:c}") %>
                        </h6>

                    </ItemTemplate>

                </asp:TemplateField>

               

                <asp:HyperLinkField HeaderText="Product Details" DataTextField="Product_Name" DataNavigateUrlFields="Product_Id" DataNavigateUrlFormatString="details.aspx?id={0}"/>


            </Columns>
        </asp:GridView>
    </div>
        </section>

</asp:Content>
