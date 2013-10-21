
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
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Etunimi</th>
											<th>Sukunimi</th>
											<th>Yritys</th>
											<th>Rooli</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Monty AB</td>
											<td>Vantaa, Vantaankatu 6</td>
											<td>Espoo, Espoonkuja 3</td>
											<td>xx:xx xx.xx.xxxx</td>
											<td><button class="btn btn-primary">Avaa</button>
												<button class="btn btn-success">Muokkaa</button></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</fieldset>
				</div>
			</div>
		</div>