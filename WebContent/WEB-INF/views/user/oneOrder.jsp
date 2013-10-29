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

				<table class="table table-striped">
					<thead>
						<tr>
							<td colspan="4"><h4>Auto</h4></td>
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
							<td><c:out value="${order.collectionAddress}" default="-----" /></td>
							<td class="data-header">Osoite</td>
							<td><c:out value="${order.destinationAddress}" default="-----" /></td>
						</tr>
						<tr>
							<td class="data-header">Postinumero</td>
							<td><c:out value="${order.collectionPostalCode}" default="-----" /></td>
							<td class="data-header">Postinumero</td>
							<td><c:out value="${order.destinationPostalCode}" default="-----" /></td>
						</tr>
						<tr>
							<td class="data-header">Toimipaikka</td>
							<td><c:out value="${order.collectionCity}" default="-----" /></td>
							<td class="data-header">Toimipaikka</td>
							<td><c:out value="${order.destinationCity}" default="-----" /></td>
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
				</table>

				<table class="table table-striped">
					<thead>
						<tr>
							<th colspan="4"><h4>Toimituksen lisätiedot</h4></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4"><c:out value="${order.additionalInformation}" default="-----" /></td>
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
								<td><c:out value="${order.nextDestinationCollectionDate}" default="-----" /></td>
								<td class="data-header">Palautuspäivä</td>
								<td><c:out value="${order.nextDestinationDate}" default="-----" /></td>
							</tr>
							<tr>
								<td class="data-header">Noutoaika</td>
								<td><c:out value="${order.nextDestinationCollectionTime}" default="-----" /></td>
								<td class="data-header">Palautusaika</td>
								<td><c:out value="${order.nextDestinationTime}" default="-----" /></td>
							</tr>
							<tr>
								<td class="data-header">Osoite</td>
								<td><c:out value="${order.nextDestinationAddress}" default="-----" /></td>
								<td class="data-header">Postinumero</td>
								<td><c:out value="${order.nextDestinationPostalCode}" default="-----" /></td>
							</tr>
							<tr>
								<td class="data-header">Toimipaikka</td>
								<td><c:out value="${order.nextDestinationCity}" default="-----" /></td>
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
								<td colspan="4"><c:out value="${order.nextAdditionalInformation}" default="-----" /></td>
							</tr>
						</tbody>
					</table>
				</c:if>
				
				<div class="row-fluid">
					<div class="span6">
						<form method="post" action="showOrders" style="float:left;">
							<button class="btn btn-primary">Takaisin</button>
						</form>
					</div>
					<div class="span6">
						<form method="post" action="getModificateOrder" style="float:right;">
							<input name="orderId" type="hidden" value="${order.orders_id}" />
							<button class="btn btn-primary">Muokkaa</button>
						</form>
					</div>
				</div>
				
			</div>
			<div class="span1"></div>
		</div>
	</div>
</body>
</html>