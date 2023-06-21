<%@ Page Title="Update Profile" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="updateprofile.aspx.cs" Inherits="vgrenier1.updateprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
    .rounded-t-5 {
      border-top-left-radius: 0.5rem;
      border-top-right-radius: 0.5rem;
    }

    @media (min-width: 992px) {
      .rounded-tr-lg-0 {
        border-top-right-radius: 0;
      }

      .rounded-bl-lg-5 {
        border-bottom-left-radius: 0.5rem;
      }
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <div style="background: linear-gradient(180deg, #edabf2 0%, #baeeed 100%)">
    <section class=" text-center text-lg-start">
       <h2 class=" text-center">Update Profile</h2>
  <div class="card  mb-6" style="background: radial-gradient(circle at top, #e9bcf5 , #b5d7a2)">
    <div class="row g-0 d-flex align-items-center">
     <%-- <div class="col-lg-6 d-none d-lg-flex">
        <img src="images/pp.jpeg" alt="Trendy Pants and Shoes"
          class="w-100 rounded-t-5 rounded-tr-lg-0 rounded-bl-lg-5" />
      </div>--%>
        <div class="col-lg-4 d-none d-lg-flex" style="padding-left:50px;">
         <asp:DetailsView AutoGenerateRows="false"  BorderStyle="None" ID="DetailsView1" runat="server"  >
               <Fields>
                   <asp:TemplateField>
                       <ItemTemplate>
                           <h3>Profile Picture</h3>
                 <asp:Image runat="server"  ImageUrl='<%# Eval("Profile", "images/{0}")%>' ID="Image1"
                        CssClass="card-img-top img-fluid vys" AlternateText="Profile Picture" Width="250px" Height="250px" />
                           </ItemTemplate>
                        </asp:TemplateField>
            </Fields>
            </asp:DetailsView>
      </div>
      <div class="col-lg-6">
        <div class="card-body py-5 px-md-5">
            

            
         <%-- <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label">Image</asp:Label>
            <div class="col-md-8">
                <asp:FileUpload ID="fuimage" runat="server" CssClass="" />
                <asp:Image ID="Image1" runat="server" Visible="false" Width="75"
                    Height="100" />
            </div>
        </div>--%>
           
            <!-- First name input -->
             <div class="form-outline">
                <asp:Label ID="Label1" runat="server" Text="First Name:"
                    AssociatedControlID="txtfname"></asp:Label>
                <div class="div_texbox">
                    <asp:TextBox ID="txtfname" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        ControlToValidate="txtfname" runat="server"
                        ErrorMessage="Required"></asp:RequiredFieldValidator>
                </div>

            <!-- Last name input-->
            <div class="col">
                <div class="form-outline">
                    <asp:Label ID="lbllname" runat="server" Text="Last Name:"
                        AssociatedControlID="txtLname"></asp:Label>
                    <div class="div_texbox">
                        <asp:TextBox ID="txtlname" runat="server" CssClass="form-control col-md-8"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="reqLname"
                            ControlToValidate="txtLname" runat="server"
                            ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            
            <!-- Email input -->
            <div class="form-outline mb-4">
                <asp:Label ID="Label2" runat="server" Text="Email Address"
                    AssociatedControlID="txtemail"></asp:Label>
                <div class="div_texbox">
                    <asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        ControlToValidate="txtEmail" runat="server"></asp:RequiredFieldValidator><br />

                </div>
            </div>



           

                    

            <!-- 2 column grid layout for inline styling -->
            

            <!-- Submit button -->
          

             <!-- Submit button -->
            <asp:Button ID="Button" OnClick="Button_Click"  runat="server"
                Text="Update Profile"
                CssClass="btn btn-outline-primary btn-block" />
                 <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
        

        </div>
      </div>
          </div>
    </div>
  </div>
</section>
</div>
<!-- Section: Design Block -->
</asp:Content>
