<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Checkout</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- //Custom Theme files -->
<link href="css/own.css" type="text/css" rel="stylesheet" media="all">
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
<script>
	/* 点击删除的商品 */
	$(function() {
		$(".close1").click(function() {
			$(this).parent().fadeOut('slow', function() {
				$(this).remove();
			});
		});
	});
	
	/* 购买 */
	function buyCake(id,count){
		$(this).remove();
		location.href = "BuyCake?c_id=" +id+ "&count="
		+ count;
	}
</script>
</head>
<body>
	<!-- header -->
	<%@ include file="header.jsp"%>
	<!--//header-->

	<!--cart-items-->
	<div class="cart-items">
		<div class="container">
			<h2>My Shopping Cart</h2>
			<c:if test="${not empty cart }">
				<c:forEach var="container" items="${cart.container }">
					<div class="cart-header">
						<div class="close1"></div>
						<div class="cart-sec simpleCart_shelfItem">
							<div class="cart-item cyc">
								<img src="${container.value.cake.bigpicture }"
									class="img-responsive" alt="">
							</div>
							<div class="cart-item-info">
								<h3>
									<a href="#"> Lorem Ipsum is not simply </a><span>cake
										name:${container.value.cake.c_name }</span>
								</h3>
								<ul class="qty">
									<li><p>count:</p></li>
									<li><p>${container.value.count }</p></li>
								</ul>
								<div class="delivery">
									<p>
										Charges : <span>${container.value.cake.price } *
											${container.value.count } =</span>
									</p>
									<p>${container.value.count * container.value.cake.price }</p>
									<div class="clearfix"></div>
								</div>
								<button class="buy"
									onclick="buyCake(${container.value.cake.id },${container.value.count });">购买</button>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
	<!--//checkout-->

	<!-- footer -->
	<%@ include file="footer.jsp"%>
	<!-- //footer -->

</body>
</html>