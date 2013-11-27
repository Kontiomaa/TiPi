<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Tilauksen tiedot</title>
</head>
<body>
	<div class="container">
		<%@include file="navi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="span10 offset1">
				<table class="table table-striped" id="orderConfirmationTable">
					<thead>
						<tr>
							<td colspan="4" class="thead-header">Auto</td>
						</tr>
					</thead>
					<tr>
						<td class="data-header">Automerkki</td>
						<td><c:out value="${orderInformation.carBrand}"
								default="-----" /></td>
						<td class="data-header">Rekisterinumero</td>
						<td><c:out value="${orderInformation.carRegister}"
								default="-----" /></td>
					</tr>
					<tr>
						<td class="data-header">Automalli</td>
						<td><c:out value="${orderInformation.carModel}"
								default="-----" /></td>
						<td class="data-header">Autoväri</td>
						<td><c:out value="${orderInformation.carColor}"
								default="-----" /></td>
					</tr>

					<thead>
						<tr>
							<td colspan="2" class="thead-header">Nouto</td>
							<td colspan="2" class="thead-header">Toimitus</td>
						</tr>
					</thead>

					<tr>
						<td class="data-header">Päivä</td>
						<td><c:out value="${orderInformation.collectionDate}"
								default="-----" /></td>
						<td class="data-header">Päivä</td>
						<td><c:out value="${orderInformation.destinationDate}"
								default="-----" /></td>
					</tr>
					<tr>
						<td class="data-header">Kellonaika</td>
						<td><c:out value="${orderInformation.collectionTime}"
								default="-----" /></td>
						<td class="data-header">Kellonaika</td>
						<td><c:out value="${orderInformation.destinationTime}"
								default="-----" /></td>
					</tr>
					<tr>
						<td class="data-header">Osoite</td>
						<td><c:out value="${orderInformation.collectionAddress}"
								default="-----" /></td>
						<td class="data-header">Osoite</td>
						<td><c:out value="${orderInformation.destinationAddress}"
								default="-----" /></td>
					</tr>
					<tr>
						<td class="data-header">Postinumero</td>
						<td><c:out value="${orderInformation.collectionPostalCode}"
								default="-----" /></td>
						<td class="data-header">Postinumero</td>
						<td><c:out value="${orderInformation.destinationPostalCode}"
								default="-----" /></td>
					</tr>
					<tr>
						<td class="data-header">Toimipaikka</td>
						<td><c:out value="${orderInformation.collectionCity}"
								default="-----" /></td>
						<td class="data-header">Toimipaikka</td>
						<td><c:out value="${orderInformation.destinationCity}"
								default="-----" /></td>
					</tr>


					<thead>
						<tr>
							<td colspan="4" class="thead-header">Asiakas</td>
						</tr>
					</thead>

					<tr>
						<td class="data-header">Etunimi</td>
						<td><c:out value="${orderInformation.clientFname}"
								default="-----" /></td>
						<td class="data-header">Puhelinnumero</td>
						<td><c:out value="${orderInformation.clientPhoneNo}"
								default="-----" /></td>
					</tr>
					<tr>
						<td class="data-header">Sukunimi</td>
						<td><c:out value="${orderInformation.clientLname}"
								default="-----" /></td>
						<td class="data-header">Yritys</td>
						<td><c:out value="${orderInformation.clientCompany}"
								default="-----" /></td>
					</tr>

					<thead>
						<tr>
							<td colspan="4" class="thead-header">Toimituksen Lisätiedot</td>
						</tr>
					</thead>

					<tr>
						<td colspan="4"><c:out
								value="${orderInformation.additionalInformation}"
								default="-----" /></td>
					</tr>

					<c:if test="${orderInformation.hasNewDestination}">

						<thead>
							<tr>
								<td colspan="4" class="thead-header">Palautus</td>
							</tr>
						</thead>

						<tr>
							<td class="data-header">Noutopäivä</td>
							<td><c:out
									value="${orderInformation.nextDestinationCollectionDate}"
									default="-----" /></td>
							<td class="data-header">Palautuspäivä</td>
							<td><c:out value="${orderInformation.nextDestinationDate}"
									default="-----" /></td>
						</tr>

						<tr>
							<td class="data-header">Noutoaika</td>
							<td><c:out
									value="${orderInformation.nextDestinationCollectionTime}"
									default="-----" /></td>
							<td class="data-header">Palautusaika</td>
							<td><c:out value="${orderInformation.nextDestinationTime}"
									default="-----" /></td>
						</tr>

						<tr>
							<td class="data-header">Osoite</td>
							<td><c:out
									value="${orderInformation.nextDestinationAddress}"
									default="-----" /></td>
							<td class="data-header">Postinumero</td>
							<td><c:out
									value="${orderInformation.nextDestinationPostalCode}"
									default="-----" /></td>
						</tr>

						<tr>
							<td class="data-header">Toimipaikka</td>
							<td><c:out value="${orderInformation.nextDestinationCity}"
									default="-----" /></td>
							<td colspan="2"></td>
						</tr>

						<thead>
							<tr>
								<td colspan="4" class="thead-header">Palautuksen Lisätiedot
								</td>
							</tr>
						</thead>

						<tr>
							<td colspan="4"><c:out
									value="${orderInformation.nextAdditionalInformation}"
									default="-----" /></td>
						</tr>
					</c:if>

					<thead>
						<tr>
							<td colspan="4" class="thead-header">Tilaajan Tiedot</td>
						</tr>
					</thead>
					<tr>
						<td class="data-header">Etunimi</td>
						<td><c:out value="${orderInformation.userProfile.fName}"
								default="-----" /></td>
						<td class="data-header">Puhelinnumero</td>
						<td><c:out value="${orderInformation.userProfile.phoneNo}"
								default="-----" /></td>
					</tr>
					<tr>
						<td class="data-header">Sukunimi</td>
						<td><c:out value="${orderInformation.userProfile.lName}"
								default="-----" /></td>
						<td class="data-header">Yritys</td>
						<td><c:out
								value="${orderInformation.userProfile.company.name}"
								default="-----" /></td>
					</tr>
					<tr>
						<td class="data-header">Muokattu</td>
						<td><c:out value="${orderInformation.lastTimeEdited}"
								default="-----" /></td>
						<td class="data-header">Tila</td>

						<c:choose>
							<c:when test="${orderInformation.statusOfOrder == 1}">
								<td><c:out value="Uusi" default="-----" /></td>
							</c:when>
							<c:when test="${orderInformation.statusOfOrder == 2}">
								<td><c:out value="Kuitattu" default="-----" /></td>
							</c:when>
							<c:when test="${orderInformation.statusOfOrder == 3}">
								<td><c:out value="Toimitettu" default="-----" /></td>
							</c:when>
							<c:when test="${orderInformation.statusOfOrder == 4}">
								<td><c:out value="Valmis" default="-----" /></td>
							</c:when>
							<c:when test="${orderInformation.statusOfOrder == 5}">
								<td><c:out value="Laskutettu" default="-----" /></td>
							</c:when>
							<c:when test="${orderInformation.statusOfOrder == 6}">
								<td><c:out value="Poistettu" default="-----" /></td>
							</c:when>
							<c:otherwise>
								<td>-----</td>
							</c:otherwise>
						</c:choose>
					</tr>

					<tr>
						<c:choose>
							<c:when test="${backToSearchOrders == 1}">
								<form action="searchOrders" method="post">
									<td>
										<button class="btn btn-primary" type="submit" value="submit">Takaisin</button>
									</td>
								</form>
							</c:when>
							<c:when test="${orderInformation.statusOfOrder == 1}">
								<td><a href="new" class="btn btn-primary">Takaisin</a></td>
							</c:when>
							<c:when test="${orderInformation.statusOfOrder == 2}">
								<td><a href="accepted" class="btn btn-primary">Takaisin</a></td>
							</c:when>
							<c:when test="${orderInformation.statusOfOrder == 3}">
								<td><a href="taken" class="btn btn-primary">Takaisin</a></td>
							</c:when>
							<c:when test="${orderInformation.statusOfOrder == 4}">
								<td><a href="completed" class="btn btn-primary">Takaisin</a></td>
							</c:when>
							<c:when test="${orderInformation.statusOfOrder == 5}">
								<td><a href="billed" class="btn btn-primary">Takaisin</a></td>
							</c:when>
							<c:when test="${orderInformation.statusOfOrder == 6}">
								<td><a href="deletedOrders" class="btn btn-primary">Takaisin</a></td>
							</c:when>
							<c:otherwise>
								<td><a href="new" class="btn btn-primary">Takaisin</a></td>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${orderInformation.statusOfOrder >= 5}">
								<td></td>
							</c:when>
							<c:otherwise>
								<form action="changeOrderStatus" method="post" class="span4">
									<td><input type="hidden" name="statusOfOrder"
										id="statusOfOrder" value="${orderInformation.statusOfOrder}" />
										<input type="hidden" name="orderID" id="orderID"
										value="${orderInformation.orders_id}" /> <input type="hidden"
										name="hasNewDestination" id="hasNewDestination"
										value="${orderInformation.hasNewDestination}" />
										<button class="btn btn-success">
											<c:out value="${changeStatusButton}" default="-----" />
										</button></td>
								</form>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${orderInformation.statusOfOrder == 1}">
								<td></td>
							</c:when>
							<c:when test="${orderInformation.statusOfOrder == 6}">
								<td></td>
							</c:when>
							<c:otherwise>
								<td>
									<form action="returnPreviousOrderStatus" method="post">
										<input type="hidden" name="statusOfOrder" id="statusOfOrder"
											value="${orderInformation.statusOfOrder}" /> <input
											type="hidden" name="orderID" id="orderID"
											value="${orderInformation.orders_id}" /> <input
											type="hidden" name="hasNewDestination" id="hasNewDestination"
											value="${orderInformation.hasNewDestination}" />
										<button class="btn btn-primary">Edellinen tila</button>
									</form>
								</td>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${orderInformation.statusOfOrder == 6}">
								<td></td>
							</c:when>
							<c:otherwise>
								<td>
									<form method="post" action="deleteOrder" style="float: right;">
										<input name="orderId" type="hidden" value="${orderInformation.orders_id}" />
										<button class="btn btn-danger">Poista</button>
									</form>
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>