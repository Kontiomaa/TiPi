<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Tilaukset</title>

<script type="text/javascript"
	src="../resources/jquery-tablesorter/jquery.tablesorter.min.js"></script>

</head>
<body>
	<div class="container">
		<%@include file="userNavi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="span10 offset1">
				<form:form action="showOrders" modelAttribute="searchOrders"
					method="post" class="form-horizontal">
					<fieldset>
						<legend>Suodata tilauksia</legend>
						<div class="row-fluid">
							<div class="span4">
								<div class="control-group">
									<form:label path="hasNewDestinationForSearchOrders"
										class="control-label" for="textinput" style="text-align:left;">Tilaukset</form:label>
									<div class="controls span6">
										<form:select path="companyMadeOrder">
											<c:choose>
												<c:when test="${searchOrders.companyMadeOrder == '0'}">
													<option value="0" selected>Omat</option>
													<option value="1">Yrityksen</option>
												</c:when>
												<c:otherwise>
													<option value="0">Omat</option>
													<option value="1" selected>Yrityksen</option>
												</c:otherwise>
											</c:choose>
										</form:select>

									</div>
								</div>
							</div>
							<div class="span4">
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
							<div class="span4">
								<div class="control-group">
									<form:label path="statusOfOrder" class="control-label"
										for="textinput" style="text-align:left;">Tilauksen status</form:label>
									<div class="controls span6">
										<form:select path="statusOfOrder">
											<c:choose>
												<c:when test="${searchOrders.statusOfOrder == '1'}">
													<option value="0">Kaikki</option>
													<option value="1" selected>Uudet</option>
													<option value="2">Kuitatut</option>
													<option value="3">Toimitetut</option>
													<option value="4">Valmiit</option>
												</c:when>
												<c:when test="${searchOrders.statusOfOrder == '2'}">
													<option value="0">Kaikki</option>
													<option value="1">Uudet</option>
													<option value="2" selected>Kuitatut</option>
													<option value="3">Toimitetut</option>
													<option value="4">Valmiit</option>
												</c:when>
												<c:when test="${searchOrders.statusOfOrder == '3'}">
													<option value="0">Kaikki</option>
													<option value="1">Uudet</option>
													<option value="2">Kuitatut</option>
													<option value="3" selected>Toimitetut</option>
													<option value="4">Valmiit</option>
												</c:when>
												<c:when test="${searchOrders.statusOfOrder == '4'}">
													<option value="0">Kaikki</option>
													<option value="1">Uudet</option>
													<option value="2">Kuitatut</option>
													<option value="3">Toimitetut</option>
													<option value="4" selected>Valmiit</option>
												</c:when>
												<c:otherwise>
													<option value="0" selected>Kaikki</option>
													<option value="1">Uudet</option>
													<option value="2">Kuitatut</option>
													<option value="3">Toimitetut</option>
													<option value="4">Valmiit</option>
												</c:otherwise>
											</c:choose>
										</form:select>
									</div>
								</div>
							</div>
							<button type="submit" class="btn btn-success">Suodata</button>
					</fieldset>
				</form:form>

				<legend>Tilaukset</legend>

				<table id="myTable" class="table table-striped">
					<thead>
						<tr>
							<th>Rek.nro</th>
							<th>Mistä</th>
							<th>Mihin</th>
							<th>Palautetaan</th>
							<th>Muokattu</th>
							<th>Status</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orders}" var="order">
							<tr>
								<td><c:out value="${order.carRegister}" /></td>
								<td><c:out value="${order.collectionCity}" />, <c:out
										value="${order.collectionAddress}" />
									<div style="float: right; text-align: right">
										<i class="icon-arrow-right"></i>
									</div></td>
								<c:choose>
									<c:when test="${order.hasNewDestination}">
										<td><c:out value="${order.destinationCity}" />, <c:out
												value="${order.destinationAddress}" />
											<div style="float: right; text-align: right">
												<i class="icon-arrow-right"></i>
											</div></td>
										<td><c:out value="${order.nextDestinationCity}" />, <c:out
												value="${order.nextDestinationAddress}" /></td>
									</c:when>
									<c:otherwise>
										<td><c:out value="${order.destinationCity}" />, <c:out
												value="${order.destinationAddress}" /></td>
										<td></td>
									</c:otherwise>
								</c:choose>

								<td><c:out value="${order.lastTimeEdited}" /></td>

								<c:choose>
									<c:when test="${order.statusOfOrder=='1'}">
										<td class="userOrders"><span class="label label-inverse" 
										rel="tooltip" title="Uusi"
										>U</span></td>
									</c:when>
									<c:when test="${order.statusOfOrder=='2'}">
										<td class="userOrders"><span class="label label-default" 
										rel="tooltip" title="Kuitattu">K</span></td>
									</c:when>
									<c:when test="${order.statusOfOrder=='3'}">
										<td class="userOrders"><span class="label label-success" 
										rel="tooltip" title="Toimitettu">T</span></td>
									</c:when>
									<c:when test="${order.statusOfOrder=='4'}">
										<td class="userOrders"><span class="label label-info" 
										rel="tooltip" title="Valmis">V</span></td>
									</c:when>
									<c:otherwise>
										<td></td>
									</c:otherwise>
								</c:choose>

								<td>
									<form method="post" action="getOneOrder" class="buttonForm">
										<input name="orderId" type="hidden" value="${order.orders_id}" />
										<button class="btn btn-primary">Avaa</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript"
		src="../resources/jquery-dataTables/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="../resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="../resources/styles/dataTableConf.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("[rel=tooltip]").tooltip({
								placement : 'bottom'
							});
							
							$('#myTable')
									.dataTable(
											{
												"aaSorting" : [ [ 4, "asc" ] ],
												"bInfo" : false,
												"sDom" : "<'row'<'span5 offset1'l><'span5 offset1'f>r>t<'row'<'span5'i><'span5'p>>",
												"sPaginationType" : "bootstrap",
												"oLanguage" : {
													"sLengthMenu" : "Näytä _MENU_",
													"sSearch" : "Hae",
													"sZeroRecords" : "Ei tilauksia",
													"oPaginate" : {
														"sNext" : "Seuraava",
														"sPrevious" : "Edellinen",
													},
												},
												"aoColumnDefs" : [ {
													"aTargets" : [ 0 ],
													"bSortable" : true
												}, {
													"aTargets" : [ 1 ],
													"bSortable" : true
												}, {
													"aTargets" : [ 2 ],
													"bSortable" : true
												}, {
													"aTargets" : [ 3 ],
													"bSortable" : true
												}, {
													"aTargets" : [ 4 ],
													"sType" : "date-uk"
												}, {
													"aTargets" : [ 5 ],
													"bSortable" : true
												}, {
													"aTargets" : [ 6 ],
													"bSortable" : false
												}, ],
											});
						});
	</script>
</body>
</html>