<%@ Page Title=" View Reserved Product" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="viewreserveproduct.aspx.cs" Inherits="vgrenier1.posteditem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
       /* #imgposter {
            margin: auto;
        }*/
    </style>
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <section style="background: linear-gradient(180deg, #7bcbdb 0%, #8972df 100%)">
    <h2 class=" text-center mt-">Reserved Product</h2>

    <asp:Repeater
        ID="rptProducts"
        runat="server">

        <ItemTemplate>
            <div class="container">
                <div class="card mx-auto text-dark text-center" style="width: 30%; background: linear-gradient(180deg, #9db692 0%, #e78892 100%);  margin: auto;">
                    <div class="">
                        <asp:Image ID="imgposter" ImageUrl='<%# Eval("Product_Image", "../images/{0}") %>'
                            class="card-img-top mt- my- mx-auto" alt="Card image" Width="80%"   runat="server" />
                    </div>
                    <div class="card-body">

                        <h5><%#Eval("Product_Name") %></h5>
                        <b>Product Description:</b> <%# Eval("Product_Des") %>
                        <br />
                    </div>
                    <div>

                        <asp:LinkButton ID="lnkproddetails" runat="server" Text="Product Details"
                            PostBackUrl='<%# Eval("product_id","details.aspx?id={0}") %>'
                            CssClass="btn btn-info"></asp:LinkButton>
                    </div>


                </div>
               
            </div>
        </ItemTemplate>
    </asp:Repeater>
        </section>
</asp:Content>
