
<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- käyttäjät</title>
</head>
<body>
	<div class="container">
		<%@include file="navi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="row-fluid">
				<div class="span12">
					<ul class="nav nav-tabs">
						<li><a href="users">Asiakas</a></li>
						<li class="active"><a href="admins">Admin</a></li>
						<li><a href="companies">Yritys</a></li>
					</ul>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span10 offset1">

					<fieldset>
						<legend>Admin</legend>
						<div class="row-fluid">
							<div class="span12">
								<table id="myTable" class="table table-striped">
									<thead>
										<tr>
											<th>Nimi</th>
											<th>Puhelinnumero</th>
											<th>Sähköposti</th>
											<th>Yritys</th>
											<th></th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${users}" var="user">
											<tr>
												<td><c:out value="${user.fName}" /> <c:out value="${user.lName}" /></td>
												<td><c:out value="${user.phoneNo}" /></td>
												<td><c:out value="${user.email}" /></td>
												<td><c:out value="${user.company.name}" /></td>
												<form action="modifyCompany" method="post">
													<td><input type="hidden" name="company_id" id="company_id"
														value="${user.user_id}" />
														<button class="btn btn-primary" type="submit"
															value="submit">Muokkaa</button></td>
												</form>
												<form action="modifyCompany" method="post">
													<td><input type="hidden" name="company_id" id="company_id"
														value="${user.user_id}" />
														<button class="btn btn-danger" type="submit"
															value="submit">Poista</button></td>
												</form>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</fieldset>
				</div>
			</div>
		</div>