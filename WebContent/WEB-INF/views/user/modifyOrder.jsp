<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Tilauksen tarkastelu</title>
</head>
<body>
	<div class="container">
		<%@include file="userNavi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="span1"></div>
			<div class="span10">

				<h3>Tilauksen tarkastelu</h3>
				
				<form:hidden path="order.orders_id" />
				
				<table class="table table-striped">
					<thead>
						<tr>
							<td colspan="4"><h4>Auto</h4></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="data-header">Automerkki</td>
							<td><form:input path="order.carBrand" name="textinput" class="input-large" type="text" /></td>
							<td class="data-header">Rekisterinumero</td>
							<td><form:input path="order.carRegister" name="textinput" class="input-large" type="text" /></td>
						</tr>
						<tr>
							<td class="data-header">Automalli</td>
							<td><form:input path="order.carModel" name="textinput" class="input-large" type="text" /></td>
							<td class="data-header">Autoväri</td>
							<td><form:input path="order.carColor" name="textinput" class="input-large" type="text" /></td>
						</tr>
					</tbody>
				</table>
				
				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="2"><h4>Nouto</h4></th>
							<th colspan="2"><h4>Toimitus</h4></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="data-header">Päivä</td>
							<td>
								<div class="input-append date" id="collectionDate" data-date="" data-date-format="dd.mm.yyyy">
									<form:input path="order.collectionDate" type="text" value="" readonly="false" />
									<span class="add-on">
										<i class="icon-calendar"></i>
									</span>
								</div>
							</td>
							<td class="data-header">Päivä</td>
							<td>
								<div class="input-append date" id="destinationDate" data-date="" data-date-format="dd.mm.yyyy">
									<form:input path="order.destinationDate" type="text" value="" readonly="false" />
									<span class="add-on">
										<i class="icon-calendar"></i>
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<td class="data-header">Kellonaika</td>
							<td>
								<div class="input-append bootstrap-timepicker">
									<form:input path="order.collectionTimeFrom" id="collectionTimeFrom" type="text" />
									<span class="add-on">
										<i class="icon-time"></i>
									</span>
								</div>
								<div class="input-append bootstrap-timepicker">
									<form:input path="order.collectionTimeTo" id="collectionTimeTo" type="text" />
									<span class="add-on">
										<i class="icon-time"></i>
									</span>
								</div>
							</td>
							<td class="data-header">Kellonaika</td>
							<td>
								<div class="input-append bootstrap-timepicker">
									<form:input path="order.destinationTime" id="collectionTime" type="text" />
									<span class="add-on">
										<i class="icon-time"></i>
									</span>
								</div>
							</td>
						</tr>
						<tr>
							<td class="data-header">Osoite</td>
							<td><form:input path="order.collectionAddress" name="textinput" class="input-large" type="text" /></td>
							<td class="data-header">Osoite</td>
							<td><form:input path="order.destinationAddress" name="textinput" class="input-large" type="text" /></td>
						</tr>
						<tr>
							<td class="data-header">Postinumero</td>
							<td><form:input path="order.collectionPostalCode" name="textinput" class="input-large" type="text" /></td>
							<td class="data-header">Postinumero</td>
							<td><form:input path="order.destinationPostalCode" name="textinput" class="input-large" type="text" /></td>
						</tr>
						<tr>
							<td class="data-header">Toimipaikka</td>
							<td><form:input path="order.collectionCity" name="textinput" class="input-large" type="text" /></td>
							<td class="data-header">Toimipaikka</td>
							<td><form:input path="order.destinationCity" name="textinput" class="input-large" type="text" /></td>
						</tr>
					</tbody>
				</table>
				
				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="4"><h4>Asiakas</h4></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="data-header">Etunimi</td>
							<td><form:input path="order.clientFname" name="textinput" class="input-large" type="text" /></td>
							<td class="data-header">Puhelinnumero</td>
							<td><form:input path="order.clientPhoneNo" name="textinput" class="input-large" type="text" /></td>
						</tr>
						<tr>
							<td class="data-header">Sukunimi</td>
							<td><form:input path="order.clientLname" name="textinput" class="input-large" type="text" /></td>
							<td class="data-header">Yritys</td>
							<td><form:input path="order.clientCompany" name="textinput" class="input-large" type="text" /></td>
						</tr>
					</tbody>
				</table>

				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="4"><h4>Toimituksen lisätiedot</h4></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4">
								<form:textarea path="order.AdditionalInformation" class="input-xxlarge" row="5" />
							</td>
						</tr>
					</tbody>
				</table>

				<c:if test="${order.hasNewDestination}">
					<table class="table table-striped">
						<thead>
							<tr>
								<th colspan="4"><h4>Palautus</h4></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="data-header">Noutopäivä</td>
								<td>
									<div class="input-append date" id="nextDestinationCollectionDate" data-date="" data-date-format="dd.mm.yyyy">
										<form:input path="order.nextDestinationCollectionDate" type="text" value="" readonly="false" />
										<span class="add-on">
											<i class="icon-calendar"></i>
										</span>
									</div>
								</td>
								<td class="data-header">Palautuspäivä</td>
								<td>
									<div class="input-append date" id="nextDestinationDate" data-date="" data-date-format="dd.mm.yyyy">
										<form:input path="order.nextDestinationDate" type="text" value="" readonly="false" />
										<span class="add-on">
											<i class="icon-calendar"></i>
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<td class="data-header">Noutoaika</td>
								<td>
									<div class="input-append bootstrap-timepicker">
										<form:input path="order.nextDestinationCollectionTimeFrom" id="nextDestinationCollectionTimeFrom" type="text" />
										<span class="add-on">
											<i class="icon-time"></i>
										</span>
									</div>
									<div class="input-append bootstrap-timepicker">
										<form:input path="order.nextDestinationCollectionTimeTo" id="nextDestinationCollectionTimeTo" type="text" />
										<span class="add-on">
											<i class="icon-time"></i>
										</span>
									</div>
								</td>
								<td class="data-header">Palautusaika</td>
								<td>
									<div class="input-append bootstrap-timepicker">
										<form:input path="order.nextDestinationTime" id="nextDestinationTime" type="text" />
										<span class="add-on">
											<i class="icon-time"></i>
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<td class="data-header">Osoite</td>
								<td><form:input path="order.nextDestinationAddress" name="textinput" class="input-large" type="text" /></td>
								<td class="data-header">Postinumero</td>
								<td><form:input path="order.nextDestinationPostalCode" name="textinput" class="input-large" type="text" /></td>
							</tr>
							<tr>
								<td class="data-header">Toimipaikka</td>
								<td><form:input path="order.nextDestinationCity" name="textinput" class="input-large" type="text" /></td>
								<td colspan="2"></td>
							</tr>
						</tbody>
					</table>

					<table class="table table-striped">
						<thead>
							<tr>
								<th colspan="4"><h4>Palautuksen lisätiedot</h4></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="4">
									<form:textarea path="order.nextAdditionalInformation" class="input-xxlarge" row="5" />
								</td>
							</tr>
						</tbody>
					</table>
				</c:if>
				
				<%--
					<div class="span6">
						<form method="post" action="showOrders" style="float:left;">
							<button class="btn btn-primary">Peruuta</button>
						</form>
					</div>
					<div class="span6">
						<form method="post" action="#" style="float:right;">
							<input name="orderId" type="hidden" value="${order.orders_id}" />
							<button class="btn btn-primary">Muokkaa</button>
						</form>
					</div>
				--%>
				
					<span class="row-fluid">
						<span class="12">
							<button class="btn btn-primary">Muokkaa</button>
						</span>
					</span>
				
				</div>
			</div>
	</div>
	
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript" src="../resources/datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="../resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../resources/bootstrap-timepicker-master/js/bootstrap-timepicker.min.js"></script>
	
</body>
</html>