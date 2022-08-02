<%-- 
    Document   : profileDetailFreelance
    Created on : Aug 2, 2022, 1:10:51 PM
    Author     : SE150888 Pham Ngoc Long
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

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
            .left h5 {
                text-align: center;
            }

            .left ul li {
                list-style: none;
            }

            .right {
                padding: 15px;
                margin: 10px;
                border-radius: 10px;
            }

            .left {
                border-radius: 10px;
            }

            .left li {
                display: inline-block;
            }

            .left .btn {
                width: 300px;
                margin-bottom: 5px;
                max-height: 35px;
            }

            .right .btn {
                width: 150px;
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
            <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3 d-block gradient-custom-2"
                 style="background-color: #F26F21 ;">
                <div class="container"><a class="navbar-brand" href="WelcomePage.jsp"><img
                            src="https://hcmuni.fpt.edu.vn/landing-page/images/logo-top.png" height="46" alt="logo" /></a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
                            class="navbar-toggler-icon"> </span></button>
                    <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto pt-2 pt-lg-0 font-base align-items-lg-center align-items-start">
                            <c:if test="${sessionScope.LOGIN_USER.roleId == 'US'}">
                                <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="freelancerhome">TRANG CHỦ</a>
                                </li>
                                <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="#linhvuc">LĨNH VỰC</a>
                                </li>
                                <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="main?action=ListJobPost">TÌM VIỆC</a>
                                </li>
                                <c:if test="${!empty sessionScope.LOGIN_USER}">
                                    <li class="nav-item px-3 navbar-dropdown dropdown-user dropdown">
                                        <a class="btn btn-outline-light order-1 order-lg-0 fw-bold nav-link hide-arrow" id="nameLogin" href="" data-bs-toggle="dropdown">
                                            <div class="avatar avatar-online">


                                                QUẢN LÝ CÔNG VIỆC


                                            </div>
                                        </a>          
                                        <ul class="dropdown-menu dropdown-menu-end">              

                                            <li>
                                                <a class="dropdown-item" href="main?action=MyJobWaiting">
                                                    <i class="bx bx-user me-2"></i>
                                                    <span class="align-middle"> VIỆC CHỜ ỨNG TUYỂN</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="dropdown-item" href="main?action=MyJobDoing">
                                                    <i class="bx bx-user me-2"></i>
                                                    <span class="align-middle"> VIỆC ĐANG THỰC HIỆN</span>
                                                </a>
                                            </li>                                   
                                        </ul>
                                    </li>
                                </c:if>
                            </c:if>
                            <c:if test="${sessionScope.LOGIN_USER.roleId == 'EM'}">
                                <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="employerhome">TRANG CHỦ</a>
                                </li>
                                <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="main?action=EmployerDashboard&userId=${sessionScope.LOGIN_USER.userId}">DASHBOARD</a>
                                </li>
                                <li class="nav-item px-3 navbar-dropdown dropdown-user dropdown">
                                    <a class="btn btn-outline-light order-1 order-lg-0 fw-bold nav-link hide-arrow" id="nameLogin" href="" data-bs-toggle="dropdown">
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
                                            <a class="dropdown-item" href="main?action=EmployerUploadJobPost">
                                                <i class="bx bx-user me-2"></i>
                                                <span class="align-middle"> ĐĂNG TUYỂN</span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>


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
                            </c:if>    
                        </ul>
                    </div>
                </div>
            </nav>  
            <section class="container" style="padding-top: 1rem;" id="timkiem">
                <h1 style="margin-top: 100px; text-align: center;">Thông tin chung</h1>
                <div class="row justify-content-center">
                    <div class="left col-12 col-md-4">
                        <div class="card position-relative shadow" style="max-width: 370px;">
                            <div class="card-body p-3">
                                <div class="row justify-content-center mt-4">              
                                    <div class="avatar-upload">
                                        <form action="main?action=uploadImg" id="frmUploadAvatar" enctype="multipart/form-data" method="POST">
                                            <div class="avatar-edit">                       
                                                <!--<input type="file" id="imageUpload" onchange="submitForm()" name="userAvatar" accept=".png, .jpg, .jpeg"/>-->
                                                <!--<label for="imageUpload"></label>--> 

                                                <input type="file" id="imageUpload" name="userAvatar" onchange="submitForm()" accept=".png, .jpg, .jpeg">
                                                <label for="imageUpload"></label>
                                                <!--</br><button type="submit" name="action" value="uploadImg">upload ảnh</button>-->
                                            </div>
                                        </form>
                                        <div class="text-center avatar-preview">                 
                                            <!--<img src="${pageContext.servletContext.contextPath}/avatar?userId=${sessionScope.LOGIN_USER.userId}" width="216" height="216">-->                  
                                            <c:choose>
                                                <c:when test="${sessionScope.LOGIN_USER.avatar==null}">
                                                    <img src="https://unloc.online/wp-content/uploads/2020/04/283-2833820_user-icon-orange-png.png?fbclid=IwAR133UMM9dPj2fhzsRFAVrcTvgHaJBLsIbkkwQbqx1dv_3FTf8OQfqcIRcM" width="216" height="216"/>
                                                </c:when>    
                                                <c:otherwise>
                                                    <img src="${pageContext.servletContext.contextPath}/avatar?userId=${sessionScope.LOGIN_USER.userId}" width="216" height="216"/> 
                                                </c:otherwise>
                                            </c:choose>
                                            </br>
                                            </br><h4>${sessionScope.LOGIN_USER.fullname}</h4>
                                        </div>                 
                                    </div>              
                                </div>
                                <div class="row text-center mt-4">              
                                    <ul>
                                        <li><a href="#" type="button" class="btn btn-success active"><i class="fa-solid fa-user"></i> Thông tin chung</a></li>
                                        <li><a href="main?action=ChangePassword" type="button" class="btn btn-success"><i class="fa-solid fa-key"></i> Thay đổi mật khẩu</a></li>
                                        <li><a href="main?action=FeedbackSystem" type="button" class="btn btn-success"><i class="fa-solid fa-comment"></i> Feedback hệ thống</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="right col-12 col-md-6">
                        <h5 style="margin-bottom: 30px;">Cập nhật thông tin</h5>
                        <c:if test="${sessionScope.LOGIN_USER.roleId == 'US'}">
                            <form onsubmit="return validateProfile()" action="main" method="GET">
                                <div class="row">
                                    <div class="form-group col-12 col-md-6">
                                        <label for="name">Họ và tên</label>
                                        <input type="text" name="fullname" class="form-control" id="nameUser" placeholder="" value="${sessionScope.LOGIN_USER.fullname}">
                                        <small></small>
                                    </div>
                                    <div class="form-group col-12 col-md-6">
                                        <label for="phone">Số điện thoại</label>
                                        <input type="text" name="phone" class="form-control" id="phoneUser" placeholder="" value="${sessionScope.LOGIN_USER.phone}">
                                        <small></small>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-12 col-md-6">
                                        <label for="email">Email liên lạc</label>
                                        <input type="email" name="email" class="form-control" id="emailUser" placeholder="" value="${sessionScope.LOGIN_USER.email}">
                                        <small></small>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-12 col-md-6">
                                        <label for="facebook">Facebook</label>
                                        <input type="text" name="facebook" class="form-control" id="facebook" placeholder=""
                                               value="${sessionScope.LOGIN_USER.facebook}">
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="form-group col-8 col-md-6">
                                        <h6 style="color: green; display: inline-block; padding: 5px 0">${requestScope.SUCCESS}</h6>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-8 col-md-8">
                                        <button type="submit" name="action" value="UpdateProfile" class="btn btn-success"><i class="fa-solid fa-floppy-disk"></i> Lưu</button>
                                    </div>
                                </div>
                            </form>
                        </c:if>
                        <c:if test="${sessionScope.LOGIN_USER.roleId == 'EM'}">
                            <form onsubmit="return validateProfileEm()" action="main" method="GET">
                                <div class="row">
                                    <div class="form-group col-12 col-md-6">
                                        <label for="name">Họ và tên</label>
                                        <input type="text" name="fullname" class="form-control" id="nameUser" placeholder="" value="${sessionScope.LOGIN_USER.fullname}">
                                        <small></small>
                                    </div>
                                    <div class="form-group col-12 col-md-6">
                                        <label for="phone">Số điện thoại</label>
                                        <input type="text" name="phone" class="form-control" id="phoneUser" placeholder="" value="${sessionScope.LOGIN_USER.phone}">
                                        <small></small>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-12 col-md-6">
                                        <label for="name">Tên công ty</label>
                                        <input type="text" name="compName" class="form-control" id="compName" placeholder="" value="${sessionScope.LOGIN_USER.compName}">
                                        <small></small>
                                    </div>
                                    <div class="form-group col-12 col-md-6">
                                        <label for="phone">Địa chỉ công ty</label>
                                        <input type="text" name="compAddress" class="form-control" id="compAddress" placeholder="" value="${sessionScope.LOGIN_USER.compAddress}">
                                        <small></small>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-12 col-md-6">
                                        <label for="email">Email liên lạc</label>
                                        <input type="email" name="email" class="form-control" id="emailUser" placeholder="" value="${sessionScope.LOGIN_USER.email}">
                                        <small></small>
                                    </div>
                                    <div class="form-group col-12 col-md-6">
                                        <label for="facebook">Facebook</label>
                                        <input type="text" name="facebook" class="form-control" id="facebook" placeholder=""
                                               value="${sessionScope.LOGIN_USER.facebook}">
                                    </div>
                                </div>
                                
                                <br>
                                <div class="row">
                                    <div class="form-group col-8 col-md-6">
                                        <h6 style="color: green; display: inline-block; padding: 5px 0">${requestScope.SUCCESS}</h6>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-8 col-md-8">
                                        <button type="submit" name="action" value="UpdateProfile" class="btn btn-success"><i class="fa-solid fa-floppy-disk"></i> Lưu</button>
                                    </div>
                                </div>
                            </form>
                        </c:if>
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


                                function submitForm() {
                                    document.getElementById("frmUploadAvatar").submit();
                                }
        </script>
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&amp;family=Volkhov:wght@700&amp;display=swap"
            rel="stylesheet">
    </body>

</html>

