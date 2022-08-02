<%-- 
    Document   : ReportPostLostAndFound
    Created on : Jul 9, 2022, 9:32:27 PM
    Author     : TrinhNgocBao
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon" />
        <title>Admin</title>

        <!-- ========== All CSS files linkup ========= -->
        <link rel="stylesheet" href="/Admin/assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="/Admin/assets/css/lineicons.css" />
        <link rel="stylesheet" href="/Admin/assets/css/materialdesignicons.min.css" />
        <link rel="stylesheet" href="/Admin/assets/css/fullcalendar.css" />
        <link rel="stylesheet" href="/Admin/assets/css/fullcalendar.css" />
        <link rel="stylesheet" href="/Admin/assets/css/main.css" />
        <link rel="stylesheet" href="/Admin/assets/css/styles.css" />
        <style>
            .top-selling-table .product{
                min-width: 70px;
            }

            .top-selling-table .product .image {
                height: 100%;
                max-width: 150px;
            }

            .detail-image {
                display: flex;
                justify-content: center;
            }

            .detail-image img{
                cursor: pointer;
                display: block;
                max-height: 400px;
                -o-object-fit: cover;
                object-fit: cover;
                -o-object-position: center;
                object-position: center;
                /*                width: auto;*/
                border-radius: 0.5rem;
                object-fit: contain;
            }
            /*            .modal-content1 {
                            background-color: transparent;
                        }*/
        </style>
    </head>

    <body>
        <!-- ======== sidebar-nav start =========== -->
        <aside class="sidebar-nav-wrapper">
            <div class="navbar-logo">
                <a href="index.html">
                    <img src="https://upload.wikimedia.org/wikipedia/vi/1/1d/Logo_%C4%90%E1%BA%A1i_h%E1%BB%8Dc_FPT.png"
                         style="width: 150px;" alt="logo" />
                </a>
            </div>
            <nav class="sidebar-nav">
                <ul>
                    <li class="nav-item nav-item-has-children">
                        <a href="#0" class="collapsed" data-bs-toggle="collapse" data-bs-target="#ddmenu_1" aria-controls="ddmenu_1"
                           aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon">
                                <i class="lni lni-bar-chart" style="font-weight: 700;"></i>
                            </span>
                            <span class="text">Dashboard</span>
                        </a>
                        <ul id="ddmenu_1" class="collapse dropdown-nav">
                            <li>
                                <a href="adminLostAndFound" class=""> Lost And Found </a>
                            </li>
                            <li>
                                <a href="adminFreelance" class=""> Freelance Job </a>
                            </li>
                        </ul>
                    </li>
                    <span class="divider">
                        <hr />
                    </span>
                    <li class="nav-item nav-item-has-children">
                        <a href="#0" class="collapsed" data-bs-toggle="collapse" data-bs-target="#ddmenu_2" aria-controls="ddmenu_2"
                           aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon">
                                <i class="lni lni-text-align-justify" style="font-weight: 700;"></i>
                            </span>
                            <span class="text">Category</span>
                        </a>
                        <ul id="ddmenu_2" class="collapse dropdown-nav">
                            <li>
                                <a href="category" class=""> Category Lost & Found </a>
                            </li>
                            <li>
                                <a href="jobCategory" class=""> Category Freelance Job </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item nav-item-has-children">
                        <a href="#0" class="collapsed" data-bs-toggle="collapse" data-bs-target="#ddmenu_3" aria-controls="ddmenu_3"
                           aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon">
                                <i class="lni lni-add-files" style="font-weight: 700;"></i>
                            </span>
                            <span class="text">Approve Posts</span>
                        </a>
                        <ul id="ddmenu_3" class="collapse dropdown-nav">
                            <li>
                                <a href="listPostToApprove"> Lost & Found Posts </a>
                            </li>
                            <li>
                                <a href="approveJobPost"> Freelance Job Posts </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item nav-item-has-children">
                        <a href="#0" class="collapsed" data-bs-toggle="collapse" data-bs-target="#ddmenu_4" aria-controls="ddmenu_4"
                           aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon">
                                <i class="lni lni-empty-file" style="font-weight: 700;"></i>
                            </span>
                            <span class="text">Posts</span>
                        </a>
                        <ul id="ddmenu_4" class="collapse dropdown-nav">
                            <li>
                                <a href="adminLostAndFoundPost"> Lost & Found </a>
                            </li>
                            <li>
                                <a href=""> Freelance Job </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item nav-item-has-children">
                        <a href="#0" data-bs-toggle="collapse" data-bs-target="#ddmenu_5" aria-controls="ddmenu_5"
                           aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon">
                                <i class="lni lni-remove-file" style="font-weight: 700;"></i>
                            </span>
                            <span class="text">Report Posts</span>
                        </a>
                        <ul id="ddmenu_5" class="collapse show dropdown-nav">
                            <li>
                                <a href="reportManagement" class="active"> Lost & Found </a>
                            </li>
                            <li>
                                <a href=""> Freelance Job </a>
                            </li>
                        </ul>
                    </li>
                    <span class="divider">
                        <hr />
                    </span>
                    <li class="nav-item nav-item-has-children">
                        <a href="#0" class="collapsed" data-bs-toggle="collapse" data-bs-target="#ddmenu_6" aria-controls="ddmenu_6"
                           aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon">
                                <i class="lni lni-users" style="font-weight: 700;"></i>
                            </span>
                            <span class="text">Users</span>
                        </a>
                        <ul id="ddmenu_6" class="collapse dropdown-nav">
                            <li>
                                <a href=""> Manage </a>
                            </li>
                            <li>
                                <a href=""> Banned </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="">
                            <span class="icon">
                                <i class="lni lni-bubble" style="font-weight: 700;"></i>
                            </span>
                            <span class="text">Feedback System</span>
                        </a>
                    </li>
                    <span class="divider">
                        <hr />
                    </span>
                </ul>
            </nav>
            <!-- <div class="promo-box">
                <h3>PlainAdmin Pro</h3>
                <p>Get All Dashboards and 300+ UI Elements</p>
                <a
                  href="https://plainadmin.com/pro"
                  target="_blank"
                  rel="nofollow"
                  class="main-btn primary-btn btn-hover"
                >
                  Purchase Now
                </a>
              </div> -->
        </aside>
        <div class="overlay"></div>
        <!-- ======== sidebar-nav end =========== -->

        <!-- ======== main-wrapper start =========== -->
        <main class="main-wrapper">
            <!-- ========== header start ========== -->
            <header class="header">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-6">
                            <div class="header-left d-flex align-items-center">
                                <div class="menu-toggle-btn mr-20">
                                    <button id="menu-toggle" class="main-btn warning-btn btn-hover">
                                        <i class="lni lni-chevron-left me-2"></i> Menu
                                    </button>
                                </div>
                                <div class="header-search d-none d-md-flex">
                                    <form action="#">
                                        <input type="text" placeholder="Search..." />
                                        <button><i class="lni lni-search-alt"></i></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-7 col-6">
                            <div class="header-right">
                                <!-- notification start -->
                                <div class="notification-box ml-15 d-none d-md-flex">
                                    <button class="dropdown-toggle" type="button" id="notification" data-bs-toggle="dropdown"
                                            aria-expanded="false">
                                        <i class="lni lni-alarm"></i>
                                        <span>2</span>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="notification">
                                        <li>
                                            <a href="#0">
                                                <div class="image">
                                                    <img src="/Admin/assets/images/lead/lead-6.png" alt="" />
                                                </div>
                                                <div class="content">
                                                    <h6>
                                                        John Doe
                                                        <span class="text-regular">
                                                            comment on a product.
                                                        </span>
                                                    </h6>
                                                    <p>
                                                        Lorem ipsum dolor sit amet, consect etur adipiscing
                                                        elit Vivamus tortor.
                                                    </p>
                                                    <span>10 mins ago</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#0">
                                                <div class="image">
                                                    <img src="/Admin/assets/images/lead/lead-1.png" alt="" />
                                                </div>
                                                <div class="content">
                                                    <h6>
                                                        Jonathon
                                                        <span class="text-regular">
                                                            like on a product.
                                                        </span>
                                                    </h6>
                                                    <p>
                                                        Lorem ipsum dolor sit amet, consect etur adipiscing
                                                        elit Vivamus tortor.
                                                    </p>
                                                    <span>10 mins ago</span>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- notification end -->
                                <!-- message start -->
                                <div class="header-message-box ml-15 d-none d-md-flex">
                                    <button class="dropdown-toggle" type="button" id="message" data-bs-toggle="dropdown"
                                            aria-expanded="false">
                                        <i class="lni lni-envelope"></i>
                                        <span>3</span>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="message">
                                        <li>
                                            <a href="#0">
                                                <div class="image">
                                                    <img src="/Admin/assets/images/lead/lead-5.png" alt="" />
                                                </div>
                                                <div class="content">
                                                    <h6>Jacob Jones</h6>
                                                    <p>Hey!I can across your profile and ...</p>
                                                    <span>10 mins ago</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#0">
                                                <div class="image">
                                                    <img src="/Admin/assets/images/lead/lead-3.png" alt="" />
                                                </div>
                                                <div class="content">
                                                    <h6>John Doe</h6>
                                                    <p>Would you mind please checking out</p>
                                                    <span>12 mins ago</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#0">
                                                <div class="image">
                                                    <img src="/Admin/assets/images/lead/lead-2.png" alt="" />
                                                </div>
                                                <div class="content">
                                                    <h6>Anee Lee</h6>
                                                    <p>Hey! are you available for freelance?</p>
                                                    <span>1h ago</span>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- message end -->
                                <!-- filter start -->
                                <div class="filter-box ml-15 d-none d-md-flex">
                                    <button class="" type="button" id="filter">
                                        <i class="lni lni-funnel"></i>
                                    </button>
                                </div>
                                <!-- filter end -->
                                <!-- profile start -->
                                <div class="profile-box ml-15">
                                    <button class="dropdown-toggle bg-transparent border-0" type="button" id="profile"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                        <div class="profile-info">
                                            <div class="info">
                                                <h6>${sessionScope.LOGIN_USER.fullname}</h6>
                                                <div class="image">
                                                    <img src="${pageContext.servletContext.contextPath}/avatar?userId=${sessionScope.LOGIN_USER.userId}" style="width: 45px; height: 47px" alt="" />
                                                </div>
                                            </div>
                                        </div>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profile">
                                        <li>
                                            <a href="#0">
                                                <i class="lni lni-user"></i> View Profile
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#0">
                                                <i class="lni lni-alarm"></i> Notifications
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#0"> <i class="lni lni-inbox"></i> Messages </a>
                                        </li>
                                        <li>
                                            <a href="#0"> <i class="lni lni-cog"></i> Settings </a>
                                        </li>
                                        <li>
                                            <a href="/logout"> <i class="lni lni-exit"></i> Sign Out </a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- profile end -->
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- ========== header end ========== -->

            <!-- ========== section start ========== -->
            <section class="section">
                <div class="container-fluid">
                    <!-- ========== title-wrapper start ========== -->
                    <div class="title-wrapper pt-30">
                        <div class="row align-items-center">
                            <div class="col-md-6">
                                <div class="title mb-30">
                                    <h2>Report Posts: Lost And Found</h2>
                                </div>
                            </div>
                            <!-- end col -->
                            <div class="col-md-6">
                                <div class="breadcrumb-wrapper mb-30">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item">
                                                <a href="#0">Report Posts</a>
                                            </li>
                                            <li class="breadcrumb-item active" aria-current="page">
                                                Lost And Found
                                            </li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>
                            <!-- end col -->
                        </div>
                        <!-- end row -->
                    </div>
                    <!-- ========== title-wrapper end ========== -->
                    <!-- End Row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card-style mb-30">
                                <div class="
                                     title
                                     d-flex
                                     flex-wrap
                                     justify-content-between
                                     align-items-center
                                     ">
                                    <div class="left">
                                        <h6 class="text-medium mb-30">Report Posts</h6>
                                    </div>
                                    <div class="right">
                                        <div class="title d-flex align-items-center flex-wrap mb-30">
                                            <button type="button" class="main-btn warning-btn btn-hover btn-sm">
                                                <i class="lni lni-remove-file mr-5" style="font-size: 20px;"></i>Total Report: ${requestScope.COUNTREPORT}</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Title -->
                                <div class="table-responsive">
                                    <table class="table top-selling-table">
                                        <thead>
                                            <tr>                    
                                                <th>
                                                    <h6 class="text-sm text-medium">Image</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium">Title</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium">Category</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium">User</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium">Reason</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium">User Report</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium text-center">Type</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium text-center">Detail</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium text-center">Action</h6>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.LISTREPORT}" var="list">
                                                <tr>
                                                    <td>
                                                        <div class="product" style="padding-left: 0px;">
                                                            <div class="image">
                                                                <img src="${pageContext.servletContext.contextPath}/item?postId=${list.postId}" alt="" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p class="text-sm">${list.title}</p>
                                                    </td>
                                                    <td>
                                                        <p class="text-sm">${list.categoryName}</p>
                                                    </td>
                                                    <td>
                                                        <p class="text-sm">${list.postUser}</p>
                                                    </td>
                                                    <td>
                                                        <p class="text-sm fw-bold">${list.reportType}</p>
                                                    </td>
                                                    <td>
                                                        <p class="text-sm">${list.reportUser}</p>
                                                    </td>
                                                    <td>
                                                        <c:choose> 
                                                            <c:when test="${list.type=='0'}">

                                                                <div class="action justify-content-center">
                                                                    <span class="status-btn warning-btn fw-bold">Lost</span>
                                                                </div>

                                                            </c:when>    
                                                            <c:otherwise>

                                                                <div class="action justify-content-center">
                                                                    <span class="status-btn success-btn fw-bold">Found</span>
                                                                </div>

                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <div class="action justify-content-center">
                                                            <button  style="font-size:23px;"  class="text-gray" data-bs-toggle="modal" data-bs-target="#ModalDetailReport"
                                                                     onclick="truyenDataDetailReport(this.getAttribute('data-postId'), this.getAttribute('data-Title'), this.getAttribute('data-CateName'), this.getAttribute('data-PostUser')
                                                                                     , this.getAttribute('data-ReportDetail'), this.getAttribute('data-ReportUser'), this.getAttribute('data-ReportType'), this.getAttribute('data-Type'), this.getAttribute('data-Description'), this.getAttribute('data-DatePost'))"

                                                                     data-postId="${list.postId}"
                                                                     data-Title="${list.title}"
                                                                     data-CateName="${list.categoryName}"
                                                                     data-PostUser="${list.postUser}"
                                                                     data-ReportDetail="${list.reportDetail}"
                                                                     data-ReportUser="${list.reportUser}"
                                                                     data-ReportType="${list.reportType}"
                                                                     data-Type="${list.type}"
                                                                     data-Description="${list.postDescription}"
                                                                     data-DatePost="${list.datePost}">

                                                                <i class="lni lni-eye fw-bold">

                                                                </i>

                                                            </button>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="action justify-content-center">
                                                            <button class="text-gray" style="font-size:23px;" data-bs-toggle="modal" data-bs-target="#ModalDeleteReportedPost"
                                                                    onclick="truyenDataDelete(this.getAttribute('data-reportId'))"
                                                                    data-reportId="${list.reportId}">
                                                                <i class="lni lni-trash-can fw-bold"></i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                    <!-- End Table -->
                                </div>
                            </div>
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                </div>
                <!-- Modal -->
                <div class="modal " id="ModalDetailReport" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-xl">
                        <div class="modal-content" style="background-color: transparent">

                            <div class="row mb-3">
                                <div class="card overflow-hidden shadow ">
                                    <div class="card-header bg-white pl-10 pr-10 border-bottom d-md-flex">

                                        <h4 id="Title" class="" style="line-height: 2.5rem;" >
                                        </h4>
                                        <span id="Type1"></span>



                                    </div>
                                    <div class="row">                       
                                        <div class="pt-4 mb-4 col-md-6 ">
                                            <div class="detail-image mb-3">
                                                <a href=""><img src="" id="PostImg" width="100%" height="100%"  alt=""/></a>
                                            </div>

                                            <div class="d-flex align-items-center top-selling-table mb-3 pl-10">
                                                <p>Posted by</p>
                                                <div class="product" style="padding-left: 0px;">
                                                    <div class="image user-image pl-10" style="max-width: 48px;">
                                                        <img id="ImgPostUser" name="avatar" src=""
                                                             alt="" />
                                                    </div>
                                                    <p id="PostUser" name="" class="text-sm"></p>
                                                </div>
                                            </div>
                                            <div class="d-flex align-items-center pl-10">                                              
                                                <span id="DatePost" class="fw-medium" style="font-size: 14px;"> 
                                                </span>
                                            </div>
                                        </div>

                                        <div class="pt-4 mb-4 col-md-6">
                                            <div class="d-flex align-items-center mb-3">
                                                <h5>Type: 
                                                    <span id="Type" class="fw-medium" style="font-size: 1rem; font-weight: 400;">

                                                    </span>
                                                </h5>
                                            </div>
                                            <div class="d-flex align-items-center mb-3">
                                                <h5>Category: 
                                                    <span id="CateName" class="fw-medium" style="font-size: 1rem; font-weight: 400;">

                                                    </span>
                                                </h5>
                                            </div>

                                            <div class="align-items-center mb-2">
                                                <h5>Description:</h5>

                                                <span id="Description" class="fw-medium" style="font-size: 0.88889rem; line-height: 2.5;">

                                                </span>

                                            </div>
                                            <div class="d-flex align-items-center mb-3">
                                                <h5>Reason: 
                                                    <span id="ReportType" class="fw-medium text-primary" style="font-size: 1rem;">

                                                    </span>
                                                </h5>
                                            </div>
                                            <div class="align-items-center mb-3">
                                                <h5 class="mb-3">Detail: </h5>
                                                <div class="form-floating">
                                                    <textarea id="ReportDetail" class="form-control text-area" placeholder="..." style="height: 100px; padding-top: 0.625rem; background-color: #fff;" readonly=""></textarea>
                                                </div>
                                            </div>
                                            <p class="mb-2">Reported by</p>
                                            <div class="d-flex align-items-center top-selling-table mb-3">
                                                <div class="product" style="padding-left: 0px;">
                                                    <div class="image user-image" style="max-width: 48px;">
                                                        <img id="ImgReportUser" name="avatar" src=""
                                                             alt="" />
                                                    </div>
                                                    <p id="ReportUser" name="fullname" class="text-sm"></p>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Modal Delete-->
                <form action="main">
                    <div class="modal fade" id="ModalDeleteReportedPost" tabindex="-1" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-sm">
                            <div class="modal-content">
                                <div class="modal-header justify-content-center">
                                    <h4 class="modal-title" id="exampleModalLabel">Are you sure ?</h4>
                                </div>
                                <div class="modal-footer justify-content-center">
                                    <input id="ReportId" type="hidden" name="reportId" />
                                    <button type="button" class="main-btn warning-btn-outline btn-hover btn-sm" data-bs-dismiss="modal">No</button>
                                    <button type="submit" name="action" value="DeleteReportedPost" class="main-btn warning-btn btn-hover btn-sm">Yes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <!-- end container -->
            </section>
            <!-- ========== section end ========== -->

            <!-- ========== footer start =========== -->
            <footer class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6 order-last order-md-first">
                            <div class="copyright text-center text-md-start">
                                <p class="text-sm">
                                    FPT SmartSchool
                                    <a href="" rel="nofollow" target="_blank">
                                        Website
                                    </a>
                                </p>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="
                                 terms
                                 d-flex
                                 justify-content-center justify-content-md-end
                                 ">
                                <a href="" class="text-sm">SOS Team</a>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- ========== footer end =========== -->
        </main>
        <!-- ======== main-wrapper end =========== -->

        <!-- ========= All Javascript files linkup ======== -->
        <script src="/Admin/assets/js/bootstrap.bundle.min.js"></script>
        <script src="/Admin/assets/js/Chart.min.js"></script>
        <script src="/Admin/assets/js/dynamic-pie-chart.js"></script>
        <script src="/Admin/assets/js/moment.min.js"></script>
        <script src="/Admin/assets/js/fullcalendar.js"></script>
        <script src="/Admin/assets/js/jvectormap.min.js"></script>
        <script src="/Admin/assets/js/world-merc.js"></script>
        <script src="/Admin/assets/js/polyfill.js"></script>
        <script src="/Admin/assets/js/main.js"></script>

        <script>
                                                                        function truyenDataDetailReport(postId, title, cateName, postUser, reportDetail, reportUser, reportType, type, postDescription, datePost) {
                                                                            document.getElementById("PostImg").setAttribute("src", "/item?postId=" + postId);
                                                                            document.getElementById("ImgPostUser").setAttribute("src", "/avatar?userId=" + postUser);
                                                                            document.getElementById("ImgReportUser").setAttribute("src", "/avatar?userId=" + reportUser);
                                                                            document.getElementById("Title").innerHTML = title;
                                                                            document.getElementById("CateName").innerHTML = cateName;
                                                                            document.getElementById("PostUser").innerHTML = postUser;
                                                                            document.getElementById("ReportDetail").innerHTML = reportDetail;
                                                                            document.getElementById("ReportUser").innerHTML = reportUser;
                                                                            document.getElementById("ReportType").textContent = reportType;
                                                                            if (type == 0) {
                                                                                document.getElementById("Type").textContent = "Đồ thất lạc";
                                                                                document.getElementById("Type").setAttribute("style", "font-size: 1rem; font-weight: 400;");
                                                                                document.getElementById("Type").setAttribute("class", "fw-medium")
                                                                                document.getElementById("Type1").textContent = "LOST";
                                                                                document.getElementById("Type1").setAttribute("style", "border-radius: 0.25rem !important;line-height: 1.5rem;height: 30px;border-bottom: 54px;margin-left: 10px; margin-top:5px;");
                                                                                document.getElementById("Type1").setAttribute("class", "badge bg-warning")
                                                                            } else {
                                                                                document.getElementById("Type").textContent = "Đồ nhặt được";
                                                                                document.getElementById("Type").setAttribute("style", "font-size: 1rem; font-weight: 400;");
                                                                                document.getElementById("Type").setAttribute("class", "fw-medium")
                                                                                document.getElementById("Type1").textContent = "FOUND";
                                                                                document.getElementById("Type1").setAttribute("style", "border-radius: 0.25rem !important;line-height: 1.5rem;height: 30px;border-bottom: 54px;margin-left: 10px; margin-top:5px;");
                                                                                document.getElementById("Type1").setAttribute("background-color", "#0d6efd!important;");
                                                                                document.getElementById("Type1").setAttribute("class", "badge bg-success");
                                                                            }

                                                                            document.getElementById("Description").textContent = postDescription;
                                                                            document.getElementById("DatePost").textContent = "Bài viết được đăng " + datePost;
                                                                        }
                                                                        function truyenDataDelete(reportId) {
                                                                            document.getElementById("ReportId").value = reportId;
                                                                        }
        </script>
        <script>
            // ======== jvectormap activation
            var markers = [
                {name: "Egypt", coords: [26.8206, 30.8025]},
                {name: "Russia", coords: [61.524, 105.3188]},
                {name: "Canada", coords: [56.1304, -106.3468]},
                {name: "Greenland", coords: [71.7069, -42.6043]},
                {name: "Brazil", coords: [-14.235, -51.9253]},
            ];

            var jvm = new jsVectorMap({
                map: "world_merc",
                selector: "#map",
                zoomButtons: true,

                regionStyle: {
                    initial: {
                        fill: "#d1d5db",
                    },
                },

                labels: {
                    markers: {
                        render: (marker) => marker.name,
                    },
                },

                markersSelectable: true,
                selectedMarkers: markers.map((marker, index) => {
                    var name = marker.name;

                    if (name === "Russia" || name === "Brazil") {
                        return index;
                    }
                }),
                markers: markers,
                markerStyle: {
                    initial: {fill: "#4A6CF7"},
                    selected: {fill: "#ff5050"},
                },
                markerLabelStyle: {
                    initial: {
                        fontWeight: 400,
                        fontSize: 14,
                    },
                },
            });
            // ====== calendar activation
            document.addEventListener("DOMContentLoaded", function () {
                var calendarMiniEl = document.getElementById("calendar-mini");
                var calendarMini = new FullCalendar.Calendar(calendarMiniEl, {
                    initialView: "dayGridMonth",
                    headerToolbar: {
                        end: "today prev,next",
                    },
                });
                calendarMini.render();
            });

            // =========== chart one start
            const ctx1 = document.getElementById("Chart1").getContext("2d");
            const chart1 = new Chart(ctx1, {
                // The type of chart we want to create
                type: "line", // also try bar or other graph types

                // The data for our dataset
                data: {
                    labels: [
                        "Day 1",
                        "Day 2",
                        "Day 3",
                        "Day 4",
                        "Day 5",
                        "Day 6",
                        "Day 7",
                    ],
                    // Information about the dataset
                    datasets: [
                        {
                            label: "",
                            backgroundColor: "transparent",
                            borderColor: "#9b51e0",
                            data: [
                                0, 10, 35, 42, 61, 51, 11,
                            ],
                            pointBackgroundColor: "transparent",
                            pointHoverBackgroundColor: "#9b51e0",
                            pointBorderColor: "transparent",
                            pointHoverBorderColor: "#fff",
                            pointHoverBorderWidth: 5,
                            pointBorderWidth: 5,
                            pointRadius: 8,
                            pointHoverRadius: 8,
                        },
                    ],
                },

                // Configuration options
                defaultFontFamily: "Inter",
                options: {
                    tooltips: {
                        callbacks: {
                            labelColor: function (tooltipItem, chart) {
                                return {
                                    backgroundColor: "#ffffff",
                                };
                            },
                        },
                        intersect: false,
                        backgroundColor: "#f9f9f9",
                        titleFontFamily: "Inter",
                        titleFontColor: "#8F92A1",
                        titleFontColor: "#8F92A1",
                        titleFontSize: 12,
                        bodyFontFamily: "Inter",
                        bodyFontColor: "#171717",
                        bodyFontStyle: "bold",
                        bodyFontSize: 16,
                        multiKeyBackground: "transparent",
                        displayColors: false,
                        xPadding: 30,
                        yPadding: 10,
                        bodyAlign: "center",
                        titleAlign: "center",
                    },

                    title: {
                        display: false,
                    },
                    legend: {
                        display: false,
                    },

                    scales: {
                        yAxes: [
                            {
                                gridLines: {
                                    display: false,
                                    drawTicks: false,
                                    drawBorder: false,
                                },
                                ticks: {
                                    padding: 35,
                                    max: 100,
                                    min: 0,
                                },
                            },
                        ],
                        xAxes: [
                            {
                                gridLines: {
                                    drawBorder: false,
                                    color: "rgba(143, 146, 161, .1)",
                                    zeroLineColor: "rgba(143, 146, 161, .1)",
                                },
                                ticks: {
                                    padding: 20,
                                },
                            },
                        ],
                    },
                },
            });

            // =========== chart one end

            // ================== chart two start
            const ctx2 = document.getElementById("Chart2").getContext("2d");
            const chart2 = new Chart(ctx2, {
                // The type of chart we want to create
                type: "bar", // also try bar or other graph types
                // The data for our dataset
                data: {
                    labels: [
                        "Day 1",
                        "Day 2",
                        "Day 3",
                        "Day 4",
                        "Day 5",
                        "Day 6",
                        "Day 7", ],
                    // Information about the dataset
                    datasets: [
                        {
                            label: "",
                            backgroundColor: "#f2994a",
                            barThickness: "flex",
                            maxBarThickness: 8,
                            data: [60, 70, 34, 50, 65, 23, 11],
                        },
                        {
                            label: "",
                            backgroundColor: "#219653",
                            barThickness: "flex",
                            maxBarThickness: 8,
                            data: [69, 74, 72, 50, 45, 90, 31],
                        },
                    ],
                },
                // Configuration options
                options: {
                    borderColor: "#F3F6F8",
                    borderWidth: 15,
                    backgroundColor: "#F3F6F8",
                    tooltips: {
                        callbacks: {
                            labelColor: function (tooltipItem, chart) {
                                return {
                                    backgroundColor: "rgba(104, 110, 255, .0)",
                                };
                            },
                        },
                        backgroundColor: "#F3F6F8",
                        titleFontColor: "#8F92A1",
                        titleFontSize: 12,
                        bodyFontColor: "#171717",
                        bodyFontStyle: "bold",
                        bodyFontSize: 16,
                        multiKeyBackground: "transparent",
                        displayColors: false,
                        xPadding: 30,
                        yPadding: 10,
                        bodyAlign: "center",
                        titleAlign: "center",
                    },

                    title: {
                        display: false,
                    },
                    legend: {
                        display: false,
                    },

                    scales: {
                        yAxes: [
                            {
                                gridLines: {
                                    display: false,
                                    drawTicks: false,
                                    drawBorder: false,
                                },
                                ticks: {
                                    padding: 35,
                                    max: 100,
                                    min: 0,
                                },
                            },
                        ],
                        xAxes: [
                            {
                                gridLines: {
                                    display: false,
                                    drawBorder: false,
                                    color: "rgba(143, 146, 161, .1)",
                                    zeroLineColor: "rgba(143, 146, 161, .1)",
                                },
                                ticks: {
                                    padding: 20,
                                },
                            },
                        ],
                    },
                },
            });
            // =========== chart four end
        </script>
    </body>

</html>
