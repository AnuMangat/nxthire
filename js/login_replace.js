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

function update_review_path(txt) {

	url = $('#header_review_id').attr('href') + "?userid=" + txt;
	$('#header_review_id').attr('href', url);

}

function update_browse_jobs_path(txt) {

	url = $('#header_browse_job_text').attr('href') + "?userid=" + txt;
	$('#header_browse_job_text').attr('href', url);

}

function show_spinner()
{
	   // add spinner to button
    $(this).html(
      `<span id="spinner" class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Loading...`
    );
}

function hide_spinner()
{
	$('#spinner').hide();
	
}