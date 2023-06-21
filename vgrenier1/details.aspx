<%@ Page Title="Product Detail" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="details.aspx.cs" Inherits="vgrenier1.details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .viewprod {
            /*background-color:#f4efee ;
            padding-bottom: 0px;
            margin: auto;
            width:350px;*/
            
        }


    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <section style="background: linear-gradient(180deg, #ea8986 0%, #504bd2 100%)">
     <h3 class="text-center mt-2 mb-2">Products Details</h3>
    <div class="viewprod mb-"<%-- style="text-align:center"--%>>
     <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="false">
           
        <Fields>
          
            <%--<asp:ImageField DataImageUrlField="Product_Image"
                DataImageUrlFormatString="../images/{0}"
                SortExpression="Picture" ControlStyle-Width="320"/>--%>

            <asp:TemplateField>

                <ItemTemplate>
                    
                    <div class="card mx-auto text-dark text-center" style="width: 40%; background: linear-gradient(180deg, #7889dd 0%, #adb0c8 100%); margin: auto;">
                     <div class="">
                    <asp:Image runat="server"
                                    ImageUrl='<%# Eval("product_image", "../images/{0}")%>' ID="Image1"
                                    class="card-img-top  mt- my- mx-auto " alt="Card image" Width="50%"  />
                         </div>
                          <div class="card-body">
                     <span><strong>Product Name:<span/>
                    <h5><strong><em>
                        <%# Eval("Product_Name") %>
                    </em></strong></h5>
                    <%--<br />--%>
                         </div>
                          <span><strong>Description:<br />
                    <%# Eval("Product_Des") %>
                              <br /> <br />
                          <span><strong>
                              <span><strong>Usage Time<br />
                    <%# Eval("Usage_time") %>
                              <br /> <br />
                          <span><strong>Price:<br />
                    <%# Eval("Product_Price") %>
                              </div>
                        
                </ItemTemplate>

            </asp:TemplateField>

            

           
                   
            
        </Fields>
               

    </asp:DetailsView>
        </div>

        </section>
</asp:Content>
