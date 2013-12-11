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
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }


    </style>

</head>
<body>

	<div class="container">
		<div class="row">
			<div class="span4"></div>
			<div class="span4">
				<form class="form-signin" action="j_spring_security_check"
					method="post">
					<h2 class="form-signin-heading">TiPi-Beta<br />Kirjaudu sisään</h2>
					<c:if test="${not empty loginerror}">
						<p class="alert alert-error">Kirjautuminen epäonnistui</p>
					</c:if>

					<c:if test="${not empty loggedout}">
						<p class="alert alert-success">Uloskirjautuminen onnistui</p>
					</c:if>
					<input type='text' name='j_username' value=''
						class="input-block-level" placeholder="Sähköposti"> <input
						type="password" name='j_password' class="input-block-level"
						placeholder="Salasana">
					<!--  <label class="checkbox">
         <input type="checkbox" value="remember-me"> Remember me
        </label>  -->
					<button class="btn btn-large btn-inverse" type="submit">Kirjaudu</button>
					<br />
					<b>Testatut selaimet:</b>
					<img alt="Google Chrome" src="resources/logos/chrome-30.png">
					<img alt="Firefox" src="resources/logos/firefox-32-noshadow.png">
					<img alt="Internet Exporer 10" src="resources/logos/ie10-102.jpg">
				</form>
			</div>
		</div>
	</div>
	<div class="span4"></div>

</body>
</html>
