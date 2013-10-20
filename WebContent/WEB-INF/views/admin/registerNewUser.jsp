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
									</div>
									<div class="control-group">
										<form:label path="lName" class="control-label" for="textinput">Sukunimi*</form:label>
										<div class="controls span6">
											<form:input path="lName" name="textinput"
												placeholder="esim Meikäläinen" class="input-large"
												type="text" />
										</div>
									</div>
								</div>
								<div class="span6">
									<div class="control-group">
										<form:label path="phoneNo" class="control-label"
											for="textinput">Puhelinnumero*</form:label>
										<div class="controls span6">
											<form:input path="phoneNo" name="textinput"
												placeholder="esim 0400123123" class="input-large"
												type="text" />
										</div>
									</div>
									<div class="control-group">
										<form:label path="email" class="control-label" for="textinput">Sähköposti*</form:label>
										<div class="controls span6">
											<form:input path="email" name="textinput"
												placeholder="esim matti.meikäläinen@esim.fi"
												class="input-large" type="text" />
										</div>
									</div>
								</div>
							</div>
							<br> <a href="registerEmptyUser" class="btn btn-danger">Tyhjennä</a>
							<button type="submit" class="btn btn-inverse">Seuraava</button>
						</fieldset>
					</form:form>
				</div>
			</div>
		</div>
</body>
</html>