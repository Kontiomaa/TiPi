<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Uusi yritys</title>
</head>
<body>
	<div class="container">

		<%@include file="navi.jsp"%>

		<div class="row-fluid" id="area">
			<div class="row-fluid">
				<div class="span12">
					<ul class="nav nav-tabs">
						<li><a href="registerNewUser">Käyttäjä</a></li>
						<li class="active"><a href="registerNewCompany">Yritys</a></li>
					</ul>
				</div>
			</div>
			<div class="span10 offset1">
				<form:form modelAttribute="registerCompany" method="post"
					class="form-horizontal">
					<c:if test="${not empty registerNewCompanySuccessful}">
						<p class="alert alert-success">Uusi yritys lisätty</p>
					</c:if>
					<fieldset>
						<legend>Rekisteröi yritys</legend>
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
											<strong class="span1 text-error errorX"
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
											<strong class="span1 text-error errorX"
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
											<strong class="span1 text-error errorX"
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
											<strong class="span1 text-error errorX"
												rel="tooltip" title="${status.errorMessage}"> x </strong>
										</c:if>
									</spring:bind>
								</div>
							</div>
						</div>
						<br> <a href="registerEmptyCompany" class="btn btn-danger">Tyhjennä</a>
						<button type="submit" class="btn btn-primary">Seuraava</button>
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