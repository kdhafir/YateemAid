<?php
	// This is a user-facing page
	/*
	Aytam Aid System - Open Source
	*/
	require_once '../users/init.php';
	if (!securePage($_SERVER['PHP_SELF'])){die();}
	require_once $abs_us_root.$us_url_root.'users/includes/template/prep.php';
	require_once $abs_us_root.$us_url_root.'ysys/functions.php';
	$yCode = Input::get('ycode');
	$goNext = Input::get('continueData');
	// Processing Form
	if(!empty($_POST)){
	    $response = preProcessForm();
	    if($response['form_valid'] == true){
	    //do something here after the form has been validated
	     //$goNext = $response['fields']['continueData'];
	     //dnd($response);
	     $db->update('yayateeminfo1',$yCode,$response['fields']);
	     Redirect::to("./yateem_addnew_06.php?ycode=". $yCode);
	    //postProcessForm($response);
	    }
	}
	?>
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
		<h2>بيانات المعرف لليتيم  <?php echo getYateemName($yCode); ?></h2>
		<div class="row">
			<table class="table">
				<tr>
					<td class="table-primary">البيانات الأساسية</td>
					<td class="table-primary">المرفقات</td>
					<td class="table-primary">بيانات الأسرة والأم</td>
					<td class="table-primary">بيانات الوصي</td>
					<td class="table-primary">بيانات المعرف</td>
					<td class="table-secondary">بيانات الكفالة</td>
				</tr>
			</table>
		</div>
		<form class="" action="<?php echo htmlentities($_SERVER['PHP_SELF']); ?>" method="post">
			<input type="hidden" name="csrf" value="<?php echo Token::generate(); ?>">
			<input type="hidden" name="ycode" value="<?php echo $yCode; ?>">
			<div class="form-group">
				<label class="" for="idName">اسم المعرف</label>
				<input type="text" name="idName" id="idName" class="form-control" value="<?php echo getFieldData($yCode,"idName"); ?>">
				<!-- final div -->
			</div>
			<div class="form-group">
				<label class="" for="idMobile">رقم موبايل المعرف</label>
				<input type="text" name="idMobile" id="idMobile" class="form-control" value="<?php echo getFieldData($yCode,"idMobile"); ?>">
				<!-- final div -->
			</div>
			<div class="form-group">
				<label class="" for="idAddress">عنوان سكن المعرف</label>
				<input type="text" name="idAddress" id="idAddress" class="form-control" value="<?php echo getFieldData($yCode,"idAddress"); ?>">
				<!-- final div -->
			</div>
			<div class="form-group">
				<label class="" for="sOpinion">رأي الإدارة المعنية [ المختص ]</label>
				<textarea name="sOpinion" id="sOpinion" class="form-control"><?php echo getFieldData($yCode,"sOpinion"); ?></textarea>
				<!-- final div -->
			</div>
			<input type="hidden" name="form_name" value="yayateeminfo1">
			<input type="submit" name="submit" value="حفظ + التالي" class="btn btn-primary col-md-6">
			<br><br>
		</form>
	</div>
</div>
<!-- footers -->
<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
