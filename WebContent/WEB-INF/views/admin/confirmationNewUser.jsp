<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Käyttäjän tiedot</title>
</head>
<body>
	<div class="container">
		<%@include file="navi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="span10 offset1">
				<table class="table table-striped" id="confirmationCompanyTable">
					<thead>
						<tr>
							<td colspan="4" style="font-size: 20px; font-weight: 700;">Käyttäjä</td>
						</tr>
					</thead>
					<tr>
						<th>Etunimi</th>
						<td><c:out value="${registerUser.fName}" default="-----" /></td>
						<th>Puhelinnumero</th>
						<td><c:out value="${registerUser.phoneNo}" default="-----" /></td>
					</tr>
					<tr>
						<th>Sukunimi</th>
						<td><c:out value="${registerUser.lName}" default="-----" /></td>
						<th>Sähköposti</th>
						<td><c:out value="${registerUser.email}" default="-----" /></td>
					</tr>
					<tr>
						<th>Yritys</th>
						<c:forEach var="company" items="${allCompanies}">
							<c:choose>
								<c:when test="${registerUser.myCompany==company.company_id}">
									<td><c:out value="${company.name}" /></td>
								</c:when>
							</c:choose>
						</c:forEach>
						<th>Rooli</th>
						<c:choose>
							<c:when test="${registerUser.myRole=='1'}">
								<td>Asiakas</td>
							</c:when>
							<c:otherwise>
								<td>Admin</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</table>
				<form action="registerNewUserSend" method="post"
					class="form-horizontal">
					<fieldset>
						<legend>Anna käyttäjälle salasana</legend>
						<div class="row-fluid">
							<div class="span12">
								<div class="control-group">
									<label id="newPassword" class="control-label" for="textinput">Salasana</label>
									<div class="controls">
										<input type="password" class="input-xlarge" name="password"
											id="password" placeholder="Kirjoita salasana" />
									</div>
								</div>

								<div class="control-group">
									<label id="newRePassword" class="control-label" for="textinput">Uudelleen</label>
									<div class="controls">
										<input type="password" class="input-xlarge"
											name="password-check" id="password-check"
											placeholder="Kirjoita salasana uudelleen" />
									</div>
								</div>

								<div class="row-fluid">
									<div>
										<a href="registerNewUser" class="btn btn-primary">Takaisin</a>

										<button type="submit" class="btn btn-success"
											id="submit">Rekisteröi käyttäjä</button>
									</div>
								</div>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("#submit")
									.click(
											function() {
												$(".text-error").hide();
												$(".text-warning").hide();
												$(".text-success").hide();
												$(".text-info").hide();
												var hasError = false;
												var passwordVal = $("#password")
														.val();
												var checkVal = $(
														"#password-check")
														.val();
												if (passwordVal == '') {
													$("#password")
															.after(
																	'<span id="info" class="text-error">Syötä uusi salasana</span>');
													hasError = true;
												} else if (checkVal == '') {
													$("#password-check")
															.after(
																	'<span id="info" class="text-error">Syötä uusi salasana uudelleen</span>');
													hasError = true;
												} else if (passwordVal != checkVal) {
													$("#password-check")
															.after(
																	'<span id="info" class="text-error">Salasanat eivät täsmää</span>');
													hasError = true;
												} else if (passwordVal.length < 6) {
													$("#password")
															.after(
																	'<span id="info" class="text-error">Salasana on liian lyhyt</span>');
													hasError = true;
												}

												if (hasError == true) {
													return false;
												}
											});

							$('#password').keyup(function() {
								checkStrength($('#password').val());
							});

							function checkStrength(password) {

								//initial strength
								var strength = 0;
								$(".text-error").hide();
								$(".text-warning").hide();
								$(".text-success").hide();
								$(".text-info").hide();

								//if the password length is less than 6, return message.
								if (password.length < 6) {
									$("#password")
											.after(
													'<span id="info" class="text-error">Lyhyt</span>');
									return 'Lyhyt';
								}

								//length is ok, lets continue.

								//if length is 8 characters or more, increase strength value
								if (password.length > 7)
									strength += 1;

								//if password contains both lower and uppercase characters, increase strength value
								if (password
										.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/))
									strength += 1;

								//if it has numbers and characters, increase strength value
								if (password.length > 10
										&& password.match(/([a-zA-Z])/)
										&& password.match(/([0-9])/))
									strength += 1;

								//if it has one special character, increase strength value
								if (password.length > 12
										&& password
												.match(/([!,%,&,@,#,$,^,*,?,_,~])/))
									strength += 1;

								//if it has two special characters, increase strength value
								if (password.length > 12
										&& password
												.match(/(.*[!,%,&,@,#,$,^,*,?,_,~].*[!,",%,&,@,#,$,^,*,?,_,~])/))
									strength += 1;

								//now we have calculated strength value, we can return messages

								//if value is less than 2
								if (strength < 2) {
									$("#password")
											.after(
													'<span id="info" class="text-warning">Heikko</span>');
									return 'Heikko';
								} else if (strength == 2) {
									$("#password")
											.after(
													'<span id="info" class="text-success">Hyvä</span>');
									return 'Hyvä';
								} else {
									$("#password")
											.after(
													'<span id="info" class="text-info">Vahva</span>');
									return 'Vahva';
								}
							}
						});
	</script>

</body>
</html>