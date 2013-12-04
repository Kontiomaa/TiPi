
<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Yritykset</title>
</head>
<body>
	<div class="container">
		<%@include file="navi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="row-fluid">
				<div class="span12">
					<ul class="nav nav-tabs">
						<li><a href="users">Asiakkaat</a></li>
						<li><a href="admins">Adminit</a></li>
						<li class="active"><a href="companies">Yritykset</a></li>
					</ul>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span10 offset1">
					<fieldset>
						<legend>Yritykset</legend>
						<div class="row-fluid">
							<div class="span12">
								<table id="myTable" class="table table-striped">
									<thead>
										<tr>
											<th>Nimi</th>
											<th>Osoite</th>
											<th>Postiosoite</th>
											<th>Toimipaikka</th>
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
												<td>
												<form action="modifyCompany" method="post" class="span4">
													<input type="hidden" name="company_id"
														id="company_id" value="${company.company_id}" />
														<button class="btn btn-primary" type="submit">Muokkaa</button>
												</form></td>
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
			               ],
		} );
	} );
	</script>
</body>
</html>