<%-- 
    Document   : LostAndFoundHome
    Created on : Jun 3, 2022, 11:05:25 AM
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
            <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block gradient-custom-2">
                <div class="container"><a class="navbar-brand" href="WelcomePage.jsp"><img
                            src="https://hcmuni.fpt.edu.vn/landing-page/images/logo-top.png" height="46" alt="logo" /></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                            class="navbar-toggler-icon"> </span></button>
                    <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto pt-2 pt-lg-0 font-base align-items-lg-center align-items-start">
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="lostAndfoundhome">TRANG CHỦ</a>
                            </li>
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="#phanloai">PHÂN LOẠI</a>
                            </li>
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="#moinhatduoc">MỚI NHẶT ĐƯỢC</a></li>
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="#moithatlac">MỚI THẤT LẠC</a></li>
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="main?action=ListAll">TÌM KIẾM</a></li>
                            
                            
                                <c:if test="${empty sessionScope.LOGIN_USER}">
                                <li class="nav-item px-3"><a class="btn btn-outline-light order-1 order-lg-0 fw-bold" href="login.jsp">ĐĂNG NHẬP /
                                        ĐĂNG KÝ</a></li>
                                    </c:if>
                                    <c:if test="${!empty sessionScope.LOGIN_USER}">
                                        <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="main?action=UploadPost">ĐĂNG BÀI</a></li>
                                <!-- User -->
                                <li class="nav-item px-3 navbar-dropdown dropdown-user dropdown">
                                    <a class="btn btn-outline-light order-1 order-lg-0 fw-bold nav-link hide-arrow" id="nameLogin" href="" data-bs-toggle="dropdown">
                                        <div class="avatar avatar-online">
                                            <c:choose>
                                                <c:when test="${sessionScope.LOGIN_USER.avatar==null}">
                                                    <img src="https://unloc.online/wp-content/uploads/2020/04/283-2833820_user-icon-orange-png.png?fbclid=IwAR133UMM9dPj2fhzsRFAVrcTvgHaJBLsIbkkwQbqx1dv_3FTf8OQfqcIRcM" alt class="w-px-40 rounded-circle" style="width: 2rem; height: 2rem"/> ${sessionScope.LOGIN_USER.fullname}
                                                </c:when>    
                                                <c:otherwise>
                                                    <img src="${pageContext.servletContext.contextPath}/avatar?userId=${sessionScope.LOGIN_USER.userId}" alt class="w-px-40 rounded-circle" style="width: 2rem; height: 2rem"/> ${sessionScope.LOGIN_USER.fullname}
                                                </c:otherwise>
                                            </c:choose>                
                                        </div>
                                    </a>          
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                            <a class="dropdown-item" href="#">
                                                <div class="d-flex">

                                                    <div class="flex-grow-1">
                                                        <span class="fw-semibold d-block">${sessionScope.LOGIN_USER.fullname}</span>
                                                        <small class="text-muted">${sessionScope.LOGIN_USER.roleName}</small>
                                                    </div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="dropdown-divider"></div>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="main?action=ProfileDetail">
                                                <i class="bx bx-user me-2"></i>
                                                <span class="align-middle"><i class="fa fa-user" aria-hidden="true"></i> Thông tin cá nhân</span>
                                            </a>
                                        </li>

                                        <li>
                                            <a class="dropdown-item" href="main?action=MyPost">
                                                <span class="d-flex align-items-center align-middle">
                                                    <i class="bx bx-user me-2"></i>
                                                    <span class="flex-grow-1 align-middle"><i class="fa fa-list-alt" aria-hidden="true"></i> Bài viết của tôi</span>
                                                    <span class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="main?action=ChangePassword">
                                                <i class="bx bx-user me-2"></i>
                                                <span class="align-middle"><i class="fa fa-key" aria-hidden="true"></i> Đổi mật khẩu</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="main?action=FeedbackSystem">
                                                <i class="bx bx-user me-2"></i>
                                                <span class="align-middle"><i class="fa fa-bug" aria-hidden="true"></i> Phản hồi hệ thống</span>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="dropdown-divider"></div>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="main?action=Logout">
                                                <i class="bx bx-user me-2"></i>
                                                <span class="align-middle"><i class="fa fa-sign-out-alt" aria-hidden="true"></i> Đăng xuất</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <!--/ User -->    
                            </c:if>    
                        </ul>
                    </div>
                </div>
            </nav>
            <section style="padding-top: 1rem;" id="timkiem">
                <div class="bg-holder"
                     style="background-image:url(https://hcmuni.fpt.edu.vn/Data/Sites/1/media/hinh-gioi-thieu-dai-hoc-fpt/hcm.png);">
                </div>
                <!--/.bg-holder-->

                <div class="container">

                    <div class="row align-items-center">
                        <h1 class="fw-bold text-light mb-3 text-center hero-title"
                            style="font-family: 'Inter', sans-serif; text-shadow: 1px 1px 1px #ffffff, 
                            1px 2px 1px #919191, 
                            1px 3px 1px #919191, 
                            1px 4px 1px #919191, 
                            1px 5px 1px #919191, 
                            1px 6px 1px #919191, 
                            1px 7px 1px #919191, 
                            1px 10px 6px rgb(16 16 16 / 40%), 
                            1px 2px 10px rgb(16 16 16 / 20%), 
                            1px 25px 35px rgb(16 16 16 / 20%), 
                            1px 30px 60px rgb(16 16 16 / 40%); top: 7.5rem;">FPT
                            University </br>Tìm kiếm đồ thất lạc</h1>
                        <div class="s131">

                            <form style="box-shadow: rgba(0, 0, 0, 0.3) 0px 19px 38px, rgba(0, 0, 0, 0.22) 0px 15px 12px; ">
                                <div class="inner-form">
                                    <div class="input-field first-wrap">
                                        <input id="search" type="text" placeholder="Bạn đang tìm kiếm gì?" />
                                    </div>
                                    <div class="input-field second-wrap" style="font-family: 'Inter', sans-serif;">
                                        <div class="input-select">
                                            <select data-trigger="" name="choices-single-defaul">
                                                <option placeholder="">Danh sách</option>
                                                <option>Đồ thất lạc</option>
                                                <option>Đồ nhặt được</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="input-field third-wrap">
                                        <button class="btn-search" type="button">Tìm kiếm</button>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </section>


            <!-- ============================================-->
            <!-- <section> begin ============================-->
            <section class="pt-5 pt-md-9" id="phanloai">

                <div class="container">
                    <div class="position-absolute z-index--1 end-0 d-none d-lg-block"><img src="assets/img/category/shape.svg"
                                                                                           style="max-width: 200px" alt="service" /></div>
                    <div class="mb-7 text-center">
                        <h5 class="text-secondary">CATEGORY </h5>
                        <h3 class="fs-xl-10 fs-lg-8 fs-7 fw-bold text-capitalize">Phân loại đồ</h3>
                    </div>
                    <div class="row">
                        <c:forEach items="${requestScope.LISTALLCATEGORY}" var="listAllCategory">
                            <div class="col-lg-3 col-sm-6 mb-6">
                                <div class="card service-card shadow-hover rounded-2 text-center align-items-center">
                                    <div class="card-body p-xxl-5 p-4"> <img src="${listAllCategory.categoryImg}" width="75" alt="Service" />
                                        <h4 class="mb-3">${listAllCategory.categoryName}</h4>

                                    </div>
                                </div>
                            </div>
                        </c:forEach>                       
                    </div>
                </div><!-- end of .container-->

            </section>
            <!-- <section> close ============================-->
            <!-- ============================================-->




            <!-- ============================================-->
            <!-- <section> begin ============================-->
            <section class="pt-5" id="moinhatduoc">

                <div class="container">
                    <div class="position-absolute start-100 bottom-0 translate-middle-x d-none d-xl-block ms-xl-n4"><img
                            src="assets/img/dest/shape.svg" alt="destination" /></div> 
                    <div class="mb-7 text-center">
                        <h5 class="text-secondary">TIN MỚI NHẤT </h5>
                        <h3 class="fs-xl-10 fs-lg-8 fs-7 fw-bold text-capitalize"><a href="list.jsp">Mới thất lạc</a> </h3>
                    </div>
                    <div class="row">
                        <c:forEach items="${requestScope.LIST3LOST}" var="itemLost">
                            <div class="col-md-4 mb-4">
                                <div class="card overflow-hidden shadow shadow-hover" id="hoverCard"> <img class="card-img-top" src="${pageContext.servletContext.contextPath}/item?postId=${itemLost.postId}"
                                                                                                           alt="Lost Item" style="height: 18rem;" />
                                    <div class="card-body py-4 px-3">
                                        <div class="d-flex flex-column flex-lg-row justify-content-between mb-3">
                                            <h4 class="text-secondary fw-medium"><a class="link-901 text-decoration-none stretched-link"
                                                                                    href="#!">${itemLost.title}</a></h4><span class="fs-1 fw-medium">${itemLost.postId}</span>
                                        </div>
                                        <div class="d-flex align-items-center"> <img src="assets/img/dest/clock.svg"
                                                                                     style="margin-right: 14px" width="20" alt="navigation" /><span class="fs-0 fw-medium">${itemLost.date}</span></div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div><!-- end of .container-->

            </section>
            <!-- <section> close ============================-->
            <!-- ============================================-->
            <section class="pt-5" id="moithatlac">

                <div class="container">
                    <div class="position-absolute start-100 bottom-0 translate-middle-x d-none d-xl-block ms-xl-n4"><img
                            src="assets/img/dest/shape.svg" alt="destination" /></div>
                    <div class="mb-7 text-center">
                        <h5 class="text-secondary">TIN MỚI NHẤT </h5>
                        <h3 class="fs-xl-10 fs-lg-8 fs-7 fw-bold text-capitalize"><a href="list.jsp">Mới nhặt được</a></h3>
                    </div>
                    <div class="row">
                        <c:forEach items="${requestScope.LIST3FOUND}" var="itemFound">
                            <div class="col-md-4 mb-4">
                                <div class="card overflow-hidden shadow shadow-hover" id="hoverCard"> <img class="card-img-top" src="${pageContext.servletContext.contextPath}/item?postId=${itemFound.postId}"
                                                                                                           alt="Found Item" style="height: 18rem;" />
                                    <div class="card-body py-4 px-3">
                                        <div class="d-flex flex-column flex-lg-row justify-content-between mb-3">
                                            <h4 class="text-secondary fw-medium"><a class="link-901 text-decoration-none stretched-link"
                                                                                    href="#!">${itemFound.title}</a></h4><span class="fs-1 fw-medium">${itemFound.postId}</span>
                                        </div>
                                        <div class="d-flex align-items-center"> <img src="assets/img/dest/clock.svg"
                                                                                     style="margin-right: 14px" width="20" alt="navigation" /><span class="fs-0 fw-medium">${itemFound.date}</span></div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div><!-- end of .container-->

            </section>
            <!-- <section> close ============================-->
            <!-- ============================================-->




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
