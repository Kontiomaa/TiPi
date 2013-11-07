
<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Adminit</title>
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
						<legend>Adminit</legend>
						<div class="row-fluid">
							<div class="span12">
								<table id="myTable" class="table table-striped">
									<thead>
										<tr>
											<th>Nimi</th>
											<th>Puhelinnumero</th>
											<th>Sähköposti</th>
											<th>Yritys</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${users}" var="user">
											<tr>
												<td><c:out value="${user.fName}" /> <c:out
														value="${user.lName}" /></td>
												<td><c:out value="${user.phoneNo}" /></td>
												<td><c:out value="${user.email}" /></td>
												<td><c:out value="${user.company.name}" /></td>
												<form action="modifyUser" method="post">
													<td><input type="hidden" name="user_id" id="user_id"
														value="${user.user_id}" />
														<button class="btn btn-primary" type="submit"
															value="submit">Muokkaa</button></td>
													<td><c:if test="${!user.userIsActive}">
															<strong style="font-size: 200%"
																class="text-error text-center" rel="tooltip"
																title="Poistettu"> x </strong>
														</c:if></td>
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
	</div>
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript"
		src="../resources/jquery-tablesorter/jquery.tablesorter.min.js"></script>
	<script type="text/javascript"
		src="../resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("[rel=tooltip]").tooltip({
				placement : 'bottom'
			});
			$(function() {
				$("table#myTable").tablesorter({
					sortList : [[0,0],[2,0]]
				});
			});
		});
	</script>
</body>
</html>