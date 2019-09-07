<?php
// This is a user-facing page
/*
Aytam Aid System - Open Source
*/
require_once '../users/init.php';
if (!securePage($_SERVER['PHP_SELF'])){die();}
require_once $abs_us_root.$us_url_root.'users/includes/template/prep.php';

$aytamQ = $db->query("SELECT * FROM `ya_yateeminfo_01` ORDER BY id DESC");
$counAytam = $aytamQ->count();

?>
<div class="row" dir="rtl">
	<div class="col-sm-12 col-md-12">
	<br>
	<div class="d-flex justify-content-start bg-secondary">
		<a class="btn btn-info" href="yateem_addnew.php">إضافة يتيم</a>
		<a class="btn btn-info" href="yateem_addnew.php">إضافة يتيم</a>
		<a class="btn btn-info" href="yateem_addnew.php">إضافة يتيم</a>
	</div>
	<br>
	<table class="table table-striped">
	
	<thead class="thead-light">
	<tr>
      <th>#</th>
      <th>الاسم</th>
      <th>تاريخ الميلاد</th>
	  <th>اسم الوصي</th>
	  <th>صلة القرابة</th>
	  <th>اسم الأم</th>
	  <th>على قيد الحياة</th>
	  <th>حالة الأسرة</th>
    </tr>
	</thead>
	<tbody>
<?php
if($counAytam > 0){
    $aytamResult = $aytamQ->results();
    $x = 1;
    foreach($aytamResult as $ar){
?>
		
		<tr>
		<td></td>
		<td><?php echo $ar->yName; ?></td>
		<td><?php echo $ar->yDateOfBirth; ?></td>
		<td><?php echo $ar->rName; ?></td>
		<td><?php echo $ar->rRelation; ?></td>
		<td><?php echo $ar->mName; ?></td>
		<td><?php echo $ar->mAlive; ?></td>
		<td><?php echo $ar->fFinanceStatus; ?></td>
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
