<%-- 
    Document   : EmployerJobProcess
    Created on : Jun 16, 2022, 3:15:29 PM
    Author     : TrinhNgocBao
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>FPTU Freelance Job</title>


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
        <style>
            .row-content {
                margin: 7rem auto 0;
                /* padding: 0px 50px; */ 
                border-bottom: 1px ridge;
                min-height: 50px;
            }

            .choosen {
                border-bottom: 5px solid #F26F21;
            }

            .card-body {
                border-bottom: 1px ridge;
            }

            .card-body h5{
                font-size: 20px;
                line-height: 2rem;
            }


        </style>
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
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="employerhome">TRANG CHỦ</a>
                            </li>
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="#">DASHBOARD</a>
                            </li>
                            <li class="nav-item px-3 navbar-dropdown dropdown-user dropdown">
                                <a class="btn btn-outline-light order-1 order-lg-0 fw-bold nav-link hide-arrow" id="nameLogin" href=""
                                   data-bs-toggle="dropdown">
                                    <div class="avatar avatar-online">


                                        QUẢN LÝ CÔNG VIỆC


                                    </div>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end">
                                    <li>
                                        <a class="dropdown-item" href="main?action=MyJobPostApprove">
                                            <i class="bx bx-user me-2"></i>
                                            <span class="align-middle"> VIỆC CHỜ PHÊ DUYỆT</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="#">
                                            <i class="bx bx-user me-2"></i>
                                            <span class="align-middle"> VIỆC ĐANG TUYỂN</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="main?action=MyJobPostDone">
                                            <i class="bx bx-user me-2"></i>
                                            <span class="align-middle"> VIỆC ĐÃ TUYỂN XONG</span>
                                        </a>
                                    </li>
                                    <li>
                                        <div class="dropdown-divider"></div>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="main?action=UploadJobPost">
                                            <i class="bx bx-user me-2"></i>
                                            <span class="align-middle"> ĐĂNG TUYỂN</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
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
                                 <li class="nav-item px-3"><a class="btn btn-light order-1 order-lg-0 fw-bold" href="main?action=EmployerUploadJobPost">Đăng tuyển</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="container">
                <div class="row row-cols-3 row-content text-center ">
                    <a class="text-decoration-none fw-bold" href="main?action=MyJobPostApprove">

                        <div class="col">
                            VIỆC CHỜ PHÊ DUYỆT
                        </div>
                    </a>
                    <a class="text-decoration-none fw-bold choosen" href="#">
                        <div class="col">
                            VIỆC ĐANG TUYỂN
                        </div>       
                    </a>

                    <a class="text-decoration-none fw-bold " href="main?action=MyJobPostDone">
                        <div class="col">
                            VIỆC ĐÃ TUYỂN XONG
                        </div>
                    </a>
                    
                </div>
            </div>

            <section style="padding: 50px 0 ;min-height: 85vh">
                <div class="container">
                    <c:if test="${empty requestScope.MY_JOB_POST_DONE}">
                        <h1 class="text-center">${ERROR}</h1>
                    </c:if>
                    <c:if test="${!empty requestScope.MY_JOB_POST_PROCESS}">
                        <c:forEach items="${requestScope.MY_JOB_POST_PROCESS}" var="myJobPostProcess">
                            <div class="card w-100">
                                <div class="card-body">
                                    <h5 class="card-title mb-3">${myJobPostProcess.title}</h5>
                                    <p class="card-text"><i class="fa fa-clock" aria-hidden="true"></i> ${myJobPostProcess.date}</p>
                                    <div class="row mb-3">
                                        <p class="col-md-4 card-text">Lĩnh vực: ${myJobPostProcess.jobCategoryName} </p>
                                        <p class="col-md-4 card-text">Yêu cầu số người:  ${myJobPostProcess.amount} </p>
                                        <!--<p class="col-md-4 card-text">Thời gian: 1-3 tháng </p>-->
                                        <p class="col-md-4 card-text">
                                            Thời gian: 
                                            <c:choose> 
                                                <c:when test="${myJobPostProcess.timeJob==1}">
                                                    Ít hơn 1 tháng
                                                </c:when> 
                                                <c:when test="${myJobPostProcess.timeJob==2}">
                                                    1 - 3 tháng
                                                </c:when>
                                                <c:when test="${myJobPostProcess.timeJob==3}">
                                                    Hơn 3 tháng
                                                </c:when> 
                                            </c:choose>
                                        </p>
                                    </div>

                                    <div class="row justify-content-end">
                                        <a href="main?action=MyJobPostProcessDetail&jobId=${myJobPostProcess.jobId}" class="col-md-2 btn btn-primary gradient-custom-2">Xem chi tiết</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>

                    <!--                        <div class="card w-100">
                                                <div class="card-body">
                                                    <h5 class="card-title mb-3">Cần tuyển gấp freelancer thiết kế Website + Logo</h5>
                                                    <p class="card-text"><i class="fa fa-clock" aria-hidden="true"></i> 10:33 15/06/2022</p>
                                                    <div class="row mb-3">
                                                        <p class="col-md-4 card-text">Lĩnh vực: Công nghệ </p>
                                                        <p class="col-md-4 card-text">Yêu cầu số người: 8 </p>
                                                        <p class="col-md-4 card-text">Thời gian: 1-3 tháng </p>
                                                    </div>
                    
                                                    <div class="row justify-content-end">
                                                        <a href="#" class="col-md-2 btn btn-primary gradient-custom-2">Xem chi tiết</a>
                                                    </div>
                                                </div>
                                            </div>
                    
                                            <div class="card w-100">
                                                <div class="card-body">
                                                    <h5 class="card-title mb-3">CTV Thiết Kế Thời Trang</h5>
                                                    <p class="card-text"><i class="fa fa-clock" aria-hidden="true"></i> 10:33 15/06/2022</p>
                                                    <div class="row mb-3">
                                                        <p class="col-md-4 card-text">Lĩnh vực: Thiết kế mỹ thuật </p>
                                                        <p class="col-md-4 card-text">Yêu cầu số người: 8 </p>
                                                        <p class="col-md-4 card-text">Thời gian: 1-3 tháng </p>
                                                    </div>
                    
                                                    <div class="row justify-content-end">
                                                        <a href="#" class="col-md-2 btn btn-primary gradient-custom-2">Xem chi tiết</a>
                                                    </div>
                                                </div>
                                            </div>-->


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
