<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Profiili</title>
</head>
<body>
	<div class="container">
		<%@include file="userNavi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="span10 offset1">


				<table class="table" id="userProfileTable">
					<thead>
						<tr>
							<td colspan="4" style="font-size: 20px; font-weight: 700;">Käyttäjä</td>
						</tr>
					</thead>
					<tr>
						<th>Etunimi</th>
						<td><c:out value="${userProfile.fName}" default="-----" /></td>
						<th>Sukunimi</th>
						<td><c:out value="${userProfile.lName}" default="-----" /></td>
					</tr>
					<tr>
						<th>Puhelinnumero</th>
						<td><c:out value="${userProfile.phoneNo}" default="-----" /></td>
						<th>Sähköposti</th>
						<td><c:out value="${userProfile.email}" default="-----" /></td>
					</tr>

					<tr>
						<td colspan="4" style="font-size: 20px; font-weight: 700;">Yritys</td>
					</tr>
					<tr>
						<th>Nimi</th>
						<td><c:out value="${userProfile.company.name}"
								default="-----" /></td>
						<th>Osoite</th>
						<td><c:out value="${userProfile.company.address}"
								default="-----" /></td>
					</tr>

					<tr>
						<th>Postinumero</th>
						<td><c:out value="${userProfile.company.postalCode}"
								default="-----" /></td>
						<th>Kaupunki</th>
						<td><c:out value="${userProfile.company.city}"
								default="-----" /></td>
					</tr>
				</table>

				<form action="changePassword" method="post" class="form-horizontal">
					<fieldset>
						<legend>Vaihda salasana</legend>
						<div class="row-fluid">
							<div class="span12">
								<div class="control-group">
								
									<c:if test="${not empty passwordChangeSuccessful}">
										<p class="alert alert-success">Salasana vaihdettu onnistuneesti</p>
									</c:if>
									<c:if test="${not empty passwordChangeFailed}">
										<p class="alert alert-error">Nykyinen salasana on väärä</p>
									</c:if>
								
									<label id="oldPasswordL" class="control-label" for="textinput">Nykyinen</label>
									<div class="controls">
										<input type="password" class="input-xlarge" name="oldPassword"
											id="oldPassword" placeholder="Kirjoita nykyinen salasana" />
									</div>
								</div>

								<div class="control-group">
									<label id="newPassword" class="control-label" for="textinput">Uusi</label>
									<div class="controls">
										<input type="password" class="input-xlarge" name="newPassword"
											id="password" placeholder="Kirjoita uusi salasana" />

									</div>
								</div>

								<div class="control-group">
									<label id="newRePassword" class="control-label" for="textinput">Varmista
										uusi</label>
									<div class="controls">
										<input type="password" class="input-xlarge"
											name="password-check" id="password-check"
											placeholder="Kirjoita uusi salasana uudelleen" />
									</div>
								</div>



								<div class="row-fluid">
									<div class="offset2" style="padding-left: 1%;">
										<button type="submit" class="btn btn-success" value="Submit"
											id="submit">Vaihda salasana</button>
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
												var oldPasswordVal = $("#oldPassword").val();
												var passwordVal = $("#password").val();
												var checkVal = $("#password-check").val();
												
												if (oldPasswordVal == ''){
													$("#oldPassword").after('<span id="info" class="text-error">Syötä nykyinen salasana</span>');
												} else if (passwordVal == '') {
													$("#password").after('<span id="info" class="text-error">Syötä uusi salasana</span>');
												} else if (checkVal == '') {
													$("#password-check").after('<span id="info" class="text-error">Syötä uusi salasana uudelleen</span>');
												} else if (passwordVal != checkVal) {
													$("#password-check").after('<span id="info" class="text-error">Salasanat eivät täsmää</span>');
												} else if (passwordVal.length < 6) {
													$("#password").after('<span id="info" class="text-error">Salasana on liian lyhyt</span>');
												} else{
													hasError = false;
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