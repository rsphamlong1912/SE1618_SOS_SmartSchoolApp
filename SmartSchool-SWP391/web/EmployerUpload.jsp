<%-- 
    Document   : EmployerUpload
    Created on : Jun 16, 2022, 3:16:54 PM
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
        <title>Upload | FPTU Freelance Job</title>


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
        <script src="//ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <style>
            .container {
                width: 100%;
                padding-right: 15px;
                padding-left: 15px;
                margin-right: auto;
                margin-left: auto;
            }

            .card-footer {
                background-color: #ffffff;
            }

            .btn-block {
                display: block;
                width: 100%;
            }

            .card-shadow {
                box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
                border-radius: 0.5rem;
            }
            .pl-10 {
                padding-left: 1.875rem!important;
            }
            .pr-10 {
                padding-right: 1.875rem!important;
            }
            .form-group small {
                color: #F21F26;
                padding-left: 10px;
                font-weight: 700 !important;
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
                <div class="container"><a class="navbar-brand" href="EmployerHome.jsp"><img
                            src="https://hcmuni.fpt.edu.vn/landing-page/images/logo-top.png" height="46" alt="logo" /></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                            class="navbar-toggler-icon"> </span></button>
                    <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto pt-2 pt-lg-0 font-base align-items-lg-center align-items-start">
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="EmployerHome.html">TRANG CHỦ</a>
                            </li>
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="#phanloai">DASHBOARD</a>
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
                                        <a class="dropdown-item" href="main?action=MyJobPostProcess">
                                            <i class="bx bx-user me-2"></i>
                                            <span class="align-middle"> VIỆC ĐANG TUYỂN</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="main?action=MyJobPostDone">
                                            <i class="bx bx-user me-2"></i>
                                            <span class="align-middle"> VIỆC ĐÃ TUYỂN</span>
                                        </a>
                                    </li>
                                    <li>
                                        <div class="dropdown-divider"></div>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="#">
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
                        </ul>
                    </div>
                </div>
            </nav>
            <section class="bg-gray-75 pt-10 pb-8">
                <div class="container" style="max-width: 771px;">
                    <div class="card card-shadow">
<!--                        <form action="main" class="needs-validation" novalidate>-->
                            <form onsubmit="return validateEmployerUpload()" action="main" method="POST" class="needs-validation" novalidate>
                            <div class="card-header bg-white pt-4 pb-4 pl-10 pr-10 border-bottom d-md-flex">
                                <h3 class="">ĐĂNG VIỆC FREELANCE</h3>                               
                            </div>
                            <div class="pl-10 pr-10 pt-3"><h4 class="text-success">${requestScope.SUCCESS}</h4></div>
                            <div class="card-body pl-10 pr-10">
                                <div class="form-group mb-4">
                                    <label for="title" class="form-control-label fw-bold mb-2">Nhập tên công việc</label>
                                    <input type="text" name="title" value="" id="titleJob" data-validate-hide-message="1"
                                           class="form-control required" required="true" data-rule-required="true" data-rule-maxlength="255">
<!--                                    <div class="invalid-feedback fw-bold">
                                        Vui lòng nhập!
                                    </div>-->
                                    <small></small>
                                </div>
                                <div class="form-group mb-4">
                                    <label for="category" class="form-control-label fw-bold mb-2">Chọn lĩnh vực</label>
                                    <select name="jobCategoryId" id="categoryJob" class="form-select form-select-lg mb-3 required" required="true" data-rule-required="true" aria-label=".form-select-lg example">
                                        <option selected disabled value="">Chọn...</option>
                                        <option value="1">Lập trình</option>
                                        <option value="2">Thiết Kế - Mỹ Thuật</option>
                                        <option value="3">Giáo dục - Đào Tạo</option>
                                    </select>
                                    <div class="invalid-feedback fw-bold">
                                        Vui lòng chọn!
                                    </div>
                                </div>
                                <div class="form-group mb-4">
                                    <label for="description" class="form-control-label fw-bold mb-2">Thông tin mô tả</label>
                                    <p class="" style="font-size: 0.875rem;">
                                        <strong class="d-block mb-2">Gợi ý nhập thông tin mô tả</strong>
                                        <span class="text-gray-600">• Bạn cần làm công việc gì?<br>
                                            • Mô tả cụ thể yêu cầu cho công việc mà bạn cần làm<br>
                                            • Các thông tin khác liên quan</span>
                                    </p>
                                    
                                    <div class="form-floating">
                                        <textarea class="form-control required" required="true" data-rule-required="true" name="description" placeholder=" " id="floatingTextarea2"
                                                  style="height: 150px"></textarea>
                                                  <small></small>
                                        <label for="floatingTextarea2">Nhập mô tả</label>
                                    </div>
<!--                                    <div class="invalid-feedback fw-bold">
                                        Vui lòng nhập!
                                    </div>-->
                                    
                                </div>
                                <div class="form-group mb-4 w-50">
                                    <label for="salary" class="form-control-label fw-bold mb-2">Mức lương theo giờ (VNĐ/giờ)</label>
                                    <input type="number" name="salary" value="" id="salary" data-validate-hide-message="1"
                                           class="form-control required" required="true" data-rule-required="true" data-rule-maxlength="255">
                                    <div class="invalid-feedback fw-bold">
                                        Vui lòng nhập!
                                    </div>
                                    <small></small>
                                </div>
                                <div class="form-group mb-4 w-50">
                                    <label for="amount" class="form-control-label fw-bold mb-2">Số người cần tuyển</label>
                                    <input type="number" name="amount" value="" id="amount" data-validate-hide-message="1"
                                           class="form-control required" required="true" data-rule-required="true" data-rule-maxlength="255">
                                    <div class="invalid-feedback fw-bold">
                                        Vui lòng nhập!
                                    </div>
                                    <small></small>
                                </div>
                                <div class="form-group mb-3">
                                    <label class="form-control-label fw-bold mb-3">Công việc của bạn dự kiến kéo dài bao lâu</label>
                                    <div class="row">
                                        <div class="col-lg-4 mb-3">
                                            <span class="w-100">
                                                <input type="radio" class="form-check-input required" required="true" data-rule-required="true" name="timeJob" value="1" id="timeJob_1" data-validate-hide-message="1">
                                                <label for="timeJobs_1">
                                                    <span class="inside pt-2 pb-2">
                                                        <span class="d-block fw-500"> Ít hơn 1 tháng</span>
                                                    </span>
                                                </label>
                                            </span>
                                        </div>
                                        <div class="col-lg-4 mb-3">
                                            <span class="w-100">
                                                <input type="radio" class="form-check-input required" required="true" data-rule-required="true" name="timeJob" value="2" id="timeJob_2" data-validate-hide-message="1">
                                                <label for="timeJobs_2">
                                                    <span class="inside pt-2 pb-2">
                                                        <span class="d-block fw-500"> 1 - 3 tháng</span>
                                                    </span>
                                                </label>
                                            </span>
                                        </div>
                                        <div class="col-lg-4 mb-3">
                                            <span class="w-100">
                                                <input type="radio" class="form-check-input required" required="true" data-rule-required="true" name="timeJob" value="3" id="timeJob_3" data-validate-hide-message="1">
                                                <label for="timeJobs_3">
                                                    <span class="pt-2 pb-2">
                                                        <span class="d-block fw-500"> Hơn 3 tháng</span>
                                                    </span>
                                                </label>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group mb-4">
                                    <label for="formQuestion" class="form-control-label fw-bold mb-3">Câu hỏi Form đăng ký công
                                        việc (ít nhất 1 câu hỏi)</label>
                                    <div class="row mb-3">
                                        <div class="input-group">
                                            <input type="text" name="question" class="form-control m-input question" required>
                                            <div class="input-group-prepend">
                                                <button class="btn btn-danger" id="DeleteRowDisable" type="button">
                                                    <i class="fa fa-trash"></i>
                                                </button>
                                            </div> 
                                            <br>
                                            <small></small>
                                            
                                        </div>
                                        
                                    </div>

                                    <div id="newinput"></div>

                                    <button id="rowAdder" type="button" class="btn btn-success">
                                        <span class="fa fa-plus-square">
                                        </span> Thêm câu hỏi
                                    </button>
                                </div>
                                <div class="card-footer pt-4 pb-2">
                                    <div class="row justify-content-md-end">
                                        <div class="col-lg-3 col-md-5 mb-3">
                                            <a href="/employerHome" class="btn btn-outline-primary btn-lg btn-block">Thoát</a>
                                        </div>
                                        <div class="col-lg-3 col-md-5 mb-3">
                                            <button type="submit" name="action" value="UploadJobPost"
                                                    class="btn btn-primary btn-lg btn-block gradient-custom-2">Đăng bài</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
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
        <script src="assets/js/extention/validation.js"></script>
        <script>
            const choices = new Choices('[data-trigger]',
                    {
                        searchEnabled: false
                    });
            (function () {
                'use strict'

                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.querySelectorAll('.needs-validation')

                // Loop over them and prevent submission
                Array.prototype.slice.call(forms)
                        .forEach(function (form) {
                            form.addEventListener('submit', function (event) {
                                if (!form.checkValidity()) {
                                    event.preventDefault()
                                    event.stopPropagation()
                                }

                                form.classList.add('was-validated')
                            }, false)
                        })
            })()
        </script>
        <script type="text/javascript">

            $("#rowAdder").click(function () {
                newRowAdd =
                        '<div class="row mb-3"> <div class="input-group">' +
                        '<input type="text" name="question" class="form-control m-inputque question" required>' +
                        '<div class="input-group-prepend">' +
                        '<button class="btn btn-danger" id="DeleteRow" type="button"> <i class="fa fa-trash"></i></button> </div>' +
                        '</div> </div> </div>';
                $('#newinput').append(newRowAdd);
            });

            $("body").on("click", "#DeleteRow", function () {
                $(this).parents(".row").remove();
            })
        </script>
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&amp;family=Volkhov:wght@700&amp;display=swap"
            rel="stylesheet">
    </body>

</html>
