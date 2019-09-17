<?php
if(file_exists("install/index.php")){
	//perform redirect if installer files exist
	//this if{} block may be deleted once installed
	header("Location: install/index.php");
}

require_once 'users/init.php';
require_once $abs_us_root.$us_url_root.'users/includes/template/prep.php';
if(isset($user) && $user->isLoggedIn()){
}

function getKafil($kafalahID){
	$db = DB::getInstance();
	$kafaQ = $db->query("SELECT kafilID FROM `ya_kafalahinfo_01` WHERE id = ?",[$kafalahID]);
	if ($kafaQ->count()){
		$kafiID = $db->first()->kafilID;
		$kafiQ = $db->query("SELECT kName FROM `ya_kafilinfo_01` WHERE id = ?",[$kafiID]);
		return $db->first()->kName;
	}else{
		return "غير موجود";
	}
}
function getOptions($option,$optionID){
	$db = DB::getInstance();
	if($option == "city"){
		$optionQ = $db->query("SELECT cityName FROM `ya_settings_cities` WHERE id = ?",[$optionID]);
		return $db->first()->cityName;
	}elseif($option == "kafalahLable"){
		$optionQ = $db->query("SELECT kafalahLable FROM `ya_kafalahinfo_01` WHERE id = ?",[$optionID]);
		return $db->first()->kafalahLable;
	}elseif($option == "yState"){
		$optionQ = $db->query("SELECT yState FROM `ya_settings_ystate` WHERE id = ?",[$optionID]);
		return $db->first()->yState;
	}
}
$aytamQ = $db->query("SELECT * FROM `ya_yateeminfo_01` ORDER BY id DESC");
$counAytam = $aytamQ->count();

?>
<div id="page-wrapper">
	<div class="container" dir="rtl">
	<br>
	<?php
		if($user->isLoggedIn()){?>
<div class="row text-right" dir="rtl">
	<div class="col-sm-12 col-md-12">
	<br>
	<form>
	<div class="d-flex justify-content-start bg-secondary">
		<a class="btn btn-info" href="ysys/yateem_addnew.php">إضافة يتيم</a>&nbsp;
		<button class="btn btn-info" type="submit">كفالة المحدد</button>
		&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		<select name="" id="" class="form-control col-md-2">
			<option disabled="" selected="">--اختر كافل--</option>
			<option value="1">فاعل خير</option>
			<option value="2">كافل يتيم</option>
			<option value="3">تجربة</option>
		</select>
		&nbsp;
		<select name="" id="" class="form-control col-md-2">
			<option disabled="" selected="">--اختر كفالة--</option>
			<option value="1">فاعل خير</option>
			<option value="2">كافل يتيم</option>
			<option value="3">تجربة</option>
		</select>
		&nbsp;
		<select name="" id="" class="form-control col-md-2">
			<option disabled="" selected="">--اختر محافظة--</option>
			<option value="1">فاعل خير</option>
			<option value="2">كافل يتيم</option>
			<option value="3">تجربة</option>
		</select>
		&nbsp;
		<a class="btn btn-info" href="yateem_addnew.php">فرز</a>
	</div>
	<br>
	<table class="table table-striped">
	
	<thead class="thead-light">
	<tr>
      <th>#</th>
      <th>الاسم</th>
      <th>العنوان</th>
	  <th>الحالة</th>
	  <th>اسم الكافل</th>
	  <th>الكفالة</th>
	  <th>المرفقات</th>
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
		<td><input type="checkbox" class="form-check-input" name="ycode" value="<?php echo $ar->id; ?>"></td>
		<td><a href="./ysys/yateem_viewyateem.php?ycode=<?php echo $ar->id; ?>"><?php echo $ar->yName; ?></a></td>
		<td>
		المدينة: <?php echo getOptions("city",$ar->cityName); ?><br>
		<?php echo $ar->yAddress; ?>
		</td>
		<td><?php echo getOptions("yState",$ar->yState); ?></td>
		<td><?php echo getKafil($ar->kafalahID); ?></td>
		<td>
		رقم: <?php echo $ar->kafalahID; ?> <br>
		<?php echo getOptions("kafalahLable",$ar->kafalahID); ?> <br>
		مبلغ: <?php echo $ar->kafalahAmountY; ?> <br>
		</td>
		<td></td>

		</tr>
		
<?php
	} // end of foreach($aytamResult as $ar)
} // end of if($counAytam > 0)

?>
</tbody>
</table>
	</div>
<?php }else{?>
					<a class="btn btn-warning" href="users/login.php" role="button"><?=lang("SIGNIN_TEXT");?> &raquo;</a>
					<a class="btn btn-info" href="users/join.php" role="button"><?=lang("SIGNUP_TEXT");?> &raquo;</a>
				<?php }?>
				<!--
		<div class="jumbotron">
			<h1 align="center"> نظام مساعد اليتيم</h1>
			<p align="center" class="text-muted">لإدارة الأيتام وكفالاتهم</p>
			<p align="center">
				<?php
				if($user->isLoggedIn()){?>
					
					<a class="btn btn-success" href="ysys/kafil_addnew.php" role="button">إضافة كافل &raquo;</a>
					<a class="btn btn-success" href="ysys/kafil_viewall.php" role="button">ادارة الكافلين &raquo;</a>
					<br><br>
					<a class="btn btn-warning" href="ysys/kafalah_addnew.php" role="button">إضافة كفالة &raquo;</a>
					<a class="btn btn-warning" href="ysys/kafalah_viewall.php" role="button">ادارة الكفالات &raquo;</a>
					<br><br>
					<a class="btn btn-primary" href="ysys/yateem_addnew.php" role="button">إضافة يتيم &raquo;</a>
					<a class="btn btn-primary" href="ysys/index.php" role="button">استعراض الأيتام &raquo;</a>
					<br><br>
					<a class="btn btn-primary" href="users/account.php" role="button"><?=lang("ACCT_HOME");?> &raquo;</a>
				<?php }else{?>
					<a class="btn btn-warning" href="users/login.php" role="button"><?=lang("SIGNIN_TEXT");?> &raquo;</a>
					<a class="btn btn-info" href="users/join.php" role="button"><?=lang("SIGNUP_TEXT");?> &raquo;</a>
				<?php }?>
			</p>
			<br>
			
		</div>-->
		
<?php  languageSwitcher();?> 
	</form>
	</div>
</div>

<!-- Place any per-page javascript here -->


<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
