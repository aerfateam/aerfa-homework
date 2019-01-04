<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<title>Products</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<!-- //Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/own.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<!-- the jScrollPane script -->
<script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" id="sourcecode">
	$(function() {
		$('.scroll-pane').jScrollPane();
	});
</script>
<script type="text/javascript">
	/* 页面刷新时的状态 */
	$(document).ready(
			function() {
				var type = $.cookie('type');
				$(":radio[name='radio'][value='" + type + "']").prop("checked",
						"checked");
				var size = $.cookie('size');
				$('#search_text').val(size);
			});

	/* 搜索满足类型条件的蛋糕 */
	$(function() {
		$(":radio")
				.click(
						function() {
							var radio = $(this).val();
							console.log("radio:" + radio);
							//得到搜索框的值
							var search_word = document
									.getElementById("search_text").value;
							location.href = "CakeByPage?pageNum=1" + "&type="
									+ radio + "&search_word=" + search_word;
						});
	});
	/* 按大小搜索 */
	function search_word() {
		var type = $("input[name='radio']:checked").val();
		var search_word = $("#search_text").val();
		location.href = "CakeByPage?pageNum=1" + "&type=" + type
				+ "&search_word=" + search_word;
	}
	
	/* 加购物车 */
	function addCake(id){
		var count =$(".item_quantity").val();
		//如果数量小于1，默认填错了，改为1
		if (count<1) {
			count=1;
		}
		location.href = "addCart?id=" +id+ "&count=" + count;
	}
</script>

</head>
<body>
	<!-- header -->
	<%@ include file="header.jsp"%>
	<!--//header-->

	<!--products-->
	<div class="products">
		<div class="container">
			<h2>Our Products</h2>
			<div class="col-md-9 product-model-sec">
				<c:if test="${empty page.list }">
					<h1>没有相关的商品</h1>
				</c:if>
				<c:if test="${not empty page.list }">
					<c:forEach var="cake" items="${page.list }">
						<div class="product-grid">
							<a href="seeSingle?id=${cake.id }">
								<div class="more-product">
									<span> </span>
								</div>
								<div class="product-img b-link-stripe b-animate-go  thickbox">
									<img src="${cake.bigpicture }" class="img-responsive" alt="">
									<div class="b-wrapper">
										<h4 class="b-animate b-from-left  b-delay03">
											<button>View</button>
										</h4>
									</div>
								</div>
							</a>
							<div class="product-info simpleCart_shelfItem">
								<div class="product-info-cust prt_name">
									<h4>${cake.c_name }#1</h4>
									<span class="item_price">￥${cake.price }</span>
									<div class="ofr">
										<p class="pric1">
											<del>￥${cake.price }</del>
										</p>
										<p class="disc">[15% Off]</p>
									</div>
									<input type="text" class="item_quantity" value="1" /> <input
										type="button" class="item_add items" value="Add"
										onclick="addCake(${cake.id });">
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="col-md-3 rsidebar span_1_of_left">
				<!-- 按分类搜索 -->
				<section class="sky-form">
					<h4>
						<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>BY
						TYPE

					</h4>
					<div class="row row1 scroll-pane">
						<div class="col col-4">
							<input type="radio" name="radio" value="Friend" />Friend
						</div>
						<div class="col col-4">
							<input type="radio" name="radio" value="Lover">Lover
						</div>
						<div class="col col-4">
							<input type="radio" name="radio" value="Sister">Sister
						</div>
						<div class="col col-4">
							<input type="radio" name="radio" value="Brother">Brother
						</div>
						<div class="col col-4">
							<input type="radio" name="radio" value="Kids">Kids
						</div>
						<div class="col col-4">
							<input type="radio" name="radio" value="Parents">Parents
						</div>
						<div class="col col-4">
							<input type="radio" name="radio" value="Chocolate">Chocolate
						</div>
						<div class="col col-4">
							<input type="radio" name="radio" value="HeartShaped">HeartShaped
						</div>
						<div class="col col-4">
							<input type="radio" name="radio" value="RoundShape">RoundShape
						</div>
					</div>
				</section>
				<!-- 按大小搜索 -->
				<section class="sky-form">
					<h4>
						<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
						SEARCH BY SIZE
					</h4>
					<div>size:2~7</div>
					<input type="text" id="search_text" name="search"> <input
						type="button" class="search_sub" value="Search"
						onclick="search_word();">
				</section>
			</div>
		</div>
		<div class="page">
			第${page.currentPageNum }页，共有${page.totalCount }条数据，一共${page.totalPageNum }页
			<a
				href="CakeByPage?pageNum=1&type=${cookie.type.value }&search_word=${cookie.size.value }">首页</a>
			<a
				href="CakeByPage?pageNum=${page.prePageNum }&type=${cookie.type.value }&search_word=${cookie.size.value }">上一页</a>
			<a
				href="CakeByPage?pageNum=${page.nextPageNum }&type=${cookie.type.value }&search_word=${cookie.size.value }">下一页</a>
			<a
				href="CakeByPage?pageNum=${page.totalPageNum }&type=${cookie.type.value }&search_word=${cookie.size.value }">末页</a>
		</div>
		<div class="clearfix"></div>
	</div>
	<!--//products-->

	<!-- footer -->
	<%@ include file="footer.jsp"%>
	<!-- //footer -->

</body>
</html>