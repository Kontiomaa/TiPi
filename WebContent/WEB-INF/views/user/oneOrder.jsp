<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Tilauksen tarkastelu</title>

	<script type="text/javascript">
		
		// Käyttäjän poistamisen varmistus. Antaa suomeksi OK ja Peruuta-valinnat.
		// OK palauttaa true ja Peruuta false.
		function deleteConfirmation() {
			var a = new Boolean();
			a = window.confirm('Oletko varma että haluat poistaa tilauksen?');
			if (a) {
				document.deleteOrderForm.submit();
			}
		}
			
	</script>

</head>
<body>
	<div class="container">
		<%@include file="userNavi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="span1"></div>
			<div class="span10">

				<h3>Tilauksen tarkastelu</h3>

				<table class="table table-striped">
					<thead>
						<tr>
							<td colspan="4" class="thead-header">Auto</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="data-header">Automerkki</td>
							<td><c:out value="${order.carBrand}" default="-----" /></td>
							<td class="data-header">Rekisterinumero</td>
							<td><c:out value="${order.carRegister}" default="-----" /></td>
						</tr>
						<tr>
							<td class="data-header">Automalli</td>
							<td><c:out value="${order.carModel}" default="-----" /></td>
							<td class="data-header">Autoväri</td>
							<td><c:out value="${order.carColor}" default="-----" /></td>
						</tr>
					</tbody>
					<thead>
						<tr>
							<th colspan="2" class="thead-header">Nouto</th>
							<th colspan="2" class="thead-header">Toimitus</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="data-header">Päivä</td>
							<td><c:out value="${order.collectionDate}" default="-----" /></td>
							<td class="data-header">Päivä</td>
							<td><c:out value="${order.destinationDate}" default="-----" /></td>
						</tr>
						<tr>
							<td class="data-header">Kellonaika</td>
							<td><c:out value="${order.collectionTime}" default="-----" /></td>
							<td class="data-header">Kellonaika</td>
							<td><c:out value="${order.destinationTime}" default="-----" /></td>
						</tr>
						<tr>
							<td class="data-header">Osoite</td>
							<td><c:out value="${order.collectionAddress}"
									default="-----" /></td>
							<td class="data-header">Osoite</td>
							<td><c:out value="${order.destinationAddress}"
									default="-----" /></td>
						</tr>
						<tr>
							<td class="data-header">Postinumero</td>
							<td><c:out value="${order.collectionPostalCode}"
									default="-----" /></td>
							<td class="data-header">Postinumero</td>
							<td><c:out value="${order.destinationPostalCode}"
									default="-----" /></td>
						</tr>
						<tr>
							<td class="data-header">Toimipaikka</td>
							<td><c:out value="${order.collectionCity}" default="-----" /></td>
							<td class="data-header">Toimipaikka</td>
							<td><c:out value="${order.destinationCity}" default="-----" /></td>
						</tr>
					</tbody>
					<thead>
						<tr>
							<th colspan="4" class="thead-header">Asiakas</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="data-header">Etunimi</td>
							<td><c:out value="${order.clientFname}" default="-----" /></td>
							<td class="data-header">Puhelinnumero</td>
							<td><c:out value="${order.clientPhoneNo}" default="-----" /></td>
						</tr>
						<tr>
							<td class="data-header">Sukunimi</td>
							<td><c:out value="${order.clientLname}" default="-----" /></td>
							<td class="data-header">Yritys</td>
							<td><c:out value="${order.clientCompany}" default="-----" /></td>
						</tr>
					</tbody>
					<thead>
						<tr>
							<th colspan="4" class="thead-header">Toimituksen lisätiedot</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4"><c:out
									value="${order.additionalInformation}" default="-----" /></td>
						</tr>
					</tbody>
					<c:if test="${order.hasNewDestination}">
						<thead>
							<tr>
								<th colspan="4" class="thead-header">Palautus</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="data-header">Noutopäivä</td>
								<td><c:out value="${order.nextDestinationCollectionDate}"
										default="-----" /></td>
								<td class="data-header">Palautuspäivä</td>
								<td><c:out value="${order.nextDestinationDate}"
										default="-----" /></td>
							</tr>
							<tr>
								<td class="data-header">Noutoaika</td>
								<td><c:out value="${order.nextDestinationCollectionTime}"
										default="-----" /></td>
								<td class="data-header">Palautusaika</td>
								<td><c:out value="${order.nextDestinationTime}"
										default="-----" /></td>
							</tr>
							<tr>
								<td class="data-header">Osoite</td>
								<td><c:out value="${order.nextDestinationAddress}"
										default="-----" /></td>
								<td class="data-header">Postinumero</td>
								<td><c:out value="${order.nextDestinationPostalCode}"
										default="-----" /></td>
							</tr>
							<tr>
								<td class="data-header">Toimipaikka</td>
								<td><c:out value="${order.nextDestinationCity}"
										default="-----" /></td>
								<td colspan="2"></td>
							</tr>
						</tbody>
						<thead>
							<tr>
								<th colspan="4" class="thead-header">Palautuksen lisätiedot</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="4"><c:out
										value="${order.nextAdditionalInformation}" default="-----" /></td>
							</tr>
						</tbody>
					</c:if>
					<thead>
						<tr>
							<td colspan="4" class="thead-header">Tilaajan Tiedot</td>
						</tr>
					</thead>
					<tr>
						<td class="data-header">Etunimi</td>
						<td><c:out value="${order.userProfile.fName}" default="-----" /></td>
						<td class="data-header">Puhelinnumero</td>
						<td><c:out value="${order.userProfile.phoneNo}"
								default="-----" /></td>
					</tr>
					<tr>
						<td class="data-header">Sukunimi</td>
						<td><c:out value="${order.userProfile.lName}" default="-----" /></td>
						<td class="data-header">Yritys</td>
						<td><c:out value="${order.userProfile.company.name}"
								default="-----" /></td>
					</tr>
					<tr>
						<td class="data-header">Muokattu</td>
						<td><c:out value="${order.lastTimeEdited}" default="-----" /></td>
						<td class="data-header">Status</td>

						<c:choose>
							<c:when test="${order.statusOfOrder == 1}">
								<td><c:out value="Uusi" default="-----" /></td>
							</c:when>
							<c:when test="${order.statusOfOrder == 2}">
								<td><c:out value="Kuitattu" default="-----" /></td>
							</c:when>
							<c:when test="${order.statusOfOrder == 3}">
								<td><c:out value="Toimitettu" default="-----" /></td>
							</c:when>
							<c:when test="${order.statusOfOrder == 4}">
								<td><c:out value="Valmis" default="-----" /></td>
							</c:when>
							<c:when test="${order.statusOfOrder == 5}">
								<td><c:out value="Laskutettu" default="-----" /></td>
							</c:when>
							<c:when test="${order.statusOfOrder == 6}">
								<td><c:out value="Poistettu" default="-----" /></td>
							</c:when>
							<c:otherwise>
								<td>-----</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</table>

				<div class="row-fluid">
					<div class="span4">
						<a href="showOrders" class="btn btn-primary">Takaisin</a>
					</div>
					<div class="span4">
						<c:choose>
							<c:when
								test="${(!nextDestinationTimeLimit && !collectionTimeLimit) ||  order.statusOfOrder > 3}">
								<strong style="float: center;">Et voi muokata tätä
									tilausta.</strong>
							</c:when>
							<c:otherwise>
								<form method="post" action="getModificateOrder"
									style="float: center;">
									<input name="orderId" type="hidden" value="${order.orders_id}" />
									<button class="btn btn-success">Muokkaa</button>
								</form>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="span4">
						<c:choose>
							<c:when test="${(nextDestinationTimeLimit && collectionTimeLimit) && order.statusOfOrder < 3}">
								<form name="deleteOrderForm" method="post" action="deleteOrder" style="float: right;">
									<input name="orderId" type="hidden" value="${order.orders_id}" />
									<a class="btn btn-danger" onClick="deleteConfirmation()">Poista</a>
								</form>
							</c:when>
							<c:otherwise>
								<strong style="float: right;">Et voi poistaa tätä
									tilausta.</strong>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

			</div>
			<div class="span1"></div>
		</div>
	</div>
</body>
</html>