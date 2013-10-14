		<%@include file="header.jsp"%>
		<title>Siirtoapu.fi -- Uudet tilaukset</title>
	</head>
	<body>
		<div class="container">

			<%@include file="navi.jsp"%>
			<div class="row-fluid" id="area">
				<div class="row-fluid">
					<div class="span12">
						<ul class="nav nav-tabs">
    						<li class="active"><a href="new">Uudet</a></li>
							<li><a href="accepted">Kuitatut</a></li>
							<li><a href="collected">Haetut</a></li>
							<li><a href="taken">Viedyt</a></li>
							<li><a href="returned">Palautetut</a></li>
							<li><a href="completed">Valmiit</a></li>
    					</ul>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span10 offset1">
					
						<fieldset>
							<legend>Tehdyt tilaukset</legend>
							<div class="row-fluid">
								<div class="span12">
										<%--
										<span class="span6"><c:out value="${orderForm.clientCompany}" default="-----" /></span>
										<span class="span6"><c:out value="${orderForm.collectionTime}" default="xx:xx" /> <c:out value="${orderForm.collectionDate}" default="xx.xx.xx" /></span>
										--%>
										
										<table class="table table-striped">
											<thead>
												<tr>
													<th>Yritys</th>
													<th>Mist‰</th>
													<th></th>
													<th>Mihin</th>
													<th>Luontip‰iv‰m‰‰r‰</th>
													<th></th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Monty AB</td>
													<td>Vantaa, Vantaankatu 6</td>
													<td><i class="icon-arrow-right"></i></td>
													<td>Espoo, Espoonkuja 3</td>
													<td>xx:xx xx.xx.xxxx</td>
													<td><button class="btn btn-primary">Avaa</button> <button class="btn btn-success">Kuittaa</button></td>
												</tr>
												<tr>
													<td>Yritys Oy</td>
													<td>Helsinki, Mannerheimintie 6</td>
													<td><i class="icon-arrow-right"></td>
													<td>Espoo, Kurapolku 1</td>
													<td>xx:xx xx.xx.xxxx</td>
													<td><button class="btn btn-primary">Avaa</button> <button class="btn btn-success">Kuittaa</button></td>
												</tr>
											</tbody>
										</table>
								</div>
							</div>
						</fieldset>
					
					</div>
				</div>
			</div>
		</div>
	</body>
</html>