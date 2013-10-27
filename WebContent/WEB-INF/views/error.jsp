<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="utf-8">
<title>Siirtoapu.fi -- Kirjaudu sisään</title>
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">

<style type="text/css">
body {
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-signin {
	max-width: 300px;
	padding: 19px 29px 29px;
	margin: 0 auto 20px;
	background-color: #fff;
	border: 1px solid #e5e5e5;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}
</style>

</head>
<body>

	<div class="container">
		<div class="row">
			<div class="span4"></div>
			<div class="span4">
				<h1>Tapahtui virhe</h1>
				<form action="/TiPi/main" method="get" class="form-horizontal">
					<fieldset>
						<button type="submit" class="btn btn-inverse">Jatka
							käyttämistä</button>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<div class="span4"></div>

</body>
</html>
