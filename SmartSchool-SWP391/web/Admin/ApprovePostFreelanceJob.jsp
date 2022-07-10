<%-- 
    Document   : ApprovePostFreelanceJob
    Created on : Jul 9, 2022, 2:05:17 AM
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
            .content-detail {
                border-bottom: 1px solid #EEEEEE !important;
            }
            .modal-body {
                padding: 2rem;
            }
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
                                <a href="index.html" class="active"> Lost And Found </a>
                            </li>
                            <li>
                                <a href="index.html" class=""> Freelance Job </a>
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
                                <a href="CategoryLostAndFound.html" class=""> Category Lost & Found </a>
                            </li>
                            <li>
                                <a href="" class=""> Category Freelance Job </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item nav-item-has-children">
                        <a href="#0" data-bs-toggle="collapse" data-bs-target="#ddmenu_3" aria-controls="ddmenu_3"
                           aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon">
                                <i class="lni lni-add-files" style="font-weight: 700;"></i>
                            </span>
                            <span class="text">Approve Posts</span>
                        </a>
                        <ul id="ddmenu_3" class="collapse show dropdown-nav">
                            <li>
                                <a href=""> Lost & Found Posts </a>
                            </li>
                            <li>
                                <a href="" class="active"> Freelance Job Posts </a>
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
                                <a href=""> Lost & Found </a>
                            </li>
                            <li>
                                <a href=""> Freelance Job </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item nav-item-has-children">
                        <a href="#0" class="collapsed" data-bs-toggle="collapse" data-bs-target="#ddmenu_5" aria-controls="ddmenu_5"
                           aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon">
                                <i class="lni lni-remove-file" style="font-weight: 700;"></i>
                            </span>
                            <span class="text">Report Posts</span>
                        </a>
                        <ul id="ddmenu_5" class="collapse dropdown-nav">
                            <li>
                                <a href=""> Lost & Found </a>
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
                                                    <img src="assets/images/lead/lead-6.png" alt="" />
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
                                                    <img src="assets/images/lead/lead-1.png" alt="" />
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
                                                    <img src="assets/images/lead/lead-5.png" alt="" />
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
                                                    <img src="assets/images/lead/lead-3.png" alt="" />
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
                                                    <img src="assets/images/lead/lead-2.png" alt="" />
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
                                                <h6>John Doe</h6>
                                                <div class="image">
                                                    <img src="assets/images/profile/profile-image.png" alt="" />
                                                    <span class="status"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <i class="lni lni-chevron-down"></i>
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
                                            <a href="#0"> <i class="lni lni-exit"></i> Sign Out </a>
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
                                    <h2>Approve Posts: Freelance Job</h2>
                                </div>
                            </div>
                            <!-- end col -->
                            <div class="col-md-6">
                                <div class="breadcrumb-wrapper mb-30">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item">
                                                <a href="#0">Posts</a>
                                            </li>
                                            <li class="breadcrumb-item">
                                                <a href="#0">Approve Posts</a>
                                            </li>
                                            <li class="breadcrumb-item active" aria-current="page">
                                                Freelance Job
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
                                        <h6 class="text-medium mb-30">Approve Posts</h6>
                                    </div>
                                    <div class="right">
                                        <div class="title d-flex align-items-center flex-wrap mb-30">
                                            <button type="button" class="main-btn warning-btn btn-hover btn-sm">
                                                <i class="lni lni-add-files mr-5" style="font-size: 20px;"></i>Total: 30 posts</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Title -->
                                <div class="table-responsive">
                                    <table class="table top-selling-table">
                                        <thead>
                                            <tr>
                                                <th>
                                                    <h6 class="text-sm text-medium">Employer</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium">Freelance Job</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium">Category</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium">Time</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium text-center">View Detail</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium text-center">Approve</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium text-center">Cancel</h6>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.LISTAPPROVE}" var="approve">
                                                <tr>
                                                    <td>
                                                        <div class="product">
                                                            <input id="jobIdDe" type="hidden" name="jobId" value="${approve.jobId}" />
                                                            <input id="descripDe" type="hidden" name="description" value="${approve.description}" />
                                                            <input id="salaryDe" type="hidden" name="salary" value="${approve.salary}" />
                                                            <input id="amountDe" type="hidden" name="amount" value="${approve.amount}" />
                                                            <input id="timeDe" type="hidden" name="timeJob" value="${approve.timeJob}" />
                                                            <div class="image user-image">
                                                                <img src="https://tophinhanh.com/wp-content/uploads/2021/12/anh-avatar-dep-cho-con-gai.jpg" alt="" />
                                                            </div>
                                                                <p id="name" class="text-sm">${approve.fullname}</p>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p id="titleDe" class="text-sm">${approve.title}</p>
                                                    </td>
                                                    <td>
                                                        <p id="cateName" class="text-sm">${approve.jobCategoryName}</p>
                                                    </td>
                                                    <td>
                                                        <p id="date" class="text-sm">${approve.date}</p>
                                                    </td>
                                                    <td>
                                                        <div class="action justify-content-center">
                                                            <button class="text-gray" style="font-size:23px;" data-bs-toggle="modal"
                                                                    data-bs-target="#ModalDetailPost" onclick="truyenDataDetail(this.getAttribute('data-jobIdDe'), 
                                                                                this.getAttribute('data-titleDe'), this.getAttribute('data-descripDe'), 
                                                                                this.getAttribute('data-cateName'),this.getAttribute('data-salaryDe'),
                                                                                this.getAttribute('data-amountDe'),this.getAttribute('data-timeDe'),
                                                                                this.getAttribute('data-avatar'),this.getAttribute('data-name'),this.getAttribute('data-date'))"
                                                                    data-jobIdDe="${approve.jobId}" 
                                                                    data-titleDe="${approve.title}" 
                                                                    data-descripDe="${approve.description}" 
                                                                    data-cateName="${approve.jobCategoryName}"
                                                                    data-salaryDe="${approve.salary}"
                                                                    data-amountDe="${approve.amount}" 
                                                                    data-timeDe="${approve.timeJob}" 
                                                                    data-avatar="${approve.avatar}" 
                                                                    data-name="${approve.fullname}" 
                                                                    data-date="${approve.date}">
                                                                
                                                                <i class="lni lni-eye fw-bold"></i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="action justify-content-center icon purple">
                                                            <button type="submit" name="action" value="ApproveJob" class="text-gray" style="font-size:25px;">
                                                                <i class="lni lni-checkmark fw-bold"></i>
                                                            </button>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="action justify-content-center icon purple">
                                                            <button type="submit" name="action" value="NoApproveJob" class="text-gray" style="font-size:20px;">
                                                                <i class="lni lni-close fw-bold"></i>
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
                <!--Modal Detail-->
                <div class="modal fade" id="ModalDetailPost" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" id="exampleModalLabel">Freelance Job Information</h4>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="jobId" id="IdDe"/>
                                <div class="content-detail mb-3">
                                    <div class="d-flex flex-column flex-lg-row justify-content-between mb-3">
                                        <h4 class="text-gray fw-medium text-truncate"><a class="text-decoration-none" id="titleD" name="title"></a></h4><span
                                            class="fs-1 fw-medium"></span>
                                    </div>
                                    <div class="d-flex align-items-center mb-3">
                                        
                                        <h6 id="CateD" name="jobCategoryName"></h6>
                                    </div>
                                </div>
                                <div class="content-detail mb-3">
                                    <div class="align-items-center mb-2">
                                        <h6 class="mb-2">Mô tả công việc:</h6>
                                        <span id="DesD" name="description" class="fw-medium" style="font-size: 0.88889rem; line-height: 2.5;"></span>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center mb-3">
                                    <h6>Mức lương: <span id="salaryDe1" name="salary" class="fw-medium" style="font-size: 14px;">
                                            </span></h6>
                                </div>
                                <div class="d-flex align-items-center mb-3">
                                    <h6>Số người cần tuyển: <span id="amountD" name="amount" class="fw-medium" style="font-size: 14px;">
                                            </span></h6>
                                </div>
                                <div class="d-flex align-items-center mb-3">
                                    <h6>Thời gian công việc: <span id="timeDe1" name="timeJob" class="fw-medium" style="font-size: 14px;"></span></h6>
                                </div>
                                <p class="mb-2">Posted by</p>
                                <div class="d-flex align-items-center top-selling-table mb-3">
                                    <div class="product">
                                        <div class="image user-image">
                                            <img id="img" name="avatar" src="https://tophinhanh.com/wp-content/uploads/2021/12/anh-avatar-dep-cho-con-gai.jpg"
                                                 alt="" />
                                        </div>
                                        <p id="nameDe" name="fullname" class="text-sm"></p>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center"> <span class="fw-medium" style="font-size: 14px;" id="dateDe" name="date" > <img
                                            src="/Admin/assets/images/clock.svg" style="margin-right: 5px;" width="15" alt="navigation" />
                                        </span>
                                </div>
                            </div>
                            <div class="modal-footer justify-content-center">
                                <button type="button" class="main-btn light-btn btn-hover btn-sm" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
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
                                                                function truyenDataDetail(jobIdDe, titleDe, descripDe, cateName, salary, amountDe, timeJob, avatar, name, date) {
                                                                    document.getElementById("IdDe").value = jobIdDe;
                                                                    document.getElementById("titleD").innerHTML = titleDe;
                                                                    document.getElementById("DesD").innerHTML = descripDe;
                                                                    document.getElementById("CateD").innerHTML = "Lĩnh vực: " + cateName;
                                                                    document.getElementById("salaryDe1").innerHTML = salary + " VNĐ/h";
                                                                    document.getElementById("amountD").innerHTML = amountDe + " người";
                                                                    document.getElementById("timeDe1").innerHTML = timeJob + " tháng";
                                                                    document.getElementById("img").innerHTML = avatar;
                                                                    document.getElementById("nameDe").innerHTML = name;
                                                                    document.getElementById("dateDe").innerHTML = date;
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
