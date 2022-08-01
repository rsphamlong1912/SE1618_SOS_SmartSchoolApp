<%-- 
    Document   : FreelanceDetail.jsp
    Created on : Jun 30, 2022, 3:25:24 PM
    Author     : TrinhNgocBao
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
            .list-group-flush>.list-group-item {
                width: 75%;
            }

            .card {
                border-radius: 0.5rem;
            }

            .card-body {
                padding: 1.5rem;
            }

            .content-detail {
                border-bottom: 1px solid #EEEEEE !important;
            }

            .breadcrumb-option {
                padding-bottom: 0px;
            }

            .card-footer {
                background-color: #ffffff;
            }

            .btn-block {
                display: block;
                width: 100%;
            }

            .contact {
                padding: 3px;                
            }
            .contact a {
                border-radius: 0.3rem;                
            }
            #hoverCard:hover {
                transform: scale(1.005);
                box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px !important;

            }

            .detail-image {
                display: flex;
                justify-content: center;
            }

            .detail-image img{
                cursor: pointer;
                display: block;
                max-height: 492px;
                -o-object-fit: cover;
                object-fit: cover;
                -o-object-position: center;
                object-position: center;
                width: auto;
                border-radius: 0.5rem;
                object-fit: contain;
            }

            .relative-image img {
                cursor: pointer;
                display: block;
                max-height: 200px;
                -o-object-fit: cover;
                object-fit: cover;
                -o-object-position: center;
                object-position: center;
                width: 100%;
            }

            .modal-content {
                border-radius: 0.5rem;
                border: 0;
            }


            .modal-header {
                border-top-right-radius:0.5rem;
                border-top-left-radius:0.5rem;             
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
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="lostAndfoundhome">TRANG CHỦ</a>
                            </li>
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="lostAndfoundhome#phanloai">PHÂN LOẠI</a>
                            </li>
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="lostAndfoundhome#moinhatduoc">MỚI NHẶT ĐƯỢC</a></li>
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="lostAndfoundhome#moithatlac">MỚI THẤT LẠC</a></li>
                            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="#">TÌM KIẾM</a></li>
                                <c:if test="${empty sessionScope.LOGIN_USER}">
                                <li class="nav-item px-3"><a class="btn btn-outline-light order-1 order-lg-0 fw-bold" href="login.jsp">ĐĂNG NHẬP /
                                        ĐĂNG KÝ</a></li>
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
                                <li class="nav-item px-3"><a class="btn btn-light order-1 order-lg-0 fw-bold" href="main?action=UploadLostAndFoundPost">ĐĂNG BÀI</a></li>
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
                            <div class="breadcrumb__links">
                                <a href="lostAndfoundhome"><i class="fa fa-home"></i> Home</a>
                                <a href="main?action=ListAll">Danh sách</a>
                                <a href="main?searchText=&type=0&action=SearchPostInHome">
                                    <c:choose> 
                                        <c:when test="${requestScope.POST.type=='0'}">
                                            Đồ thất lạc
                                        </c:when>  
                                        <c:otherwise>
                                            Đồ nhặt được
                                        </c:otherwise>
                                    </c:choose>
                                </a>
                                <span>${requestScope.POST.title}</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <section class="shop" style="min-height: 82vh;">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9 col-md-9 mb-5">
                            <div class="row mb-3">
                                <div class="card overflow-hidden shadow ">
                                    <div class="card-header bg-white pt-4 pl-10 pr-10 border-bottom d-md-flex">

                                        <h4 class="" style="line-height: 2.5rem;" >${requestScope.POST.title}
                                                                    

                                            <!--<span class="badge bg-secondary" style="border-radius: 0.25rem !important;">-->
                                            <c:choose> 
                                                <c:when test="${requestScope.POST.type=='0'}">
                                                    <span class="badge bg-secondary" style="border-radius: 0.25rem !important;">LOST</span>
                                                </c:when>  
                                                <c:otherwise>
                                                    <span class="badge" style="border-radius: 0.25rem !important; background-color: #0d6efd!important;">FOUND</span>
                                                </c:otherwise>
                                            </c:choose>
                                            <!--                                            </span> or
                                                                                        <span class="badge" style="border-radius: 0.25rem !important; background-color: #0d6efd!important;">FOUND</span> (if ra)-->
                                        </h4>

                                    </div>
                                    <div class="card-body">
                                        <div class="row justify-content-md-end">
                                            <div class="col-lg-3 col-md-3 mb">
                                                <div class="d-flex justify-content-md-end">
                                                    <img src="assets/img/dest/warning.svg" style="margin-right: 5px;" width="17" alt="navigation" />
                                                    <span class="fw-bold" style="font-size: 14px;">
                                                        <a href="" class="text-decoration-none" style="color: #5E6282;" data-bs-toggle="modal" data-bs-target="#reportModal"> Báo cáo vi phạm</a>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="pt-3 mb-4 ">
                                            <div class="detail-image">
                                                <a href="" data-bs-toggle="modal" data-bs-target="#imageModal"><img src="${pageContext.servletContext.contextPath}/item?postId=${requestScope.POST.postId}" width="100%" height="100%"  alt=""/></a>
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <div class="d-flex align-items-center mb-3">
                                                <h6>Danh mục: 
                                                    <span class="fw-medium" style="font-size: 0.88889rem;">
                                                        ${requestScope.POST.categoryName}    
                                                    </span>
                                                </h6>
                                            </div>
                                            <div class="align-items-center mb-2">
                                                <h6>Mô tả:</h6>

                                                <span class="fw-medium" style="font-size: 0.88889rem; line-height: 2.5;">
                                                    ${requestScope.POST.description}
                                                </span>

                                            </div>
                                        </div>



                                    </div>
                                    <div class="card-footer pt-3 pb-2">
                                        <div class="row justify-content-md-end">
                                            <div class="col-lg-3 col-md-3 mb-3 ">
                                                <div class="d-flex align-items-center justify-content-center">
                                                    <img src="assets/img/dest/clock.svg" style="margin-right: 5px;" width="17" alt="navigation" />
                                                    <span class="fw-medium" style="font-size: 14px;"> 
                                                        Đã đăng ${requestScope.POST.date}
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="card overflow-hidden shadow ">
                                    <div class="card-header bg-white pt-4 pl-10 pr-10 border-bottom d-md-flex">
                                        <h5 class="">TIN LIÊN QUAN</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <c:forEach items="${requestScope.LIST3CATE}" var="listPost"> 
                                                <div class="col-lg-12 col-md-12 mb-5">

                                                    <div class="card overflow-hidden shadow shadow-hover" id="hoverCard" style="max-height: 200px;">
                                                        <div class="row g-0">
                                                            <div class="col-md-4 relative-image">
                                                                <img src="${pageContext.servletContext.contextPath}/item?postId=${listPost.postId}" alt=""/>
                                                            </div>

                                                            <div class="col-md-8">
                                                                <div class="card-body">
                                                                    <div class="d-flex flex-column flex-lg-row justify-content-between mb-2">
                                                                        <h5 class="text-secondary fw-medium text-truncate"><a
                                                                                class="link-901 text-decoration-none stretched-link" href="/main?postId=${listPost.postId}&userId=${listPost.userId}&action=Detail">${listPost.title}</a></h5><span class="fs-1 fw-medium"></span>
                                                                    </div>
                                                                    <div class="d-flex align-items-center mb-2"> <span
                                                                            class="fw-bold" style="font-size: 15px;">
                                                                            <c:choose> 
                                                                                <c:when test="${listPost.type=='0'}">
                                                                                    Đồ thất lạc
                                                                                </c:when>  
                                                                                <c:otherwise>
                                                                                    Đồ nhặt được
                                                                                </c:otherwise>
                                                                            </c:choose>
                                                                        </span>
                                                                    </div>
                                                                    <div class="d-flex align-items-center mb-5"> 
                                                                        <span class="fw-bold" style="font-size: 14px;">Danh mục: 
                                                                            <span class="fw-medium" style="font-size: 14px;">${listPost.categoryName}</span>                                                                        
                                                                        </span>
                                                                    </div>
                                                                    <div class="d-flex align-items-center"> 
                                                                        <img src="assets/img/dest/clock.svg" style="margin-right: 5px;" width="15" alt="navigation" />
                                                                        <span class="fw-medium" style="font-size: 14px;">${listPost.date}
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                            <!--                                            <div class="col-lg-12 col-md-12 mb-5">
                                                                                            <div class="card overflow-hidden shadow shadow-hover" id="hoverCard" style="max-height: 200px;">
                                                                                                <div class="row g-0">
                                                                                                    <div class="col-md-4 relative-image">
                                                                                                        <img src="https://anhdephd.vn/wp-content/uploads/2022/03/anh-dai-dien-nu-deo-kinh-chat-600x600.jpg" class="img-fluid" alt=""/>
                                                                                                    </div>
                                            
                                                                                                    <div class="col-md-8">
                                                                                                        <div class="card-body">
                                                                                                            <div class="d-flex flex-column flex-lg-row justify-content-between mb-2">
                                                                                                                <h5 class="text-secondary fw-medium text-truncate"><a
                                                                                                                        class="link-901 text-decoration-none stretched-link" href="#">Mất cái ZFOLD3 ròi</a></h5><span class="fs-1 fw-medium"></span>
                                                                                                            </div>
                                                                                                            <div class="d-flex align-items-center mb-2"> <span
                                                                                                                    class="fw-bold" style="font-size: 15px;">Đồ thất lạc</span>
                                                                                                            </div>
                                                                                                            <div class="d-flex align-items-center mb-5"> 
                                                                                                                <span class="fw-bold" style="font-size: 14px;">Loại: 
                                                                                                                    <span class="fw-medium" style="font-size: 14px;">Điện thoại</span>                                                                        
                                                                                                                </span>
                                                                                                            </div>
                                                                                                            <div class="d-flex align-items-center"> 
                                                                                                                <img src="assets/img/dest/clock.svg" style="margin-right: 5px;" width="15" alt="navigation" />
                                                                                                                <span class="fw-medium" style="font-size: 14px;">1 giờ trước
                                                                                                                </span>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>-->
                                        </div>
                                    </div>                           
                                </div>                                                       
                            </div>
                        </div>
                        <!-- Modal  Report-->
                        <div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-lg">
                                <div class="modal-content">
                                    <form action="main" method="POST" >
                                        <div class="modal-header gradient-custom-2" >
                                            <h5 class="modal-title" id="exampleModalLabel" style="color: #ffffff;">Báo cáo</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body" style="padding: 1.5rem;">                           
                                            <div class="row">
                                                <c:forEach items="${requestScope.LISTREPORT}" var="listReport">
                                                        <div class="col-md-6 mb-2">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="radio" name="reportTypeId" id="" value="${listReport.reportTypeId}" required>
                                                                <label class="form-check-label" for="">
                                                                    ${listReport.reportType}
                                                                </label>
                                                            </div>
                                                        </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <input type="hidden" name="userId" value="${requestScope.POST.userId}"/>
                                        <input type="hidden" name="postId" value="${requestScope.POST.postId}"/>
                                        <div class="modal-footer justify-content-center">
                                            <button type="submit" name="action" value="SendReportPost" class="btn btn-primary gradient-custom-2">Gửi báo cáo</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Modal  Image-->
                        <div class="modal" id="imageModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered modal-xl">
                                <div class="modal-content">
                                    <div class="modal-body" style="padding: 1.5rem;">  
                                        <img src="${pageContext.servletContext.contextPath}/item?postId=${requestScope.POST.postId}" width="100%" height="100%"  alt=""/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-3">
                            <div class="card overflow-hidden shadow ">
                                <div
                                    class="card-header bg-white pt-4 pl-10 pr-10 border-bottom d-md-flex justify-content-center">
                                    <h5 class="">NGƯỜI ĐĂNG</h5>
                                </div>
                                <div class="card-body">
                                    <div class="row justify-content-center">
                                        <div class="content-detail mb-3">
                                            <div class="avatar-upload ">
                                                <div class="text-center avatar-preview">
                                                    <c:if test="${!empty USERINFOR.avatar}">
                                                        <img src="${pageContext.servletContext.contextPath}/avatar?userId=${JOBDETAIL.userId}"
                                                             width="164" height="164" />
                                                    </c:if>
                                                    <c:if test="${empty USERINFOR.avatar}">
                                                        <img src="${pageContext.servletContext.contextPath}/avatar?userId=${requestScope.POST.userId}"
                                                             width="164" height="164" />
                                                    </c:if>

                                                    </br>
                                                    </br>
                                                    <h5 class="mb-3">${USERINFOR.fullname} ${requestScope.USER_POST.fullname}</h5>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="content-detail mb-3">
                                            <div class="d-flex align-items-center justify-content-center">
                                                <h6 style="line-height: 2.5;">Thông tin liên hệ</h6>
                                            </div>


                                            <div class="d-flex align-items-center">
                                                <h6 style="line-height: 2.5;">Số điện thoại: <span class="fw-medium"
                                                                                                   style="font-size: 14px; "> ${requestScope.USER_POST.phone}</span></h6>
                                            </div>

                                            <div class="d-flex align-items-center">
                                                <h6 style="line-height: 2.5;">Email: <span class="fw-medium text-break"
                                                                                           style="font-size: 14px;"> ${requestScope.USER_POST.email}</span></h6>
                                            </div>

                                            <div class="d-flex align-items-center">
                                                <h6 style="line-height: 2.5;">Facebook: <span class="fw-medium text-break"
                                                                                              style="font-size: 14px;">  ${requestScope.USER_POST.facebook}</span></h6>
                                            </div>


                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-3 contact">
                                            <a href="tel:${USERINFOR.phone}" class="btn btn-success btn-sm w-100" style="background: linear-gradient(to right, #99df20, #009245 ); border:none;"> Gọi <i class="fa fa-phone"
                                                                                                                                                                                                        aria-hidden="true"></i></a>
                                        </div>
                                        <div class="col-md-6 contact">
                                            <a href="${USERINFOR.facebook}" class="btn btn-success btn-sm w-100" style="background: linear-gradient(to right, #12c2e9, #c471ed, #f64f59); border:none;" > Messenger <i class="fa fa-comment"
                                                                                                                                                                                                        aria-hidden="true"></i></a>
                                        </div>
                                        <div class="col-md-3 contact">
                                            <a href="mailto:${USERINFOR.email}" class="btn btn-success btn-sm w-100" style="background: linear-gradient(to right, #43cea2, #1174d7); border:none;"> Mail <i class="fa fa-envelope"
                                                                                                                                                                                                        aria-hidden="true"></i></a>
                                        </div>

                                    </div>
                                </div>
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
