
<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Hae tilauksia</title>
</head>
<body>
	<div class="container">

		<%@include file="navi.jsp"%>
		<div class="row-fluid" id="area">
			<%@include file="ordersNavi.jsp"%>
			<div class="row-fluid">
				<div class="span10 offset1">

					<form:form action="searchOrders" modelAttribute="searchOrders"
						method="post" class="form-horizontal">
						<fieldset>
							<legend>Hae tilauksia</legend>
							<div class="row-fluid">
								<div class="span6">
									<div class="control-group">
										<form:label path="carBrand" class="control-label"
											for="textinput">Automerkki</form:label>
										<div class="controls span6">
											<form:input path="carBrand" name="textinput"
												placeholder="esim Audi" class="input-large" type="text" />
										</div>
									</div>

									<div class="control-group">
										<form:label path="carModel" class="control-label"
											for="textinput">Automalli</form:label>
										<div class="controls span6">
											<form:input path="carModel" name="textinput"
												placeholder="esim A5" class="input-large" type="text" />
										</div>
									</div>

									<div class="control-group">
										<form:label path="carRegister" class="control-label"
											for="textinput">Rekisterinumero</form:label>
										<div class="controls span6">
											<form:input path="carRegister" name="textinput"
												placeholder="esim ABC-123" class="input-large" type="text" />
										</div>
									</div>
									<div class="control-group">
										<form:label path="companyMadeOrder" class="control-label"
											for="textinput">Yritys</form:label>
										<div class="controls span6">
											<form:select path="companyMadeOrder">
												<option value="0">Valitse</option>
												<c:forEach var="company" items="${allCompanies}">
													<c:choose>
														<c:when
															test="${searchOrders.companyMadeOrder == company.company_id}">
															<option selected value="${company.company_id}">${company.name}</option>
														</c:when>
														<c:otherwise>
															<option value="${company.company_id}">${company.name}</option>
														</c:otherwise>
													</c:choose>

												</c:forEach>
											</form:select>
										</div>
									</div>
								</div>
								<div class="span6">
									<div class="control-group">
										<form:label path="collectionCity" class="control-label"
											for="textinput">Nouto toimipaikka</form:label>
										<div class="controls span6">
											<form:input path="collectionCity" name="textinput"
												placeholder="esim Helsinki" class="input-large" type="text" />
										</div>
									</div>
									<div class="control-group">
										<form:label path="destinationCity" class="control-label"
											for="textinput">Toimitus toimipaikka</form:label>
										<div class="controls span6">
											<form:input path="destinationCity" name="textinput"
												placeholder="esim Vantaa" class="input-large" type="text" />
										</div>
									</div>
									<div class="control-group">
										<form:label path="nextDestinationCity" class="control-label"
											for="textinput">Palautus toimipaikka</form:label>
										<div class="controls span6">
											<form:input path="nextDestinationCity" name="textinput"
												placeholder="esim Espoo" class="input-large" type="text" />
										</div>
									</div>
									<div class="control-group">
										<form:label path="hasNewDestinationForSearchOrders"
											class="control-label" for="textinput">Tilauksessa on palautus</form:label>
										<div class="controls span6">
											<form:select path="hasNewDestinationForSearchOrders">
												<c:choose>
													<c:when
														test="${searchOrders.hasNewDestinationForSearchOrders == '2'}">
														<option value="0">Valitse</option>
														<option value="1">Ei</option>
														<option value="2" selected>Kyllä</option>
													</c:when>
													<c:when
														test="${searchOrders.hasNewDestinationForSearchOrders == '1'}">
														<option value="0">Valitse</option>
														<option value="1" selected>Ei</option>
														<option value="2">Kyllä</option>
													</c:when>
													<c:otherwise>
														<option value="0" selected>Valitse</option>
														<option value="1">Ei</option>
														<option value="2">Kyllä</option>

													</c:otherwise>
												</c:choose>
											</form:select>

										</div>
									</div>
								</div>
							</div>
							<button type="submit" class="btn btn-success">Hae</button>
						</fieldset>
					</form:form>

					<fieldset>
						<legend>Haetut tilaukset</legend>
						<div class="row-fluid">
							<div class="span12">

								<table id="myTable" class="table table-striped">
									<thead>
										<tr>
											<th>Yritys</th>
											<th>Nouto</th>
											<th>Toimitus</th>
											<th>Palautus</th>
											<th>Valmis</th>
											<th></th>
											<!-- Yrityksen nimi, tilausksen numero (id) valmistunut aika (tilauksen haluttu palautusaika)-->
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${orders}" var="order">
											<tr>
												<td><c:out value="${order.userProfile.company.name}" /></td>
												<td><c:out value="${order.collectionCity}" />, <c:out
														value="${order.collectionAddress}" />
													<div style="float: right; text-align: right">
														<i class="icon-arrow-right"></i>
													</div></td>
												<c:choose>
													<c:when test="${order.hasNewDestination}">
														<td><c:out value="${order.destinationCity}" />
															<div style="float: right; text-align: right">
																<i class="icon-arrow-right"></i>
															</div>, <c:out value="${order.destinationAddress}" /></td>
														<td><c:out value="${order.nextDestinationCity}" />,
															<c:out value="${order.nextDestinationAddress}" /></td>
														<td><c:out value="${order.nextDestinationDate}" /> <c:out 
														value="${order.nextDestinationTime}" /></td>
													</c:when>
													<c:otherwise>
														<td><c:out value="${order.destinationCity}" />, <c:out
																value="${order.destinationAddress}" /></td>
														<td></td>
														<td><c:out value="${order.destinationDate}" /> <c:out
																value="${order.destinationTime}" /></td>
													</c:otherwise>
												</c:choose>
												<form action="orderInformation" method="post" class="span4">
													<td><input type="hidden" name="orderID" id="orderID"
														value="${order.orders_id}" /> <input type="hidden"
														name="backToSearchOrders" id="backToSearchOrders"
														value="1" />
														<button class="btn btn-primary" type="submit"
															value="submit">Avaa</button></td>
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
		src="../resources/jquery-dataTables/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="../resources/styles/dataTableConf.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		$('#myTable').dataTable( {
			"aaSorting": [[ 4, "asc" ]],
			"bInfo": false,
			"sDom": "<'row'<'span5 offset1'l><'span5 offset1'f>r>t<'row'<'span5'i><'span5'p>>",
			"sPaginationType": "bootstrap",
			"oLanguage": {
				"sLengthMenu" : "Näytä _MENU_",
				"sSearch": "Hae",
				"sZeroRecords": "Ei tilauksia", 
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
			               { "aTargets": [ 4 ], "sType": "date-uk"},
			               { "aTargets": [ 5 ], "bSortable": false },
			               ],
		} );
	} );
	</script>
</body>
</html>