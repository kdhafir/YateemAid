<?php
// This is a user-facing page
/*
Aytam Aid System - Open Source
*/
require_once '../users/init.php';
if (!securePage($_SERVER['PHP_SELF'])){die();}
require_once $abs_us_root.$us_url_root.'users/includes/template/prep.php';

$aytamQ = $db->query("SELECT * FROM `ya_kafeelinfo_01` ORDER BY id DESC");
$counAytam = $aytamQ->count();

?>
<div class="row" dir="rtl">
	<div class="col-sm-12 col-md-12">
	<br>
	<div class="d-flex justify-content-start bg-secondary">
		<a class="btn btn-info" href="kafil_addnew.php">إضافة كافل</a>
		<a class="btn btn-info" href="">AAAAA</a>
		<a class="btn btn-info" href="">AAAAA</a>
	</div>
	<br>
	<table class="table table-striped">
	
	<thead class="thead-light">
	<tr>
      <th>#</th>
      <th>اسم الكافل</th>
      <th>عنوان الكافل</th>
	  <th>رقم الهاتف</th>
	  <th>النوع</th>
	  <th>الدولة</th>
    </tr>
	</thead>
	<tbody>
<?php
if($counAytam > 0){
    $kafilResult = $kafilQ->results();
    $x = 1;
    foreach($kafilResult as $k){
?>
		
		<tr>
		<td></td>
		<td><?php echo $k->kName; ?></td>
		<td><?php echo $k->kAddress; ?></td>
		<td><?php echo $k->kPhone; ?></td>
		<td><?php echo $k->kType; ?></td>
		<td><?php echo $k->kCountry; ?></td>
		</tr>
		
<?php
	} // end of foreach($aytamResult as $ar)
} // end of if($counAytam > 0)

?>
</tbody>
</table>
	</div>

</div>



<!-- footers -->

<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
