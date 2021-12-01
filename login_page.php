<?php
	session_start();
?>
<html>
    <head>
        <title>Example</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">       
        <link href="https://use.fontawesome.com/releases/v5.0.4/css/all.css" rel="stylesheet">    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js">
        </script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link href="login_page.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-light bg-ligh sticky-top">
            <div class="container-fluid">
                <!--a class="navbar-branch" href="#">
                    <img src="images\my-logo.png" height="100">
                </a-->&nbsp;&nbsp;
                <h3>Phòng vé máy bay Đà Lạt PV</h3>
              <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarResponsive">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                  <li class="nav-item">
                    <a class="nav-link active" href="my_index.html">Trang chính</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="my_login_page.php">Đặt vé</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="my_index.html">Khuyến mãi</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="my_login_page.php">Đăng nhập</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="my_index.html">Liên hệ</a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>
          <form class="float_form" style="padding-left: 40px" action="login_handler.php" method="POST">
            <div class="container-fluid padding" style="padding-top: 20px; padding-left: 200px;">
                <div class="row padding">
                    <div class="col-md-12 col-lg-4" >
                        <div class="container" style="background-color: rgba(255, 255, 255, 0.5);">
                            <div class="text-center">
                                <h2>
                                    <li class="fa fa-user">Đăng nhập</li>
                                </h2>
                            </div>
                            <form>
                              <div class="form-group">
                                  <label for="nameAccount">Tài khoản</label>
                                  <input type="text" class="form-control" name='username' id="nameAccount" placeholder="Nhập tên tài khoản" required>
                              </div>
                              <div class="form-group">
                                  <label for="passAccount">Mật khẩu</label>
                                  <input type="password" data-lpignore="true" class="form-control" name='password' id="passAccount" placeholder="Nhập mật khẩu" required>
                              </div>
                              <div class="form-group">
                                  <label for="typeAccount">User-type</label><br>
                                  <div class="form-check form-check-inline">
                                      <input class="form-check-input" type="radio" name="user_type" id="Customer" value="Customer">
                                      <label class="form-check-label" for="inlineRadio1">Khách hàng</label>
                                  </div>
                                  <div class="form-check form-check-inline">
                                      <input class="form-check-input" type="radio" name="user_type" id="Administrator" value="Administrator">
                                      <label class="form-check-label" for="inlineRadio1">Nhân viên</label>
                                  </div>
                              </div>
                              
                                <?php
                                    if(isset($_GET['msg']) && $_GET['msg']=='failed')
                                    {
                                        echo "<br>
                                        <strong style='color:red'>Sai tên đăng nhập hoặc mật khẩu</strong>
                                        <br><br>";
                                    }
                                ?>
                                <div class="text-center">
                                    <input class="btn btn-warning" type="submit" name="Login" value="Login">
                                </div>
                          </form>
                        </div><br><br>
                        <div class="text-center">
                            <li class="fa fa-user-plus">
                                <a class="btn btn-success" type="button" href="my_new_user.php">Đăng ký tài khoản mới</a>
                            </li>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <img src="https://www.internetically9.com/wp-content/uploads/2020/03/air_hostess-1.jpg" style="height:325px;width:500px">
                    </div>
                </div>
            </div>
          </form>
    </body>
</html>
