<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>마이페이지</title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="resources/jisu/css/bootstrap.min.css" rel="stylesheet" />
  <link href="resources/jisu/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="resources/jisu/demo/demo.css" rel="stylesheet" />
</head>
<body>
	<div class="wrapper">
    <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="" class="simple-text logo-mini">
         <div class="logo-image-small">
            <img src="resources/jisu/img/apple-icon.png">
         </div> 
        </a>
        <a href="" class="simple-text logo-normal">
          작은농장
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li>
            <a href="mypage.me">
              <i class="nc-icon nc-circle-10"></i>
              <p>회원정보수정</p>
            </a>
          </li>
          <li>
            <a href="diary.me">
              <i class="nc-icon nc-calendar-60"></i>
              <p>영농일지 작성</p>
            </a>
          </li>
          <li>
            <a href="follow.me">
              <i class="nc-icon nc-favourite-28"></i>
              <p>팔로우목록</p>
            </a>
          </li>
          <li>
            <a href="trade.me">
              <i class="nc-icon nc-diamond"></i>
              <p>거래목록</p>
            </a>
          </li>
          <li>
            <a href="board.me">
              <i class="nc-icon nc-single-copy-04"></i>
              <p>내가 쓴 게시글</p>
            </a>
          </li>
          <li class="active ">
            <a href="reply.me">
              <i class="nc-icon nc-single-copy-04"></i>
              <p>내가 쓴 댓글</p>
            </a>
          </li>
          <li>
            <a href="delete.me">
              <i class="nc-icon nc-simple-remove"></i>
              <p>회원탈퇴</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    
    <div class="main-panel" style="height: 100vh;">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-absolute fixed-top navbar-transparent">
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <a class="navbar-brand">내가 쓴 댓글</a>
          </div>
        </div>
      </nav>
      
      <!-- mainContent -->
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <h3 class="description">우히</h3>
          </div>
        </div>
      </div>
      <footer class="footer" style="position: absolute; bottom: 0; width: -webkit-fill-available;">
        <div class="container-fluid">
          <div class="row">
            <nav class="footer-nav">
              <ul>
                <li><a href="">Creative Tim</a></li>
                <li><a href="">Blog</a></li>
                <li><a href="">Licenses</a></li>
              </ul>
            </nav>
            <div class="credits ml-auto">
              <span class="copyright">
                © 2020, made with <i class="fa fa-heart heart"></i> by Creative Tim
              </span>
            </div>
          </div>
        </div>
      </footer>
    </div>
   </div>
    
  <!--   Core JS Files   -->
  <script src="resources/jisu/js/core/jquery.min.js"></script>
  <script src="resources/jisu/js/core/popper.min.js"></script>
  <script src="resources/jisu/js/core/bootstrap.min.js"></script>
  <script src="resources/jisu/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="resources/jisu/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="resources/jisu/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="resources/jisu/js/paper-dashboard.min.js?v=2.0.1" type="text/javascript"></script>
</body>
</html>
