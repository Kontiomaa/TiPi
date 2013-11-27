<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Uusi tilaus</title>
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
					<c:if test="${not empty orderSuccessful}">
						<p class="alert alert-success">Tilaus lähetetty onnistuneesti</p>
					</c:if>
					<c:if test="${!isItValid.everythingOk}">
						<p class="alert alert-error">Tilauksen lähetys epäonnistui</p>
					</c:if>

					<!-- Tilauslomake -->
					<legend>
						Tilauslomake - Auto <i class="icon-info-sign" rel="tooltip"
							title="Täytä tähän auton tiedot"></i>
					</legend>
					<strong> * (tähdellä) merkityt kentät ovat pakollisia</strong>
					<div class="row-fluid" style="padding-top: 10px;">
						<div class="span6">
							<div class="control-group">
								<form:label path="carBrand" class="control-label"
									for="textinput">Automerkki*</form:label>
								<div class="controls span6">
									<form:input path="carBrand" name="textinput"
										placeholder="esim Audi" class="input-large" type="text" />
								</div>

								<spring:bind path="carBrand">
									<c:if test="${status.error}">
										<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="${status.errorMessage}"> x </strong>
									</c:if>
								</spring:bind>
								<%-- 
									<div class="span1">
										<form:errors path="carBrand" class="icon-ban-circle" rel="tooltip" id="blah"
											title="teksti"/></div>--%>
							</div>
							<div class="control-group">
								<form:label path="carModel" class="control-label"
									for="textinput">Automalli*</form:label>
								<div class="controls span6">
									<form:input path="carModel" name="textinput"
										placeholder="esim A5" class="input-large" type="text" />
								</div>
								<spring:bind path="carModel">
									<c:if test="${status.error}">
										<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="${status.errorMessage}"> x </strong>
									</c:if>
								</spring:bind>
							</div>
						</div>
						<div class="span6">
							<div class="control-group">
								<form:label path="carRegister" class="control-label"
									for="textinput">Rekisterinumero*</form:label>
								<div class="controls span6">
									<form:input path="carRegister" name="textinput"
										placeholder="esim ABC-123" class="input-large" type="text" />
								</div>
								<spring:bind path="carRegister">
									<c:if test="${status.error}">
										<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="${status.errorMessage}"> x </strong>
									</c:if>
								</spring:bind>
							</div>

							<div class="control-group">
								<form:label path="carColor" class="control-label"
									for="textinput">Auton väri</form:label>
								<div class="controls span6">
									<form:input path="carColor" name="textinput"
										placeholder="esim Musta" class="input-large" type="text" />
								</div>
								<spring:bind path="carColor">
									<c:if test="${status.error}">
										<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="${status.errorMessage}"> x </strong>
									</c:if>
								</spring:bind>
							</div>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span6">
							<legend>
								Nouto <i class="icon-info-sign" rel="tooltip"
									title="Täytä tähän milloin ja mistä auto on noudettavissa"></i>
							</legend>
							<div class="control-group">
								<form:label path="collectionDate" class="control-label"
									for="textinput">Aika*</form:label>
								<div class="input-append date span3" id="collectionDate"
									data-date="" data-date-format="dd.mm.yyyy">
									<form:input path="collectionDate" class="span10" type="text"
										value="" readonly="true" />
									<span class="add-on"><i class="icon-calendar"></i></span>
								</div>
								<spring:bind path="collectionDate">
									<c:if test="${status.error}">
										<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="${status.errorMessage}"> x </strong>
									</c:if>
								</spring:bind>
								<div class="input-append bootstrap-timepicker span2">
									<form:input path="collectionTime" id="collectionTime"
										type="text" class="span9" />
									<span class="add-on"> <i class="icon-time"></i>
									</span>
								</div>
								<spring:bind path="collectionTime">
									<c:if test="${status.error}">
										<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="${status.errorMessage}"> x </strong>
									</c:if>
								</spring:bind>
							</div>
							<div class="control-group">
								<form:label path="collectionAddress" class="control-label"
									for="textinput">Osoite*</form:label>
								<div class="controls span6">
									<form:input path="collectionAddress" name="textinput"
										placeholder="esim Valtakatu 54b" class="input-large"
										type="text" />
								</div>
								<spring:bind path="collectionAddress">
									<c:if test="${status.error}">
										<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="${status.errorMessage}"> x </strong>
									</c:if>
								</spring:bind>
							</div>

							<div class="control-group">
								<form:label path="collectionPostalCode" class="control-label"
									for="textinput">Postinumero*</form:label>
								<div class="controls span6">
									<form:input path="collectionPostalCode" name="textinput"
										placeholder="esim 00100" class="input-large" type="text" />
								</div>
								<spring:bind path="collectionPostalCode">
									<c:if test="${status.error}">
										<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="${status.errorMessage}"> x </strong>
									</c:if>
								</spring:bind>
							</div>

							<div class="control-group">
								<form:label path="collectionCity" class="control-label"
									for="textinput">Toimipaikka*</form:label>
								<div class="controls span6">
									<form:input path="collectionCity" name="textinput"
										placeholder="esim Helsinki" class="input-large" type="text" />
								</div>
								<spring:bind path="collectionCity">
									<c:if test="${status.error}">
										<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="${status.errorMessage}"> x </strong>
									</c:if>
								</spring:bind>
							</div>
						</div>
						<div class="span6">
							<legend>
								Toimitus <i class="icon-info-sign" rel="tooltip"
									title="Täytä tähän milloin ja missä auton pitää olla toimitettuna"></i>
							</legend>
							<div class="control-group">
								<form:label path="destinationDate" class="control-label"
									for="textinput">Aika*</form:label>
								<div class="input-append date span3" id="destinationDate"
									data-date="" data-date-format="dd.mm.yyyy">
									<form:input path="destinationDate" class="span10" type="text"
										value="" readonly="true" />
									<span class="add-on"><i class="icon-calendar"></i></span>
								</div>
								<spring:bind path="destinationDate">
									<c:choose>
										<c:when test="${status.error}">
											<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="${status.errorMessage}"> x </strong>
										</c:when>
										<c:when test="${!isItValid.collectionBeforeDestination}">
											<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="Toimitus on sama tai ennen noutoa"> x </strong>
										</c:when>
										<c:otherwise>
											<!-- Everything is ok! -->
										</c:otherwise>
									</c:choose>
								</spring:bind>
								<div class="input-append bootstrap-timepicker span2">
									<form:input path="destinationTime" id="destinationTime"
										type="text" class="span9" />
									<span class="add-on"> <i class="icon-time"></i>
									</span>
								</div>
								<spring:bind path="destinationTime">
									<c:if test="${status.error}">
										<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="${status.errorMessage}"> x </strong>
									</c:if>
								</spring:bind>
							</div>
							<div class="control-group">
								<form:label path="destinationAddress" class="control-label"
									for="textinput">Osoite*</form:label>
								<div class="controls span6">
									<form:input path="destinationAddress" name="textinput"
										placeholder="esim Yhdystie 32a 54" class="input-large"
										type="text" />
								</div>
								<spring:bind path="destinationAddress">
									<c:if test="${status.error}">
										<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="${status.errorMessage}"> x </strong>
									</c:if>
								</spring:bind>
							</div>

							<div class="control-group">
								<form:label path="destinationPostalCode" class="control-label"
									for="textinput">Postinumero*</form:label>
								<div class="controls span6">
									<form:input path="destinationPostalCode" name="textinput"
										placeholder="esim 01300" class="input-large" type="text" />
								</div>
								<spring:bind path="destinationPostalCode">
									<c:if test="${status.error}">
										<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="${status.errorMessage}"> x </strong>
									</c:if>
								</spring:bind>
							</div>

							<div class="control-group">
								<form:label path="destinationCity" class="control-label"
									for="textinput">Toimipaikka*</form:label>
								<div class="controls span6">
									<form:input path="destinationCity" name="textinput"
										placeholder="esim Vantaa" class="input-large" type="text" />
								</div>
								<spring:bind path="destinationCity">
									<c:if test="${status.error}">
										<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="${status.errorMessage}"> x </strong>
									</c:if>
								</spring:bind>
							</div>
						</div>
					</div>

					<!-- Asiakkaan tiedot -->

					<legend>
						Asiakkaan tiedot <i class="icon-info-sign" rel="tooltip"
							title="Täytä tähän toisen osapuolen tiedot"></i>
					</legend>
					<div class="row-fluid">
						<div class="span6">
							<div class="control-group">
								<form:label path="clientFname" class="control-label"
									for="textinput">Etunimi*</form:label>
								<div class="controls span6">
									<form:input path="clientFname" name="textinput"
										placeholder="esim Matti" class="input-large" type="text" />
								</div>
								<spring:bind path="clientFname">
									<c:if test="${status.error}">
										<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="${status.errorMessage}"> x </strong>
									</c:if>
								</spring:bind>
							</div>

							<div class="control-group">
								<form:label path="clientLname" class="control-label"
									for="textinput">Sukunimi*</form:label>
								<div class="controls span6">
									<form:input path="clientLname" name="textinput"
										placeholder="esim Meikäläinen" class="input-large" type="text" />
								</div>
								<spring:bind path="clientLname">
									<c:if test="${status.error}">
										<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="${status.errorMessage}"> x </strong>
									</c:if>
								</spring:bind>
							</div>
						</div>
						<div class="span6">

							<div class="control-group">
								<form:label path="clientPhoneNo" class="control-label"
									for="textinput">Puhelinnumero*</form:label>
								<div class="controls span6">
									<form:input path="clientPhoneNo" name="textinput"
										placeholder="esim 0400123123" class="input-large" type="text" />
								</div>
								<spring:bind path="clientPhoneNo">
									<c:if test="${status.error}">
										<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="${status.errorMessage}"> x </strong>
									</c:if>
								</spring:bind>
							</div>

							<div class="control-group">
								<form:label path="clientCompany" class="control-label"
									for="textinput">Yritys</form:label>
								<div class="controls span6">
									<form:input path="clientCompany" name="textinput"
										placeholder="esim Autoliike OY" class="input-large"
										type="text" />
								</div>
								<spring:bind path="clientCompany">
									<c:if test="${status.error}">
										<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="${status.errorMessage}"> x </strong>
									</c:if>
								</spring:bind>
							</div>
						</div>
					</div>

					<!-- Toimituksen lisätiedot -->
					<div class="row-fluid">
						<div class="span12">
							<legend>
								Toimituksen lisätiedot <i class="icon-info-sign" rel="tooltip"
									title="Kirjoita tähän toimitukseen liittyviä lisätietoja"></i>
							</legend>
							<form:label path="additionalInformation" class="control-label"
								for="textarea">Lisätiedot</form:label>
							<div class="controls span7">
								<form:textarea path="additionalInformation" rows="3"
									name="textarea" class="input-xxlarge"></form:textarea>
							</div>
							<spring:bind path="additionalInformation">
								<c:if test="${status.error}">
									<strong style="font-size: 200%" class="span1 text-error"
										rel="tooltip" title="${status.errorMessage}"> x </strong>
								</c:if>
							</spring:bind>
						</div>
					</div>

					<div class="row-fluid">
						<div class="span12">
							<legend>
								Palautus <i class="icon-info-sign" rel="tooltip"
									title="Rastita jos tilaukseen liittyy palautus ja täytä palautuksen tiedot"></i>
							</legend>
							<div class="control-group">
								<div class="checkbox span10 offset1 control-group">
									<form:label path="hasNewDestination">
										<form:checkbox id="hasNewDestination" type="checkbox"
											path="hasNewDestination" />
										Tilauksessa on palautus
									</form:label>
								</div>
							</div>
							<div id="returnArea" class="collapse">
								<div class="row-fluid">
									<div class="span6">
										<!-- Noutoaika -->
										<div class="control-group">
											<form:label path="nextDestinationCollectionDate"
												class="control-label span4" for="textinput">
												Noutoaika* <i class="icon-info-sign" rel="tooltip"
													title="Milloin auto on valmis haettavaksi toimituspaikasta"></i>
											</form:label>
											<div class="input-append date span4" id="nextDestinationCollectionDate"
												data-date="" data-date-format="dd.mm.yyyy">
												<form:input path="nextDestinationCollectionDate" class="span8"
													type="text" value="" readonly="true" />
												<span class="add-on"> <i class="icon-calendar"></i>
												</span>
											</div>
											<c:choose>
											<c:when test="${isItValid.valueNullNextDestinationCollectionDate}">
											<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="Valitse päivämäärä"> x </strong>
											</c:when>
											<c:when test="${!isItValid.destinationBeforeNextCollection}">
											<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="Palautuksen noutoaika on sama tai ennen toimitusaikaa"> x </strong>
											</c:when>
											<c:otherwise>
											<!-- Everything is ok! -->
											</c:otherwise>
											</c:choose>
											<div class="input-append bootstrap-timepicker span2">
												<form:input path="nextDestinationCollectionTime"
													id="nextDestinationCollectionTime" type="text" class="span10" />
												<span class="add-on"> <i class="icon-time"></i>
												</span>
											</div>
										</div>
										<!--  Palautusaika -->
										<div class="control-group">
											<form:label path="nextDestinationDate"
												class="control-label span4" for="textinput">
											Palautusaika* <i class="icon-info-sign" rel="tooltip"
													title="Milloin auton tulee olla palautettuna"></i>
											</form:label>
											<div class="input-append date span4" id="nextDestinationDate"
												data-date="" data-date-format="dd.mm.yyyy">
												<form:input path="nextDestinationDate" class="span8"
													type="text" value="" readonly="true" />
												<span class="add-on"> <i class="icon-calendar"></i>
												</span>
											</div>								
											<c:choose>
											<c:when test="${isItValid.valueNullNextDestinationDate}">
											<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="Valitse päivämäärä"> x </strong>
											</c:when>
											<c:when test="${!isItValid.nextCollectionBeforeNextDestination}">
											<strong style="font-size: 200%" class="span1 text-error"
											rel="tooltip" title="Palautusaika on sama tai ennen noutoaikaa"> x </strong>
											</c:when>
											<c:otherwise>
											<!-- Everything is ok! -->
											</c:otherwise>
											</c:choose>
											<div class="input-append bootstrap-timepicker span2">
												<form:input path="nextDestinationTime"
													id="nextDestinationTime" type="text" class="span10" />
												<span class="add-on"> <i class="icon-time"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="span6">
										<div class="span10 offset2">
											<div class="checkbox control-group">
												<label> <input type="checkbox"
													id="sameAsCollectionAddress">Sama palautuspaikka
													kuin noudettaessa <i class="icon-info-sign" rel="tooltip"
													title="Rastita tämä jos auto palautetaan nouto-osoitteeseen"></i>
												</label>
											</div>
										</div>
										<div class="control-group">
											<form:label path="nextDestinationAddress"
												class="control-label" for="textinput">
											Osoite*
										</form:label>
											<div class="controls span6">
												<form:input path="nextDestinationAddress" name="textinput"
													placeholder="esim Kesäkatu 95" class="input-large"
													type="text" />
											</div>
											<c:choose>
												<c:when test="${isItValid.nextDestinationAddressEmpty}">
													<strong style="font-size: 200%" class="span1 text-error"
													rel="tooltip" title="Lisää osoite"> x </strong>
												</c:when>
												<c:when test="${isItValid.nextDestinationAddressTooLong}">
													<strong style="font-size: 200%" class="span1 text-error"
													rel="tooltip" title="Osoite on liian pitkä"> x </strong>
												</c:when>
												<c:otherwise>
													<!-- Everything is ok! -->
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<div class="span6">
										<div class="control-group">
											<form:label path="nextDestinationPostalCode"
												class="control-label" for="textinput">
											Postinumero*
										</form:label>
											<div class="controls span6">
												<form:input path="nextDestinationPostalCode"
													name="textinput" placeholder="esim 02100"
													class="input-large" type="text" />
											</div>
											<c:choose>
												<c:when test="${isItValid.nextDestinationPostalCodeEmpty}">
													<strong style="font-size: 200%" class="span1 text-error"
													rel="tooltip" title="Lisää postinumero"> x </strong>
												</c:when>
												<c:when test="${isItValid.nextDestinationPostalCodeIsNotValid}">
													<strong style="font-size: 200%" class="span1 text-error"
													rel="tooltip" title="Postinumeron pitää olla 5 numeroinen"> x </strong>
												</c:when>
												<c:otherwise>
													<!-- Everything is ok! -->
												</c:otherwise>
											</c:choose>
										</div>

										<div class="control-group">
											<form:label path="nextDestinationCity" class="control-label"
												for="textinput">
											Toimipaikka*
										</form:label>
											<div class="controls span6">
												<form:input path="nextDestinationCity" name="textinput"
													placeholder="esim Espoo" class="input-large" type="text" />
											</div>
											<c:choose>
												<c:when test="${isItValid.nextDestinationCityEmpty}">
													<strong style="font-size: 200%" class="span1 text-error"
													rel="tooltip" title="Lisää kaupunki"> x </strong>
												</c:when>
												<c:when test="${isItValid.nextDestinationCityTooLong}">
													<strong style="font-size: 200%" class="span1 text-error"
													rel="tooltip" title="Kaupungin nimi on liian pitkä"> x </strong>
												</c:when>
												<c:otherwise>
													<!-- Everything is ok! -->
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>					

								<div class="row-fluid">
									<div class="span12">
										<legend>
											Palautuksen lisätiedot <i class="icon-info-sign"
												rel="tooltip"
												title="Kirjoita tähän palautukseen liittyviä lisätietoja"></i>
										</legend>
										<div class="control-group">
											<form:label path="nextAdditionalInformation"
												class="control-label" for="textarea">Lisätiedot</form:label>
											<div class="controls">
												<form:textarea path="nextAdditionalInformation" rows="3"
													name="textarea" class="input-xxlarge"></form:textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span12">
								<br> <a href="orderFormEmpty" class="btn btn-danger">Tyhjennä</a>
								<button type="submit" class="btn btn-primary">Seuraava</button>
							</div>
						</div>
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
		$(document)
				.ready(
						function() {
							$("#hasNewDestination").is(function() {
								if ($('#hasNewDestination').is(':checked')) {
									$("#returnArea").collapse('hide');
								}
							});

							$("#hasNewDestination").change(function() {
								$("#returnArea").collapse('toggle');
							});

							$("#sameAsCollectionAddress")
									.change(
											function() {
												var nextDestinationAddress;
												var nextDestinationPostalCode;
												var nextDestinationCity;
												if (this.checked) {
													nextDestinationAddress = $(
															"#collectionAddress")
															.val();
													nextDestinationPostalCode = $(
															"#collectionPostalCode")
															.val();
													nextDestinationCity = $(
															"#collectionCity")
															.val();
												} else {
													nextDestinationCity = "";
												}
												$("#nextDestinationAddress")
														.val(
																nextDestinationAddress);
												$("#nextDestinationPostalCode")
														.val(
																nextDestinationPostalCode);
												$("#nextDestinationCity").val(
														nextDestinationCity);
											});

							$("[rel=tooltip]").tooltip({
								placement : 'bottom'
							});

							var nowTemp = new Date();
							var now = new Date(nowTemp.getFullYear(), nowTemp
									.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

							var checkin = $('#collectionDate')
									.datepicker(
											{
												onRender : function(date) {
													return date.valueOf() < now
															.valueOf() ? 'disabled'
															: '';
												}
											})
									.on(
											'changeDate',
											function(ev) {
												if (ev.date.valueOf() > checkout.date
														.valueOf()) {
													var newDate = new Date(
															ev.date);
													newDate.setDate(newDate
															.getDate());
													checkout.setValue(newDate);
												}
												if (ev.date.valueOf() > nextCheckin.date
														.valueOf()) {
													var newDate = new Date(
															ev.date);
													newDate.setDate(newDate
															.getDate());
													nextCheckin
															.setValue(newDate);
												}
												if (ev.date.valueOf() > nextCheckout.date
														.valueOf()) {
													var newDate = new Date(
															ev.date);
													newDate.setDate(newDate
															.getDate());
													nextCheckout
															.setValue(newDate);
												}
												checkin.hide();
												$('#destinationDate')[0]
														.focus();
												$('#nextCheckin')[0].focus();
												$('#nextCheckout')[0].focus();
											}).data('datepicker');

							var checkout = $('#destinationDate')
									.datepicker(
											{
												onRender : function(date) {
													return date.valueOf() < checkin.date
															.valueOf() ? 'disabled'
															: '';
												}
											})
									.on(
											'changeDate',
											function(ev) {
												if (ev.date.valueOf() > nextCheckin.date
														.valueOf()) {
													var newDate = new Date(
															ev.date);
													newDate.setDate(newDate
															.getDate());
													nextCheckin
															.setValue(newDate);
												}
												if (ev.date.valueOf() > nextCheckout.date
														.valueOf()) {
													var newDate = new Date(
															ev.date);
													newDate.setDate(newDate
															.getDate());
													nextCheckout
															.setValue(newDate);
												}
												checkout.hide();
												$('#nextCheckin')[0].focus();
												$('#nextCheckout')[0].focus();
											}).data('datepicker');

							var nextCheckin = $(
									'#nextDestinationCollectionDate')
									.datepicker(
											{
												onRender : function(date) {
													return date.valueOf() < checkout.date
															.valueOf() ? 'disabled'
															: '';
												}
											})
									.on(
											'changeDate',
											function(ev) {
												nextCheckin.hide();
												if (ev.date.valueOf() > nextCheckout.date
														.valueOf()) {
													var newDate = new Date(
															ev.date);
													newDate.setDate(newDate
															.getDate());
													nextCheckout
															.setValue(newDate);
												}
												$('#nextCheckout')[0].focus();
											}).data('datepicker');

							var nextCheckout = $('#nextDestinationDate')
									.datepicker(
											{
												onRender : function(date) {
													return date.valueOf() < nextCheckin.date
															.valueOf() ? 'disabled'
															: '';
												}
											}).on('changeDate', function(ev) {
										nextCheckout.hide();
									}).data('datepicker');

							var checkinTime = $('#destinationTime').timepicker(
									{
										minuteStep : 15,
										showMeridian : false,
										defaultTime : "00:00"
									});

							var checkoutTime = $('#collectionTime')
									.timepicker({
										minuteStep : 15,
										showMeridian : false,
										defaultTime : "00:00"
									});

							var nextCheckinTime = $(
									'#nextDestinationCollectionTime')
									.timepicker({
										minuteStep : 15,
										showMeridian : false,
										defaultTime : "00:00"
									});

							var nextCheckoutTime = $('#nextDestinationTime')
									.timepicker({
										minuteStep : 15,
										showMeridian : false,
										defaultTime : "00:00"
									});
						});
	</script>
</body>
</html>