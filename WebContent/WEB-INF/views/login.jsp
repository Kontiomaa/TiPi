<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<meta charset="utf-8">
<title>Siirtoapu.fi -- Kirjaudu sisään</title>
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="span4"></div>
			<div class="span4">
				<form class="form-signin" action="j_spring_security_check"
					method="post">
					<h2 class="form-signin-heading">Kirjaudu sisään</h2>
					<c:if test="${not empty loginerror}">
						<p class="alert alert-error">Sisäänkirjautuminen epäonnistui.
							Käyttäjätunnus tai salasana on syötetty väärin.</p>
					</c:if>

					<c:if test="${not empty loggedout}">
						<p class="alert alert-success">Uloskirjautuminen onnistui</p>
					</c:if>
					<input type='text' name='j_username' value=''
						class="input-block-level" placeholder="Käyttäjätunnus"> <input
						type="password" name='j_password' class="input-block-level"
						placeholder="Salasana">
					<!--  <label class="checkbox">
         <input type="checkbox" value="remember-me"> Remember me
        </label>  -->
					<button class="btn btn-large btn-inverse" type="submit">Kirjaudu</button>
				</form>
			</div>
		</div>
	</div>
	<div class="span4"></div>

</body>
</html>
