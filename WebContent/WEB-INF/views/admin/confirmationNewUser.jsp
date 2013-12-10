<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Käyttäjän tiedot</title>
</head>
<body>
	<div class="container">
		<%@include file="navi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="span10 offset1">
				<table class="table table-striped" id="confirmationCompanyTable">
					<thead>
						<tr>
							<td colspan="4" style="font-size: 20px; font-weight: 700;">Käyttäjä</td>
						</tr>
					</thead>
					<tr>
						<th>Etunimi</th>
						<td><c:out value="${registerUser.fName}" default="-----" /></td>
						<th>Puhelinnumero</th>
						<td><c:out value="${registerUser.phoneNo}" default="-----" /></td>
					</tr>
					<tr>
						<th>Sukunimi</th>
						<td><c:out value="${registerUser.lName}" default="-----" /></td>
						<th>Sähköposti</th>
						<td><c:out value="${registerUser.email}" default="-----" /></td>
					</tr>
					<tr>
						<th>Yritys</th>
						<c:forEach var="company" items="${allCompanies}">
							<c:choose>
								<c:when test="${registerUser.myCompany==company.company_id}">
									<td><c:out value="${company.name}" /></td>
								</c:when>
							</c:choose>
						</c:forEach>
						<th>Rooli</th>
						<c:choose>
							<c:when test="${registerUser.myRole=='1'}">
								<td>Asiakas</td>
							</c:when>
							<c:otherwise>
								<td>Admin</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</table>
				<form action="registerNewUserSend" method="post"
					class="form-horizontal">
					<fieldset>
						<div class="row-fluid">
							<div class="span12">
										<input type="hidden" class="input-xlarge" name="password"
											id="password" value="${generatedPassword}"/>
								<h3>Uuden käyttäjän salasana on: <c:out value="${generatedPassword}" default="-----" /></h3>
								<div class="row-fluid">
									<div>
										<a href="registerNewUser" class="btn btn-primary">Takaisin</a>

										<button type="submit" class="btn btn-success"
											id="submit">Rekisteröi käyttäjä</button>
									</div>
								</div>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</body>
</html>