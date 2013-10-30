<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Tilauksen tiedot</title>
</head>
<body>
	<div class="container">
		<%@include file="navi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="span10 offset1">
				<table class="table" id="orderConfirmationTable">
					<thead>
						<tr>
							<td colspan="4" style="font-size: 20px; font-weight: 700;">Auto</td>
						</tr>
					</thead>
					<tr>
						<th>Automerkki</th>
						<td><c:out value="${orderInformation.carBrand}"
								default="-----" /></td>
						<th>Rekisterinumero</th>
						<td><c:out value="${orderInformation.carRegister}"
								default="-----" /></td>
					</tr>
					<tr>
						<th>Automalli</th>
						<td><c:out value="${orderInformation.carModel}"
								default="-----" /></td>
						<th>Autoväri</th>
						<td><c:out value="${orderInformation.carColor}"
								default="-----" /></td>
					</tr>

					<thead>
						<tr>
							<td colspan="2" style="font-size: 20px; font-weight: 700;">Nouto</td>
							<td colspan="2" style="font-size: 20px; font-weight: 700;">Toimitus</td>
						</tr>
					</thead>

					<tr>
						<th>Päivä</th>
						<td><c:out value="${orderInformation.collectionDate}"
								default="-----" /></td>
						<th>Päivä</th>
						<td><c:out value="${orderInformation.destinationDate}"
								default="-----" /></td>
					</tr>
					<tr>
						<th>Kellonaika</th>
						<td><c:out value="${orderInformation.collectionTimeFrom}"
								default="-----" /></td>
						<th>Kellonaika</th>
						<td><c:out value="${orderInformation.destinationTime}"
								default="-----" /></td>
					</tr>
					<tr>
						<th>Osoite</th>
						<td><c:out value="${orderInformation.collectionAddress}"
								default="-----" /></td>
						<th>Osoite</th>
						<td><c:out value="${orderInformation.destinationAddress}"
								default="-----" /></td>
					</tr>
					<tr>
						<th>Postinumero</th>
						<td><c:out value="${orderInformation.collectionPostalCode}"
								default="-----" /></td>
						<th>Postinumero</th>
						<td><c:out value="${orderInformation.destinationPostalCode}"
								default="-----" /></td>
					</tr>
					<tr>
						<th>Toimipaikka</th>
						<td><c:out value="${orderInformation.collectionCity}"
								default="-----" /></td>
						<th>Toimipaikka</th>
						<td><c:out value="${orderInformation.destinationCity}"
								default="-----" /></td>
					</tr>


					<thead>
						<tr>
							<td colspan="4" style="font-size: 20px; font-weight: 700;">Asiakas</td>
						</tr>
					</thead>

					<tr>
						<th>Etunimi</th>
						<td><c:out value="${orderInformation.clientFname}"
								default="-----" /></td>
						<th>Puhelinnumero</th>
						<td><c:out value="${orderInformation.clientPhoneNo}"
								default="-----" /></td>
					</tr>
					<tr>
						<th>Sukunimi</th>
						<td><c:out value="${orderInformation.clientLname}"
								default="-----" /></td>
						<th>Yritys</th>
						<td><c:out value="${orderInformation.clientCompany}"
								default="-----" /></td>
					</tr>

					<thead>
						<tr>
							<td colspan="4" style="font-size: 20px; font-weight: 700;">Toimituksen
								Lisätiedot</td>
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
								<td colspan="4" style="font-size: 20px; font-weight: 700;">Palautus</td>
							</tr>
						</thead>

						<tr>
							<th>Noutopäivä</th>
							<td><c:out
									value="${orderInformation.nextDestinationCollectionDate}"
									default="-----" /></td>
							<th>Palautuspäivä</th>
							<td><c:out value="${orderInformation.nextDestinationDate}"
									default="-----" /></td>
						</tr>

						<tr>
							<th>Noutoaika</th>
							<td><c:out
									value="${orderInformation.nextDestinationCollectionTimeFrom}"
									default="-----" /></td>
							<th>Palautusaika</th>
							<td><c:out value="${orderInformation.nextDestinationTime}"
									default="-----" /></td>
						</tr>

						<tr>
							<th>Osoite</th>
							<td><c:out
									value="${orderInformation.nextDestinationAddress}"
									default="-----" /></td>
							<th>Postinumero</th>
							<td><c:out
									value="${orderInformation.nextDestinationPostalCode}"
									default="-----" /></td>
						</tr>

						<tr>
							<th>Toimipaikka</th>
							<td><c:out value="${orderInformation.nextDestinationCity}"
									default="-----" /></td>
							<td colspan="2"></td>
						</tr>

						<thead>
							<tr>
								<td colspan="4" style="font-size: 20px; font-weight: 700;">Palautuksen
									Lisätiedot
								</th>
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
							<td colspan="4" style="font-size: 20px; font-weight: 700;">Tilaajan
								Tiedot</td>
						</tr>
					</thead>
					<tr>
						<th>Etunimi</th>
						<td><c:out value="${orderInformation.userProfile.fName}"
								default="-----" /></td>
						<th>Puhelinnumero</th>
						<td><c:out value="${orderInformation.userProfile.phoneNo}"
								default="-----" /></td>
					</tr>
					<tr>
						<th>Sukunimi</th>
						<td><c:out value="${orderInformation.userProfile.lName}"
								default="-----" /></td>
						<th>Yritys</th>
						<td><c:out
								value="${orderInformation.userProfile.company.name}"
								default="-----" /></td>
					</tr>
					<tr>
						<th>Muokattu</th>
						<td><c:out value="${orderInformation.lastTimeEdited}"
								default="-----" /></td>
						<th>Status</th>

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
						</c:choose>
					</tr>

					<tr>
						<c:choose>
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
							<c:otherwise>
								<td><a href="new" class="btn btn-danger">Takaisin</a></td>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${orderInformation.statusOfOrder == 5}">
								<td colspan="2"></td>
							</c:when>
							<c:otherwise>
								<form action="changeOrderStatus" method="post" class="span4">
									<td colspan="2"><input type="hidden" name="statusOfOrder"
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
							<c:otherwise>
								<form action="returnPreviousOrderStatus" method="post" class="span4">
									<td><input type="hidden" name="statusOfOrder"
										id="statusOfOrder" value="${orderInformation.statusOfOrder}" />
										<input type="hidden" name="orderID" id="orderID"
										value="${orderInformation.orders_id}" /> <input type="hidden"
										name="hasNewDestination" id="hasNewDestination"
										value="${orderInformation.hasNewDestination}" />
										<button class="btn btn-danger">
											Edellinen status
										</button></td>
								</form>
							</c:otherwise>
						</c:choose>

					</tr>
				</table>

			</div>
		</div>
	</div>
</body>
</html>