<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>首页：显示销量前八的蛋糕</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">	
	  addEventListener("load", function() { 
		 setTimeout(hideURLbar, 0); }, false); 
	 function hideURLbar(){ 
		window.scrollTo(0,1); } 

</script>
<!-- //Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<!-- js -->
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
<!-- //js -->
<!-- cart -->
<script src="js/simpleCart.min.js">
	
</script>
<!-- cart -->
</head>
<body>
	<!-- header -->
	<%@ include file="header.jsp"%>
	<!--//header-->

	<!--banner-->
	<div class="banner">
		<div class="container">
			<h2 class="hdng">
				Yummy <span>Cakes</span> for u
			</h2>
			<p>Our best cakes make your day special</p>
			<a href="products.jsp">SHOP NOW</a>
			<div class="banner-text">
				<img src="images/2.png" alt="" />
			</div>
		</div>
	</div>
	<!--//banner-->
	<!--gallery-->
	<div class="gallery">
		<div class="container">
			<div class="gallery-grids">
				<div class="col-md-8 gallery-grid glry-one">
					<a href="CakeByPage"><img src="images/g1.jpg"
						class="img-responsive" alt="" />
						<div class="gallery-info">
							<p>
								<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
								view
							</p>
							<a class="shop" href="CakeByPage">SHOP NOW</a>
							<div class="clearfix"></div>
						</div> </a>
					<div class="galy-info">
						<p>Lorem Ipsum is simply</p>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price">$95.00</h5>
							</div>
							<div class="rating">
								<c:forEach begin="1" end="5">
									<span>☆</span>
								</c:forEach>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<div class="col-md-4 gallery-grid glry-two">
					<a href="CakeByPage"><img src="images/g2.jpg"
						class="img-responsive" alt="" />
						<div class="gallery-info galrr-info-two">
							<p>
								<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
								view
							</p>
							<a class="shop" href="CakeByPage">SHOP NOW</a>
							<div class="clearfix"></div>
						</div> </a>
					<div class="galy-info">
						<p>Lorem Ipsum is simply</p>
						<div class="galry">
							<div class="prices">
								<h5 class="item_price">$95.00</h5>
							</div>
							<div class="rating">
								<c:forEach begin="1" end="5">
									<span>☆</span>
								</c:forEach>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<c:if test="${not empty cake }">
					<c:forEach var="cc" items="${cake }">
						<div class="col-md-3 gallery-grid ">
							<a href="CakeByPage"><img src="${cc.bigpicture }"
								class="img-responsive" alt="" />
								<div class="gallery-info">
									<p>
										<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
										view
									</p>
									<a class="shop" href="seeSingle?id=${cc.id }">SHOP NOW</a>
									<div class="clearfix"></div>
								</div> </a>
							<div class="galy-info">
								<p>${cc.c_name }</p>
								<div class="galry">
									<div class="prices">
										<h5 class="item_price">￥${cc.price }</h5>
									</div>
									<div class="rating">
										<!-- 循环五个星星 -->
										<c:forEach begin="1" end="5">
											<span>☆</span>
										</c:forEach>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
	<!--//gallery-->
	<!--subscribe-->
	<div class="subscribe">
		<div class="container">
			<h3>Newsletter</h3>
			<form>
				<input type="text" class="text" value="Email"
					onFocus="this.value = '';"
					onBlur="if (this.value == '') {this.value = 'Email';}"> <input
					type="submit" value="Subscribe">
			</form>
		</div>
	</div>
	<!--//subscribe-->

	<!-- footer -->
	<%@ include file="footer.jsp"%>
	<!-- //footer -->

</body>
</html>