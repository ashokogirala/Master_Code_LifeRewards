<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Login Page</title>
<meta charset="UTF-8" />
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/structure.css">
</head>
<body>	
	<form class="box login" action="login" validate="true">
		<fieldset class="boxBody">
			<title>LIFE REWARDS CARD SYSTEM</title>
			 <label><s:textfield
					name="username" key="label.username" size="20" required="required"
					tabindex="1" placeholder="PremiumPixel" /></label>
			 <label><a href="#" class="rLink" tabindex="5">Forget your password?</a>
			<s:password name="password" key="label.password" size="20"
					tabindex="2" required="required" /></label>

		</fieldset>
		
		<footer>
			<label><input type="checkbox" tabindex="3">Keep me
				logged in</label> <s:submit method="execute" key="label.login" align="center" class="btnLogin" value="Login" tabindex="4"/>
				<s:if test="hasActionErrors()">
		<div class="errors">
			<s:actionerror />
		</div>
		</s:if>
		</footer>
	</form>
	<!-- <footer id="main">
  <a href="http://wwww.cssjunction.com">Simple Login Form (HTML5/CSS3 Coded) by CSS Junction</a> | <a href="http://www.premiumpixels.com">PSD by Premium Pixels</a>
</footer> -->
</body>
</html>
