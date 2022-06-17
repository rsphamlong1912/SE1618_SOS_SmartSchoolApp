<%-- 
    Document   : postDetail
    Created on : Jun 12, 2022, 8:10:20 AM
    Author     : SE150888 Pham Ngoc Long
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
              integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@500&family=Roboto:wght@400;500&display=swap"
              rel="stylesheet">


        <!-- ===============================================-->
        <!--Stylesheets-->
        <!-- ===============================================-->
        <link href="assets/css/theme.css" rel="stylesheet" />
        <link href="assets/css/main.css" rel="stylesheet" />
        <link href="assets/css/style.css" rel="stylesheet" />
        <style>
            section {
                margin-top: 3rem;
            }
            h3 {
                padding: 10px 0 15px 0;
            }

            .imgPost img {
                width: 400px;
                height: 400px;
                border: 1px solid #433535;
                border-radius: 10px;
            }

            .profileUserPost img {
                width: 234px;
                height: 234px;
                border-radius: 50%;
            }

            .info-desc {
                display: flex;
            }

            .info-desc span {
                font-weight: 800;
                min-width: 130px;
                font-size: 18px;
            }

            .title-desc {
                font-weight: 500;
            }
            
            .content-desc {
               font-size: 18px; 
            }

        </style>
    </head>


    <body>

        <!-- ===============================================-->
        <!--    Main Content-->
        <!-- ===============================================-->

        <main class="main" id="top">
            <!-- here  data-navbar-on-scroll="data-navbar-on-scroll"-->
            <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block gradient-custom-2"
                 style="background-color: #F26F21 ;">
                <div class="container"><a class="navbar-brand" href="lostAndfoundhome"><img
                            src="https://hcmuni.fpt.edu.vn/landing-page/images/logo-top.png" height="46" alt="logo" /></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon">
                        </span></button>
                    <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto pt-2 pt-lg-0 font-base align-items-lg-center align-items-start">
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page"
                                                         href="lostAndfoundhome">Trang chủ</a>
                            </li>
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="#phanloai">Phân
                                    loại</a>
                            </li>
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page"
                                                         href="#moinhatduoc">Mới nhặt
                                    được</a></li>
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="#moithatlac">Mới
                                    thất
                                    lạc</a></li>
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="#timkiem">Tìm
                                    kiếm</a></li>
                            <c:if test="${empty sessionScope.LOGIN_USER}">
                                <li class="nav-item px-3"><a class="btn btn-outline-light order-1 order-lg-0 fw-bold" href="#!">Đăng nhập /
                                        Đăng ký</a></li>
                                    </c:if>
                                    <c:if test="${!empty sessionScope.LOGIN_USER}">
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
            <section class="container" style="padding-top: 3rem;" id="timkiem">
                <h1 class="mb-8" style="margin-top: 50px; text-align: center;">Chỉnh sửa bài đăng</h1>
                <div class="row">
                    <div class="col-12 col-md-4">
                        <div class="imgPost">
                            <img src="${pageContext.servletContext.contextPath}/item?postId=${requestScope.POST.postId}"
                                 alt="Image Post Detail">
                        </div>
                    </div>
                    <div class="col-12 col-md-5">
                        <h3>${requestScope.POST.title}</h3>
                        <div class="info-desc"><span class="title-desc">Loại:</span>
                            <p class="content-desc">
                                <c:choose> 
                                    <c:when test="${requestScope.POST.type=='0'}">
                                        Đồ thất lạc
                                    </c:when>  
                                    <c:otherwise>
                                        Đồ nhặt được
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                        <div class="info-desc"><span class="title-desc">Danh mục: </span>
                            <p class="content-desc">${requestScope.POST.categoryName}</p>
                        </div>
                        <div class="info-desc"><span class="title-desc">Mô tả:</span>
                            <p class="content-desc">${requestScope.POST.description}</p>
                        </div>
                        <div class="info-desc"><span class="title-desc">Ngày đăng: </span>
                            <p class="content-desc">${requestScope.POST.date}</p>
                        </div>
                        <a href="#" class="btn btn-danger btn-sm"><i class="fa-solid fa-trash"></i> Xóa</a>
                        <a href="#" class="btn btn-success btn-sm"><i class="fa-solid fa-pencil"></i> Sửa</a>


                    </div>
                    <div class="col-12 col-md-3 profileUserPost">
                        
                        <div class="card align-items-center" style="width: 18rem;">
                            <h3>Người đăng</h3>
                            <c:choose>
                                <c:when test="${sessionScope.LOGIN_USER.avatar==null}">
                                    <img src="https://unloc.online/wp-content/uploads/2020/04/283-2833820_user-icon-orange-png.png?fbclid=IwAR133UMM9dPj2fhzsRFAVrcTvgHaJBLsIbkkwQbqx1dv_3FTf8OQfqcIRcM" alt >
                                </c:when>    
                                <c:otherwise>
                                    <img src="${pageContext.servletContext.contextPath}/avatar?userId=${requestScope.POST.userId}" alt="User Post">
                                </c:otherwise>
                            </c:choose>
                            <div class="card-body">
                                <h5 class="card-title text-center">${requestScope.USER_POST.fullname}</h5>
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item"><i class="fa-solid fa-phone"></i> ${requestScope.USER_POST.phone}</li>
                                <li class="list-group-item"><i class="fa-solid fa-envelope"></i> ${requestScope.USER_POST.email} </li>
                                <li class="list-group-item"><i class="fa-brands fa-facebook"></i> ${requestScope.USER_POST.facebook} </li>
                            </ul>
