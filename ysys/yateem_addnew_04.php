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
	     Redirect::to("./yateem_addnew_05.php?ycode=". $yCode);
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
		<h2>بيانات الوصي لليتيم  <?php echo getYateemName($yCode); ?></h2>
		<div class="row">
			<table class="table">
				<tr>
					<td class="table-primary">البيانات الأساسية</td>
					<td class="table-primary">المرفقات</td>
					<td class="table-primary">بيانات الأسرة والأم</td>
					<td class="table-primary">بيانات الوصي</td>
					<td class="table-secondary">بيانات المعرف</td>
					<td class="table-secondary">بيانات الكفالة</td>
				</tr>
			</table>
		</div>
		<form class="" action="<?php echo htmlentities($_SERVER['PHP_SELF']); ?>" method="post">
			<input type="hidden" name="csrf" value="<?php echo Token::generate(); ?>">
			<input type="hidden" name="ycode" value="<?php echo $yCode; ?>">
			<div class="row">
				<div class="form-group col">
					<label class="" for="rName">اسم الوصي</label>
					<input type="text" name="rName" id="rName" class="form-control" value="">
					<!-- final div -->
				</div>
				<div class="form-group col">
					<label class="" for="rIDCard">رقم هوية الوصي</label>
					<input type="text" name="rIDCard" id="rIDCard" class="form-control" value="">
					<!-- final div -->
				</div>
			</div>
			<!--End of row-->
			<div class="row">
				<div class="form-group col">
					<label class="" for="rSex">جنس الوصي</label>
					<select name="rSex" id="rSex" class="form-control">
						<option disabled="" selected="" value="">--Select One--</option>
						<option value="male">ذكر</option>
						<option value="female">أنثى</option>
					</select>
					<!-- final div -->
				</div>
				<div class="form-group col">
					<label class="" for="rDateOfBirth">تاريخ ميلاد الوصي</label>
					<input type="date" class="form-control hasDatepicker" name="rDateOfBirth" id="rDateOfBirth" value="">
					<!-- final div -->
				</div>
			</div>
			<!--End of row-->
			<div class="row">
				<div class="form-group col">
					<label class="" for="rRelation">صلة قرابة الوصي باليتيم</label>
					<input type="text" name="rRelation" id="rRelation" class="form-control" value="">
					<!-- final div -->
				</div>
			</div>
			<!--End of row-->
			<div class="row">
				<div class="form-group col">
					<label class="" for="rMobile">رقم موبايل الوصي</label>
					<input type="text" name="rMobile" id="rMobile" class="form-control" value="">
					<!-- final div -->
				</div>
				<div class="form-group col">
					<label class="" for="rMobilePerson">صاحب الموبايل (مسجل باسم من)</label>
					<input type="text" name="rMobilePerson" id="rMobilePerson" class="form-control" value="">
					<!-- final div -->
				</div>
			</div>
			<!--End of row-->
			<div class="row">
				<div class="form-group col">
					<label class="" for="rWorkName">جهة عمل الوصي</label>
					<input type="text" name="rWorkName" id="rWorkName" class="form-control" value="">
					<!-- final div -->
				</div>
				<div class="form-group col">
					<label class="" for="rWorkType">نوع العمل</label>
					<select name="rWorkType" id="rWorkType" class="form-control">
						<option disabled="" selected="" value="">--Select One--</option>
						<option value="gov">حكومي</option>
						<option value="special">خاص</option>
						<option value="charity">خيري</option>
						<option value="free">حر</option>
						<option value="none">لا يوجد</option>
					</select>
					<!-- final div -->
				</div>
			</div>
			<!--End of row-->
			<input type="hidden" name="form_name" value="yayateeminfo1">
			<input type="submit" name="submit" value="حفظ + التالي" class="btn btn-primary col-md-6">
			<br><br>
		</form>
	</div>
</div>
<!-- footers -->
<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
