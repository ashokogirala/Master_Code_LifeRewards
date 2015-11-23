<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<%
	String client = (String) request.getAttribute("clientId");
%>
<html>
<head>
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

#nav li a:hover, #nav li a:focus {
	color: #fff;
	background: blue;
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

<body onload="formFill();">
<div id="header"
		style="border: 0px 0px 0px 0px; padding: 15px 0px 0px 0px;">

		<img src="images/logo.png" alt="Smiley face"
			height="150" width="200">
		<h3>LIFE REWARDS CARDS SYSTEM</h3>
		<ul id="nav">
			<li><a href="/LifeRewardsCard/MainMenu.jsp">home</a></li>
		</ul>
	</div>
	<h3>Policy Program Search</h3>

	<s:form action="searchPolicy">
		<s:div class="table">
		
			<s:textfield name="customerId" label="CUSTOMER ID" />
			<s:textfield name="lifewardsCard" label="LIFE WARDS CARD NUMBER" size="20"/>
			<s:textfield name="clientNo" label="CLIENT NUMBER" size="20"/>			
			<s:textfield name="policyCode" label="REFERRING POLICY NO" size="20"/>
			<s:textfield name="doc" label="INCEPTION DATE" size="20"/>
			<s:textfield name="product" label="COVER" size="45" />			
			<s:textfield name="expiryDate" label="TERMINATION DATE" />
			<tr>
				<td><s:submit value="search" theme="simple" /></td>
				<td><s:submit type="button" theme="simple" onclick="clear();return false;"
						value="clear" /></td>
			</tr>
		</s:div>
	</s:form>

</body>
</html>