<!--                            <div class="card-body text-center">
                                <a href="#" class="btn btn-success btn-sm"><i class="fa-solid fa-phone-volume"></i> Gọi</a>
                                <a href="#" class="btn btn-success btn-sm"><i class="fa-brands fa-facebook-messenger"></i> Messenger</a>
                                <a href="#" class="btn btn-success btn-sm"><i class="fa-solid fa-envelope"></i> Mail</a>
                            </div>-->
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
                                <li class="mb-2"><a class="link-900 fs-1 fw-medium text-decoration-none" href="#!">About</a>
                                </li>
                                <li class="mb-2"><a class="link-900 fs-1 fw-medium text-decoration-none"
                                                    href="#!">Careers</a></li>
                                <li class="mb-2"><a class="link-900 fs-1 fw-medium text-decoration-none"
                                                    href="#!">Mobile</a></li>
                            </ul>
                        </div>
                        <div class="col-lg-2 col-md-4 mb-4 mb-lg-0 order-lg-2 order-md-3">
                            <h4 class="footer-heading-color fw-bold font-sans-serif mb-3 mb-lg-4">Contact</h4>
                            <ul class="list-unstyled mb-0">
                                <li class="mb-2"><a class="link-900 fs-1 fw-medium text-decoration-none"
                                                    href="#!">Help/FAQ</a></li>
                                <li class="mb-2"><a class="link-900 fs-1 fw-medium text-decoration-none" href="#!">Press</a>
                                </li>
                                <li class="mb-2"><a class="link-900 fs-1 fw-medium text-decoration-none"
                                                    href="#!">Affiliate</a></li>
                            </ul>
                        </div>
                        <div class="col-lg-2 col-md-4 mb-4 mb-lg-0 order-lg-3 order-md-4">
                            <h4 class="footer-heading-color fw-bold font-sans-serif mb-3 mb-lg-4">More</h4>
                            <ul class="list-unstyled mb-0">
                                <li class="mb-2"><a class="link-900 fs-1 fw-medium text-decoration-none"
                                                    href="#!">Airlinefees</a></li>
                                <li class="mb-2"><a class="link-900 fs-1 fw-medium text-decoration-none"
                                                    href="#!">Airline</a></li>
                                <li class="mb-2"><a class="link-900 fs-1 fw-medium text-decoration-none" href="#!">Low fare
                                        tips</a></li>
                            </ul>
                        </div>
                        <div class="col-lg-3 col-md-5 col-12 mb-4 mb-md-6 mb-lg-0 order-lg-4 order-md-1">
                            <div class="icon-group mb-4"> <a class="text-decoration-none icon-item shadow-social"
                                                             id="facebook" href="#!"><i class="fab fa-facebook-f"> </i></a><a
                                                             class="text-decoration-none icon-item shadow-social" id="instagram" href="#!"><i
                                        class="fab fa-instagram"> </i></a><a
                                    class="text-decoration-none icon-item shadow-social" id="twitter" href="#!"><i
                                        class="fab fa-twitter">
                                    </i></a></div>
                            <h4 class="fw-medium font-sans-serif text-white mb-3">Discover our app</h4>
                            <div class="d-flex align-items-center"> <a href="#!"> <img class="me-2"
                                                                                       src="assets/img/play-store.png" alt="play store" /></a><a href="#!"> <img
                                        src="assets/img/apple-store.png" alt="apple store" /></a>
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
