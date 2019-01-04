<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<title>注册Account</title>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript">
	
			
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 


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
<script src="js/simpleCart.min.js"></script>
<!-- cart -->

<script type="text/javascript">
	/* 判断昵称是否被占用 */
	function checkName(re) {
		var req = false;
		var name = $("#nickName").val();
		if (name == "") {
			$("#checkName").text("昵称为空");
			req = false;
		} else {
			$.ajax({
				url : "judgeUseName?name=" + name,
				async : re,
				type : "POST",
				success : function(res) {
					if (res == "ok") {
						$("#checkName").text("昵称可用");
						req = true;
					} else {
						$("#checkName").text("昵称已被占用");
						req = false;
					}
				}
			});
		}
		return req;
	}

	/* 判断邮箱是否被占用 */
	function judgeUseEmail(re) {
		var req = false;
		var email = $("#EmailAddress").val();
		if (email == "") {
			$("#judgeUseEmail").text("邮箱为空");
			req = false;
		} else {
			$.ajax({
				url : "judgeUseEmail?EmailAddress=" + email,
				async : re,
				type : "POST",
				success : function(res) {
					if (res == "ok") {
						$("#judgeUseEmail").text("邮箱可用");
						req = true;
					} else {
						$("#judgeUseEmail").text("邮箱已被注册过");
						req = false;
					}
				}
			});
		}
		return req;
	}

	/* 判断密码是否为空  */
	function judgeEmptyPassword() {
		var pass = $("#password1").val();
		if (pass == "") {
			$("#judgeEmptyPassword").text("密码为空");
			return false;
		} else {
			$("#judgeEmptyPassword").text("密码可用");
			return true;
		}
	}

	/* 判断密码与确认密码是否一致 */
	function judgeSavePassword() {
		var pass = $("#password1").val();
		var pass1 = $("#password2").val();
		if (pass != pass1) {
			$("#judgeSavePassword").text("确认密码与密码不一致");
			return false;
		} else {
			$("#judgeSavePassword").text("确认密码与密码一致");
			return true;
		}
	}

	/* 检查是否可以正常提交 */
	function judgeCorrect(re) {
		/* 如果所有的都满足，正常提交 */
		if (checkName(re) && judgeUseEmail(re) && judgeEmptyPassword()
				&& judgeSavePassword()) {
			return true;
		} else {
			return false;
		}
	}
</script>
</head>
<body>
	<!-- header -->
	<%@ include file="header.jsp"%>
	<!--//header-->

	<!--account-->
	<div class="account">
		<div class="container">
			<div class="register">
				<form action="register" method="post"
					onSubmit="return judgeCorrect(false);">
					<div class="register-top-grid">
						<h3>Personal information</h3>
						<div class="input">
							<!-- 昵称 -->
							<span>NickName<label>*</label></span> <input type="text"
								name="NickName" id="nickName" onblur="checkName(true);">
							<span id="checkName" style="color: red; font-size: 14px"></span>
						</div>
						<div class="input">
							<!-- 邮箱 -->
							<span>Email Address<label>*</label></span> <input type="text"
								name="EmailAddress" id="EmailAddress"
								onblur="judgeUseEmail(true);"> <span id="judgeUseEmail"
								style="color: red; font-size: 14px"></span>
							<!-- 密码 -->
							<div class="register-bottom-grid">
								<div class="input">
									<span>Password<label>*</label></span> <input type="password"
										name="password1" id="password1" onblur="judgeEmptyPassword();">
									<span id="judgeEmptyPassword"
										style="color: red; font-size: 14px"></span>
								</div>
								<!-- 确认密码 -->
								<div class="input">
									<span>Confirm Password<label>*</label></span> <input
										type="password" name="password2" id="password2"
										onblur="judgeSavePassword();"> <span
										id="judgeSavePassword" style="color: red; font-size: 14px"></span>
								</div>
							</div>
							<div class="clearfix"></div>
							<div class="register-but">
								<input type="submit" value="submit">
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--//account-->

	<!-- footer -->
	<%@ include file="footer.jsp"%>
	<!-- //footer -->

</body>
</html>