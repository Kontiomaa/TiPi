<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Siirtoapu.fi -- Uusi tilaus</title>
<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/styles/style.css">
</head>
<body>
	<div class="container">

		<%@include file="navi.jsp"%>

		<div class="row">
			<div class="span2"></div>
			<div class="span8" id="area">

				<h1>Kuittaamattomat</h1>
				<input type=button name=nappi1 value=Kuittaa />
				<h1>Kuitatut</h1>
				<input type=button name=nappi2 value=Haettu />
				<h1>Haetut</h1>
				<input type=button name=nappi3 value=Viety />
				<h1>Viedyt</h1>
				<input type=button name=nappi4 value=Palautettu />
				<h1>Palautetut</h1>
				<input type=button name=nappi5 value=Valmis />

			</div>
			<div class="span2"></div>
		</div>
	</div>
</body>
</html>