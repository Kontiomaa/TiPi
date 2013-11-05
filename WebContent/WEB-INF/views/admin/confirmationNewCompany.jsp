<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Yrityksen tiedot</title>
</head>
<body>
	<div class="container">
		<%@include file="navi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="span10 offset1">
				<table class="table table-striped" id="confirmationCompanyTable">
					<thead>
						<tr>
							<td colspan="4" style="font-size: 20px; font-weight: 700;">Firma</td>
						</tr>
					</thead>
					<tr>
						<th>Nimi</th>
						<td><c:out value="${registerCompany.name}" default="-----" /></td>
						<th>Osoite</th>
						<td><c:out value="${registerCompany.address}" default="-----" /></td>
					</tr>
					<tr>
						<th>Postinumero</th>
						<td><c:out value="${registerCompany.postalCode}"
								default="-----" /></td>
						<th>Kaupunki</th>
						<td><c:out value="${registerCompany.city}" default="-----" /></td>
					</tr>
					<tr>
						<td><a href="registerNewCompany" class="btn btn-primary">Takaisin</a></td>
						<td><form action="registerNewCompanySend" method="post"
								class="form-horizontal">
								<fieldset>
									<button type="submit" class="btn btn-success">Rekisteröi
										yritys</button>
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