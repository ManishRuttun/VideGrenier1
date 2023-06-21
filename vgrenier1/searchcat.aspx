<%@ Page Title="Search Category" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="searchcat.aspx.cs" Inherits="vgrenier1.searchcat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .content {
            width: 700px;
            padding-left: 50px;
            border: solid 0px black;
            /*background-color: ;*/
            margin:auto;
        }

        a {
            color: blue;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <section style="background: linear-gradient(180deg, #d0ecb6 0%, #75e1df 100%)">
    
    <div class="content">
        <h3 class=" text-center mt-2">Select a Category</h3>
        <!-- This repeater will be used to display list of categories: 
change the attributes name and add a query string to pass the Category ID -->
        <asp:Repeater
            ID="rptProductCategories"
            runat="server">
            <ItemTemplate>
                <asp:HyperLink
                    ID="lnkMenu"
                    Text='<%#Eval("Category_Name")%>'
                    NavigateUrl='<%#Eval("Category_Id","searchcat.aspx?id={0}")%>'
                    runat="server" />
            </ItemTemplate>
            <SeparatorTemplate>
                &nbsp;|&nbsp;
            </SeparatorTemplate>
        </asp:Repeater>
        <hr />

        <!-- This DataList will be used to display list of movies depending on which category is selected from 
the above Repeater -->
        <asp:DataList
            ID="dlstProductDetails"
            RepeatColumns="1"
            runat="server">
            <ItemTemplate>
                <div class="card bg- text-dark text-center h-50"
                    style="width:50%;  margin: auto; background: linear-gradient(0deg, #77ee9b 0%, #3cd7d5 100%);">
                    <asp:Image runat="server" ImageUrl='<%# Eval("Product_Image", "../images/{0}")%>'
                        ID="Image1" CssClass="card-img-top mt-2 mx-auto" Width="80%"  />
                    <div class="card-body h">
                        <h2 class="card-title"><%# Eval("product_name")%></h2>
                        <p class="card-text text-dark">
                            <span><strong>Product Description:<br />
                                </strong></span>
                             
                            
 <%#Eval("Product_Des") %>
                               
                        </p>
                        <p class="card-text">
                            <span><strong>Product Price:<br />
                            </strong></span>
                            <span class="text-dark">
                                <%# Eval("Product_Price","{0:c}")%>
                            </span>
                        </p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
            
    </div>
        </section>
        

</asp:Content>
