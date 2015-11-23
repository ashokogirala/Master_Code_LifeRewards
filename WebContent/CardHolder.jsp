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
</style>
<script type="text/javascript">
function clear()
{
document.getElementsByName('custIdNum')[0].value = "";
document.getElementsByName('passport')[0].value = "";
document.getElementsByName('country')[0].value = "";
document.getElementsByName('firstName')[0].value = "";
document.getElementsByName('middleName')[0].value = "";
document.getElementsByName('lastName')[0].value = "";
document.getElementsByName('dob')[0].value = "";
document.getElementsByName('officeNo')[0].value = "";
document.getElementsByName('mobileNo')[0].value = "";
document.getElementsByName('homeNo')[0].value = "";
document.getElementsByName('email')[0].value = "";
document.getElementsByName('postalId')[0].value = "";
document.getElementsByName('address')[0].value = "";
document.getElementsByName('state')[0].value = "";
document.getElementsByName('city')[0].value = "";
document.getElementsByName('clientNo')[0].value = "";
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

<body style="background-color: white" onload="changeStyle();">
	<div id="header"
		style="border: 0px 0px 0px 0px; padding: 15px 0px 0px 0px;">

		<img src="images/logo.png" alt="Smiley face" height="150" width="200">
		<h3>LIFE REWARDS CARDS SYSTEM</h3>
		<ul id="nav">
			<li><a href="/LifeRewardsCard/MainMenu.jsp">home</a></li>
		</ul>
	</div>
	<h3>Card Holder Details</h3>
	<s:actionerror />
	<s:form action="registerClient">
		<s:div class="table">
			<s:textfield name="clientNo" label="CLIENT ID" />
			<s:textfield name="custIdNum" label="CUSTOMER ID NUMBER" />
			<s:textfield name="passport" label="PASSPORT NUMBER" />
			<s:select name="country" label="NATIONALITY"
				list="{'BOTSWANA','NIGERIA','KENYA','S AFRICA','ZIMBABWE'}" />
			<s:textfield name="firstName" label="FIRST NAME" />
			<s:textfield name="middleName" label="MIDDLE NAME" />
			<s:textfield name="lastName" label="LAST NAME" />			
			<sj:datepicker id="2" name="dob" displayFormat="dd-M-yy"
				changeYear="true" label="DATE OF BIRTH"  yearRange="1915:2015" changeMonth="true" />
			<s:radio list="{'male','female'}" name="gender" label="GENDER"></s:radio>
			<s:textfield name="officeNo" label="OFFICE NUMBER" value="(+267)"/>
			<s:textfield name="mobileNo" label="MOBILE NUMBER" value="(+267)"/>
			<s:textfield name="homeNo" label="HOME NUMBER" value="(+267)"/>
			<s:textfield name="email" label="EMAIL ID" />
			<s:textfield name="postalId" label="POSTAL CODE" />
			<s:textfield name="city" label="CITY" />
			<s:textarea name="address" label="ADDRESS" />
			<s:textfield name="state" label="STATE" />
			<tr align="center">
				<td colspan="2"><s:submit value="next" theme="simple" /></td>
				<td align="left"><s:submit type="button" theme="simple"
						onclick="clear();return false;" value="Reset" /></td>
			</tr>
		</s:div>
	</s:form>

</body>
</html>