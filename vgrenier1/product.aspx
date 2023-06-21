<%@ Page Title="Add Product" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="vgrenier1.test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">
    <!-- Section: Design Block -->
    <section class="text-center bg-info">
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <!-- Background image -->
        <div class="p-5 bg-image" style="">
        </div>
        <!-- Background image -->

        <div class="card mx-4 mx-md-5 shadow-5-strong" style="margin-top: -100px; background: hsla(0, 0%, 100%, 0.9); backdrop-filter: blur(30px);">
            <div class="card-body py-5 px-md-5">

                <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                        <h2 class="fw-bold mb-5">Add a Product</h2>

                        <!-- 2 column grid layout with text inputs for the first and last names -->
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <div class="form-outline">
                                    <asp:Label runat="server"
                                        CssClass="form-label">Product Name</asp:Label>

                                    <asp:TextBox runat="server" ID="txtPName"
                                        CssClass="form-control" />
                                    <asp:RequiredFieldValidator ValidationGroup="prod" runat="server" ControlToValidate="txtPName"
                                        CssClass="text-danger" ErrorMessage="The Product Name field is required." />
                                </div>
                            </div>

                
                            <div class="col-md-6 mb-3">
                                <div class="form-outline">
                                    <asp:Label runat="server"
                                        CssClass="form-label">Product Category</asp:Label>

                                    <asp:DropDownList ID="ddlcat" runat="server"
                                        CssClass="form-control">
                                    </asp:DropDownList>




                                </div>
                            </div>
                        </div>

                        <div class="form-outline">
                            <asp:Label runat="server"
                                CssClass="form-label">Usage Time</asp:Label>

                            <asp:TextBox runat="server" ID="txtusage"
                                
                                CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ValidationGroup="prod" ControlToValidate="txtusage"
                                CssClass="text-danger" ErrorMessage="The Usage time field is required." />

                        </div>
                       
                        <div class="mb-3 mt-2">
                            <asp:Label runat="server"
                                CssClass="form-label">Product Description
            <span id="notif" class="bagde bg-danger rounded-pill" runat="server"></span>
                            </asp:Label>

                            <asp:TextBox runat="server" ID="txtpdes"
                                TextMode="Multiline" CssClass="form-control" />
                        </div>
                        <div class="form-outline">
                            <asp:Label runat="server"
                                CssClass="form-label">Product Price</asp:Label>

                            <asp:TextBox runat="server" ID="txtprice"
                                
                                CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ValidationGroup="prod" ControlToValidate="txtprice"
                                CssClass="text-danger" ErrorMessage="The Product Price field is required." />

                        </div>
                         <div class="form-group row justify-content">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label"></asp:Label>
            <div class="col-md-8">
                <div class="form-check-inline">
                    <asp:CheckBox runat="server" ID="chkstatus"
                        CssClass="form-check-input" />
                    <asp:Label runat="server"
                        CssClass="form-check-label">Status</asp:Label>
                </div>
            </div>
        </div>

                        <div class="row align-items-center py-3">
                            <div class="col-md-3 ps-3">

                                <h6 class="mb-4">Image of Product</h6>

                            </div>
                            <div class="col-md-6 pe-3">
                                <asp:FileUpload ID="fuimage" runat="server" CssClass="" />
                                 <asp:Image ID="Image1" runat="server" Visible="false" Width="75"
                    Height="100" />


                                <div class="small text-muted mt-2">Upload your product image.</div>

                            </div>




                            <!-- Submit button -->
                           
                            <asp:Button runat="server" ID="btnAddproduct" ValidationGroup="prod"
                                OnClick="btnAddproduct_Click1" Text="Add Product"
                                CssClass="btn btn-block btn-outline-primary" />

                            <asp:Button runat="server" ID="btnUpdate"
                                 OnClick="btnUpdate_Click"  Visible="false" Text="Update Product"
                                CssClass="btn btn-block btn-outline-primary" />

                            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>

                            <!-- Register buttons -->


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Section: Design Block -->
</asp:Content>
