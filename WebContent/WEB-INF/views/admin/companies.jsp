
<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- k�ytt�j�t</title>
</head>
<body>
	<div class="container">
		<%@include file="navi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="row-fluid">
				<div class="span12">
					<ul class="nav nav-tabs">
						<li><a href="users">Asiakas</a></li>
						<li><a href="admins">Admin</a></li>
						<li class="active"><a href="companies">Yritys</a></li>
					</ul>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span10 offset1">
					<fieldset>
						<legend>Yritys</legend>
						<div class="row-fluid">
							<div class="span12">
								<table id="myTable" class="table table-striped">
									<thead>
										<tr>
											<th>Nimi</th>
											<th>Osoite</th>
											<th>Postiosoite</th>
											<th>Kaupunki</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${allCompanies}" var="company">
											<tr>
												<td><c:out value="${company.name}" /></td>
												<td><c:out value="${company.address}" /></td>
												<td><c:out value="${company.postalCode}" /></td>
												<td><c:out value="${company.city}" /></td>
												<form action="modifyCompany" method="post" class="span4">
													<td><input type="hidden" name="company_id" id="company_id"
														value="${company.company_id}" />
														<button class="btn btn-primary" type="submit"
															value="submit">Muokkaa</button></td>
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