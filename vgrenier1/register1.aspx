<%@ Page Title="Register" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="register1.aspx.cs" Inherits="vgrenier1.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <!-- Section: Design Block -->
    <section class="background-radial-gradient overflow-hidden">
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <style>
            .background-radial-gradient {
                background-color: hsl(330, 80%, 40%);
                background-image: radial-gradient(650px circle at 0% 0%, hsl(218, 41%, 35%) 15%, hsl(218, 41%, 30%) 35%, hsl(218, 41%, 20%) 75%, hsl(218, 41%, 19%) 80%, transparent 100%), radial-gradient(1250px circle at 100% 100%, hsl(218, 41%, 45%) 15%, hsl(218, 41%, 30%) 35%, hsl(218, 41%, 20%) 75%, hsl(218, 41%, 19%) 80%, transparent 100%);
            }

          /*
            #radius-shape-1 {
                height: 220px;
                width: 220px;
                top: -60px;
                left: -130px;
                background: radial-gradient(#178781, #523293);
                overflow: hidden;
            }
           */

            #radius-shape-2 {
                border-radius: 38% 62% 63% 37% / 70% 33% 67% 30%;
                bottom: -60px;
                right: -110px;
                width: 300px;
                height: 300px;
                background: radial-gradient(#178781, #ad1fff);
                overflow: hidden;
            }

            .bg-glass {
                background-color: hsla(0, 0%, 100%, 0.9) !important;
                backdrop-filter: saturate(200%) blur(25px);
            }
        </style>

        <div class="container px-4 py-2 px-md-5 text-center text-lg-start my-5">
            <div class="row gx-lg-5 align-items-center mb-5">
                <div class="col-lg-6 mb-5 mb-lg-0" style="z-index: 10">
                    <h1 class="my-5 display-3 fw-bold ls-tight" style="color: hsl(218, 81%, 95%)">Welcome to
                        <br />
                        <span style="color: hsl(218, 81%, 75%)">Vide Grenier</span>
                    </h1>
                    <p class="mb-4 opacity-70" style="color: hsl(218, 81%, 85%)">
                        Vide Grenier is an Online Platform where Buyers and Sellers meet to sell or buy a product.
                        Many variety of products can be found here.
                    </p>
                </div>

                <div class="col-lg-6 mb-5 mb-lg-0 position-relative">
                    <div id="radius-shape-1" class="position-absolute rounded-circle shadow-5-strong"></div>
                    <div id="radius-shape-2" class="position-absolute shadow-5-strong"></div>

                    <div class="card bg-glass">
                        <div class="card-body px-4 py-3 px-md-5">
                            <h3 class=" mb-4">Register Here</h3>
                            <!-- 2 column grid layout with text inputs for the first and last names -->
                            <div class="row">
       
                                <div class="col-md-6 mb-2">
                                    <div class="form-outline">
                                        <asp:Label ID="lblFname" runat="server"
                                            CssClass="form-label">First Name</asp:Label>

                                        <asp:TextBox runat="server" ID="txtFirstName"
                                            CssClass="form-control" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
            ValidationGroup="reg"
            ControlToValidate="txtFirstName"
            Display="Dynamic"
            SetFocusOnError="true"
            CssClass="text-danger" 
            ErrorMessage=" First Name is Required!!!"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-2">
                                    <div class="form-outline">
                                        <asp:Label ID="lblLname" runat="server"
                                            CssClass="form-label">Last Name</asp:Label>

                                        <asp:TextBox runat="server" ID="txtLastName"
                                            CssClass="form-control" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
            ValidationGroup="reg"
            ControlToValidate="txtLastName"
            Display="Dynamic"
            SetFocusOnError="true"
            CssClass="text-danger" 
            ErrorMessage="Last Name is Required!!!"></asp:RequiredFieldValidator>


                                    </div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <asp:Label ID="lblDOB" runat="server"
                                    CssClass="form-label">Date Of Birth</asp:Label>

                                <asp:TextBox runat="server" ID="txtDOB"
                                    TextMode="Date"
                                    CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDOB"
                                     ValidationGroup="reg"
                                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The DOB field is required." />
                            </div>
                             <div class="form-outline">
                                        <asp:Label ID="lblNum" runat="server"
                                            CssClass="form-label">Phone Number</asp:Label>

                                        <asp:TextBox runat="server" ID="txtnum"
                                            CssClass="form-control" />
                                        <asp:CompareValidator ID="CompareValidator2"
            ControlToValidate="txtnum"
            Operator="DataTypeCheck"
            Type="Integer"
            runat="server"
            Display="Dynamic"
            CssClass="text-danger" 
            ErrorMessage="Wrong Data Type">
                                        </asp:CompareValidator>

                                    </div>

                            <!-- Email input -->
                             <div class="form-outline mb-2">
                                <asp:Label ID="lblAddress" runat="server"
                                    CssClass="form-label">Address</asp:Label>

                                <asp:TextBox runat="server" ID="txtAddress"
                                    CssClass="form-control" />
                            </div>

                            <div class="form-outline mb-2">
                                <asp:Label ID="lblEmail" runat="server"
                                    CssClass="form-label">Email Address</asp:Label>

                                <asp:TextBox runat="server" ID="txtEmail"
                                    CssClass="form-control" />
                                <asp:RequiredFieldValidator ID="reqEmail" Display="Dynamic" ValidationGroup="reg" ControlToValidate="txtEmail" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="RegEmail" Display="Dynamic" runat="server" ControlToValidate="txtEmail" CssClass="text-danger"
                            ValidationExpression="^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$" 
                            ErrorMessage="Not Valid"></asp:RegularExpressionValidator>
                            </div>

                            <div class="form-outline mb-2">
                                <asp:Label ID="lblUsername" runat="server"
                                    CssClass="form-label">Username</asp:Label>

                                <asp:TextBox runat="server" ID="txtUsername"
                                    CssClass="form-control" />

                                <asp:RequiredFieldValidator ID="reqUsername" ValidationGroup="reg" ControlToValidate="txtUsername" Display="Dynamic" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator><br />


                        <asp:RegularExpressionValidator ID="regUsername" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtUsername"
                            ValidationExpression="^[a-zA-Z0-9]{5,}$" runat="server"
                            ErrorMessage="Username must be minimum 5 characters"></asp:RegularExpressionValidator>

                                

                        
                            </div>

                            <!-- Password input -->
                            <div class="form-outline mb-2">
                                 <asp:Label ID="lblPassword" runat="server" 
                CssClass="form-label">Password</asp:Label>

            <asp:TextBox runat="server" ID="txtpass" TextMode="Password"
                CssClass="form-control" />

                                
             <asp:CustomValidator ID="CompareValidator3" runat="server"
             ControlToValidate="txtpass"
             OnServerValidate="CompareValidator3_ServerValidate"
             ClientValidationFunction="validatePassword"
             ValidateEmptyText="true"
                 CssClass="text-danger" 
                 Display="Dynamic"
            ErrorMessage="Pass must be 7 to 12 chars !!"></asp:CustomValidator>
                            </div>

                    <div class="form-outline mb-2">
                        <asp:Label ID="lblCpassword" runat="server" 
                    CssClass="form-label">Confirm password</asp:Label>

                <asp:TextBox runat="server" ID="txtcpass" TextMode="Password"
                    CssClass="form-control" />

                        <asp:CompareValidator ID="CompareValidator1" runat="server"
                            ControlToValidate="txtcpass"
                            ControlToCompare="txtpass"
                            Operator="Equal"
                            CssClass="text-danger" 
                            Display="Dynamic"
                            ErrorMessage="Password does not match"></asp:CompareValidator>

                    </div>

                          <div class="col-md-3 mt-3 ps-3">

                                <h6 class="mb-2">Upload Profile Picture</h6>

                            
                            <div class="col-md-6 pe-3">
                                <asp:FileUpload ID="fuimage" runat="server" CssClass="" />
                                 <asp:Image ID="Image1" runat="server" Visible="false" Width="75"
                    Height="100" />


                                <div class="small text-muted mt-2"></div>

                            </div>
                              </div>



                            <!-- Checkbox -->

                            <!-- Submit button -->

                            <div class="col-md-6">
                <asp:Button runat="server" Text="Register" ValidationGroup="reg"
                     ID="btnRegister" OnClick="btnRegister_Click"
                    CssClass="btn btn-primary btn-block mb-4" />
                   <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            </div>

                            <!-- Register buttons -->


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
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
            <asp:TemplateField HeaderText="Product Name">
                <ItemTemplate>
                    <!-- display the movie name -->
                    <asp:Label ID="lblFirstName" Text='<%#Eval("First_Name")%>'
                        runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
              <asp:TemplateField HeaderText="Product Image">
                <ItemTemplate>
                    <!-- display the movie name -->
                    <asp:Label ID="lblLastName" Text='<%#Eval("Last_Name")%>'
                        runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <%-- add an imagefield here to display the poster--%>
        </Columns>
    </asp:GridView>
    <!-- Section: Design Block -->

</asp:Content>
