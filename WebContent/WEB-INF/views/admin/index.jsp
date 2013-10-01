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
			<div class="row-fluid" id="area">
			<div class="row-fluid">
			<div class="span12">
			<div class="navbar">
				<div class="navbar-inner">
				<div class="row-fluid">
					<div class="span6 offset3">
						<ul class="nav">
							<!-- <li><a href="#">Tilaukset</a></li> Tilaukset ovat etusivulla, tarvitaan vain alalinkit -->
							<li><a class="btn-inverse" href="#">Uudet</a></li>
							<li><a href="#">Tilatut</a></li>
							<li><a href="#">Haettu</a></li>
							<li><a href="#">Palautettavat</a></li>
							<li><a href="#">Hoidetut</a></li>
						</ul>
					</div>
					</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span10 offset1">

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
			</div>
		</div>
	</div>
</body>
</html>