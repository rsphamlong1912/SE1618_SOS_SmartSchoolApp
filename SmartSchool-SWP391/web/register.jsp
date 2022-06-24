<%-- 
    Document   : register.jsp
    Created on : Jun 5, 2022, 1:01:08 AM
    Author     : TrinhNgocBao
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">


        <!-- ===============================================-->
        <!--    Document Title-->
        <!-- ===============================================-->
        <title>FPTU Lost & Found</title>


        <!-- ===============================================-->
        <!--    Favicons-->
        <!-- ===============================================-->
        <link rel="apple-touch-icon" sizes="180x180" href="assets/img/favicons/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicons/favicon-16x16.png">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicons/logo-truong-fpt_043152255.ico">
        <link rel="manifest" href="assets/img/favicons/manifest.json">
        <meta name="msapplication-TileImage" content="assets/img/favicons/mstile-150x150.png">
        <meta name="theme-color" content="#ffffff">
        <!-- <link href="https://fonts.googleapis.com/css?family=Poppins" rel="stylesheet" /> -->


        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@500&family=Roboto:wght@400;500&display=swap"
              rel="stylesheet">


        <!-- ===============================================-->
        <!--Stylesheets-->
        <!-- ===============================================-->
        <link href="./assets/css/theme.css" rel="stylesheet" />
        <link href="./assets/css/main.css" rel="stylesheet" />
        <link href="./assets/css/style.css" rel="stylesheet" />
    </head>


    <body>

        <!-- ===============================================-->
        <!--    Main Content-->
        <!-- ===============================================-->

        <main class="main" id="top">
            <!-- here  data-navbar-on-scroll="data-navbar-on-scroll"-->
            <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block gradient-custom-2" style="background-color: #F26F21 ;">
                <div class="container"><a class="navbar-brand" href="index.html"><img
                            src="https://hcmuni.fpt.edu.vn/landing-page/images/logo-top.png" height="46" alt="logo" /></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                            class="navbar-toggler-icon"> </span></button>
                    <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto pt-2 pt-lg-0 font-base align-items-lg-center align-items-start">
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="lostAndfoundhome">Trang chủ</a>
                            </li>
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="#phanloai">Phân loại</a>
                            </li>
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="#moinhatduoc">Mới nhặt
                                    được</a></li>
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="#moithatlac">Mới thất
                                    lạc</a></li>
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="#timkiem">Tìm kiếm</a></li>
                            <li class="nav-item px-3"><a class="btn btn-outline-light order-1 order-lg-0 fw-bold" href="#!">Đăng nhập /
                                    Đăng ký</a></li>
                            <!-- <li class="nav-item px-3 px-xl-4"><a class="btn btn-outline-dark btn-success order-1 order-lg-0 fw-bold"
                                href="#!">Đăng ký</a></li> -->
                        </ul>
                    </div>
                </div>
            </nav>
            <section style="padding-top: 0px">
                <div class="bg-holder"
                     style="background-image:url(https://hcmuni.fpt.edu.vn/Data/Sites/1/media/hinh-gioi-thieu-dai-hoc-fpt/hcm.png);">
                </div>
                <!--/.bg-holder-->

                <div class="container pt-10 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-xl-10">
                            <div class="card rounded-1 text-secondary">
                                <form onsubmit="return validate()" action="main" method="POST">
                                    <div class="row g-0">
                                        <div class="text-center mt-5">
                                            <img src="https://upload.wikimedia.org/wikipedia/vi/1/1d/Logo_%C4%90%E1%BA%A1i_h%E1%BB%8Dc_FPT.png"
                                                 style="width: 185px;" alt="logo">
                                            <h4 class="mt-1 mb-5 pb-1">FPT SmartSchool</h4>
                                        </div>
                                        <p class="text-center">Đăng ký tài khoản của bạn</p>
                                        <div class="col-lg-6">
                                            <div class="card-body p-md-5 mx-md-4">  
                                                <div class="form-outline mb-2 ">
                                                    <label class="form-label" for="form2Example11">Họ tên</label>
                                                    <input type="text" id="fullName" class="form-control" name="fullName"
                                                           value="${requestScope.FULLNAME}" placeholder="" />
                                                    <small class="fw-bold"></small>                      
                                                </div>
                                                <div class="form-outline mb-2">
                                                    <label class="form-label" for="form2Example11">Tên đăng nhập</label>
                                                    <input type="text" id="userName" class="form-control" name="userName"
                                                           value="${requestScope.USERNAME}" placeholder="" />
                                                    <small class="fw-bold">${requestScope.ERROR}</small>                       
                                                </div>

                                                <div class="form-outline mb-3">
                                                    <label class="form-label" for="form2Example22">Mật khẩu</label>
                                                    <input type="password" id="password" class="form-control" name="password" />
                                                    <small class="fw-bold"></small>
                                                </div>
                                                <div class="form-outline mb-3">
                                                    <label class="form-label" for="form2Example22">Nhập lại mật khẩu</label>
                                                    <input type="password" id="re-password" class="form-control" name="repassword"/>
                                                    <small class="fw-bold"></small>
                                                </div>
                                            </div>
                                        </div>
                                            <div class="col-lg-6">
                                                <div class="card-body p-md-5 mx-md-4">
                                                    <div class="form-outline mb-2">
                                                        <label class="form-label" for="form2Example11">Email</label>
                                                        <input type="email" id="email" class="form-control" name="email"
                                                               value="${requestScope.EMAIL}" placeholder="" />
                                                        <small class="fw-bold"></small>                      
                                                    </div>
                                                    <div class="form-outline mb-2">
                                                        <label class="form-label" for="form2Example11">Số điện thoại</label>
                                                        <input type="tel" id="phone" class="form-control" name="phone"
                                                               value="${requestScope.PHONE}" placeholder="" />
                                                        <small class="fw-bold"></small>                      
                                                    </div>
                                                    <div class="text-center pt-1 mb-5 pb-1">
                                                        <c:if test="${empty requestScope.ERROR}">
                                                            <h6 style="color: green; display: inline-block; padding: 5px 0">${requestScope.SUCCESS}</h6></br>
                                                        </c:if>
                                                        <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="submit" name="action" value="SignUp">Đăng ký</button>                       
                                                    </div>                     
                                                    <div class="d-flex align-items-center justify-content-center pb-4">
                                                        <p class="mb-0 me-2">Đã có tài khoản ?</p>
                                                        <a class="btn btn-outline-danger" href="login.jsp">Đăng nhập</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </form>  
                            </div>
                        </div>
                    </div>
                </div>
            </section>


            <!-- ============================================-->
            <!-- <section> begin ============================-->
            <section class="pb-0 pb-lg-4 gradient-custom-2">

                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-7 col-12 mb-4 mb-md-6 mb-lg-0 order-0"> <img class="mb-4"
                                                                                                 src="https://hcmuni.fpt.edu.vn/landing-page/images/logo-top.png" width="150" alt="jadoo" />
                            <p class="fs--1 text-white mb-0 fw-medium">Giúp bạn tìm kiếm những món đồ không may bị thất lạc
                            </p>
                        </div>
                        <div class="col-lg-2 col-md-4 mb-4 mb-lg-0 order-lg-1 order-md-2">
                            <h4 class="footer-heading-color fw-bold font-sans-serif mb-3 mb-lg-4">Company</h4>
                            <ul class="list-unstyled mb-0">
                                <li class="mb-2"><a class="link-900 fs-1 fw-medium text-decoration-none" href="#!">About</a></li>
                                <li class="mb-2"><a class="link-900 fs-1 fw-medium text-decoration-none" href="#!">Careers</a></li>
                                <li class="mb-2"><a class="link-900 fs-1 fw-medium text-decoration-none" href="#!">Mobile</a></li>
                            </ul>
                        </div>
                        <div class="col-lg-2 col-md-4 mb-4 mb-lg-0 order-lg-2 order-md-3">
                            <h4 class="footer-heading-color fw-bold font-sans-serif mb-3 mb-lg-4">Contact</h4>
                            <ul class="list-unstyled mb-0">
                                <li class="mb-2"><a class="link-900 fs-1 fw-medium text-decoration-none" href="#!">Help/FAQ</a></li>
                                <li class="mb-2"><a class="link-900 fs-1 fw-medium text-decoration-none" href="#!">Press</a></li>
                                <li class="mb-2"><a class="link-900 fs-1 fw-medium text-decoration-none" href="#!">Affiliate</a></li>
                            </ul>
                        </div>
                        <div class="col-lg-2 col-md-4 mb-4 mb-lg-0 order-lg-3 order-md-4">
                            <h4 class="footer-heading-color fw-bold font-sans-serif mb-3 mb-lg-4">More</h4>
                            <ul class="list-unstyled mb-0">
                                <li class="mb-2"><a class="link-900 fs-1 fw-medium text-decoration-none" href="#!">Airlinefees</a></li>
                                <li class="mb-2"><a class="link-900 fs-1 fw-medium text-decoration-none" href="#!">Airline</a></li>
                                <li class="mb-2"><a class="link-900 fs-1 fw-medium text-decoration-none" href="#!">Low fare tips</a></li>
                            </ul>
                        </div>
                        <div class="col-lg-3 col-md-5 col-12 mb-4 mb-md-6 mb-lg-0 order-lg-4 order-md-1">
                            <div class="icon-group mb-4"> <a class="text-decoration-none icon-item shadow-social" id="facebook"
                                                             href="#!"><i class="fab fa-facebook-f"> </i></a><a class="text-decoration-none icon-item shadow-social"
                                                             id="instagram" href="#!"><i class="fab fa-instagram"> </i></a><a
                                                             class="text-decoration-none icon-item shadow-social" id="twitter" href="#!"><i class="fab fa-twitter">
                                    </i></a></div>
                            <h4 class="fw-medium font-sans-serif text-white mb-3">Discover our app</h4>
                            <div class="d-flex align-items-center"> <a href="#!"> <img class="me-2" src="assets/img/play-store.png"
                                                                                       alt="play store" /></a><a href="#!"> <img src="assets/img/apple-store.png" alt="apple store" /></a>
                            </div>
                        </div>
                    </div>
                </div><!-- end of .container-->

            </section>
            <!-- <section> close ============================-->
            <!-- ============================================-->


            <div class="py-5 text-center">
                <p class="mb-0 text-secondary fs--1 fw-medium">FPT SmartSchool </p>
            </div>
        </main>
        <!-- ===============================================-->
        <!--    End of Main Content-->
        <!-- ===============================================-->




        <!-- ===============================================-->
        <!--    JavaScripts-->
        <!-- ===============================================-->
        <script src="vendors/@popperjs/popper.min.js"></script>
        <script src="vendors/bootstrap/bootstrap.min.js"></script>
        <script src="vendors/is/is.min.js"></script>
        <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
        <script src="vendors/fontawesome/all.min.js"></script>
        <script src="assets/js/theme.js"></script>
        <script src="assets/js/extention/choices.js"></script>
        <script src="assets/js/extention/validation.js"></script>
        <script>
                                    const choices = new Choices('[data-trigger]',
                                            {
                                                searchEnabled: false
                                            });

        </script>
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&amp;family=Volkhov:wght@700&amp;display=swap"
            rel="stylesheet">
    </body>

</html>
