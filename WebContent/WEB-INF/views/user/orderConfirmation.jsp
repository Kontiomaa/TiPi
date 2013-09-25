<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<title>Siirtoapu.fi -- Uusi tilaus</title>
<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="../resources/styles/style.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="navbar navbar-inverse navbar-fixed-top">
				<div class="navbar-inner">
					<div class="container">

						<ul class="nav">
							<li class="active"><a class="brand" href="#">Siirtoapu.fi</a>
							</li>
							<li><a href="orderFormEmpty">Etusivu</a></li>
							<li><a href="#">Käyttäjät</a></li>
							<li><a href="#">Rekisteröinti</a></li>
						</ul>

						<form class="navbar-form pull-right">
							<a href="../j_spring_security_logout" class="btn">Kirjaudu
								ulos</a>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="span2"></div>
			<div class="span8" id="area">
				<table class="table">
					<thead>
						<tr>
							<th colspan="2" style="font-size: 20px">Auto</th>
						</tr>
					</thead>
					<tr>
						<td>Automalli</td>
						<td><c:out value="${orderForm.carBrand}" default="-----" /></td>
					</tr>
					<tr>
						<td>Automerkki</td>
						<td><c:out value="${orderForm.carModel}" default="-----" /></td>
					</tr>
					<tr>
						<td>Rekisterinumero</td>
						<td><c:out value="${orderForm.carRegister}" default="-----" /></td>
					</tr>
					<tr>
						<td>Autoväri</td>
						<td><c:out value="${orderForm.carColor}" default="-----" /></td>
					</tr>
					<thead>
						<tr>
							<th colspan="2" style="font-size: 20px">Nouto</th>
						</tr>
					</thead>
					<tr>
						<td><a href="orderForm" class="btn btn-danger">Takaisin</a></td>
						<td>
							<button type="submit" class="btn btn-inverse">Vahvista
								tilaus</button>
						</td>
					</tr>
				</table>

			</div>
			<div class="span2"></div>
		</div>
	</div>
</body>
</html>