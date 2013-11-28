<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Uusi käyttäjä</title>
</head>
<body>
	<div class="container">

		<%@include file="navi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="row-fluid">
				<div class="span12">
					<ul class="nav nav-tabs">
						<li class="active"><a href="registerNewUser">Käyttäjä</a></li>
						<li><a href="registerNewCompany">Yritys</a></li>
					</ul>
				</div>
			</div>
			<div class="span10 offset1">
				<form:form modelAttribute="registerUser" method="post"
					class="form-horizontal">
					<c:if test="${not empty registerNewUserSuccessful}">
						<p class="alert alert-success">Uusi käyttäjä lisätty</p>
					</c:if>
					<fieldset>
						<legend>Rekisteröi käyttäjä</legend>
						<div class="row-fluid">
							<div class="span6">
								<div class="control-group">
									<form:label path="fName" class="control-label" for="textinput">Etunimi*</form:label>
									<div class="controls span6">
										<form:input path="fName" name="textinput"
											placeholder="esim Matti" class="input-large" type="text" />
									</div>
									<spring:bind path="fName">
										<c:if test="${status.error}">
											<strong class="span1 text-error errorX"
												rel="tooltip" title="${status.errorMessage}"> x </strong>
										</c:if>
									</spring:bind>
								</div>
								<div class="control-group">
									<form:label path="lName" class="control-label" for="textinput">Sukunimi*</form:label>
									<div class="controls span6">
										<form:input path="lName" name="textinput"
											placeholder="esim Meikäläinen" class="input-large"
											type="text" />
									</div>
									<spring:bind path="lName">
										<c:if test="${status.error}">
											<strong class="span1 text-error errorX"
												rel="tooltip" title="${status.errorMessage}"> x </strong>
										</c:if>
									</spring:bind>
								</div>
								<div class="control-group">
									<form:label path="myCompany" class="control-label"
										for="textinput">Yritys*</form:label>
									<div class="controls span6">
										<form:select path="myCompany">
											<c:forEach var="company" items="${allCompanies}">
												<c:choose>
													<c:when
														test="${registerUser.myCompany == company.company_id}">
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
									<form:label path="phoneNo" class="control-label"
										for="textinput">Puhelinnumero*</form:label>
									<div class="controls span6">
										<form:input path="phoneNo" name="textinput"
											placeholder="esim 0400123123" class="input-large" type="text" />
									</div>
									<spring:bind path="phoneNo">
										<c:if test="${status.error}">
											<strong class="span1 text-error errorX"
												rel="tooltip" title="${status.errorMessage}"> x </strong>
										</c:if>
									</spring:bind>
								</div>
								<div class="control-group">
									<form:label path="email" class="control-label" for="textinput">Sähköposti*</form:label>
									<div class="controls span6">
										<form:input path="email" name="textinput"
											placeholder="esim matti.meikäläinen@esim.fi"
											class="input-large" type="text" />
									</div>
									<spring:bind path="email">
										<c:if test="${status.error}">
											<strong class="span1 text-error errorX"
												rel="tooltip" title="${status.errorMessage}"> x </strong>
										</c:if>
									</spring:bind>
								</div>
								<div class="control-group">
									<form:label path="myRole" class="control-label" for="textinput">Rooli*</form:label>
									<div class="controls span6">
										<form:select path="myRole">
											<c:choose>
												<c:when test="${registerUser.myRole == '2'}">
													<option value="1">Asiakas</option>
													<option value="2" selected>Admin</option>
												</c:when>
												<c:otherwise>
													<option value="1" selected>Asiakas</option>
													<option value="2">Admin</option>
												</c:otherwise>
											</c:choose>
										</form:select>

									</div>
								</div>
							</div>
						</div>
						<br> <a href="registerEmptyUser" class="btn btn-danger">Tyhjennä</a>
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