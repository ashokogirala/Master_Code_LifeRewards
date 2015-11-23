<!doctype html>
<html lang=''>
<head>
<meta charset='utf-8'>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/styles.css">
<script src="script.js"></script>
<title>MainMenu</title>
<style>
body {
	background-position: right top;
	background-repeat: no-repeat;
}
</style>
<script>
	function validLogin() {
		alert("hai");
	}
	function functiontoredirect() {
		form1.action = "removeOrModify";
		form1.submit();
	}
</script>
</head>
<form name="form1" method="post">
	<body background="images/logo.png">
		<h3 style="color: blue">Life Wards Card System</h3>
		<div id='cssmenu'>
			<ul>
				<li><a href='#'><span>Home</span></a></li>
				<li class='active has-sub'><a href='#'><span>Registration
							& search</span></a>
					<ul>
						<li><a href='/LifeRewardsCard/CardHolder.jsp'><span>Registration</span></a></li>
						<li><a href='/LifeRewardsCard/CardHolderSearch.jsp'><span>Search</span></a></li>
					</ul></li>
				<li class='active has-sub'><a href='#'><span>Change
							Status</span></a>
					<ul>
						<li><a href='/LifeRewardsCard/ChangeCardStatus.jsp'><span>Change
									Card Status</span></a></li>

					</ul></li>
				<li><a href='#'><span>About</span></a></li>
				<li class='last'><a href='#'><span>Contact</span></a></li>
			</ul>
		</div>

	</body>
</form>
<html>