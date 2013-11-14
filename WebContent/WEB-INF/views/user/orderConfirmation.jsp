<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Uusi tilaus</title>
</head>
<body>
	<div class="container">
		<%@include file="userNavi.jsp"%>
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
						<td><c:out value="${orderForm.carBrand}" default="-----" /></td>
						<th>Rekisterinumero</th>
						<td><c:out value="${orderForm.carRegister}" default="-----" /></td>
					</tr>
					<tr>
						<th>Automalli</th>
						<td><c:out value="${orderForm.carModel}" default="-----" /></td>
						<th>Autoväri</th>
						<td><c:out value="${orderForm.carColor}" default="-----" /></td>
					</tr>

					<thead>
						<tr>
							<td colspan="2" style="font-size: 20px; font-weight: 700;">Nouto</td>
							<td colspan="2" style="font-size: 20px; font-weight: 700;">Toimitus</td>
						</tr>
					</thead>

					<tr>
						<th>Päivä</th>
						<td><c:out value="${orderForm.collectionDate}"
								default="-----" /></td>
						<th>Päivä</th>
						<td><c:out value="${orderForm.destinationDate}"
								default="-----" /></td>
					</tr>
					<tr>
						<th>Kellonaika</th>
						<td><c:out value="${orderForm.collectionTime}"
								default="-----" /></td>
						<th>Kellonaika</th>
						<td><c:out value="${orderForm.destinationTime}"
								default="-----" /></td>
					</tr>
					<tr>
						<th>Osoite</th>
						<td><c:out value="${orderForm.collectionAddress}"
								default="-----" /></td>
						<th>Osoite</th>
						<td><c:out value="${orderForm.destinationAddress}"
								default="-----" /></td>
					</tr>
					<tr>
						<th>Postinumero</th>
						<td><c:out value="${orderForm.collectionPostalCode}"
								default="-----" /></td>
						<th>Postinumero</th>
						<td><c:out value="${orderForm.destinationPostalCode}"
								default="-----" /></td>
					</tr>
					<tr>
						<th>Toimipaikka</th>
						<td><c:out value="${orderForm.collectionCity}"
								default="-----" /></td>
						<th>Toimipaikka</th>
						<td><c:out value="${orderForm.destinationCity}"
								default="-----" /></td>
					</tr>


					<thead>
						<tr>
							<td colspan="4" style="font-size: 20px; font-weight: 700;">Asiakas</td>
						</tr>
					</thead>

					<tr>
						<th>Etunimi</th>
						<td><c:out value="${orderForm.clientFname}" default="-----" /></td>
						<th>Puhelinnumero</th>
						<td><c:out value="${orderForm.clientPhoneNo}" default="-----" /></td>
					</tr>
					<tr>
						<th>Sukunimi</th>
						<td><c:out value="${orderForm.clientLname}" default="-----" /></td>
						<th>Yritys</th>
						<td><c:out value="${orderForm.clientCompany}" default="-----" /></td>
					</tr>

					<thead>
						<tr>
							<td colspan="4" style="font-size: 20px; font-weight: 700;">Toimituksen
								Lisätiedot</td>
						</tr>
					</thead>

					<tr>
						<td colspan="4"><c:out
								value="${orderForm.additionalInformation}" default="-----" /></td>
					</tr>

					<c:if test="${orderForm.hasNewDestination}">

						<thead>
							<tr>
								<td colspan="4" style="font-size: 20px; font-weight: 700;">Palautus</td>
							</tr>
						</thead>

						<tr>
							<th>Noutopäivä</th>
							<td><c:out
									value="${orderForm.nextDestinationCollectionDate}"
									default="-----" /></td>
							<th>Palautuspäivä</th>
							<td><c:out value="${orderForm.nextDestinationDate}"
									default="-----" /></td>
						</tr>

						<tr>
							<th>Noutoaika</th>
							<td><c:out
									value="${orderForm.nextDestinationCollectionTime}"
									default="-----" /></td>
							<th>Palautusaika</th>
							<td><c:out value="${orderForm.nextDestinationTime}"
									default="-----" /></td>
						</tr>

						<tr>
							<th>Osoite</th>
							<td><c:out value="${orderForm.nextDestinationAddress}"
									default="-----" /></td>
							<th>Postinumero</th>
							<td><c:out value="${orderForm.nextDestinationPostalCode}"
									default="-----" /></td>
						</tr>

						<tr>
							<th>Toimipaikka</th>
							<td><c:out value="${orderForm.nextDestinationCity}"
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
									value="${orderForm.nextAdditionalInformation}" default="-----" /></td>
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
						<td><c:out value="${userProfile.fName}" default="-----" /></td>
						<th>Puhelinnumero</th>
						<td><c:out value="${userProfile.phoneNo}" default="-----" /></td>
					</tr>
					<tr>
						<th>Sukunimi</th>
						<td><c:out value="${userProfile.lName}" default="-----" /></td>
						<th>Yritys</th>
						<td><c:out value="${userProfile.company.name}"
								default="-----" /></td>
					</tr>

					<tr>

						<td><a href="orderForm" class="btn btn-primary">Takaisin</a></td>

						<td><form action="orderSend" method="post"
								class="form-horizontal">
								<fieldset>
									<button type="submit" class="btn btn-success">Lähetä
										tilaus</button>
								</fieldset>
							</form></td>
						<td colspan="2"></td>
					</tr>
				</table>

			</div>
		</div>
	</div>
</body>
</html>