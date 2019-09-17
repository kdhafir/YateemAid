<?php
// This is a user-facing page
/*
Aytam Aid System - Open Source
*/
require_once '../users/init.php';
if (!securePage($_SERVER['PHP_SELF'])){die();}
require_once $abs_us_root.$us_url_root.'users/includes/template/prep.php';

$kafalahQ = $db->query("SELECT * FROM `ya_kafalahinfo_01` ORDER BY id DESC");
$counKafalah = $kafalahQ->count();

?>
<div class="row text-right" dir="rtl">
	<div class="col-sm-12 col-md-12">
	<br>
	<div class="d-flex justify-content-start bg-secondary">
		<a class="btn btn-info" href="kafalah_addnew.php">إضافة كفالة</a>
		<a class="btn btn-info" href="">DDDD </a>
		<a class="btn btn-info" href="">DDDD </a>
	</div>
	<br>
	<table class="table table-striped">
	
	<thead class="thead-light">
	<tr>
      <th>#</th>
      <th>الكافل</th>
      <th>مبلغ الكفالة</th>
	  <th>العملة</th>
	  <th>تاريخ البدء</th>
	  <th>دورتها</th>
	  <th>عدد الأيتام</th>
	  <th>الاستمرارية</th>
    </tr>
	</thead>
	<tbody>
<?php
if($counKafalah > 0){
    $kafalahResult = $kafalahQ->results();
    $x = 1;
    foreach($kafalahResult as $q){
?>
		
		<tr>
		<td></td>
		<td><?php echo $q->kafilID; ?></td>
		<td><?php echo $q->kafalahAmount; ?></td>
		<td><?php echo $q->kafalahCurrency; ?></td>
		<td><?php echo $q->kafalahSDate; ?></td>
		<td><?php echo $q->kafalahLoop; ?></td>
		<td><?php echo $q->kafalahAytam; ?></td>
		<td><?php echo $q->kafalahType; ?></td>
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
