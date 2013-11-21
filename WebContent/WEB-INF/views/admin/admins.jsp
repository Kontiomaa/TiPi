
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
											<th></th>
											<th></th>
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
		src="../resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="../resources/jquery-dataTables/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="../resources/styles/dataTableConf.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$("[rel=tooltip]").tooltip({
			placement : 'bottom'
		});
		$('#myTable').dataTable( {
			"aaSorting": [[ 0, "asc" ]],
			"bInfo": false,
			"sDom": "<'row'<'span5 offset1'l><'span5 offset1'f>r>t<'row'<'span5'i><'span5'p>>",
			"sPaginationType": "bootstrap",
			"oLanguage": {
				"sLengthMenu" : "Näytä _MENU_",
				"sSearch": "Hae",
				"sZeroRecords": "Ei käyttäjiä", 
				"oPaginate": {
				"sNext": "Seuraava",
				"sPrevious": "Edellinen",
				},
			},
			"aoColumnDefs": [
			               { "aTargets": [ 0 ], "bSortable": true },
			               { "aTargets": [ 1 ], "bSortable": true },
			               { "aTargets": [ 2 ], "bSortable": true },
			               { "aTargets": [ 3 ], "bSortable": true },
			               { "aTargets": [ 4 ], "bSortable": false },
			               { "aTargets": [ 5 ], "bSortable": false },
			               ],
		} );
	} );
	</script>
</body>
</html>