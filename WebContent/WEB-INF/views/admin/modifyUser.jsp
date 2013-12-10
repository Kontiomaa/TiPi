<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Muokkaa käyttäjää</title>
</head>
<body>
	<div class="container">

		<%@include file="navi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="span10 offset1">
					<form name="modifyUserResetPassword" method="post"
						action="modifyUserResetPassword">
						<input type="hidden" name="user_id" id="user_id"
								value="${modifyUser.user_id}" />
						<input type="hidden" name="email" id="email"
								value="${modifyUser.email}" />
						<legend>
							Muokkaa käyttäjää
							<a class="btn" onClick="deleteConfirmation()">Palauta
								salasana</a>
						</legend>
					</form>
					<form:form action="saveModifiedUser" modelAttribute="modifyUser"
						method="post" class="form-horizontal">
						<fieldset>
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
											<strong style="font-size: 200%" class="span1 text-error"
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
											<strong style="font-size: 200%" class="span1 text-error"
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
														test="${modifyUser.myCompany == company.company_id}">
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
											<strong style="font-size: 200%" class="span1 text-error"
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
											<strong style="font-size: 200%" class="span1 text-error"
												rel="tooltip" title="${status.errorMessage}"> x </strong>
										</c:if>
									</spring:bind>
								</div>
								<div class="control-group">
									<form:label path="myRole" class="control-label" for="textinput">Rooli*</form:label>
									<div class="controls span6">
										<form:select path="myRole">
											<c:choose>
												<c:when test="${modifyUser.myRole == '2'}">
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
						<form:input type="hidden" path="user_id"
							value="${modifyUser.user_id}" />
						<c:choose>
							<c:when test="${modifyUser.myRole == '2'}">
								<br>
								<a href="admins" class="btn btn-primary">Takaisin</a>
							</c:when>
							<c:otherwise>
								<br>
								<a href="users" class="btn btn-primary">Takaisin</a>
							</c:otherwise>
						</c:choose>
						<button type="submit" class="btn btn-success">Tallenna</button>

						<c:choose>
							<c:when test="${modifyUser.userIsActive}">
								<form:input type="hidden" path="userIsActive" value="false" />
								<button type="submit" name="changeUserIsActiveStatus"
									value="true" class="btn btn-danger pull-right">Poista</button>
							</c:when>
							<c:otherwise>
								<form:input type="hidden" path="userIsActive" value="true" />
								<button type="submit" name="changeUserIsActiveStatus"
									value="true" class="btn btn-success pull-right">Palauta</button>
							</c:otherwise>
						</c:choose>
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
		function deleteConfirmation() {
			var a = new Boolean();
			a = window.confirm('Haluatko varmasti korvata käyttäjän salasanan?');
			if (a) {
				document.modifyUserResetPassword.submit();
			}
		}
	</script>
</body>
</html>