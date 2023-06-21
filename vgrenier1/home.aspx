<%@ Page Title="Home" Language="C#" MasterPageFile="~/guestmaster.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="vgrenier1.home" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
         <style type="text/css">
        .content {
            width: 100%;
            padding: 50px;
            border: solid 0px black;
            margin:auto;
            /*background-color:#ffb3ba;*/
            background: radial-gradient(circle at top, #d756b5 , #eed7af)
        }
        /*.container1{
            background-color:darksalmon;
        }*/

        a {
            color: blue;
        }
    </style>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="maincontent" runat="server">
    <!-- SLIDER -->
        <div style="background-color: blanchedalmond">

    <div class="container1">
    <div class="owl-carousel owl-theme hero-slider">
        <div class="slide slide1">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center text-white">

                        <h1 class="display-3 my-4">Welcome<br />
                            To
                            <br />
                            Vide Grenier</h1>
                        
                        <h6 class="text- text-uppercase" style="color:#eb9824;">WE HAVE A VARIETY OF PRODUCTS AVAILABLE FOR YOU</h6>
                        <%--<a href="login1.aspx" class="btn btn-brand">User</a>
                        <a rel="modal:open" class="btn btn-outline-light ms-3" id="modopen"
                            data-bs-toggle="modal" href="#modadmin">Admin</a>--%>
                    </div>
                </div>
            </div>
        </div>
        <div class="slide slide2">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-lg-10 offset-lg-1 text-white">
                        <h6 class="text-white text-uppercase">Welcome To Vide Grenier</h6>
                        <h1 class="display-3 my-4">New Member
                            <br />
                            Register here</h1>
                        <a href="register1.aspx" class="btn btn-brand">Register</a>
                        <%--<a href="#" class="btn btn-outline-light ms-3">Our work</a>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- MILESTONE -->


    <!-- Services -->
    <section id="services" class="text-center">
        <div class="content">

            <div class="row form-group" runat="server">
                <div class="col-sm-6 " style="float: left">
                    <h2>List of Product</h2>
                </div>
                <div class="col-sm-3" style="float: right;">
                    <div class="input-group">
                        <%--Trigger the TextChanged event--%>
                        <asp:DropDownList ID="ddlCategory" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" runat="server"
                            CssClass="form-control" AutoPostBack="true">
                        </asp:DropDownList>&nbsp;
                    </div>
                </div>
                <div class="col-sm-3" style="float: right;">
                    <div class="input-group">
                        <%--generate text changed event--%>
                        <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="true" CssClass="form-control" Placeholder="Search..." />
                        <span class="input-group-addon">
                            <i class="fa fa-search"></i></span>
                    </div>
                </div>
            </div>

            <%-- START AJAX CONTROL --%>
            <hr />


            <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                <ContentTemplate>
                    <asp:ListView
                        ID="lvProduct" OnPagePropertiesChanging="lvProduct_PagePropertiesChanging"
                        runat="server" ItemPlaceholderID="itemPlaceholder" DataKeyNames="product_id">

                        <ItemTemplate>

                            <div class="card text-dark text-center"
                                style="width: 20%; float:left; margin-left:10px; background: linear-gradient(180deg, #2af1f9 0%, #e8c891 100%)">
                                <asp:Image runat="server"
                                    ImageUrl='<%# Eval("product_image", "../images/{0}")%>' ID="Image1"
                                    class="card-img-top mt- my- mx-auto" alt="Card image" Width="100%"  />
                                <div class="card-body">
                                    <h5 class="card-title"><%# Eval("product_name")%></h5>
                                    <p class="card-text">
                                       
                       <%-- <asp:HyperLink runat="server" NavigateUrl='<%#Eval("product_id","~/details.aspx?id={0}")%>'>
                            <%#Eval("product_des").ToString() +": "+ Eval("product_name").ToString() %>
                        </asp:HyperLink>--%>
                                    </p>
                                     <p class="card-text text-dark">
                            <span><strong>Product Description:<br />
                                </strong></span>
                             
                            
 <%#Eval("Product_Des") %>
                               
                        </p>

                                    <p class="card-text">
                                        <span><strong>Price:<br />
                                        </strong></span><%# Eval("product_price","{0:c}")%>
                                    </p>
                                    <%--Eval movie_id as the commandargument--%>
                                    <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" CommandArgument='<%# Eval("product_id") %>'
                                        runat="server" Text="Reserve" CommandName="btnAccess" CssClass="btn btn-primary" />

                                </div>
                            </div>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div id="itemPlaceholder" class="categoryContainer" runat="server">
                            </div>
                            <hr style="clear: both" />

                            <div class="text-right">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="7">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Link"
                                            ShowNextPageButton="false" ShowFirstPageButton="true" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Link"
                                            ShowPreviousPageButton="false" ShowLastPageButton="true" />
                                    </Fields>
                                </asp:DataPager>
                            </div>

                        </LayoutTemplate>
                    </asp:ListView>
                </ContentTemplate>

                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddlCategory" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="TextBox1" EventName="TextChanged" />

                </Triggers>

            </asp:UpdatePanel>

            <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
        </div>



























       <%-- <div class="row">
            <div class="col-12">
                <div class="intro">
                    <h6>Our Products</h6>
                    <h1>List of Products</h1>
                    <p class="mx-auto">here you can find a list of all products that are available on the website.</p>
                </div>
            </div>
        </div>
        <div class="row g-4">
            <div class="col-lg-4 col-md-6">
                <div class="service">
                    <img src="img/p2.jpeg" alt="">
                    <h5>Clay Pot</h5>
                    <p>Clay Pot for planting</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="service">
                    <img src="img/p1.jpeg" alt="">
                    <h5>Bicycle</h5>
                    <p>New bicycle with gears</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="service">
                    <img src="img/p3.jpeg" alt="">
                    <h5>Pan</h5>
                    <p>Pan for cooking</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="service">
                    <img src="img/p4.jpeg" alt="">
                    <h5>Computer chair</h5>
                    <p>Comfortable Computer chair </p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="service">
                    <img src="img/p5.jpeg" alt="">
                    <h5>Champion League Football</h5>
                    <p>Lastest ball edition</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="service">
                    <img src="img/p6.jpeg" alt="">
                    <h5>Sofa</h5>
                    <p>Colorful Sofa Set</p>
                </div>
            </div>
        </div>--%>
    </section>

    <!-- Successful Projects -->
 <%--   <section class="bg-light" id="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="intro">
                        <h6>Work</h6>
                        <h1>Successful projects</h1>
                        <p class="mx-auto">
                            Contrary to popular belief, Lorem Ipsum is not simply random text. It has
                            roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div id="projects-slider" class="owl-theme owl-carousel">
            <div class="project">
                <div class="overlay"></div>
                <img src="img/project1.jpg" alt="">
                <div class="content">
                    <h2>Consulting Marketing</h2>
                    <h6>Website Design</h6>
                </div>
            </div>
            <div class="project">
                <div class="overlay"></div>
                <img src="img/project2.jpg" alt="">
                <div class="content">
                    <h2>Consulting Marketing</h2>
                    <h6>Website Design</h6>
                </div>
            </div>
            <div class="project">
                <div class="overlay"></div>
                <img src="img/project3.jpg" alt="">
                <div class="content">
                    <h2>Consulting Marketing</h2>
                    <h6>Website Design</h6>
                </div>
            </div>
            <div class="project">
                <div class="overlay"></div>
                <img src="img/project4.jpg" alt="">
                <div class="content">
                    <h2>Consulting Marketing</h2>
                    <h6>Website Design</h6>
                </div>
            </div>
            <div class="project">
                <div class="overlay"></div>
                <img src="img/project5.jpg" alt="">
                <div class="content">
                    <h2>Consulting Marketing</h2>
                    <h6>Website Design</h6>
                </div>
            </div>
        </div>
    </section>--%>

    <%-- <!-- Blogs -->
    <section id="blog">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="intro">
                        <h6>Blog</h6>
                        <h1>Blog Posts</h1>
                        <p class="mx-auto">Contrary to popular belief, Lorem Ipsum is not simply random text. It has
                            roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <article class="blog-post">
                        <img src="img/project5.jpg" alt="">
                        <a href="#" class="tag">Web Design</a>
                        <div class="content">
                            <small>01 Dec, 2022</small>
                            <h5>Web Design trends in 2022</h5>
                            <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a
                                piece of classical Latin literature from</p>
                        </div>
                    </article>
                </div>
                <div class="col-md-4">
                    <article class="blog-post">
                        <img src="img/project4.jpg" alt="">
                        <a href="#" class="tag">Programming</a>
                        <div class="content">
                            <small>01 Dec, 2022</small>
                            <h5>Web Design trends in 2022</h5>
                            <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a
                                piece of classical Latin literature from</p>
                        </div>
                    </article>
                </div>
                <div class="col-md-4">
                    <article class="blog-post">
                        <img src="img/project2.jpg" alt="">
                        <a href="#" class="tag">Marketing</a>
                        <div class="content">
                            <small>01 Dec, 2022</small>
                            <h5>Web Design trends in 2022</h5>
                            <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a
                                piece of classical Latin literature from</p>
                        </div>
                    </article>
                </div>
            </div>
        </div>
    </section>--%>
        </div>
            </div>
</asp:Content>
