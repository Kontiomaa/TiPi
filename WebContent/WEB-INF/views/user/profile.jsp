<%@include file="header.jsp"%>
<title>Siirtoapu.fi -- Profiili</title>
</head>
<body>
	<div class="container">
		<%@include file="userNavi.jsp"%>
		<div class="row-fluid" id="area">
			<div class="span10 offset1">


				<table class="table" id="orderConfirmationTable">
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
						<th>Käyttäjänimi</th>
						<td><c:out value="${userProfile.username}" default="-----" /></td>


				</table>



			</div>
		</div>
	</div>
	<%--
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function() {
			 
		    $('#passwordInput, #confirmPasswordInput').on('keyup', function(e) {
		 
		        if($('#passwordInput').val() == '' &#038;& $('#confirmPasswordInput').val() == '')
		        {
		            $('#passwordStrength').removeClass().html('');
		 
		            return false;
		        }
		 
		     if($('#passwordInput').val() != '' &#038;& $('#confirmPasswordInput').val() != '' &#038;& $('#passwordInput').val() != $('#confirmPasswordInput').val())
		    	{
		    		$('#passwordStrength').removeClass().addClass('alert alert-error').html('Passwords do not match!');
		        	return false;
		    	}
		 
		        // Must have capital letter, numbers and lowercase letters
		        var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
		 
		        // Must have either capitals and lowercase letters or lowercase and numbers
		        var mediumRegex = new RegExp("^(?=.{7,})(((?=.*[A-Z])(?=.*[a-z]))|((?=.*[A-Z])(?=.*[0-9]))|((?=.*[a-z])(?=.*[0-9]))).*$", "g");
		 
		        // Must be at least 6 characters long
		        var okRegex = new RegExp("(?=.{6,}).*", "g");
		 
		        if (okRegex.test($(this).val()) === false) {
		            // If ok regex doesn't match the password
		        	$('#passwordStrength').removeClass().addClass('alert alert-error').html('Password must be 6 characters long.');
		 
		        } else if (strongRegex.test($(this).val())) {
		            // If reg ex matches strong password
		            $('#passwordStrength').removeClass().addClass('alert alert-success').html('Good Password!');
		        } else if (mediumRegex.test($(this).val())) {
		            // If medium password matches the reg ex
		            $('#passwordStrength').removeClass().addClass('alert alert-info').html('Make your password stronger with more capital letters, more numbers and special characters!');
		        } else {
		            // If password is ok
		            $('#passwordStrength').removeClass().addClass('alert alert-error').html('Weak Password, try using numbers and capital letters.');
		        }
		        
		        return true;
		    });
		});
		
		
		</script>  --%>
</body>
</html>