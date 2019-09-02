<?php
// This is a user-facing page
/*
Aytam Aid System - Open Source
*/
require_once '../users/init.php';
if (!securePage($_SERVER['PHP_SELF'])){die();}
require_once $abs_us_root.$us_url_root.'users/includes/template/prep.php';

$aytamQ = $db->query("SELECT * FROM `yy_yateem_main_info` ORDER BY id DESC");
$counAytam = $aytamQ->count();

?>
<div class="row" dir="rtl">
	<div class="col-sm-12 col-md-12">
	<a class="btn btn-primary" href="addnew.php">إضافة يتيم</a>
<?php
displayTable('11yateemmaininfo');
if($counAytam > 0){
    $aytamResult = $aytamQ->results();
    $x = 1;
    foreach($aytamResult as $ar){
?>
		<table class="table">
		<tr>
		<td></td>
		</tr>
		</table>
<?php
	} // end of foreach($aytamResult as $ar)
} // end of if($counAytam > 0)

?>
	</div>

</div>



<!-- footers -->

<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
