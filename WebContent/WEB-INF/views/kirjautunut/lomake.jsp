<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Siirtoapu.fi -- Uusi tilaus</title>
<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.css">
<style type="text/css">
body {
	padding-top: 40px;
	background-color: #f5f5f5;
}

#area {
	background-color: white;
	padding-right: 50px;
	padding-left: 50px;
}
</style>
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
							<li><a href="#">Etusivu</a></li>
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
				<form class="form-horizontal">
					<fieldset>
						<legend>Tilauslomake - Auto</legend>
						<div class="control-group">
							<label class="control-label" for="textinput">Automerkki*</label>
							<div class="controls">
								<input id="textinput" name="textinput" placeholder="esim Audi"
									class="input-xxlarge" type="text">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="textinput">Automalli*</label>
							<div class="controls">
								<input id="textinput" name="textinput" placeholder="esim A5"
									class="input-xxlarge" type="text">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="textinput">Rekisterinumero*</label>
							<div class="controls">
								<input id="textinput" name="textinput"
									placeholder="esim ABC-123" class="input-xxlarge" type="text">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="textinput">Auton väri</label>
							<div class="controls">
								<input id="textinput" name="textinput" placeholder="esim Musta"
									class="input-xxlarge" type="text">
							</div>
						</div>

						<legend>Nouto</legend>

						<div class="control-group">
							<label class="control-label" for="textinput">Noudettavissa
								Päivämäärä</label>
							<div class="controls">
								<input id="textinput" name="textinput"
									placeholder="pp.kk.vvvv esim 15.03.2008" class="input-xxlarge"
									type="text">
								<p class="help-block">Jos noudettavissa heti. Jätä tyhjäksi</p>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="textinput">Noudettavissa
								kellonaika</label>
							<div class="controls">
								<input id="textinput" name="textinput"
									placeholder="tt:mm esim 12:00" class="input-xxlarge"
									type="text">
								<p class="help-block">Jos noudettavissa heti. Jätä tyhjäksi</p>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="textinput">Nouto
								osoite*</label>
							<div class="controls">
								<input id="textinput" name="textinput"
									placeholder="esim Valtakatu 54b" class="input-xxlarge"
									type="text">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="textinput">Nouto
								postinumero*</label>
							<div class="controls">
								<input id="textinput" name="textinput" placeholder="esim 00100"
									class="input-xxlarge" type="text">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="textinput">Nouto
								toimipaikka*</label>
							<div class="controls">
								<input id="textinput" name="textinput"
									placeholder="esim Helsinki" class="input-xxlarge" type="text">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="textinput">Perillä
								päivämäärä*</label>
							<div class="controls">
								<input id="textinput" name="textinput"
									placeholder="pp.kk.vvvv esim 16.03.2008" class="input-xxlarge"
									type="text">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="textinput">Perillä
								kellonaika*</label>
							<div class="controls">
								<input id="textinput" name="textinput"
									placeholder="tt:mm esim 14:00" class="input-xxlarge"
									type="text">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="textinput">Toimitus
								osoite*</label>
							<div class="controls">
								<input id="textinput" name="textinput"
									placeholder="esim Yhdystie 32a 54" class="input-xxlarge"
									type="text">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="textinput">Toimitus
								postinumero*</label>
							<div class="controls">
								<input id="textinput" name="textinput" placeholder="esim 01300"
									class="input-xxlarge" type="text">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="textinput">Toimitus
								toimipaikka*</label>
							<div class="controls">
								<input id="textinput" name="textinput" placeholder="esim Vantaa"
									class="input-xxlarge" type="text">
							</div>
						</div>

						<legend>Asiakkaan tiedot</legend>

						<div class="control-group">
							<label class="control-label" for="textinput">Etunimi*</label>
							<div class="controls">
								<input id="textinput" name="textinput" placeholder="esim Matti"
									class="input-xxlarge" type="text">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="textinput">Sukunimi*</label>
							<div class="controls">
								<input id="textinput" name="textinput"
									placeholder="esim Meikäläinen" class="input-xxlarge"
									type="text">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="textinput">Puhelinnumero*</label>
							<div class="controls">
								<input id="textinput" name="textinput"
									placeholder="esim 0400123123" class="input-xxlarge" type="text">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="textinput">Yritys</label>
							<div class="controls">
								<input id="textinput" name="textinput"
									placeholder="esim Autoliike OY" class="input-xxlarge"
									type="text">
							</div>
						</div>

						<legend>Toimituksen lisätiedot</legend>
						<div class="control-group">
							<label class="control-label" for="textarea">Lisätiedot</label>
							<div class="controls">
								<textarea rows="3" id="textarea" name="textarea"
									class="input-xxlarge"></textarea>
							</div>
						</div>

						<legend>Palautus</legend>

						<div class="control-group">
							<label class="control-label" for="textinput">Noudettavissa
								päivämäärä*</label>
							<div class="controls">
								<input id="textinput" name="textinput"
									placeholder="pp.kk.vvvv esim 18.03.2008" class="input-xxlarge"
									type="text">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="textinput">Noudettavissa
								kellonaika*</label>
							<div class="controls">
								<input id="textinput" name="textinput"
									placeholder="tt:mm esim 12:00" class="input-xxlarge"
									type="text">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="textinput">Perillä
								päivämäärä*</label>
							<div class="controls">
								<input id="textinput" name="textinput"
									placeholder="pp.kk.vvvv esim 20.03.2008" class="input-xxlarge"
									type="text">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="textinput">Perillä
								kellonaika*</label>
							<div class="controls">
								<input id="textinput" name="textinput"
									placeholder="tt:mm esim 15:00" class="input-xxlarge"
									type="text">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="textinput">Toimitus
								osoite</label>
							<div class="controls">
								<input id="textinput" name="textinput"
									placeholder="esim Kesäkatu 95" class="input-xxlarge"
									type="text">
								<p class="help-block">Jos sama kuin noudettaessa. Jätä
									tyhjäksi</p>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="textinput">Toimitus
								postinumero</label>
							<div class="controls">
								<input id="textinput" name="textinput" placeholder="esim 02100"
									class="input-xxlarge" type="text">
								<p class="help-block">Jos sama kuin noudettaessa. Jätä
									tyhjäksi</p>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="textinput">Toimitus
								toimipaikka</label>
							<div class="controls">
								<input id="textinput" name="textinput" placeholder="esim Espoo"
									class="input-xxlarge" type="text">
								<p class="help-block">Jos sama kuin noudettaessa. Jätä
									tyhjäksi</p>
							</div>
						</div>

						<legend>Palautuksen lisätiedot</legend>
						<div class="control-group">
							<label class="control-label" for="textarea">Lisätiedot</label>
							<div class="controls">
								<textarea rows="3" id="textarea" name="textarea"
									class="input-xxlarge"></textarea>
							</div>
						</div>
						<button type="reset" class="btn btn-danger">Tyhjennä</button>
						<button type="submit" class="btn btn-inverse">Lähetä
							tilaus</button>
					</fieldset>
				</form>

			</div>
			<div class="span2"></div>
		</div>
	</div>
</body>
</html>