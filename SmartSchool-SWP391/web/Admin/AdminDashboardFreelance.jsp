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
  <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
  <link rel="stylesheet" href="assets/css/lineicons.css" />
  <link rel="stylesheet" href="assets/css/materialdesignicons.min.css" />
  <link rel="stylesheet" href="assets/css/fullcalendar.css" />
  <link rel="stylesheet" href="assets/css/fullcalendar.css" />
  <link rel="stylesheet" href="assets/css/main.css" />
  <link rel="stylesheet" href="assets/css/styles.css" />
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
              <svg width="22" height="22" viewBox="0 0 22 22">
                <path
                  d="M17.4167 4.58333V6.41667H13.75V4.58333H17.4167ZM8.25 4.58333V10.0833H4.58333V4.58333H8.25ZM17.4167 11.9167V17.4167H13.75V11.9167H17.4167ZM8.25 15.5833V17.4167H4.58333V15.5833H8.25ZM19.25 2.75H11.9167V8.25H19.25V2.75ZM10.0833 2.75H2.75V11.9167H10.0833V2.75ZM19.25 10.0833H11.9167V19.25H19.25V10.0833ZM10.0833 13.75H2.75V19.25H10.0833V13.75Z" />
              </svg>
            </span>
            <span class="text">Dashboard</span>
          </a>
          <ul id="ddmenu_1" class="collapse show dropdown-nav">
            <li>
              <a href="index.html" class=""> Lost And Found </a>
            </li>
            <li>
              <a href="index.html" class="active"> Freelance Job </a>
            </li>
          </ul>
        </li>
        <li class="nav-item nav-item-has-children">
          <a href="#0" class="collapsed" data-bs-toggle="collapse" data-bs-target="#ddmenu_2" aria-controls="ddmenu_2"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon">
              <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path
                  d="M12.8334 1.83325H5.50008C5.01385 1.83325 4.54754 2.02641 4.20372 2.37022C3.8599 2.71404 3.66675 3.18036 3.66675 3.66659V18.3333C3.66675 18.8195 3.8599 19.2858 4.20372 19.6296C4.54754 19.9734 5.01385 20.1666 5.50008 20.1666H16.5001C16.9863 20.1666 17.4526 19.9734 17.7964 19.6296C18.1403 19.2858 18.3334 18.8195 18.3334 18.3333V7.33325L12.8334 1.83325ZM16.5001 18.3333H5.50008V3.66659H11.9167V8.24992H16.5001V18.3333Z" />
              </svg>
            </span>
            <span class="text">Pages</span>
          </a>
          <ul id="ddmenu_2" class="collapse dropdown-nav">
            <li>
              <a href="settings.html"> Settings </a>
            </li>
            <li>
              <a href="blank-page.html"> Blank Page </a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a href="invoice.html">
            <span class="icon">
              <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path
                  d="M17.4166 7.33333C18.9383 7.33333 20.1666 8.56167 20.1666 10.0833V15.5833H16.4999V19.25H5.49992V15.5833H1.83325V10.0833C1.83325 8.56167 3.06159 7.33333 4.58325 7.33333H5.49992V2.75H16.4999V7.33333H17.4166ZM7.33325 4.58333V7.33333H14.6666V4.58333H7.33325ZM14.6666 17.4167V13.75H7.33325V17.4167H14.6666ZM16.4999 13.75H18.3333V10.0833C18.3333 9.57917 17.9208 9.16667 17.4166 9.16667H4.58325C4.07909 9.16667 3.66659 9.57917 3.66659 10.0833V13.75H5.49992V11.9167H16.4999V13.75ZM17.4166 10.5417C17.4166 11.0458 17.0041 11.4583 16.4999 11.4583C15.9958 11.4583 15.5833 11.0458 15.5833 10.5417C15.5833 10.0375 15.9958 9.625 16.4999 9.625C17.0041 9.625 17.4166 10.0375 17.4166 10.5417Z" />
              </svg>
            </span>
            <span class="text">Invoice</span>
          </a>
        </li>
        <li class="nav-item nav-item-has-children">
          <a href="#0" class="collapsed" data-bs-toggle="collapse" data-bs-target="#ddmenu_3" aria-controls="ddmenu_3"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon">
              <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path
                  d="M12.9067 14.2908L15.2808 11.9167H6.41667V10.0833H15.2808L12.9067 7.70917L14.2083 6.41667L18.7917 11L14.2083 15.5833L12.9067 14.2908ZM17.4167 2.75C17.9029 2.75 18.3692 2.94315 18.713 3.28697C19.0568 3.63079 19.25 4.0971 19.25 4.58333V8.86417L17.4167 7.03083V4.58333H4.58333V17.4167H17.4167V14.9692L19.25 13.1358V17.4167C19.25 17.9029 19.0568 18.3692 18.713 18.713C18.3692 19.0568 17.9029 19.25 17.4167 19.25H4.58333C3.56583 19.25 2.75 18.425 2.75 17.4167V4.58333C2.75 3.56583 3.56583 2.75 4.58333 2.75H17.4167Z" />
              </svg>
            </span>
            <span class="text">Auth</span>
          </a>
          <ul id="ddmenu_3" class="collapse dropdown-nav">
            <li>
              <a href="signin.html"> Sign In </a>
            </li>
            <li>
              <a href="signup.html"> Sign Up </a>
            </li>
          </ul>
        </li>
        <span class="divider">
          <hr />
        </span>
        <li class="nav-item nav-item-has-children">
          <a href="#0" class="collapsed" data-bs-toggle="collapse" data-bs-target="#ddmenu_4" aria-controls="ddmenu_4"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon">
              <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path
                  d="M3.66675 4.58325V16.4999H19.2501V4.58325H3.66675ZM5.50008 14.6666V6.41659H8.25008V14.6666H5.50008ZM10.0834 14.6666V11.4583H12.8334V14.6666H10.0834ZM17.4167 14.6666H14.6667V11.4583H17.4167V14.6666ZM10.0834 9.62492V6.41659H17.4167V9.62492H10.0834Z" />
              </svg>
            </span>
            <span class="text">UI Elements </span>
          </a>
          <ul id="ddmenu_4" class="collapse dropdown-nav">
            <li>
              <a href="alerts.html"> Alerts </a>
            </li>
            <li>
              <a href="buttons.html"> Buttons </a>
            </li>
            <li>
              <a href="cards.html"> Cards </a>
            </li>
            <li>
              <a href="typography.html"> Typography </a>
            </li>
          </ul>
        </li>
        <li class="nav-item nav-item-has-children">
          <a href="#0" class="collapsed" data-bs-toggle="collapse" data-bs-target="#ddmenu_55" aria-controls="ddmenu_55"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon">
              <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path
                  d="M1.83325 19.25V17.4167H18.3333V19.25H1.83325ZM18.3333 7.33333V4.58333H16.4999V7.33333H18.3333ZM18.3333 2.75C18.8195 2.75 19.2858 2.94315 19.6296 3.28697C19.9734 3.63079 20.1666 4.0971 20.1666 4.58333V7.33333C20.1666 7.81956 19.9734 8.28588 19.6296 8.6297C19.2858 8.97351 18.8195 9.16667 18.3333 9.16667H16.4999V11.9167C16.4999 12.8891 16.1136 13.8218 15.426 14.5094C14.7383 15.197 13.8057 15.5833 12.8333 15.5833H7.33325C6.36079 15.5833 5.42816 15.197 4.74053 14.5094C4.05289 13.8218 3.66659 12.8891 3.66659 11.9167V2.75H18.3333ZM14.6666 4.58333H5.49992V11.9167C5.49992 12.4029 5.69307 12.8692 6.03689 13.213C6.38071 13.5568 6.84702 13.75 7.33325 13.75H12.8333C13.3195 13.75 13.7858 13.5568 14.1296 13.213C14.4734 12.8692 14.6666 12.4029 14.6666 11.9167V4.58333Z" />
              </svg>
            </span>
            <span class="text">Icons</span>
          </a>
          <ul id="ddmenu_55" class="collapse dropdown-nav">
            <li>
              <a href="icons.html"> LineIcons </a>
            </li>
            <li>
              <a href="mdi-icons.html"> MDI Icons </a>
            </li>
          </ul>
        </li>
        <li class="nav-item nav-item-has-children">
          <a href="#0" class="collapsed" data-bs-toggle="collapse" data-bs-target="#ddmenu_5" aria-controls="ddmenu_5"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon">
              <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path
                  d="M13.75 4.58325H16.5L15.125 6.41659L13.75 4.58325ZM4.58333 1.83325H17.4167C18.4342 1.83325 19.25 2.65825 19.25 3.66659V18.3333C19.25 19.3508 18.4342 20.1666 17.4167 20.1666H4.58333C3.575 20.1666 2.75 19.3508 2.75 18.3333V3.66659C2.75 2.65825 3.575 1.83325 4.58333 1.83325ZM4.58333 3.66659V7.33325H17.4167V3.66659H4.58333ZM4.58333 18.3333H17.4167V9.16659H4.58333V18.3333ZM6.41667 10.9999H15.5833V12.8333H6.41667V10.9999ZM6.41667 14.6666H15.5833V16.4999H6.41667V14.6666Z" />
              </svg>
            </span>
            <span class="text"> Forms </span>
          </a>
          <ul id="ddmenu_5" class="collapse dropdown-nav">
            <li>
              <a href="form-elements.html"> From Elements </a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a href="tables.html">
            <span class="icon">
              <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path
                  d="M4.58333 3.66675H17.4167C17.9029 3.66675 18.3692 3.8599 18.713 4.20372C19.0568 4.54754 19.25 5.01385 19.25 5.50008V16.5001C19.25 16.9863 19.0568 17.4526 18.713 17.7964C18.3692 18.1403 17.9029 18.3334 17.4167 18.3334H4.58333C4.0971 18.3334 3.63079 18.1403 3.28697 17.7964C2.94315 17.4526 2.75 16.9863 2.75 16.5001V5.50008C2.75 5.01385 2.94315 4.54754 3.28697 4.20372C3.63079 3.8599 4.0971 3.66675 4.58333 3.66675ZM4.58333 7.33341V11.0001H10.0833V7.33341H4.58333ZM11.9167 7.33341V11.0001H17.4167V7.33341H11.9167ZM4.58333 12.8334V16.5001H10.0833V12.8334H4.58333ZM11.9167 12.8334V16.5001H17.4167V12.8334H11.9167Z" />
              </svg>
            </span>
            <span class="text">Tables</span>
          </a>
        </li>
        <span class="divider">
          <hr />
        </span>

        <li class="nav-item">
          <a href="notification.html">
            <span class="icon">
              <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path
                  d="M9.16667 19.25H12.8333C12.8333 20.2584 12.0083 21.0834 11 21.0834C9.99167 21.0834 9.16667 20.2584 9.16667 19.25ZM19.25 17.4167V18.3334H2.75V17.4167L4.58333 15.5834V10.0834C4.58333 7.24171 6.41667 4.76671 9.16667 3.94171V3.66671C9.16667 2.65837 9.99167 1.83337 11 1.83337C12.0083 1.83337 12.8333 2.65837 12.8333 3.66671V3.94171C15.5833 4.76671 17.4167 7.24171 17.4167 10.0834V15.5834L19.25 17.4167ZM15.5833 10.0834C15.5833 7.51671 13.5667 5.50004 11 5.50004C8.43333 5.50004 6.41667 7.51671 6.41667 10.0834V16.5H15.5833V10.0834Z" />
              </svg>
            </span>
            <span class="text">Notifications</span>
          </a>
        </li>
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
                <h3 class="text-bold mb-10">34567</h3>
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
                <h3 class="text-bold mb-10">10,000(chỗ này chỉ lấy role EM)</h3>
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
                <h3 class="text-bold mb-10">24,567 (chỗ này chỉ lấy role US)</h3>
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
                  <h5 class="text-bold">Total: 323 posts</h5>
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
                    <tr>
                      <td>
                        <div class="product">
                          <div class="image user-image">
                            <img src="https://thuthuatnhanh.com/wp-content/uploads/2018/07/anh-dai-dien-dep.jpg" alt="" />
                          </div>
                          <p class="text-sm">Trịnh Ngọc Bảo</p>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">0838439296</p>
                      </td>
                      <td>
                        <p class="text-sm">ngbao1592001@gmail.com</p>
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
                    <tr>
                      <td>
                        <div class="product">
                          <div class="image user-image">
                            <img src="https://thuthuatnhanh.com/wp-content/uploads/2018/07/anh-dai-dien-dep.jpg" alt="" />
                          </div>
                          <p class="text-sm">Trịnh Ngọc Bảo</p>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">0838439296</p>
                      </td>
                      <td>
                        <p class="text-sm">ngbao1592001@gmail.com</p>
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
                    <tr>
                      <td>
                        <div class="product">
                          <div class="image user-image">
                            <img src="assets/images/products/product-mini-2.jpg" alt="" />
                          </div>
                          <p class="text-sm">Arm Chair</p>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">Interior</p>
                      </td>
                      <td>
                        <p class="text-sm">$345</p>
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
                    <tr>
                      <td>
                        <div class="product">
                          <div class="image user-image">
                            <img src="assets/images/products/product-mini-3.jpg" alt="" />
                          </div>
                          <p class="text-sm">Sofa</p>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">Interior</p>
                      </td>
                      <td>
                        <p class="text-sm">$345</p>
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
                    <tr>
                      <td>
                        <div class="product">
                          <div class="image user-image">
                            <img src="assets/images/products/product-mini-4.jpg" alt="" />
                          </div>
                          <p class="text-sm">Kitchen</p>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">Interior</p>
                      </td>
                      <td>
                        <p class="text-sm">$345</p>
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
                    <tr>
                      <td>
                        <div class="product">
                          <div class="image user-image">
                            <img
                              src="data:image/jpeg;base64,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"
                              alt="" />
                          </div>
                          <p class="text-sm">Phạm Ngọc Long</p>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">Cần tuyển nhân sự thiết kế Web</p>
                      </td>
                      <td>
                        <p class="text-sm">Thiết kế - Mỹ Thuật</p>
                      </td>
                      <td>
                        <p class="text-sm">10,000 VNĐ / giờ</p>
                      </td>
                      <td>
                        <p class="text-sm">3 người</p>
                      </td>
                      <td>
                        <p class="text-sm">1 - 3 tháng</p>
                      </td>
                      <td>
                        <p class="text-sm">1 giờ trước</p>
                      </td>
                      <td>
                        <div class="action justify-content-center">
                          <button>
                            <i class="lni lni-eye"></i>
                          </button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <div class="product">
                          <div class="image user-image">
                            <img
                              src="data:image/jpeg;base64,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"
                              alt="" />
                          </div>
                          <p class="text-sm">Phạm Ngọc Long</p>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">Cần tuyển nhân sự thiết kế Web</p>
                      </td>
                      <td>
                        <p class="text-sm">Thiết kế - Mỹ Thuật</p>
                      </td>
                      <td>
                        <p class="text-sm">10,000 VNĐ / giờ</p>
                      </td>
                      <td>
                        <p class="text-sm">3 người</p>
                      </td>
                      <td>
                        <p class="text-sm">1 - 3 tháng</p>
                      </td>
                      <td>
                        <p class="text-sm">1 giờ trước</p>
                      </td>
                      <td>
                        <div class="action justify-content-center">
                          <button>
                            <i class="lni lni-eye"></i>
                          </button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <div class="product">
                          <div class="image user-image">
                            <img
                              src="data:image/jpeg;base64,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"
                              alt="" />
                          </div>
                          <p class="text-sm">Phạm Ngọc Long</p>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">Cần tuyển nhân sự thiết kế Web</p>
                      </td>
                      <td>
                        <p class="text-sm">Thiết kế - Mỹ Thuật</p>
                      </td>
                      <td>
                        <p class="text-sm">10,000 VNĐ / giờ</p>
                      </td>
                      <td>
                        <p class="text-sm">3 người</p>
                      </td>
                      <td>
                        <p class="text-sm">1 - 3 tháng</p>
                      </td>
                      <td>
                        <p class="text-sm">1 giờ trước</p>
                      </td>
                      <td>
                        <div class="action justify-content-center">
                          <button>
                            <i class="lni lni-eye"></i>
                          </button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <div class="product">
                          <div class="image user-image">
                            <img
                              src="data:image/jpeg;base64,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"
                              alt="" />
                          </div>
                          <p class="text-sm">Phạm Ngọc Long</p>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">Cần tuyển nhân sự thiết kế Web</p>
                      </td>
                      <td>
                        <p class="text-sm">Thiết kế - Mỹ Thuật</p>
                      </td>
                      <td>
                        <p class="text-sm">10,000 VNĐ / giờ</p>
                      </td>
                      <td>
                        <p class="text-sm">3 người</p>
                      </td>
                      <td>
                        <p class="text-sm">1 - 3 tháng</p>
                      </td>
                      <td>
                        <p class="text-sm">1 giờ trước</p>
                      </td>
                      <td>
                        <div class="action justify-content-center">
                          <button>
                            <i class="lni lni-eye"></i>
                          </button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <div class="product">
                          <div class="image user-image">
                            <img
                              src="data:image/jpeg;base64,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"
                              alt="" />
                          </div>
                          <p class="text-sm">Phạm Ngọc Long</p>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">Cần tuyển nhân sự thiết kế Web</p>
                      </td>
                      <td>
                        <p class="text-sm">Thiết kế - Mỹ Thuật</p>
                      </td>
                      <td>
                        <p class="text-sm">10,000 VNĐ / giờ</p>
                      </td>
                      <td>
                        <p class="text-sm">3 người</p>
                      </td>
                      <td>
                        <p class="text-sm">1 - 3 tháng</p>
                      </td>
                      <td>
                        <p class="text-sm">1 giờ trước</p>
                      </td>
                      <td>
                        <div class="action justify-content-center">
                          <button>
                            <i class="lni lni-eye"></i>
                          </button>
                        </div>
                      </td>
                    </tr>
                    
 
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
  <script src="assets/js/bootstrap.bundle.min.js"></script>
  <script src="assets/js/Chart.min.js"></script>
  <script src="assets/js/dynamic-pie-chart.js"></script>
  <script src="assets/js/moment.min.js"></script>
  <script src="assets/js/fullcalendar.js"></script>
  <script src="assets/js/jvectormap.min.js"></script>
  <script src="assets/js/world-merc.js"></script>
  <script src="assets/js/polyfill.js"></script>
  <script src="assets/js/main.js"></script>

  <script>
    // ======== jvectormap activation
    var markers = [
      { name: "Egypt", coords: [26.8206, 30.8025] },
      { name: "Russia", coords: [61.524, 105.3188] },
      { name: "Canada", coords: [56.1304, -106.3468] },
      { name: "Greenland", coords: [71.7069, -42.6043] },
      { name: "Brazil", coords: [-14.235, -51.9253] },
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
        initial: { fill: "#4A6CF7" },
        selected: { fill: "#ff5050" },
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
  </script>
</body>

</html>
