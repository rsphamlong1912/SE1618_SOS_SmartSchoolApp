<%-- 
    Document   : CategoryLostAndFound
    Created on : Jul 8, 2022, 10:53:41 AM
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
        <link rel="shortcut icon" href="/Admin/assets/images/favicon.svg" type="image/x-icon" />
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
            #ModalAddCategory small, #ModalEditCategory small {
                color: #F21F26;
                padding-left: 10px;
                font-weight: 700 !important;
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
                        <a href="#0" data-bs-toggle="collapse" data-bs-target="#ddmenu_2" aria-controls="ddmenu_2"
                           aria-expanded="false" aria-label="Toggle navigation">
                            <span class="icon">
                                <i class="lni lni-text-align-justify" style="font-weight: 700;"></i>
                            </span>
                            <span class="text">Category</span>
                        </a>
                        <ul id="ddmenu_2" class="collapse show dropdown-nav">
                            <li>
                                <a href="" class="active"> Category Lost & Found </a>
                            </li>
                            <li>
                                <a href="jobCategory"  class=""> Category Freelance Job </a>
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
                                                <h6>John Doe</h6>
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
                                    <h2>Category Management: Lost And Found</h2>
                                </div>
                            </div>
                            <!-- end col -->
                            <div class="col-md-6">
                                <div class="breadcrumb-wrapper mb-30">
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item">
                                                <a href="#0">Category</a>
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
                                        <h6 class="text-medium mb-30">Category</h6>
                                    </div>
                                    <div class="right">
                                        <div class="title d-flex align-items-center flex-wrap mb-30">
                                            <button type="button" class="main-btn warning-btn btn-hover btn-sm" data-bs-toggle="modal"
                                                    data-bs-target="#ModalAddCategory">
                                                <i class="lni lni-plus mr-5"></i>Add New Category</button>
                                        </div>
                                    </div>
                                    <!-- Modal -->
                                    <div class="modal fade" id="ModalAddCategory" tabindex="-1" aria-labelledby="exampleModalLabel"
                                         aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="exampleModalLabel">Add New Category</h4>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <form onsubmit="return validateAddCategoryLF()" action="main" method="POST">
                                                    <div class="modal-body">
                                                        <div class="row justify-content-center">
                                                            <div class="col-11">
                                                                <div class="input-style-1">
                                                                    <label>Category Name</label>
                                                                    <input id="cateName" type="text" placeholder="Type here" name="categoryName" />
                                                                    <small></small>
                                                                </div>
                                                            </div>
                                                            <div class="col-11">
                                                                <div class="input-style-1">
                                                                    <label>Category Image (Please copy URL Image)</label>
                                                                    <textarea id="cateImage" placeholder="Type here" rows="6" name="categoryImg"></textarea>
                                                                    <small></small>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="main-btn light-btn btn-hover btn-sm" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" name="action" value="AddCategory" class="main-btn warning-btn btn-hover btn-sm">Save changes</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Title -->
                                <div class="table-responsive">
                                    <table class="table top-selling-table">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>
                                                    <h6 class="text-sm text-medium">Category Image</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium">Category Name</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium text-center">Status</h6>
                                                </th>
                                                <th class="min-width">
                                                    <h6 class="text-sm text-medium text-center">Action</h6>
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.LISTALLCATEGORY}" var="listCategory" varStatus="count">
                                                <tr>
                                                    <td>
                                                        <input type="hidden" value="${listCategory.categoryId}"/>
                                                        <h6 class="text-sm">#${count.index + 1}</h6>
                                                    </td>
                                                    <td>
                                                        <div class="product">
                                                            <div class="image">
                                                                <img src="${listCategory.categoryImg}" alt="" />
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <p class="text-sm">${listCategory.categoryName}</p>
                                                    </td>
                                                    <td>
                                                        <div class="action justify-content-center">
                                                            <span class="status-btn success-btn">Active</span>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="action justify-content-center icon purple">
                                                            <button class="text-gray" style="font-size:20px;" data-bs-toggle="modal"
                                                                    data-bs-target="#ModalEditCategory" onclick="truyenDataEdit(this.getAttribute('data-editCateID'), this.getAttribute('date-editCateName'), this.getAttribute('data-editCateImg'))"
                                                                    data-editCateID="${listCategory.categoryId}"
                                                                    data-editCateImg="${listCategory.categoryImg}"
                                                                    date-editCateName="${listCategory.categoryName}">
                                                                <i class="lni lni-pencil-alt fw-bold"></i>
                                                            </button>
                                                            <button class="text-gray" style="font-size:20px;" data-bs-toggle="modal"
                                                                    data-bs-target="#ModalDeleteCategory" onclick="truyenIdDelete(this.getAttribute('data-cateId'))"
                                                                    data-cateId="${listCategory.categoryId}" >
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
                <!-- Modal Edit -->
                <form onsubmit="return validateEditCategoryLF()" action="main" method="POST">
                    <div class="modal fade" id="ModalEditCategory" tabindex="-1" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" id="exampleModalLabel">Edit Category</h4>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                        <div class="row justify-content-center">
                                            <div>
                                                <input id="CateId1" type="hidden" name="categoryId" />
                                            </div>
                                            <div class="col-11">
                                                <div class="input-style-1">
                                                    <label>Category Name</label>
                                                    <input id="CateN" type="text" placeholder="Type here" name="categoryName"/>
                                                    <small></small>
                                                </div>
                                            </div>
                                            <div class="col-11">
                                                <div class="input-style-1">
                                                    <label>Category Image (Please copy URL Image)</label>
                                                    <textarea id="CateImg" name="categoryImg" placeholder="Type here" rows="6"></textarea>
                                                    <small></small>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="main-btn light-btn btn-hover btn-sm" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" name="action" value="EditCategory" class="main-btn warning-btn btn-hover btn-sm">Save changes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <!--Modal Delete-->
                <form action="main">
                    <div class="modal fade" id="ModalDeleteCategory" tabindex="-1" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-sm">
                            <div class="modal-content">
                                <div class="modal-header justify-content-center">
                                    <h4 class="modal-title" id="exampleModalLabel">Are you sure?</h4>
                                </div>
                                <div class="modal-footer justify-content-center">
                                    <input id="CateId2" type="hidden" name="categoryId" />
                                    <button type="button" class="main-btn warning-btn-outline btn-hover btn-sm" data-bs-dismiss="modal">No</button>
                                    <button type="submit" name="action" value="DeleteCategory" class="main-btn warning-btn btn-hover btn-sm">Yes</button>
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
                                    <a href="#" rel="nofollow" target="_blank">
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
        <script src="/Admin/assets/js/validation.js"></script>

        <script>
                                                                        function truyenDataEdit(cateID, cateName, cateImage) {
                                                                            document.getElementById("CateId1").value = cateID;
                                                                            document.getElementById("CateN").value = cateName;
                                                                            document.getElementById("CateImg").innerHTML = cateImage;
                                                                        }
        </script>

        <script>
            function truyenIdDelete(cateID) {
                document.getElementById("CateId2").value = cateID;
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
