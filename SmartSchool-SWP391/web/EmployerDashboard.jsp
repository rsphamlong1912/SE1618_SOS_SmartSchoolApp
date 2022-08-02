<%-- 
    Document   : EmployerDashboard
    Created on : Aug 1, 2022, 8:45:27 AM
    Author     : SE150888 Pham Ngoc Long
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <title>FPTU Freelance Job </title>


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

        <link rel="stylesheet" href="./assets/css/font-awesome.min.css" type="text/css">
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
            .banner-section {
                align-items: center;
                background-color: #f6f7ff;
                display: flex;
                height: 500px;
                width: 100%;
            }
            .banner-section .banner-wrap {
                align-items: center;
                box-sizing: border-box;
                display: flex;
                justify-content: space-between;
                margin: 0 auto;
                max-width: 1104px;
                padding-left: 40px;
                padding-right: 40px;
                width: 100%;
            }
            .banner-section .banner-content {
                max-width: 25.75rem;
                min-width: 50%;
                z-index: 1;
            }
            .banner-section .banner-content h2 {
                line-height: 2.5rem;
            }
            .banner-section .banner-content p {
                margin-top: 1.25rem;
            }
            .banner-section .banner-content a {
                margin-top: 2.5rem;
            }
            .analytics-section {
                background-color: #fff;
                border: 1px solid #e6e6e6;
                border-radius: 15px;
                box-sizing: border-box;
                display: flex;
                flex-wrap: wrap;
                margin: -3.4375rem auto 0;
                max-width: 1024px;
                padding: 2rem 2.5rem;
            }

            .analytics-section .analytics-card {
                border-right: 1px solid #ebebeb;
                flex: 1 1;
                margin-right: 2.5rem;
            }

            .analytics-section .analytics-card:last-child {
                border-right: none;
                margin-right: 0;
            }
            .bold-subtitle {
                color: #1e223c;
                font-family: proxima-nova,Arial,sans-serif;
                font-size: 1.5rem;
                font-weight: 700;
            }
            .normal-small-text {
                font-size: 1.2rem;
                line-height: 1.5rem;
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
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon">
                        </span></button>
                    <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto pt-2 pt-lg-0 font-base align-items-lg-center align-items-start">
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="EmployerHome.jsp">TRANG CHỦ</a>
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
                                        <a class="dropdown-item" href="main?action=MyJobPostProcess">
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
                                <li class="nav-item px-3"><a class="btn btn-outline-light order-1 order-lg-0 fw-bold"
                                                             href="login.jsp">ĐĂNG NHẬP /
                                        ĐĂNG KÝ</a></li>
                                    </c:if>
                                    <c:if test="${!empty sessionScope.LOGIN_USER}">
                                <!-- User -->
                                <li class="nav-item px-3 navbar-dropdown dropdown-user dropdown">
                                    <a class="btn btn-outline-light order-1 order-lg-0 fw-bold nav-link hide-arrow"
                                       id="nameLogin" href="" data-bs-toggle="dropdown">
                                        <div class="avatar avatar-online">
                                            <c:choose>
                                                <c:when test="${sessionScope.LOGIN_USER.avatar==null}">
                                                    <img src="https://unloc.online/wp-content/uploads/2020/04/283-2833820_user-icon-orange-png.png?fbclid=IwAR133UMM9dPj2fhzsRFAVrcTvgHaJBLsIbkkwQbqx1dv_3FTf8OQfqcIRcM"
                                                         alt class="w-px-40 rounded-circle"
                                                         style="width: 2rem; height: 2rem" />
                                                    ${sessionScope.LOGIN_USER.fullname}
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${pageContext.servletContext.contextPath}/avatar?userId=${sessionScope.LOGIN_USER.userId}"
                                                         alt class="w-px-40 rounded-circle"
                                                         style="width: 2rem; height: 2rem" />
                                                    ${sessionScope.LOGIN_USER.fullname}
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end">
                                        <li>
                                            <a class="dropdown-item" href="#">
                                                <div class="d-flex">

                                                    <div class="flex-grow-1">
                                                        <span
                                                            class="fw-semibold d-block">${sessionScope.LOGIN_USER.fullname}</span>
                                                        <small
                                                            class="text-muted">${sessionScope.LOGIN_USER.roleName}</small>
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
                                                <span class="align-middle"><i class="fa fa-user" aria-hidden="true"></i>
                                                    Thông tin cá nhân</span>
                                            </a>
                                        </li>

                                        <li>
                                            <a class="dropdown-item" href="main?action=MyPost">
                                                <span class="d-flex align-items-center align-middle">
                                                    <i class="bx bx-user me-2"></i>
                                                    <span class="flex-grow-1 align-middle"><i class="fa fa-list-alt"
                                                                                              aria-hidden="true"></i> Bài viết của tôi</span>
                                                    <span
                                                        class="flex-shrink-0 badge badge-center rounded-pill bg-danger w-px-20 h-px-20">4</span>
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="main?action=ChangePassword">
                                                <i class="bx bx-user me-2"></i>
                                                <span class="align-middle"><i class="fa fa-key" aria-hidden="true"></i> Đổi
                                                    mật khẩu</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="main?action=FeedbackSystem">
                                                <i class="bx bx-user me-2"></i>
                                                <span class="align-middle"><i class="fa fa-bug" aria-hidden="true"></i> Phản
                                                    hồi hệ thống</span>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="dropdown-divider"></div>
                                        </li>
                                        <li>
                                            <a class="dropdown-item" href="main?action=Logout">
                                                <i class="bx bx-user me-2"></i>
                                                <span class="align-middle"><i class="fa fa-sign-out-alt"
                                                                              aria-hidden="true"></i> Đăng xuất</span>
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

            <!-- Breadcrumb Begin -->
            <div class="breadcrumb-option">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">

                            <a class="text-decoration-none" href="employerhome"><i class="fa fa-chevron-left"></i> Trở về</a>

                        </div>
                    </div>
                </div>
            </div>
            <!-- Breadcrumb End -->
            <div class="banner-section">
                <div class="banner-wrap">
                    <div class="banner-content">
                        <h2 class="bold-title">Chào mừng, ${sessionScope.LOGIN_USER.fullname}!</h2>
                        <p class="normal-small-text">Cập nhật nhanh chóng số liệu thống kê các bài đăng việc làm của nhà tuyển dụng.</p>
                    </div>
                    <img src="assets/img/banner.png" alt="banner">
                </div>
            </div>
            <section class="analytics-section">
                <div class="analytics-card">
                    <div class="icon profile-visits"sss>
                        <img src="assets/img/icons/total-job.png" alt="icon">
                    </div>
                    <div class="count bold-subtitle">${TOTAL_POST}</div>
                    <div class="description normal-small-text">Tổng số việc làm</div>

                </div>
                <div class="analytics-card">
                    <div class="icon registered-companies">
                        <img src="assets/img/icons/waiting.png" alt="icon">
                    </div>
                    <div class="count bold-subtitle">${TOTAL_WAITING_POST}</div>
                    <div class="description normal-small-text">Đang chờ phê duyệt</div>
                </div>

                <div class="analytics-card">
                    <div class="icon reviews">
                        <img src="assets/img/icons/process.png" alt="icon">
                    </div>
                    <div class="count bold-subtitle">${TOTAL_NEW_POST}</div>
                    <div class="description normal-small-text">Đang tuyển</div>

                </div>

                <div class="analytics-card">
                    <div class="icon new-companies">
                        <img src="assets/img/icons/job-done.png" alt="icon">
                    </div>
                    <div class="count bold-subtitle">${TOTAL_DONE_POST}</div>
                    <div class="description normal-small-text">Việc hoàn thành</div>
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
        <!--- AJAX -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            var newAmount;
            var oldAmount = ${requestScope.JOBDETAIL.amount};
            function validateAmount() {
                if (document.getElementById("newAmount").value.length === 0) {
                    document.getElementById("warningValidate").textContent = "Vui lòng nhập!"
                    return false;
                } else if (document.getElementById("newAmount").value < oldAmount) {
                    document.getElementById("warningValidate").textContent = "Không thể cập nhật số ứng viên ít hơn ban đầu!"
                    return false;
                    sss
                }
                return true;
            }
            function ApproveUser(applyJobId, userId, jobId, buttonValue, fullname, title, jobCategoryName) {

                $.ajax({
                    url: "/approveUserWaiting",
                    type: "get",
                    data: {
                        applyJobId: applyJobId,
                        userId: userId,
                        jobId: jobId,
                        buttonValue: buttonValue

                    },
                    success: function (data) {

                        if ('UserFullJob' === data) {
                            $("#ModalFullJob").modal("show");
                        } else if ('JobFullAmount' === data) {
                            $("#ModalJobFullAmount").modal("show");
                        } else {
                            var row = document.getElementById(userId);
                            row.remove();
                            var amountF = document.getElementById("amountFreelancer");

                            amountF.textContent = data;
                        }

                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                });
            }
        </script>
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

