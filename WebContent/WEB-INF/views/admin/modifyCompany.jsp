<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Muokkaa yritystä</title>
</head>
<body>
	<div class="container">

		<%@include file="navi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="span10 offset1">
				<form:form action="saveModifiedCompany"
					modelAttribute="modifyCompany" method="post"
					class="form-horizontal">
					<fieldset>
						<legend>Muokkaa yritystä</legend>
						<div class="row-fluid">
							<div class="span6">
								<div class="control-group">
									<form:label path="name" class="control-label" for="textinput">Nimi*</form:label>
									<div class="controls span6">
										<form:input path="name" name="textinput"
											placeholder="esim Autoliike OY" class="input-large"
											type="text" />
									</div>
									<spring:bind path="name">
										<c:if test="${status.error}">
											<strong style="font-size: 200%" class="span1 text-error"
												rel="tooltip" title="${status.errorMessage}"> x </strong>
										</c:if>
									</spring:bind>
								</div>
								<div class="control-group">
									<form:label path="address" class="control-label"
										for="textinput">Osoite*</form:label>
									<div class="controls span6">
										<form:input path="address" name="textinput"
											placeholder="esim Vauhtikatu 13a" class="input-large"
											type="text" />
									</div>
									<spring:bind path="address">
										<c:if test="${status.error}">
											<strong style="font-size: 200%" class="span1 text-error"
												rel="tooltip" title="${status.errorMessage}"> x </strong>
										</c:if>
									</spring:bind>
								</div>
							</div>
							<div class="span6">
								<div class="control-group">
									<form:label path="postalCode" class="control-label"
										for="textinput">Postinumero*</form:label>
									<div class="controls span6">
										<form:input path="postalCode" name="textinput"
											placeholder="esim 00220" class="input-large" type="text" />
									</div>
									<spring:bind path="postalCode">
										<c:if test="${status.error}">
											<strong style="font-size: 200%" class="span1 text-error"
												rel="tooltip" title="${status.errorMessage}"> x </strong>
										</c:if>
									</spring:bind>
								</div>
								<div class="control-group">
									<form:label path="city" class="control-label" for="textinput">Toimipaikka*</form:label>
									<div class="controls span6">
										<form:input path="city" name="textinput"
											placeholder="esim Helsinki" class="input-large" type="text" />
									</div>
									<spring:bind path="city">
										<c:if test="${status.error}">
											<strong style="font-size: 200%" class="span1 text-error"
												rel="tooltip" title="${status.errorMessage}"> x </strong>
										</c:if>
									</spring:bind>
								</div>
							</div>
						</div>
						<form:input type="hidden" path="company_id"
							value="${order.orders_id}" />
						<br> <a href="companies" class="btn btn-primary">Takaisin</a>
						<button type="submit" class="btn btn-success">Tallenna</button>
					</fieldset>
				</form:form>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript"
		src="../resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("[rel=tooltip]").tooltip({
				placement : 'bottom'
			});
		});
	</script>
</body>
</html>