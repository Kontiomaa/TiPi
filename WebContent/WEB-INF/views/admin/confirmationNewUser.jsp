<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Uusi tilaus</title>
</head>
<body>
	<div class="container">
		<%@include file="navi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="span10 offset1">
				<table class="table" id="confirmationCompanyTable">
					<thead>
						<tr>
							<td colspan="4" style="font-size: 20px; font-weight: 700;">Firma</td>
						</tr>
					</thead>
					<tr>
						<th>Nimi</th>
						<td><c:out value="${registerUser.fName}" default="-----" /></td>
						<th>Osoite</th>
						<td><c:out value="${registerUser.lName}" default="-----" /></td>
					</tr>
					<tr>
						<th>Postinumero</th>
						<td><c:out value="${registerUser.phoneNo}" default="-----" /></td>
						<th>Kaupunki</th>
						<td><c:out value="${registerUser.email}" default="-----" /></td>
					</tr>
					
					<tr>

						<td><a href="registerNewUser" class="btn btn-danger">Takaisin</a></td>

						<td><form action="registerNewUserSend" method="post"
								class="form-horizontal">
								<fieldset>
									<button type="submit" class="btn btn-inverse">Lähetä
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