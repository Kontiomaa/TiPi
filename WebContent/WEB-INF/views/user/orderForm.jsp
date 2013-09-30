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
<link rel="stylesheet"
	href="../resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../resources/styles/style.css">
<link rel="stylesheet" href="../resources/datepicker/css/datepicker.css">
<link rel="stylesheet"
	href="../resources/bootstrap-timepicker-master/css/bootstrap-timepicker.min.css">

</head>
<body>
	<div class="container">
		<%@include file="userNavi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="span10 offset1">
				<form:form modelAttribute="orderForm" method="post"
					class="form-horizontal">
					<fieldset>
						<legend>Tilauslomake - Auto</legend>
						<div class="row-fluid">
							<div class="span6">
								<div class="control-group">
									<form:label path="carBrand" class="control-label"
										for="textinput">Automerkki*</form:label>
									<div class="controls">
										<form:input path="carBrand" name="textinput"
											placeholder="esim Audi" class="input-xlarge" type="text" />
									</div>
								</div>

								<div class="control-group">
									<form:label path="carModel" class="control-label"
										for="textinput">Automalli*</form:label>
									<div class="controls">
										<form:input path="carModel" name="textinput"
											placeholder="esim A5" class="input-xlarge" type="text" />
									</div>
								</div>
							</div>
							<div class="span6">
								<div class="control-group">
									<form:label path="carRegister" class="control-label"
										for="textinput">Rekisterinumero*</form:label>
									<div class="controls">
										<form:input path="carRegister" name="textinput"
											placeholder="esim ABC-123" class="input-xlarge" type="text" />
									</div>
								</div>

								<div class="control-group">
									<form:label path="carColor" class="control-label"
										for="textinput">Auton väri</form:label>
									<div class="controls">
										<form:input path="carColor" name="textinput"
											placeholder="esim Musta" class="input-xlarge" type="text" />
									</div>
								</div>
							</div>
						</div>
						<legend>Nouto</legend>
						<div class="row-fluid">
							<div class="span6">
								<div class="control-group">
									<form:label path="collectionDate" style="padding-right: 8px;"
										class="control-label" for="textinput">Nouto aika*</form:label>
									<div class="input-append date span4" id="collectionDate"
										data-date="" data-date-format="dd.mm.yyyy">
										<form:input path="collectionDate" class="span8" type="text"
											value="" readonly="true" />
										<span class="add-on"><i class="icon-calendar"></i></span>
									</div>

									<div style="padding-left: 5px;"
										class="input-append bootstrap-timepicker">
										<form:input path="collectionTime" id="collectionTime"
											type="text" class="input-small" />
										<span class="add-on"> <i class="icon-time"></i>
										</span>
									</div>

								</div>
								<div class="control-group">
									<form:label path="collectionAddress" class="control-label"
										for="textinput">Nouto
								osoite*</form:label>
									<div class="controls">
										<form:input path="collectionAddress" name="textinput"
											placeholder="esim Valtakatu 54b" class="input-xlarge"
											type="text" />
									</div>
								</div>

								<div class="control-group">
									<form:label path="collectionPostalCode" class="control-label"
										for="textinput">Nouto
								postinumero*</form:label>
									<div class="controls">
										<form:input path="collectionPostalCode" name="textinput"
											placeholder="esim 00100" class="input-xlarge" type="text" />
									</div>
								</div>

								<div class="control-group">
									<form:label path="collectionCity" class="control-label"
										for="textinput">Nouto
								toimipaikka*</form:label>
									<div class="controls">
										<form:input path="collectionCity" name="textinput"
											placeholder="esim Helsinki" class="input-xlarge" type="text" />
									</div>
								</div>
							</div>
							<div class="span6">
								<div class="control-group">
									<form:label path="collectionDate" style="padding-right: 8px;"
										class="control-label" for="textinput">Toimitus aika*</form:label>
									<div class="input-append date span4" id="destinationDate"
										data-date="" data-date-format="dd.mm.yyyy">

										<form:input path="destinationDate" class="span8" type="text"
											value="" readonly="true" />
										<span class="add-on"><i class="icon-calendar"></i></span>
									</div>

									<div class="input-append bootstrap-timepicker">
										<form:input path="destinationTime" id="destinationTime"
											type="text" class="input-small" />
										<span class="add-on"> <i class="icon-time"></i>
										</span>
									</div>
								</div>
								<div class="control-group">
									<form:label path="destinationAddress" class="control-label"
										for="textinput">Toimitus
								osoite*</form:label>
									<div class="controls">
										<form:input path="destinationAddress" name="textinput"
											placeholder="esim Yhdystie 32a 54" class="input-xlarge"
											type="text" />
									</div>
								</div>

								<div class="control-group">
									<form:label path="destinationPostalCode" class="control-label"
										for="textinput">Toimitus
								postinumero*</form:label>
									<div class="controls">
										<form:input path="destinationPostalCode" name="textinput"
											placeholder="esim 01300" class="input-xlarge" type="text" />
									</div>
								</div>

								<div class="control-group">
									<form:label path="destinationCity" class="control-label"
										for="textinput">Toimitus
								toimipaikka*</form:label>
									<div class="controls">
										<form:input path="destinationCity" name="textinput"
											placeholder="esim Vantaa" class="input-xlarge" type="text" />
									</div>
								</div>
							</div>
						</div>
						<legend>Asiakkaan tiedot</legend>
						<div class="row-fluid">
							<div class="span6">
								<div class="control-group">
									<form:label path="clientFname" class="control-label"
										for="textinput">Etunimi*</form:label>
									<div class="controls">
										<form:input path="clientFname" name="textinput"
											placeholder="esim Matti" class="input-xlarge" type="text" />
									</div>
								</div>

								<div class="control-group">
									<form:label path="clientLname" class="control-label"
										for="textinput">Sukunimi*</form:label>
									<div class="controls">
										<form:input path="clientLname" name="textinput"
											placeholder="esim Meikäläinen" class="input-xlarge"
											type="text" />
									</div>
								</div>
							</div>
							<div class="span6">

								<div class="control-group">
									<form:label path="clientPhoneNo" class="control-label"
										for="textinput">Puhelinnumero*</form:label>
									<div class="controls">
										<form:input path="clientPhoneNo" name="textinput"
											placeholder="esim 0400123123" class="input-xlarge"
											type="text" />
									</div>
								</div>

								<div class="control-group">
									<form:label path="clientCompany" class="control-label"
										for="textinput">Yritys</form:label>
									<div class="controls">
										<form:input path="clientCompany" name="textinput"
											placeholder="esim Autoliike OY" class="input-xlarge"
											type="text" />
									</div>
								</div>
							</div>
						</div>
						<legend>Toimituksen lisätiedot</legend>
						<div class="control-group">
							<form:label path="additionalInformation" class="control-label"
								for="textarea">Lisätiedot</form:label>
							<div class="controls">
								<form:textarea path="additionalInformation" rows="3"
									name="textarea" class="input-xxlarge"></form:textarea>
							</div>
						</div>

						<legend>Palautus</legend>
						<div id="returnArea">
							<div class="row-fluid">
								<div class="span6">
									<div class="control-group">
										<form:label path="nextDestinationCollectionDate"
											style="padding-right: 8px;" class="control-label"
											for="textinput">Nouto aika*</form:label>
										<div class="input-append date span4"
											id="nextDestinationCollectionDate" data-date=""
											data-date-format="dd.mm.yyyy">
											<form:input path="nextDestinationCollectionDate"
												class="span8" type="text" value="" readonly="true" />
											<span class="add-on"><i class="icon-calendar"></i></span>
										</div>

										<div style="padding-left: 5px;"
											class="input-append bootstrap-timepicker">
											<form:input path="nextDestinationCollectionTime"
												id="nextDestinationCollectionTime" type="text"
												class="input-small" />
											<span class="add-on"> <i class="icon-time"></i>
											</span>
										</div>

									</div>

									<div class="control-group">
										<form:label path="nextDestinationDate"
											style="padding-right: 8px;" class="control-label"
											for="textinput">Palautus aika*</form:label>
										<div class="input-append date span4" id="nextDestinationDate"
											data-date="" data-date-format="dd.mm.yyyy">
											<form:input path="nextDestinationDate" class="span8"
												type="text" value="" readonly="true" />
											<span class="add-on"><i class="icon-calendar"></i></span>
										</div>

										<div style="padding-left: 5px;"
											class="input-append bootstrap-timepicker">
											<form:input path="nextDestinationTime"
												id="nextDestinationTime" type="text" class="input-small" />
											<span class="add-on"> <i class="icon-time"></i>
											</span>
										</div>
									</div>

								</div>
								<div class="span6">
									<b class="span11 offset1">Jätä nämä tyhjäksi, jos osoite on
										sama kuin noudettaessa</b>
									<div class="control-group">
										<form:label path="nextDestinationAddress"
											class="control-label" for="textinput">Palautus
								osoite</form:label>
										<div class="controls">
											<form:input path="nextDestinationAddress" name="textinput"
												placeholder="esim Kesäkatu 95" class="input-xlarge"
												type="text" />
										</div>
									</div>

									<div class="control-group">
										<form:label path="nextDestinationPostalCode"
											class="control-label" for="textinput">Palautus
								postinumero</form:label>
										<div class="controls">
											<form:input path="nextDestinationPostalCode" name="textinput"
												placeholder="esim 02100" class="input-xlarge" type="text" />
										</div>
									</div>

									<div class="control-group">
										<form:label path="nextDestinationCity" class="control-label"
											for="textinput">Palautus
								toimipaikka</form:label>
										<div class="controls">
											<form:input path="nextDestinationCity" name="textinput"
												placeholder="esim Espoo" class="input-xlarge" type="text" />
										</div>
									</div>
								</div>
							</div>
							<legend>Palautuksen lisätiedot</legend>
							<div class="control-group">
								<form:label path="nextAdditionalInformation"
									class="control-label" for="textarea">Lisätiedot</form:label>
								<div class="controls">
									<form:textarea path="nextAdditionalInformation" rows="3"
										name="textarea" class="input-xxlarge"></form:textarea>
								</div>
							</div>
						</div>
						<a href="orderFormEmpty" class="btn btn-danger">Tyhjennä</a>
						<button type="submit" class="btn btn-inverse">Seuraava</button>
					</fieldset>
				</form:form>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript"
		src="../resources/datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="../resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="../resources/bootstrap-timepicker-master/js/bootstrap-timepicker.min.js"></script>
	<script type="text/javascript">
		var nowTemp = new Date();
		var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp
				.getDate(), 0, 0, 0, 0);

		var checkin = $('#collectionDate').datepicker({
			onRender : function(date) {
				return date.valueOf() < now.valueOf() ? 'disabled' : '';
			}
		}).on('changeDate', function(ev) {
			if (ev.date.valueOf() > checkout.date.valueOf()) {
				var newDate = new Date(ev.date);
				newDate.setDate(newDate.getDate());
				checkout.setValue(newDate);
			}
			if (ev.date.valueOf() > nextCheckin.date.valueOf()) {
				var newDate = new Date(ev.date);
				newDate.setDate(newDate.getDate());
				nextCheckin.setValue(newDate);
			}
			if (ev.date.valueOf() > nextCheckout.date.valueOf()) {
				var newDate = new Date(ev.date);
				newDate.setDate(newDate.getDate());
				nextCheckout.setValue(newDate);
			}
			checkin.hide();
			$('#destinationDate')[0].focus();
			$('#nextCheckin')[0].focus();
			$('#nextCheckout')[0].focus();
		}).data('datepicker');

		var checkout = $('#destinationDate')
				.datepicker(
						{
							onRender : function(date) {
								return date.valueOf() < checkin.date.valueOf() ? 'disabled'
										: '';
							}
						}).on('changeDate', function(ev) {
					if (ev.date.valueOf() > nextCheckin.date.valueOf()) {
						var newDate = new Date(ev.date);
						newDate.setDate(newDate.getDate());
						nextCheckin.setValue(newDate);
					}
					if (ev.date.valueOf() > nextCheckout.date.valueOf()) {
						var newDate = new Date(ev.date);
						newDate.setDate(newDate.getDate());
						nextCheckout.setValue(newDate);
					}
					checkout.hide();
					$('#nextCheckin')[0].focus();
					$('#nextCheckout')[0].focus();
				}).data('datepicker');

		var nextCheckin = $('#nextDestinationCollectionDate')
				.datepicker(
						{
							onRender : function(date) {
								return date.valueOf() < checkout.date.valueOf() ? 'disabled'
										: '';
							}
						}).on('changeDate', function(ev) {
					nextCheckin.hide();
					if (ev.date.valueOf() > nextCheckout.date.valueOf()) {
						var newDate = new Date(ev.date);
						newDate.setDate(newDate.getDate());
						nextCheckout.setValue(newDate);
					}
					$('#nextCheckout')[0].focus();
				}).data('datepicker');

		var nextCheckout = $('#nextDestinationDate')
				.datepicker(
						{
							onRender : function(date) {
								return date.valueOf() < nextCheckin.date
										.valueOf() ? 'disabled' : '';
							}
						}).on('changeDate', function(ev) {
					nextCheckout.hide();
				}).data('datepicker');

		var checkinTime = $('#destinationTime').timepicker({
			minuteStep : 15,
			showMeridian : false
		});

		var checkoutTime = $('#collectionTime').timepicker({
			minuteStep : 15,
			showMeridian : false
		});

		var nextCheckinTime = $('#nextDestinationCollectionTime').timepicker({
			minuteStep : 15,
			showMeridian : false
		});

		var nextCheckoutTime = $('#nextDestinationTime').timepicker({
			minuteStep : 15,
			showMeridian : false
		});
	</script>
</body>
</html>