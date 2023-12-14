<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Alazea - Gardening &amp; Landscaping HTML Template</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/scss/style.css">

    

</head>

<body>
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-circle"></div>
        <div class="preloader-img">
            <img src="img/core-img/leaf.png" alt="">
        </div>
    </div>

    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(img/bg-img/24.jpg);">
            <h2>SHOP DETAILS</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item"><a href="#">Shop</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Shop Details</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Single Product Details Area Start ##### -->
    <section class="single_product_details_area mb-50">
        <div class="produts-details--content mb-50">
            <div class="container">
                <div class="row justify-content-between">

                    <div class="col-12 col-md-6 col-lg-5">
                        <div class="single_product_thumb">
                            <div id="product_details_slider" class="" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <a class="product-img" href="img/bg-img/49.jpg" title="Product Image">
                                        <img class="d-block w-100" src="img/bg-img/49.jpg" alt="1">
                                    </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="product-img" href="img/bg-img/49.jpg" title="Product Image">
                                        <img class="d-block w-100" src="img/bg-img/49.jpg" alt="1">
                                    </a>
                                    </div>
                                    <div class="carousel-item">
                                        <a class="product-img" href="img/bg-img/49.jpg" title="Product Image">
                                        <img class="d-block w-100" src="img/bg-img/49.jpg" alt="1">
                                    </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-6">
                        <div class="single_product_desc">
                            <h4 class="title">Recuerdos Plant</h4>
                            <h4 class="price">$9.99</h4>
                            <div class="short_overview">
                                <p>상품내용 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus pellem malesuada in nibh selama euismod. Curabitur a rhoncus dui. Nunc lobortis cursus magna utrum faucibus. Vivamus justo nibh, pharetra non risus accumsan, tincidunt suscipit leo.</p>
                            </div>

                            <div class="products--meta" style="padding-top: 0px;">
                                <p><span>작물종류</span> <span>CT201807</span></p>
                                <p><span>교환여부</span> <span>Outdoor Plants</span></p>
                                <p><span>거래지역</span> <span>plants, green, cactus </span></p>
                            </div>

                            <div class="cart--area d-flex flex-wrap align-items-center" style="padding-top: 50px;">
                                <!-- 찜, 문의하기, 구매하기 버튼 -->
                                <div>
                                    <button type="submit" name="addtocart" value="5" class="btn alazea-btn ml-15"><i class="icon_heart_alt"></i> 찜</button>
                                </div>
                                <div>
                                    <button type="submit" name="addtocart" value="5" class="btn alazea-btn ml-15">1:1 문의하기</button>
                                </div>
                                <form class="cart clearfix d-flex align-items-center" method="post">
                                    <button type="submit" name="addtocart" value="5" class="btn alazea-btn ml-15">구매하기</button>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="product_details_tab clearfix">
                        <!-- Tabs -->
                        <ul class="nav nav-tabs" role="tablist" id="product-details-tab">
                            <li class="nav-item">
                                <p style="font-size: 22px; color: #70c745;">Reviews</p>
                            </li>
                        </ul>
                        <!-- Tab Content -->
                        <div class="tab-content">
                            <div role="tabpanel" class="" id="reviews">
                                <div class="submit_a_review_area mt-50">
                                    <h4>Submit A Review</h4>
                                    <form action="#" method="post">
                                        <div class="row">
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label for="name">Nickname</label>
                                                    <input type="email" class="form-control" id="name" placeholder="Nazrul">
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="comments">Comments</label>
                                                    <textarea class="form-control" id="comments" rows="5" data-max-length="150"></textarea>
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <button type="submit" class="btn alazea-btn">Submit Your Review</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>

                        <br><br>
                        <!-- 수정/삭제 -->
                        <div class="pupdatebtn" align="center">
                            <button type="submit" name="addtocart" value="5" class="btn alazea-btn-orange ml-15">수정하기</button>
                            <button type="submit" name="addtocart" value="5" class="btn alazea-btn-gray ml-15">삭제하기</button>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Single Product Details Area End ##### -->

    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
</body>

</html>