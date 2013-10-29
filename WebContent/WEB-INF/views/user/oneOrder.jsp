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
							<td>Automerkki</td>
							<td><c:out value="${order.carBrand}" default="-----" /></td>
							<td>Rekisterinumero</td>
							<td><c:out value="${order.carRegister}" default="-----" /></td>
						</tr>
						<tr>
							<td>Automalli</td>
							<td><c:out value="${order.carModel}" default="-----" /></td>
							<td>Autoväri</td>
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
							<td>Päivä</td>
							<td><c:out value="${order.collectionDate}" default="-----" /></td>
							<td>Päivä</td>
							<td><c:out value="${order.destinationDate}" default="-----" /></td>
						</tr>
						<tr>
							<td>Kellonaika</td>
							<td><c:out value="${order.collectionTime}" default="-----" /></td>
							<td>Kellonaika</td>
							<td><c:out value="${order.destinationTime}" default="-----" /></td>
						</tr>
						<tr>
							<td>Osoite</td>
							<td><c:out value="${order.collectionAddress}" default="-----" /></td>
							<td>Osoite</td>
							<td><c:out value="${order.destinationAddress}" default="-----" /></td>
						</tr>
						<tr>
							<td>Postinumero</td>
							<td><c:out value="${order.collectionPostalCode}" default="-----" /></td>
							<td>Postinumero</td>
							<td><c:out value="${order.destinationPostalCode}" default="-----" /></td>
						</tr>
						<tr>
							<td>Toimipaikka</td>
							<td><c:out value="${order.collectionCity}" default="-----" /></td>
							<td>Toimipaikka</td>
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
							<td>Etunimi</td>
							<td><c:out value="${order.clientFname}" default="-----" /></td>
							<td>Puhelinnumero</td>
							<td><c:out value="${order.clientPhoneNo}" default="-----" /></td>
						</tr>
						<tr>
							<td>Sukunimi</td>
							<td><c:out value="${order.clientLname}" default="-----" /></td>
							<td>Yritys</td>
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
								<td>Noutopäivä</td>
								<td><c:out value="${order.nextDestinationCollectionDate}" default="-----" /></td>
								<td>Palautuspäivä</td>
								<td><c:out value="${order.nextDestinationDate}" default="-----" /></td>
							</tr>
							<tr>
								<td>Noutoaika</td>
								<td><c:out value="${order.nextDestinationCollectionTime}" default="-----" /></td>
								<td>Palautusaika</td>
								<td><c:out value="${order.nextDestinationTime}" default="-----" /></td>
							</tr>
							<tr>
								<td>Osoite</td>
								<td><c:out value="${order.nextDestinationAddress}" default="-----" /></td>
								<td>Postinumero</td>
								<td><c:out value="${order.nextDestinationPostalCode}" default="-----" /></td>
							</tr>
							<tr>
								<th>Toimipaikka</th>
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
						<form method="post" action="#" style="float:right;">
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