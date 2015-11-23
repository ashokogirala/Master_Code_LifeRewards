<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE HTML>
<%
	Boolean card = (Boolean) request.getAttribute("regSuccess");
	String prgmId = (String) request.getAttribute("prgmId");
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
</style>
<script type="text/javascript">
function clear()
{
document.getElementsByName('clientNo')[0].value = "";
document.getElementsByName('lifewardsCard')[0].value = "";
document.getElementsByName('cardExpiryDate')[0].value = "";
document.getElementsByName('status')[0].value = "";
}

function onLoadCardDetails() {	
var v1 ="<%=card%>";
var v2="<%=prgmId%>";
		if (!(v1 == "null")) {
			alert("Card Details Captured Successfully");
			clear();
		}
		if (!(v2 == "null")) {
			alert("card holder Policy program details Captured Successfully ");
		}
	}
</script>
</head>
<body onload="onLoadCardDetails();">
	<div id="header"
		style="border: 0px 0px 0px 0px; padding: 15px 0px 0px 0px;">

		<img src="images/logo.png" height="150" width="200">
		<h3>LIFE WARDS CARDS SYSTEM</h3>
		<ul id="nav">
			<li><a href="/LifewardsCard/MainMenu.jsp">home</a></li>
		</ul>
	</div>

	<h3>Life ward Card Details</h3>

	<s:form action="captureCardDetails">
		<s:div class="table">
			<s:textfield name="clientNo" label="CLIENT NUMBER" size="20" />
			<s:textfield name="lifewardsCard" label="LIFE WARDS CARD NUMBER"
				size="20" />			
			<sj:datepicker name="cardExpiryDate" displayFormat="dd-M-yy"
				changeYear="true" label="TERMINATION DATE"  yearRange="2015:2050" changeMonth="true" />
			<s:select name="status" label="CARD STATUS"
				list="{'Active','InActive'}" />
			<tr>
				<td><s:submit value="submit" theme="simple" /></td>
				<td><s:submit type="button" theme="simple"
						onclick="clear();return false;" value="clear" /></td>
			</tr>
		</s:div>
	</s:form>

</body>
</html>