<%-- 
    Document   : profileDetail.jsp
    Created on : Jun 3, 2022, 12:12:37 AM
    Author     : SE150888 Pham Ngoc Long
--%>

<%-- 
    Document   : profileDetail.jsp
    Created on : Jun 2, 2022, 10:05:13 PM
    Author     : SE150888 Pham Ngoc Long
--%>

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
      <div class="container"><a class="navbar-brand" href="index.html"><img
            src="https://hcmuni.fpt.edu.vn/landing-page/images/logo-top.png" height="46" alt="logo" /></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span
            class="navbar-toggler-icon"> </span></button>
        <div class="collapse navbar-collapse border-top border-lg-0 mt-4 mt-lg-0" id="navbarSupportedContent">
          <ul class="navbar-nav ms-auto pt-2 pt-lg-0 font-base align-items-lg-center align-items-start">
            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="index.html">Trang chủ</a>
            </li>
            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="#phanloai">Phân loại</a>
            </li>
            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="#moinhatduoc">Mới nhặt
                được</a></li>
            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="#moithatlac">Mới thất
                lạc</a></li>
            <li class="nav-item px-3"><a class="nav-link fw-bold" aria-current="page" href="#timkiem">Tìm kiếm</a></li>
            <li class="nav-item px-3"><a class="btn btn-outline-light order-1 order-lg-0 fw-bold" href="#!">Đăng nhập /
                Đăng ký</a></li>
            <!-- <li class="nav-item px-3 px-xl-4"><a class="btn btn-outline-dark btn-success order-1 order-lg-0 fw-bold"
                href="#!">Đăng ký</a></li> -->
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
              <img class="mb-4 mt-2 rounded-2 w-100"
                src="https://cdn2.iconfinder.com/data/icons/people-flat-design/64/Face-Profile-User-Man-Boy-Person-Avatar-512.png"
                alt="Avatar profile" />
              <ul>
                <li><a href="#" type="button" class="btn btn-success"><i class="fa-solid fa-user"></i> Thông tin chung</a></li>
                <li><a href="#" type="button" class="btn btn-success"><i class="fa-solid fa-file"></i> Bài đăng của tôi</a></li>
                <li><a href="#" type="button" class="btn btn-success"><i class="fa-solid fa-key"></i> Thay đổi mật khẩu</a></li>
                <li><a href="#" type="button" class="btn btn-success"><i class="fa-solid fa-comment"></i> Feedback hệ thống</a></li>

              </ul>
            </div>
          </div>
        </div>
        <div class="right col-12 col-md-6">
          <h5 style="margin-bottom: 30px;">Cập nhật thông tin</h5>
          <form>
            <div class="row">
              <div class="form-group col-12 col-md-6">
                <label for="name">Họ và tên</label>
                <input type="text" class="form-control" id="name" placeholder="" value="${sessionScope.LOGIN_USER.fullname}">
              </div>
              <div class="form-group col-12 col-md-6">
                <label for="phone">Số điện thoại</label>
                <input type="text" class="form-control" id="phone"" placeholder="" value="${sessionScope.LOGIN_USER.phone}">
              </div>
            </div>
            <div class="row">
              <div class="form-group col-12 col-md-6">
                <label for="email">Email liên lạc</label>
                <input type="email" class="form-control" id="email" placeholder="" value="${sessionScope.LOGIN_USER.email}">
              </div>
            </div>
            <div class="row">
              <div class="form-group col-12 col-md-6">
                <label for="facebook">Facebook</label>
                <input type="text" class="form-control" id="facebook" placeholder=""
                  value="${sessionScope.LOGIN_USER.facebook}">
              </div>
            </div>
            <br>
            <div class="row">
              <div class="form-group col-8 col-md-6">
                <button type="submit" class="btn btn-success"><i class="fa-solid fa-floppy-disk"></i> Lưu</button>
              </div>
            </div>
          </form>
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