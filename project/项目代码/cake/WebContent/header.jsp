<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.abc.cakeonline.entity.CakeType"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <script src="js/jquery.min.js"></script> -->
<script type="text/javascript">
	/* 判断邮箱密码是否正确 */
	function checkLogin() {
		var email = $("#email").val();
		var pwd = $("#password").val();
		if (email == "" || pwd == "") {
			$("#checkLogin").text("邮箱或密码为空");
		} else {
			$.ajax({
						url : "checkLogin?EmailAddress=" + email + "&password="
								+ pwd,
						async : true,
						type : "POST",
						success : function(res) {
							var msg = eval("(" + res + ")");
							if (msg.result == "ok") {
								$("#loginForm").remove();
								var node = "<div id=loginForm style='color: red; font-size: 24px'>欢迎您！"
										+ msg.nickname + "</div>"
								$("#loginBox").append(node);
							} else {
								$("#checkLogin").text("邮箱或密码错误");
							}
						}
					});
		}
	}
</script>
<!--header-->
<div class="header">
	<div class="container">
		<nav class="navbar navbar-default" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<h1 class="navbar-brand">
					<a href="index.jsp">Yummy</a>
				</h1>
			</div>
			<!-- 三级循环 -->
			<!--navbar-header-->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="index.jsp" class="active">Home</a></li>
					<!-- 判断是否为空，不为空，显示顶级菜单 -->
					<c:if test="${not empty caketypes }">
						<c:forEach var="topType" items="${caketypes }">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">${topType.t_name }<b class="caret"></b></a>
								<ul class="dropdown-menu multi-column columns-4">
									<div class="row">
										<!-- 显示二级菜单，由于是一样的，值固定 -->
										<c:forEach var="secondType" items="${topType.childTypes }">
											<div class="col-sm-3">
												<h4>${secondType.t_name }</h4>
												<ul class="multi-column-dropdown">
													<!-- 显示二级菜单对应的子菜单，通过父级id来找 -->
													<c:forEach var="lastType" items="${secondType.childTypes }">
														<li><a class="list" href="products.jsp">${lastType.t_name }</a></li>
													</c:forEach>
												</ul>
											</div>
										</c:forEach>
									</div>
								</ul></li>
						</c:forEach>
					</c:if>
				</ul>
				<!--/.navbar-collapse-->
			</div>
			<!--//navbar-header-->
		</nav>


		<div class="header-info">
			<div class="header-right search-box">
				<a href="#"><span class="glyphicon glyphicon-search"
					aria-hidden="true"></span></a>
				<div class="search">
					<form class="navbar-form">
						<input type="text" class="form-control">
						<button type="submit" class="btn btn-default"
							aria-label="Left Align">Search</button>
					</form>
				</div>
			</div>
			<div class="header-right login">
				<a href="#"><span class="glyphicon glyphicon-user"
					aria-hidden="true"></span></a>
				<div id="loginBox">
					<!-- 判断是否已经登录过登录 -->
					<c:if test="${not empty user }">
						<div id=loginForm style='color: red; font-size: 24px'>欢迎您！${user.nickname }</div>
					</c:if>
					<c:if test="${empty user }">
						<form id="loginForm">
							<span id="checkLogin" style="color: red; font-size: 14px"></span>
							<fieldset id="body">
								<fieldset>
									<label for="email">Email Address</label> <input type="text"
										name="email" id="email">
								</fieldset>
								<fieldset>
									<label for="password">Password</label> <input type="password"
										name="password" id="password">
								</fieldset>
								<input type="button" id="login" onclick="checkLogin();"
									value="Sign in" /> <label for="checkbox"><input
									type="checkbox" id="checkbox"> <i>Remember me</i></label>
							</fieldset>
							<p>
								New User ? <a class="sign" href="account.jsp">Sign Up</a> <span><a
									href="#">Forgot your password?</a></span>
							</p>
						</form>
					</c:if>
				</div>
			</div>
			<!-- 购物车 -->
			<div class="header-right cart">
				<a href="#"><span class="glyphicon glyphicon-shopping-cart"
					aria-hidden="true"></span></a>
				<div class="cart-box">
					<h4>
						<a href="checkout.jsp"> <span class="simpleCart_total">
								$0.00 </span> (<span id="simpleCart_quantity"
							class="simpleCart_quantity"> 0 </span>)
						</a>
					</h4>
					<p>
						<a href="checkout.jsp" class="simpleCart_empty">Enter cart</a>
					</p>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<!--//header-->