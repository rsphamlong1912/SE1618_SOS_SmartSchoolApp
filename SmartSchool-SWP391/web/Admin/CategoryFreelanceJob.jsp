<%-- 
    Document   : CategoryFreelanceJob
    Created on : Jul 8, 2022, 10:54:47 AM
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
          <a href="#0" data-bs-toggle="collapse" data-bs-target="#ddmenu_2" aria-controls="ddmenu_2"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon">
              <i class="lni lni-text-align-justify" style="font-weight: 700;"></i>
            </span>
            <span class="text">Category</span>
          </a>
          <ul id="ddmenu_2" class="collapse show dropdown-nav">
            <li>
              <a href="CategoryLostAndFound.html" class=""> Category Lost & Found </a>
            </li>
            <li>
              <a href="" class="active"> Category Freelance Job </a>
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
              <a href=""> Lost & Found Posts </a>
            </li>
            <li>
              <a href=""> Freelance Job Posts </a>
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
                <h2>Category Management: Freelance Job</h2>
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
                      <div class="modal-body">
                        <form action="" method="">
                          <div class="row justify-content-center">
                            <div class="col-11">
                              <div class="input-style-1">
                                <label>Category Name</label>
                                <input type="text" placeholder="Type here" />
                              </div>
                            </div>
                            <div class="col-11">
                              <div class="input-style-1">
                                <label>Category Description</label>
                                <textarea placeholder="Type here" rows="2"></textarea>
                              </div>
                            </div>
                            <div class="col-11">
                              <div class="input-style-1">
                                <label>Category Image (Please copy URL Image)</label>
                                <textarea placeholder="Type here" rows="5"></textarea>
                              </div>
                            </div>
                          </div>
                        </form>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="main-btn light-btn btn-hover btn-sm"
                          data-bs-dismiss="modal">Close</button>
                        <button type="button" class="main-btn warning-btn btn-hover btn-sm">Save changes</button>
                      </div>
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
                        <h6 class="text-sm text-medium">Category Description</h6>
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
                    <tr>
                      <td>
                        <h6 class="text-sm">#1</h6>
                      </td>
                      <td>
                        <div class="product">
                          <div class="image">
                            <img src="https://img.icons8.com/ios/100/000000/laptop--v1.png" alt="" />
                          </div>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">Lập Trình</p>
                      </td>
                      <td>
                        <p class="text-sm">Lập Trình Front-End, Lập Trình Back-End, Fullstack Engineer,...</p>
                      </td>
                      <td>
                        <div class="action justify-content-center">
                          <span class="status-btn success-btn">Active</span>
                        </div>
                      </td>
                      <td>
                        <div class="action justify-content-center icon purple">
                          <button class="text-gray" style="font-size:20px;" data-bs-toggle="modal"
                          data-bs-target="#ModalEditCategory">
                            <i class="lni lni-pencil-alt fw-bold"></i>
                          </button>
                          <button class="text-gray" style="font-size:20px;" data-bs-toggle="modal"
                          data-bs-target="#ModalDeleteCategory">
                            <i class="lni lni-trash-can fw-bold"></i>
                          </button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <h6 class="text-sm">#2</h6>
                      </td>
                      <td>
                        <div class="product">
                          <div class="image">
                            <img
                              src="https://img.icons8.com/external-xnimrodx-lineal-color-xnimrodx/64/undefined/external-laptop-coworking-space-xnimrodx-lineal-color-xnimrodx.png"
                              alt="" />
                          </div>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">Lập Trình</p>
                      </td>
                      <td>
                        <p class="text-sm">Lập Trình Front-End, Lập Trình Back-End, Fullstack Engineer,...</p>
                      </td>
                      <td>
                        <div class="action justify-content-center">
                          <span class="status-btn success-btn">Active</span>
                        </div>
                      </td>
                      <td>
                        <div class="action justify-content-center icon purple">
                          <button class="text-gray" style="font-size:20px;">
                            <i class="lni lni-pencil-alt fw-bold"></i>
                          </button>
                          <button class="text-gray" style="font-size:20px;">
                            <i class="lni lni-trash-can fw-bold"></i>
                          </button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <h6 class="text-sm">#3</h6>
                      </td>
                      <td>
                        <div class="product">
                          <div class="image">
                            <img
                              src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxIQDxAPDxEVEBAQDQ8PDxAQFRUQDQ0PFRIWFxUVFRUYHiggGRslGxUVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0NFRAPGisdHR0tLS0rKysrKysrLSstKzc3LSstKy0tLS0tKzcrKy0tLS0rLSstKy0rKystLS0tKystLf/AABEIAOEA4QMBIgACEQEDEQH/xAAcAAEAAgMBAQEAAAAAAAAAAAAABgcBBAUDAgj/xABPEAABAwEBCAoPBQYFBQAAAAAAAQIDBBEFBxITITFR0QYUFzVBU1RhkZMVIjJjcXSBkpSho7Gys9JCUnPB8BYzYnKEoiMlQ3WCRGTC4fH/xAAYAQEBAQEBAAAAAAAAAAAAAAAAAQIDBP/EACIRAQACAgIBBAMAAAAAAAAAAAABEQISAyExBBMyQSJRYf/aAAwDAQACEQMRAD8AvEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADm7I7rsoqSerkRXNgidIrW909eBqeFVRPKB0gUJJfzrLVspaZqW5EcsiqieG1Leg+d3Ot5PS+0+stC/QUFu51vJ6X2n1jdzreT0vtfrJQv0FBbudbyel9r9Y3cq3k9L7X6wL9BQe7lW8npfa/WN3Gt5PS+1+sC/AUHu41vJ6X2v1jdxreT0vtfrAvwFCbuNbyel9r9ZjdxreT0vtfrAvwFB7uNbyel9r9Y3cq3k9L7X6wL8BQW7lW8npfa/WN3Ot5PS+1+sUL9BQO7nW8npfa/WN3Ot5PS+1+stC/gUDu51vJ6X2v1ht/OtX/p6VeZMbb8YoX8DgbBtkzbp0MdWjMW5XPjkjtwkZIxbFsXhTMqeE75AAAAAAAAAInfX3kr/AMBPmNJYRK+xvJdDxdPjaBVN6OnY+Orw2NfZJDZhNR1nav0k/wBoRcUzzG6iDXmWqsVZZxsHwvLGxK6D3cVaQ8nJe0tFaCLio/MbqPnaMXFR+Y3Ub+JXQYWFdB1uHOpaO0YuKj8xuobRi4qPzG6jbWMJGXpO2ntGLio/MbqG0YuKZ5jdRu4szgoOk7aXY+Lio/MbqPpKCLio/MbqNtTFg6GptCLio/MbqMpQxcVH5jdRtYJnBHR21doRcVH5jdRnaEXFR+Y3UbJki21koIuKj8xuoztKLio/MbqNiwzYSoW2ttKLio/MbqMbRi4qPzG6jbsFg6GrtGLio/MbqIbfWpmMuexWsa1duRJa1qNWzFy8KIT2whN95P8ALmeOw/LlMclay3x/KEmvDbz/ANbUf+JYxXN4Tef+tqfe0sY8EvYAAAAAAAAESvsbyXQ8XT42ktIlfY3juh4unxtArK8m+yKt/Fg+B5ZSyqVreSbbFW/jQfA8svFns461h5uS9pfOOUwsh9YsYs6dOfbzVT5VD2xZnFluEqWuqGME2cWMWNjVr2DBNjFmcWNjVr4JnAPfAGATZdXjgDAPfAMpGNjVr4JnBNjFjAGxq18Ezgmxiz6SMmy6tZGEIvxNsuazx6H5cpYSQkDv0x2XMYv/AH8Py5Tnnl+Mt4Y9w7l4Tef+tqfe0sYrm8JvP/W1PvQsY8j0gAAAAAAABEr7G8d0PF0+NpLSJX2d47oeLp8bQK5vEtthrvxqf4Hlo4orG8JI1tPdF73IxrZ6dXOcqNY1MW/Oq5EJZdW+Lc+C1rHuqX5O1p24TcvfHKjFTwKp3wmapzyiLSLFjFkLS+I9+WOjRG8CvmtcvkRmTpU9oL4OWyWlsTSyS1ehWp7zdyzUJbihijnXO2WUk1iJJinL9mZMD+61W+s7iNtS1MqLlRUyoqE2ldYamKGKNvAGANk1amKGKNvAGANjVqYszizawBgDZdWqkZ9JEbGAZxY2NWtizGLNrAGASzVrYszgGxgGcAWatdGEBv3p/lbPH4PlzFjYBXt/Ntlymf7hB8uYzlPTUR26V4TeZPHKn3oWMVzeE3mTxyp96FjHFsAAAAAAAAIjfZ3juh4unxtJcRG+1vHdDxdPmNAoTYZsanrmTLC6NEikjRWyvVlrla6xW5FTMinRrdiNbDarqdzmt+1ErZv7WKrulDtXlP3Vblai46CxHLZb2rsxZCwuVciss0JgqvlVbDM+oywmvp0jhxyi1QXHr8FcW/IqZFRcip4UO5NTI9trSd1tymTWY6Nkqfx2OsXS1y9snkU537MRt/d4cfMjlkZ/dl9Z0x9VjPmKYn0+X12rypa5im3cnZFPTr/hSuYluVttrF8LVyL0Enujsac5O1VHc9mBb0kOuncWeG1XRvRv3kaqt85Mh2x5MMvEuOXHlj5hP7k3xUWxKmNF/jiyL5WrkXpQl1zrv0tRZi5m2r9h64D+h2fyWn56WVUPuOvc3hLOMJGUv0vgDAKEuVsyqYLEjmciJ9m3CZ5q5CX3LvnvyJNGyTnS2N35p6jM4S3GcLLwDOARyh2eUcndK6Jf4kwm9LcvqO3S3Xp5f3c8blXMmEiO81cpmbhqKl74BnAPR72tS1yo1NKqiJ6zRnu1TszzNX+Xt/W3IhFmobWAMA4VTstiTuGK7nd2vqynJqdl71VURWt/lS31qajGWJzxhM8AYBW1Rspl4JXIum1bOfIeDdlU7f8AVctulVsQukp7kLRwCub/AAn+Ux/7hB8uY+Ydns7bLcF/M5Mq9FhGr6Wy7blz2QOiwHNrIZMJFVWrZHIllnl0kywmIWM4lNbwm8yeOVPvQsYrm8JvMnjlT70LGOLYAAAAAAAARG+1vHdD8BPmNJcRG+1vHdD8BvzGAVBemfZHV5LbZIfJ2ryf4Vv65yF3l4cOKt5pYM1lvcOzWqhYTqNclj7ES3PYtq6Mjjzcnyl6+KfwhzsJUzKrcnAqp7jKVkjcz1z58L8jafS6XIng7VF9fhPCSmtTgcmnItmXKc3S32y6klnA7Si2WqnlPRt1Et7ZnlRM6HLqaZG8KszWIvcW+FTwZDK7uI3OtXgTBanPauQsRZNN+rpqOf8AewsVV4VbY/yOSxfWcWbYZRPVVjke3mR6K1POS31nQjuRUrbhIxE4LcrkTnynp+z8y55GpbzKqnXH3I8W5ZRxz5cj9h4U4XuTSi5PUfbNiECZnM/5ulb+Vh149jkiWW1Tks4GNRvvOjDc7BstkfJZwvVv5Ih6McuX7p58seL6tw4tiWS2PEO0du93vRT7/Z2ob3LYv+Lv/SEitVAkx3iZeeYRae5VYn+jbnyscxbM+ZMK05dStTH3ccjMvCxU6FJ/thTO2FLtKaqwfVu4Vd0HktWvPz5CyKighk7qNPC3tfccuo2MsW1WO85PzTUXYpCNtrwqvRYfDqr9ZU/Ik8+xeT7KIvlSw1f2YmX7FnlQuxq4W2fJz5Tj7J5sKBE7834XE5ZsNlX7rfC78ktODfB2NupaJsrpEdbUxMwWotiWtkXOvgM5ZdSuMdrJvCbzJ45Ue9CxiuLwe8yeOVHvQsc8zsAAAAAAAAEQvt7x3Q/Ab8xhLyIX3N47ofgN+awCnr1EzWxVaK5UtlhsRMiu7V5Pn3RRtmZUzWq5M2mz9Zyv71lDHKyqWRiPVskOCq8CYLifNufDb+6b5URTnlwzlNu+HLEYxA27Ua5cJqKmTIqKvgPpla53cRudoXIjelT2jja3M1E0WIiHs136zKI9P+5X3v4820jnd1Y1qpY5qphKqaPAdCkjbGxGMSxqZkNdsh9pIdMeOMfDGWc5eW4jzKSGskhnGGmWzhIFahrYwwsxUe7o0PhYkPFZzGPL2lQ9cUgxR5Y4ykw7SoemKM4vnPPHGcaW5Kh6YBlGnnjTKSi0qHqiEHvx72s8eh+XKTXGkIvwPtuazx2H5comeiknvB7zJ45Ue9CxyuLwe8yeOVHvaWOclAAAAAAAACIX3N47ofgs+awl5Eb7MauuJXtaiuVYW2IiWqv+KzgApu9ZWxRR1WNlZGqyRYOMe1iuRGutswlS0nK3XpuUw9bHrKMW58/ES9U/UfC3On4iXq36jVqvbsxTcpg62PWZ7MU3KYetj1lDdjpuIl6t+odj5uJk6t+oWWvpLs03KYOtj+o+uzVNymHrY/qKD7HzcTJ1b9Q7Hy8TJ1b9QstfvZum5TD1sesdnKblMPWx6ygtoS8TJ1b9QS583EydW/ULLX52cpuUw9bHrMLdum5TD1sf1FCbQl4mTq36htCXiZOrfqLZa+Vu3Tcph62PWOzdNymHrWayhtoy8TJ1b9Q2hNxMnVv1C0Xx2apuUw9bHrMdm6flMPWs+oojaMvEydW/UNoTcTJ1b9Q2F79nKflMPWs1js5Tcoh62PWUR2Pm4mTq36htCXiZOrfqGwvjs5T8ph62P6h2dpuUw9bHrKG2hLxMnVv1DaEvEydW/UNkX0l3ablMPWx6yKXzbpxS0LWxzRyO23E7BY9r3WIyTLYi5sqFY7Rm4mTq36j7Sim4mTq36hORT9D3g95v62o97Sxyurw8bm3HRHNVq7cqFsciotlreBSxTCgAAAAAAcrZDd2KiixkmVXWpGzMsjkTTwJpX35gNq6d0Y6aNZZXYLUyImdz3fdanCpV2yXZBLVraqWRtX/DiTM3ncvCvP0c/Ouvd91TIskr7VzNa3uI26Gp+rTRdUNX7XMaiB4uYq9s5FVf5cidJ4Pp7citVeezIhtLO3SfO226QPBIFRO5V2Rbc6LbzW/mvlMxUtlqpkyL2qoti81qWp7vKe6VTdJnbrdIGttRFVbWq3wJajsnBw9KeRRLTpltRVtyYWZcudVt/wDpsuq26TynmwlTtksTTp/XvA8drtsRMiomnJYnNnCUrcq2586cC5bcuqwyi/xJ0n0n8zfXqA8tqNWzgVOFMtnkyB1I1f1l/XOe1v8AE3pPnGJ95APJ1K2zTk4cyJbm4QlI3T0ZUVenJ5D2w00oMNPvJ6wNfajeDJZoX1jabV5stlqqlqp5MpsI9PvIMJPvIB4JQW5kV2fLnRETnzjsdktsXSqIirl4M+Q3IZUS3tksU98e373kA5e0F0Ki2ZM+jmMbQ4MFciaM/RlOpthv3jC1TeFQObtJUzIq+Dg6T1jp1atqIttuVFS1HeU3Uq2aQlY3hUDp7Hrry0j0kiWxF/eROtwZE0KmnQqZulC17h3aiq48ONbHJZjI17uNefm0LwlLpWN06TYorrrDI2WGRWPbmXgVNCpwotmYULyBwdi2yWOuYtljZmIiyMTKli/aauhelPWveMgAABz7sXGhq2YudquYio5ERVSxyZlycJ0ABElvdUH3Zeuk1nwt7ag0TddJrJgAIat7Sg7/ANfJrMbmdB3/AK+TWTMAQzcyoO/+kSaxuZUHf/SJNZMwBDNzKg7/AOkSaxuZUHf/AEiTWTMAQzcyoO/+kSaxuZUHf/SJNZMwBDNzKg7/AOkSaxuZUHf/AEiTWTMAQzcyoO/+kSaxuZUHf/SJNZMwBDNzKg7/AOkSaxuZUHf/AEiTWTMAQzcyoO/9fJrG5lQd/wCvk1kzAEM3MqDv/XyaxuZUHf8A0iTWTMAQzcyoO/8AXyaxuZUHf+vk1kzAEN3M6Dv/AF8msyl7Wg0TdfJrJiAOPcPY3T0WFtdHNw7FdhPc/CszW2nYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD//Z"
                              alt="" />
                          </div>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">Lập Trình</p>
                      </td>
                      <td>
                        <p class="text-sm">Lập Trình Front-End, Lập Trình Back-End, Fullstack Engineer,...</p>
                      </td>
                      <td>
                        <div class="action justify-content-center">
                          <span class="status-btn success-btn">Active</span>
                        </div>
                      </td>
                      <td>
                        <div class="action justify-content-center icon purple">
                          <button class="text-gray" style="font-size:20px;">
                            <i class="lni lni-pencil-alt fw-bold"></i>
                          </button>
                          <button class="text-gray" style="font-size:20px;">
                            <i class="lni lni-trash-can fw-bold"></i>
                          </button>
                        </div>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <h6 class="text-sm">#4</h6>
                      </td>
                      <td>
                        <div class="product">
                          <div class="image">
                            <img
                              src="data:image/png;base64,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"
                              alt="" />
                          </div>
                        </div>
                      </td>
                      <td>
                        <p class="text-sm">Lập Trình</p>
                      </td>
                      <td>
                        <p class="text-sm">Lập Trình Front-End, Lập Trình Back-End, Fullstack Engineer,...</p>
                      </td>
                      <td>
                        <div class="action justify-content-center">
                          <span class="status-btn success-btn">Active</span>
                        </div>
                      </td>
                      <td>
                        <div class="action justify-content-center icon purple">
                          <button class="text-gray" style="font-size:20px;">
                            <i class="lni lni-pencil-alt fw-bold"></i>
                          </button>
                          <button class="text-gray" style="font-size:20px;">
                            <i class="lni lni-trash-can fw-bold"></i>
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
      <!-- Modal -->
      <div class="modal fade" id="ModalEditCategory" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title" id="exampleModalLabel">Edit Category</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form action="" method="">
                <div class="row justify-content-center">
                  <div class="col-11">
                    <div class="input-style-1">
                      <label>Category Name</label>
                      <input type="text" value="Hiện title category" placeholder="Type here" />
                    </div>
                  </div>
                  <div class="col-11">
                    <div class="input-style-1">
                      <label>Category Description</label>
                      <textarea placeholder="Type here" rows="2">Hiện mô tả</textarea>
                    </div>
                  </div>
                  <div class="col-11">
                    <div class="input-style-1">
                      <label>Category Image (Please copy URL Image)</label>
                      <textarea placeholder="Type here" rows="5">Hiện link</textarea>
                    </div>
                  </div>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="main-btn light-btn btn-hover btn-sm" data-bs-dismiss="modal">Close</button>
              <button type="button" class="main-btn warning-btn btn-hover btn-sm">Save changes</button>
            </div>
          </div>
        </div>
      </div>
      <div class="modal fade" id="ModalDeleteCategory" tabindex="-1" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-sm">
          <div class="modal-content">
            <div class="modal-header justify-content-center">
              <h4 class="modal-title" id="exampleModalLabel">Are you sure?</h4>
            </div>
            <div class="modal-footer justify-content-center">
              <button type="button" class="main-btn warning-btn-outline btn-hover btn-sm"
                data-bs-dismiss="modal">No</button>
              <button type="button" class="main-btn warning-btn btn-hover btn-sm">Yes</button>
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
          "Day 7",],
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
