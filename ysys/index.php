<?php
// This is a user-facing page
/*
Aytam Aid System - Open Source
*/
require_once '../users/init.php';
if (!securePage($_SERVER['PHP_SELF'])){die();}
require_once $abs_us_root.$us_url_root.'users/includes/template/prep.php';


?>
<div class="row text-right" dir="rtl">
	<div class="col-sm-12 col-md-12">
	<br>
	<div class="d-flex justify-content-start bg-secondary">
		<a class="btn btn-info" href="yateem_addnew.php">إضافة يتيم</a>
		<a class="btn btn-info" href="yateem_addnew.php">إضافة يتيم</a>
		<a class="btn btn-info" href="yateem_addnew.php">إضافة يتيم</a>
	</div>
	<br>
	<?php
	displayTable('yayateeminfo1');
	?>
	</div>

</div>



<!-- footers -->

<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
