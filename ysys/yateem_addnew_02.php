<?php
// This is a user-facing page
/*
Aytam Aid System - Open Source
*/
require_once '../users/init.php';
if (!securePage($_SERVER['PHP_SELF'])){die();}
require_once $abs_us_root.$us_url_root.'users/includes/template/prep.php';

// Processing Form
if(!empty($_POST)){
    $response = preProcessForm();
    if($response['form_valid'] == true){
    //do something here after the form has been validated
    //$goNext = $response['fields']['continueData'];
    postProcessForm($response);
    }
}
$goNext = Input::get('continueData');
if($goNext){
    Redirect::to("./yateem_addnew_02.php?ycode=");
}else{
        
}
//$aytamQ = $db->query("SELECT * FROM `yy_yateem_main_info` ORDER BY id DESC");
//$counAytam = $aytamQ->count();

?>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/themes/base/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="./js/jquery.ui.plupload/css/jquery.ui.plupload.css" type="text/css" />

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>

<!-- production -->
<script type="text/javascript" src="./js/plupload.full.min.js"></script>
<script type="text/javascript" src="./js/jquery.ui.plupload/jquery.ui.plupload.js"></script>
<!-- activate Arabic translation -->
<script type="text/javascript" src="./js/i18n/ar.js"></script>


<div class="row text-right" dir="rtl">
<div class="col-md-3">
    <br>
    <h4>التنقل السريع</h4>
    <a href="#dateOfEntry">البيانات الأساسية</a><br>
    <a href="#yQuranSchool">بيانات الوصي</a><br>
    <a href="#rWorkType">بيانات الأم</a><br>
    <a href="#idName">بيانات المعرف</a><br>
    <a href="./index.php">استعراض الأيتام</a>
    </div>
	<div class="col-sm-12 col-md-9">
    <br>
    <h2>رفع المرفقات الخاصة باليتيم</h2>
    <div class="row">
    <table class="table">
        <tr>
            <td class="table-primary">البيانات الأساسية</td>
            <td class="table-primary">المرفقات</td>
            <td class="table-secondary">بيانات الأسرة والأم</td>
            <td class="table-secondary">بيانات الوصي</td>
            <td class="table-secondary">بيانات المعرف</td>
            <td class="table-secondary">بيانات الكفالة</td>
        </tr>
    </table>
    </div>
<form id="form" method="post" action="./dump.php">
	<div id="uploader">
		<p>Your browser doesn't have Flash, Silverlight or HTML5 support.</p>
	</div>
	<br />
	<input class="btn btn-primary" type="submit" value="التالي" />
</form>
</div>
<script type="text/javascript">
// Initialize the widget when the DOM is ready
$(function() {
	$("#uploader").plupload({
		// General settings
		runtimes : 'html5,flash,silverlight,html4',
		url : './aytamattachments/upload.php',

		// User can upload no more then 20 files in one go (sets multiple_queues to false)
		max_file_count: 20,

		chunk_size: '1mb',

		// Resize images on clientside if we can
		resize : {
			width : 200,
			height : 200,
			quality : 90,
			crop: true // crop to exact dimensions
		},

		filters : {
			// Maximum file size
			max_file_size : '1000mb',
			// Specify what files to browse for
			mime_types: [
				{title : "Image files", extensions : "jpg,gif,png"},
				{title : "Zip files", extensions : "zip"}
			]
		},

		// Rename files by clicking on their titles
		rename: true,

		// Sort files
		sortable: true,

		// Enable ability to drag'n'drop files onto the widget (currently only HTML5 supports that)
		dragdrop: true,

		// Views to activate
		views: {
			list: true,
			thumbs: true, // Show thumbs
			active: 'thumbs'
		},

		// Flash settings
		flash_swf_url : './js/Moxie.swf',

		// Silverlight settings
		silverlight_xap_url : './js/Moxie.xap'
	});


	// Handle the case when form was submitted before uploading has finished
	$('#form').submit(function(e) {
		// Files in queue upload them first
		if ($('#uploader').plupload('getFiles').length > 0) {

			// When all files are uploaded submit form
			$('#uploader').on('complete', function() {
				$('#form')[0].submit();
			});

			$('#uploader').plupload('start');
		} else {
			alert("يجب اضافة ملف واحد على الاقل");
		}
		return false; // Keep the form from submitting
	});
});
</script>

</div>



<!-- footers -->

<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
