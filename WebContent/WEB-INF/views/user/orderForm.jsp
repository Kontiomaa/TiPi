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
				<form:form modelAttribute="orderForm" method="post"
					class="form-horizontal">
					<fieldset>
						<legend>Tilauslomake - Auto</legend>
						<div class="control-group">
							<form:label path="carBrand" class="control-label" for="textinput">Automerkki*</form:label>
							<div class="controls">
								<form:input path="carBrand" name="textinput"
									placeholder="esim Audi" class="input-xxlarge" type="text" />
							</div>
						</div>

						<div class="control-group">
							<form:label path="carModel" class="control-label" for="textinput">Automalli*</form:label>
							<div class="controls">
								<form:input path="carModel" name="textinput"
									placeholder="esim A5" class="input-xxlarge" type="text" />
							</div>
						</div>

						<div class="control-group">
							<form:label path="carRegister" class="control-label"
								for="textinput">Rekisterinumero*</form:label>
							<div class="controls">
								<form:input path="carRegister" name="textinput"
									placeholder="esim ABC-123" class="input-xxlarge" type="text" />
							</div>
						</div>

						<div class="control-group">
							<form:label path="carColor" class="control-label" for="textinput">Auton väri</form:label>
							<div class="controls">
								<form:input path="carColor" name="textinput"
									placeholder="esim Musta" class="input-xxlarge" type="text" />
							</div>
						</div>
						<%-- 
						<legend>Nouto</legend>

						<div class="control-group">
							<form:label path="collectionDate" class="control-label" for="textinput">Noudettavissa
								Päivämäärä</form:label>
							<div class="controls">
								<form:input path="collectionDate" name="textinput"
									placeholder="pp.kk.vvvv esim 15.03.2008" class="input-xxlarge"
									type="text" />
								<p class="help-block">Jos noudettavissa heti. Jätä tyhjäksi</p>
							</div>
						</div>

						<div class="control-group">
							<form:label path="collectionTime" class="control-label" for="textinput">Noudettavissa
								kellonaika</form:label>
							<div class="controls">
								<form:input path="collectionTime" name="textinput"
									placeholder="tt:mm esim 12:00" class="input-xxlarge"
									type="text" />
								<p class="help-block">Jos noudettavissa heti. Jätä tyhjäksi</p>
							</div>
						</div>

						<div class="control-group">
							<form:label path="collectionAddress" class="control-label" for="textinput">Nouto
								osoite*</form:label>
							<div class="controls">
								<form:input path="collectionAddress" name="textinput"
									placeholder="esim Valtakatu 54b" class="input-xxlarge"
									type="text" />
							</div>
						</div>

						<div class="control-group">
							<form:label path="collectionPostalCode" class="control-label" for="textinput">Nouto
								postinumero*</form:label>
							<div class="controls">
								<form:input path="collectionPostalCode" name="textinput" placeholder="esim 00100"
									class="input-xxlarge" type="text" />
							</div>
						</div>

						<div class="control-group">
							<form:label path="collectionCity" class="control-label" for="textinput">Nouto
								toimipaikka*</form:label>
							<div class="controls">
								<form:input path="collectionCity" name="textinput"
									placeholder="esim Helsinki" class="input-xxlarge" type="text" />
							</div>
						</div>

						<div class="control-group">
							<form:label path="destinationDate" class="control-label" for="textinput">Perillä
								päivämäärä*</form:label>
							<div class="controls">
								<form:input path="destinationDate" name="textinput"
									placeholder="pp.kk.vvvv esim 16.03.2008" class="input-xxlarge"
									type="text" />
							</div>
						</div>

						<div class="control-group">
							<form:label path="destinationTime" class="control-label" for="textinput">Perillä
								kellonaika*</form:label>
							<div class="controls">
								<form:input path="destinationTime" name="textinput"
									placeholder="tt:mm esim 14:00" class="input-xxlarge"
									type="text" />
							</div>
						</div>

						<div class="control-group">
							<form:label path="destinationAddress" class="control-label" for="textinput">Toimitus
								osoite*</form:label>
							<div class="controls">
								<form:input path="" name="textinput"
									placeholder="esim Yhdystie 32a 54" class="input-xxlarge"
									type="text" />
							</div>
						</div>

						<div class="control-group">
							<form:label path="destinationPostalCode" class="control-label" for="textinput">Toimitus
								postinumero*</form:label>
							<div class="controls">
								<form:input path="destinationPostalCode" name="textinput" placeholder="esim 01300"
									class="input-xxlarge" type="text" />
							</div>
						</div>

						<div class="control-group">
							<form:label path="destinationCity" class="control-label" for="textinput">Toimitus
								toimipaikka*</form:label>
							<div class="controls">
								<form:input path="" name="textinput" placeholder="esim Vantaa"
									class="input-xxlarge" type="text" />
							</div>
						</div>

						<legend>Asiakkaan tiedot</legend>

						<div class="control-group">
							<form:label path="" class="control-label" for="textinput">Etunimi*</form:label>
							<div class="controls">
								<form:input path="" name="textinput" placeholder="esim Matti"
									class="input-xxlarge" type="text" />
							</div>
						</div>

						<div class="control-group">
							<form:label path="" class="control-label" for="textinput">Sukunimi*</form:label>
							<div class="controls">
								<form:input path="" name="textinput"
									placeholder="esim Meikäläinen" class="input-xxlarge"
									type="text" />
							</div>
						</div>

						<div class="control-group">
							<form:label path="" class="control-label" for="textinput">Puhelinnumero*</form:label>
							<div class="controls">
								<form:input path="" name="textinput"
									placeholder="esim 0400123123" class="input-xxlarge" type="text" />
							</div>
						</div>

						<div class="control-group">
							<form:label path="" class="control-label" for="textinput">Yritys</form:label>
							<div class="controls">
								<form:input path="" name="textinput"
									placeholder="esim Autoliike OY" class="input-xxlarge"
									type="text" />
							</div>
						</div>

						<legend>Toimituksen lisätiedot</legend>
						<div class="control-group">
							<form:label path="" class="control-label" for="textarea">Lisätiedot</form:label>
							<div class="controls">
								<textarea rows="3" name="textarea"
									class="input-xxlarge"></textarea>
							</div>
						</div>

						<legend>Palautus</legend>

						<div class="control-group">
							<form:label path="" class="control-label" for="textinput">Noudettavissa
								päivämäärä*</form:label>
							<div class="controls">
								<form:input path="" name="textinput"
									placeholder="pp.kk.vvvv esim 18.03.2008" class="input-xxlarge"
									type="text" />
							</div>
						</div>

						<div class="control-group">
							<form:label path="" class="control-label" for="textinput">Noudettavissa
								kellonaika*</form:label>
							<div class="controls">
								<form:input path="" name="textinput"
									placeholder="tt:mm esim 12:00" class="input-xxlarge"
									type="text" />
							</div>
						</div>

						<div class="control-group">
							<form:label path="" class="control-label" for="textinput">Perillä
								päivämäärä*</form:label>
							<div class="controls">
								<form:input path="" name="textinput"
									placeholder="pp.kk.vvvv esim 20.03.2008" class="input-xxlarge"
									type="text" />
							</div>
						</div>

						<div class="control-group">
							<form:label path="" class="control-label" for="textinput">Perillä
								kellonaika*</form:label>
							<div class="controls">
								<form:input path="" name="textinput"
									placeholder="tt:mm esim 15:00" class="input-xxlarge"
									type="text" />
							</div>
						</div>

						<div class="control-group">
							<form:label path="" class="control-label" for="textinput">Toimitus
								osoite</form:label>
							<div class="controls">
								<form:input path="" name="textinput"
									placeholder="esim Kesäkatu 95" class="input-xxlarge"
									type="text" />
								<p class="help-block">Jos sama kuin noudettaessa. Jätä
									tyhjäksi</p>
							</div>
						</div>

						<div class="control-group">
							<form:label path="" class="control-label" for="textinput">Toimitus
								postinumero</form:label>
							<div class="controls">
								<form:input path="" name="textinput" placeholder="esim 02100"
									class="input-xxlarge" type="text" />
								<p class="help-block">Jos sama kuin noudettaessa. Jätä
									tyhjäksi</p>
							</div>
						</div>

						<div class="control-group">
							<form:label path="" class="control-label" for="textinput">Toimitus
								toimipaikka</form:label>
							<div class="controls">
								<form:input path="" name="textinput" placeholder="esim Espoo"
									class="input-xxlarge" type="text" />
								<p class="help-block">Jos sama kuin noudettaessa. Jätä
									tyhjäksi</p>
							</div>
						</div>

						<legend>Palautuksen lisätiedot</legend>
						<div class="control-group">
							<form:label path="" class="control-label" for="textarea">Lisätiedot</form:label>
							<div class="controls">
								<textarea rows="3" name="textarea"
									class="input-xxlarge"></textarea>
							</div>
						</div>
						 --%>
						<a href="orderFormEmpty" class="btn btn-danger">Tyhjennä</a>
						<button type="submit" class="btn btn-inverse">Lähetä
							tilaus</button>
					</fieldset>
				</form:form>

			</div>
			<div class="span2"></div>
		</div>
	</div>
</body>
</html>