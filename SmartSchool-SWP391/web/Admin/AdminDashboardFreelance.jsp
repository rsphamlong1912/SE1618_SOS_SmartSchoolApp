<%-- 
    Document   : AdminDashboardFreelance.jsp
    Created on : Jul 7, 2022, 6:17:43 PM
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
        <title>Admin Freelance Job</title>

        <!-- ========== All CSS files linkup ========= -->
        <link rel="stylesheet" href="/Admin/assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="/Admin/assets/css/lineicons.css" />
        <link rel="stylesheet" href="/Admin/assets/css/materialdesignicons.min.css" />
        <link rel="stylesheet" href="/Admin/assets/css/fullcalendar.css" />
        <link rel="stylesheet" href="/Admin/assets/css/fullcalendar.css" />
        <link rel="stylesheet" href="/Admin/assets/css/main.css" />
        <link rel="stylesheet" href="/Admin/assets/css/styles.css" />
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
                        <a href="#0" data-bs-toggle="collapse" data-bs-target="#ddmenu_1" aria-controls="ddmenu_1"
                           aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon">
                                <i class="lni lni-bar-chart" style="font-weight: 700;"></i>
                            </span>
                            <span class="text">Dashboard</span>
                        </a>
                        <ul id="ddmenu_1" class="collapse show dropdown-nav">
                            <li>
                                <a href="adminLostAndFound"> Lost And Found </a>
                            </li>
                            <li>
                                <a href="" class="active"> Freelance Job </a>
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

                                <a href="main?action=ApprovePost"> Lost & Found Posts </a>
                            </li>
                            <li>
                                <a href="main?action=ApproveJobPost" class="active"> Freelance Job Posts </a>
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
                        <a href="#0" class="collapsed" data-bs-toggle="collapse" data-bs-target="#ddmenu_5" aria-controls="ddmenu_5"
                           aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon">
                                <i class="lni lni-remove-file" style="font-weight: 700;"></i>
                            </span>
                            <span class="text">Report Posts</span>
                        </a>
                        <ul id="ddmenu_5" class="collapse dropdown-nav">
                            <li>
                                <a href="reportManagement"> Lost & Found </a>
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
                                    <button id="menu-toggle" class="main-btn primary-btn btn-hover">
                                        <i class="lni lni-chevron-left me-2"></i> Menu
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-7 col-6">
                            <div class="header-right">
                                <!-- profile start -->
                                <div class="profile-box ml-15">
                                    <button class="dropdown-toggle bg-transparent border-0" type="button" id="profile"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                        <div class="profile-info">
                                            <div class="info">
                                                <h6>Admin</h6>
                                                <div class="image">
                                                    <img src="/Admin/assets/images/profile/profile-image.png" alt="" />
                                                    <span class="status"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <i class="lni lni-chevron-down"></i>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profile">
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
                                    <h2>Freelance Job Dashboard</h2>
                                </div>
                            </div>
                            <!-- end col -->
                            <div class="col-md-6">
                                <div class="breadcrumb-wrapper mb-30">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item">
                                                <a href="#0">Dashboard</a>
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
                    <div class="row">
                        <div class="col-xl-4 col-lg-4 col-sm-6">
                            <div class="icon-card mb-30">
                                <div class="icon purple">
                                    <i class="lni lni-package"></i>
                                </div>
                                <div class="content">
                                    <h6 class="mb-10">Total Posts</h6>
                                    <h3 class="text-bold mb-10">${requestScope.TOTAL_JOB_POST}</h3>
                                    <p class="text-sm text-success">
                                        <i class="lni lni-arrow-up"></i> +2.00%
                                        <span class="text-gray">()</span>
                                    </p>
                                </div>
                            </div>
                            <!-- End Icon Cart -->
                        </div>
                        <!-- End Col -->
                        <div class="col-xl-4 col-lg-4 col-sm-6">
                            <div class="icon-card mb-30">
                                <div class="icon orange">
                                    <i class="lni lni-user"></i>
                                </div>
                                <div class="content">
                                    <h6 class="mb-10">Employer</h6>
                                    <h3 class="text-bold mb-10">${requestScope.TOTAL_EMPLOYER}</h3>
                                    <p class="text-sm text-success">
                                        <i class="lni lni-arrow-up"></i> +5.45%
                                        <span class="text-gray">Increased</span>
                                    </p>
                                </div>
                            </div>
                            <!-- End Icon Cart -->
                        </div>
                        <!-- End Col -->
                        <div class="col-xl-4 col-lg-4 col-sm-6">
                            <div class="icon-card mb-30">
                                <div class="icon success">
                                    <i class="lni lni-users"></i>
                                </div>
                                <div class="content">
                                    <h6 class="mb-10">Freelancer</h6>
                                    <h3 class="text-bold mb-10">${requestScope.TOTAL_USER}</h3>
                                    <p class="text-sm text-danger">
                                        <i class="lni lni-arrow-down"></i> -2.00%
                                        <span class="text-gray">Expense</span>
                                    </p>
                                </div>
                            </div>
                            <!-- End Icon Cart -->
                        </div>
                        <!-- End Col -->
                    </div>
                    <!-- End Row -->
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card-style mb-30">
                                <div class="title d-flex flex-wrap justify-content-between">
                                    <div class="left">
                                        <h6 class="text-medium mb-10">Posts by last 7 days</h6>
                                    </div>
                                    <div class="right">
                                        <h5 class="text-bold">Total: ${requestScope.TOTAL_JOB_POST_LAST_WEEK} posts</h5>
                                    </div>
                                </div>
                                <!-- End Title -->
                                <div class="chart">
                                    <canvas id="Chart1" style="width: 100%; height: 433px"></canvas>
                                </div>
                                <!-- End Chart -->
                            </div>
                        </div>
                        <!-- End Col -->
                        <div class="col-lg-6">
                            <div class="card-style mb-30">
                                <div class="
                                     title
                                     d-flex
                                     flex-wrap
                                     align-items-center
                                     justify-content-between
                                     ">
                                    <div class="left">
                                        <h6 class="text-medium mb-30">New Employers</h6>
                                    </div>
                                    <div class="right">
                                        <!-- <div class="select-style-1">
                                          <div class="select-position select-sm">
                                            <select class="light-bg">
                                              <option value="">Today</option>
                                              <option value="">Yesterday</option>
                                            </select>
                                          </div>
                                        </div> -->
                                    </div>
                                </div>
                                <!-- End Title -->
                                <div class="table-responsive">
                                    <table class="table top-selling-table">
                                        <thead>
                                        <th>
                                            <h6 class="text-sm text-medium">Name</h6>
                                        </th>
                                        <th class="min-width">
                                            <h6 class="text-sm text-medium">Phone</h6>
                                        </th>
                                        <th class="min-width">
                                            <h6 class="text-sm text-medium">Email</h6>
                                        </th>
                                        <th class="min-width">
                                            <h6 class="text-sm text-medium text-center">Status</h6>
                                        </th>
                                        <th class="min-width">
                                            <h6 class="text-sm text-medium text-center">Action</h6>
                                        </th>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.TOP5_NEW_EMPLOYER}" var="employer">
                                                <tr>
                                                    <td>
                                                        <div class="product">
                                                            <div class="image user-image">
                                                                <img src="${pageContext.servletContext.contextPath}/avatar?userId=${employer.userId}" alt="" />
                                                            </div>
                                                            <p class="text-sm">${employer.fullname}</p>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p class="text-sm">${employer.phone}</p>
                                                    </td>
                                                    <td>
                                                        <p class="text-sm">${employer.email}</p>
                                                    </td>
                                                    <td>
                                                        <div class="action justify-content-center">
                                                            <span class="status-btn success-btn">Active</span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="action justify-content-center">
                                                            <button type="submit" name="" value="" class="edit" >
                                                                <span class="status-btn danger-btn" style="font-weight: 700;"><i class="lni lni-ban" style="font-weight: 700;"></i> Ban</span>                     
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
                        <!-- End Row -->
                    </div>
                    <!-- End Row -->
                    <div class="row">
                        <!-- <div class="col-lg-5">
                            <div class="card-style mb-30">
                              <div
                                class="
                                  title
                                  d-flex
                                  justify-content-between
                                  align-items-center
                                "
                              >
                                <div class="left">
                                  <h6 class="text-medium mb-30">Sells by State</h6>
                                </div>
                              </div>
                              
                              <div id="map" style="width: 100%; height: 400px"></div>
                              <p>Last updated: 7 days ago</p>
                            </div>
                          </div> -->
                        <!-- End Col -->
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
                                        <h6 class="text-medium mb-30">New Freelance Job Posts</h6>
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
                                                    <h6 class="text-sm text-medium">Salary</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium">Amount</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium">Time Job</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium">Time</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium text-center">View Detail</h6>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.TOP5_JOB_POST}" var="jobPost">
                                                <tr>
                                                    <td>
                                                        <div class="product">
                                                            <div class="image user-image">
                                                                <img
                                                                    src="${pageContext.servletContext.contextPath}/avatar?userId=${jobPost.userId}"
                                                                    alt="" />
                                                            </div>
                                                            <p class="text-sm">${jobPost.fullname}</p>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p class="text-sm">${jobPost.title}</p>
                                                    </td>
                                                    <td>
                                                        <p class="text-sm">${jobPost.jobCategoryName}</p>
                                                    </td>
                                                    <td>
                                                        <p class="text-sm">${jobPost.salary}VNĐ / giờ</p>
                                                    </td>
                                                    <td>
                                                        <p class="text-sm">${jobPost.amount} người</p>
                                                    </td>
                                                    <td>
                                                        <p class="text-sm">
                                                            <c:choose> 
                                                                <c:when test="${jobPost.timeJob==1}">
                                                                    Ít hơn 1 tháng
                                                                </c:when> 
                                                                <c:when test="${jobPost.timeJob==2}">
                                                                    1 - 3 tháng
                                                                </c:when>
                                                                <c:when test="${jobPost.timeJob==3}">
                                                                    Hơn 3 tháng
                                                                </c:when> 
                                                            </c:choose>
                                                        </p>
                                                    </td>
                                                    <td>
                                                        <p class="text-sm">${jobPost.date}</p>
                                                    </td>
                                                    <td>
                                                        <div class="action justify-content-center">
                                                            <button>
                                                                <i class="lni lni-eye"></i>
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
                // The type of chart 
                type: "line",

                // The data for our dataset
                data: {
                    labels: [
                        "7 day ago",
                        "6 day ago",
                        "5 day ago",
                        "4 day ago",
                        "3 day ago",
                        "2 day ago",
                        "1 day ago",
                    ],
                    // Information about the dataset
                    datasets: [
                        {
                            label: "Number Of Post",
                            backgroundColor: "transparent",
                            borderColor: "#9b51e0",
                            data: [
            ${requestScope.DATA[0]}, ${requestScope.DATA[1]}, ${requestScope.DATA[2]}, ${requestScope.DATA[3]}, ${requestScope.DATA[4]}, ${requestScope.DATA[5]}, ${requestScope.DATA[6]},
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
                                    max: 10,
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
        </script>
    </body>

</html>
