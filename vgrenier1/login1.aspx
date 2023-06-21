<%@ Page Title="Login" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="login1.aspx.cs" Inherits="vgrenier1.login1" %>

<%@ Register Src="logincrtl.ascx" TagPrefix="uc" TagName="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">


    <section class="vh-100">
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <style>
            .vh-100 {
                background: radial-gradient(circle at center, #c09d6d , #f8ffeb);
            }
        </style>

        <div class="container py-5 h-100">
            <div class="row d-flex align-items-center justify-content-center h-100">

                <div class="col-md-8 col-lg-7 col-xl-6">
                    <img src="https://t4.ftcdn.net/jpg/01/49/25/83/360_F_149258334_cmok2uz0WoLmv8PRR3o7HqqZGiBLHtck.jpg" class="img-fluid" alt="Phone image">
                </div>
                <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
                    <div class="card bg-glass">
                        <div class="card-body px-4 py-3 px-md-5">
                            <h3 class=" mb-4">Login </h3>

                         <uc:Login runat="server" ID="userlogin" ValidationGroup="usergroup" />

                                               


                            <!-- Email input -->
                          

                            <!-- Password input -->
                            

                           

                            <!-- Submit button -->

                            <div class="col-md-6 mb-4">

                                <asp:Button runat="server" ID="btnLogin" OnClick="btnLogin_Click" ValidationGroup="usergroup" Text="Log in"
                                    CssClass="btn btn-primary btn-lg btn-block" />

                            </div>

                            <p>
                                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label><br />

                                <asp:Button ID="btnRegister" runat="server"
                                    PostBackUrl="~/register1.aspx" Text="Don’t have an account yet? 
Join now"
                                    CausesValidation="false" CssClass="btn btn-warning" /><br />
                            </p>


                        </div>
                    </div>



                </div>
            </div>
        </div>
    </section>

</asp:Content>
