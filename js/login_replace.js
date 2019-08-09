function replace_login(txt) {
	$('#header_login_text').text(txt);
	$('#header_login_text').attr('href', "");
}

function hide_login_text() {

	$(document).ready(function() {

		$('#header_login_signup_text').hide();
	});
}


function hide_login_text_partial() {

	$(document).ready(function() {
		
		$('#header_login_pipe_text').hide();

		$('#header_login_signup_text').hide();
	});
}