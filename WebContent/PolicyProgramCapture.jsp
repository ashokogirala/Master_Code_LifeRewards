<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE HTML>
<%
	String client = (String) request.getAttribute("clientId");
%>
<html>
<head>
<sj:head />
<style type="text/css">
h3 {
	font-family: Calibri;
	font-size: 22pt;
	font-style: normal;
	font-weight: bold;
	color: SlateBlue;
	text-align: center;
	text-decoration: underline
}

table {
	font-family: Calibri;
	color: #000066;
	font-size: 11pt;
	font-style: normal;
	text-align:;
	background-color: #CCCCFF;
	border-collapse: collapse;
	border: 2px solid navy;
	text-align:;
}

table.inner {
	border: 0px
}

table {
	margin: 0 auto;
}

.errorsBg {
	background-color: #CCCCFF;
	color: red;
}

.errorMessage {
	padding: 0px 8px;
}

table {
	border-spacing: 4px;
}

td {
	padding: 4px;
}

div.header {
	position: fixed;
	bottom: 0;
	right: 100;
	width: 300px;
	border: 3px solid #8AC007;
}

#nav {
	text-align: right;
}

#nav li {
	display: inline;
	margin: 0 1 0 0;
}

#nav li a {
	padding: 5px 15px;
	font-weight: bold;
	color: #ccc;
	color: blue;
	text-shadow: 0 1px 1px rgba(0, 0, 0, 0.5);
	-webkit-border-radius: 14px;
	-moz-border-radius: 14px;
	border-radius: 14px;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

#nav li a:hover,#nav li a:focus {
	color: #fff;
	background: blue;
}

.box {
	padding: 20px;
	display: none;
	margin-top: 20px;
	border: 1px solid #000;
}

.red {
	background: #ff0000;
}

.green {
	background: #00ff00;
}

.blue {
	background: #0000ff;
}
</style>
<script type="text/javascript">
function clear()
{
document.getElementsByName('policyNo')[0].value = "";
document.getElementsByName('lifewardsCard')[0].value = "";
document.getElementsByName('clientNo')[0].value = "";
document.getElementsByName('policyCode')[0].value = "";
document.getElementsByName('doc')[0].value = "";
document.getElementsByName('product')[0].value = "";
document.getElementsByName('expiryDate')[0].value = "";
}

function changeStyle() {
		var v1 ="<%=client%>";
		if (!(v1 == "null")) {
			document.getElementsByName('clientNo')[0].value = v1;
			alert("client " + v1 + " registered successfully");
		}
	}
</script>
</head>

<body onload="changeStyle();" style="background-color: white">
	<div id="header"
		style="border: 0px 0px 0px 0px; padding: 15px 0px 0px 0px;">

		<img src="images/logo.png" alt="Smiley face"
			height="150" width="200">
		<h3>LIFE REWARDS CARDS SYSTEM</h3>
		<ul id="nav">
			<li><a href="/LifewardsCard/MainMenu.jsp">home</a></li>
		</ul>
	</div>

	<h3>Policy Program Capturing</h3>
	<s:form action="capturePolicyPrgm">
		<s:div class="table">
			<s:textfield name="clientNo" label="CLIENT NUMBER" size="20" />
			<s:textfield name="lifewardsCard" label="LIFE REWARDS CARD NUMBER"
				size="20" />
			<s:textfield name="policyCode" label="REFERRING POLICY NO" size="20" />
			<s:select name="companyName" label="COMPANY"
				list="{'BIHL','BLIL','BIFM','LG'}" />
			<sj:datepicker name="doc" displayFormat="dd-M-yy" changeYear="true"
				label="COMMENCEMENT DATE" yearRange="1995:2015" changeMonth="true" />
			<s:select name="product" label="COVER ID"
				list="{'Card Holder','Spouse','Child 22-25 Yrs','Child 16-21 Yrs','Child 6-15 Yrs','Child 0-5(incl.Stillborn)'}" />
			<sj:datepicker name="expiryDate" displayFormat="dd-M-yy"
				changeYear="true" label="TERMINATION DATE" yearRange="2015:2050"
				changeMonth="true" />				
			<s:textfield name="premium" label="PREMIUM" />
			<tr>
				<td><s:submit value="SavePolicy" theme="simple" action="savePolicy"/></td>
				<td><s:submit type="button" theme="simple"
						onclick="clear();return false;" value="clear" /></td>
			</tr>
		</s:div>
		<div class="red box">
			You have selected <strong>red option</strong> so i am here
		</div>
	</s:form>

</body>
</html>