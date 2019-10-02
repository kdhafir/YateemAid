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
      Redirect::to("./yateem_addnew_04.php?ycode=". $yCode);
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
		<h2>بيانات الأم والأسرة لليتيم  <?php echo getYateemName($yCode); ?></h2>
		<div class="row">
			<table class="table">
				<tr>
					<td class="table-primary">البيانات الأساسية</td>
					<td class="table-primary">المرفقات</td>
					<td class="table-primary">بيانات الأسرة والأم</td>
					<td class="table-secondary">بيانات الوصي</td>
					<td class="table-secondary">بيانات المعرف</td>
					<td class="table-secondary">بيانات الكفالة</td>
				</tr>
			</table>
		</div>
		<form class="" action="<?php echo htmlentities($_SERVER['PHP_SELF']); ?>" method="post">
    <input type="hidden" name="csrf" value="<?php echo Token::generate(); ?>">
    <input type="hidden" name="ycode" value="<?php echo $yCode; ?>">
		<div class="row">
			<div class="form-group col-md-6">
				<label class="" for="mName">اسم الأم</label>
				<input type="text" name="mName" id="mName" class="form-control" value="<?php echo getFieldData($yCode,"mName"); ?>">
				<!-- final div -->
			</div>
			<div class="form-group col-md-6">
				<label class="" for="mIDCard">رقم هوية الأم</label>
				<input type="text" name="mIDCard" id="mIDCard" class="form-control" value="<?php echo getFieldData($yCode,"mIDCard"); ?>">
				<!-- final div -->
			</div>
		</div>
    <!--End of row-->
		<div class="form-group col">
			<label class="" for="mAlive">هل الأم على قيد الحياة</label>
			<div class="radio">
				<label><input type="radio" value="yes" name="mAlive">نعم</label>
			</div>
			<div class="radio">
				<label><input type="radio" value="no" name="mAlive">لا</label>
			</div>
			<!-- final div -->
    </div>
    <div class="row">
		<div class="form-group col">
			<label class="" for="mStatus">حالة الأم الاجتماعية</label>
			<select name="mStatus" id="mStatus" class="form-control">
              <option value="<?php echo getFieldData($yCode,"mStatus"); ?>"><?php menuQuery("r",getFieldData($yCode,"mStatus"),"ya_settings_mstate","mStatus"); ?></option>
			<?php menuQuery("w",0,"ya_settings_mstate","mStatus"); ?>
			</select>
			<!-- final div -->
    </div>
		<div class="form-group col">
			<label class="" for="mWork">عمل الأم [ إن وجد ]</label>
			<input type="text" name="mWork" id="mWork" class="form-control" value="<?php echo getFieldData($yCode,"mWork"); ?>">
			<!-- final div -->
    </div>
    </div><!--End of row-->
    <div class="row">
		<div class="form-group col">
			<label class="" for="fNumberOfBrothers">عدد الاخوة والأخوات</label>
			<input type="number" step="1" name="fNumberOfBrothers" id="fNumberOfBrothers" class="form-control" value="<?php echo getFieldData($yCode,"fNumberOfBrothers"); ?>">
			<!-- final div -->
		</div>
		<div class="form-group col">
			<label class="" for="fRankInFamily">ترتيب اليتيم بين اخوانه واخواته [ من الأكبر الى الأصغر ]</label>
			<input type="number" step="1" name="fRankInFamily" id="fRankInFamily" class="form-control" value="<?php echo getFieldData($yCode,"fRankInFamily"); ?>">
			<!-- final div -->
    </div>
    </div><!--End of row-->
    <div class="row">
		<div class="form-group col">
			<label class="" for="fHomeType">نوع السكن</label>
			<select name="fHomeType" id="fHomeType" class="form-control">
              <option value="<?php echo getFieldData($yCode,"fHomeType"); ?>"><?php menuQuery("r",getFieldData($yCode,"fHomeType"),"ya_settings_hometype","fHomeType"); ?></option>
			<?php menuQuery("w",0,"ya_settings_hometype","hType"); ?>
			</select>
			<!-- final div -->
		</div>
		<div class="form-group col">
			<label class="" for="fAddress">عنوان سكن الأسرة</label>
			<input type="text" name="fAddress" id="fAddress" class="form-control" value="<?php echo getFieldData($yCode,"fAddress"); ?>">
			<!-- final div -->
    </div>
    </div><!--End of row-->
    <div class="row">
		<div class="form-group col">
			<label class="" for="fFinanceStatus">الوضع المادي للأسرة</label>
			<select name="fFinanceStatus" id="fFinanceStatus" class="form-control">
              <option value="<?php echo getFieldData($yCode,"fFinanceStatus"); ?>"><?php menuQuery("r",getFieldData($yCode,"fFinanceStatus"),"ya_settings_fstate","fFinanceStatus"); ?></option>
			<?php menuQuery("w",0,"ya_settings_fstate","fFinanceStatus","fFinanceStatus"); ?>
			</select>
			<!-- final div -->
		</div>
		<div class="form-group col">
			<label class="" for="fFinanceSalary">الدخل الشهري للأسرة</label>
			<input type="number" step=".01" name="fFinanceSalary" id="fFinanceSalary" class="form-control" value="<?php echo getFieldData($yCode,"fFinanceSalary"); ?>">
			<!-- final div -->
    </div>
    </div><!--End of row-->
    <div class="row">
		<div class="form-group col">
			<label class="" for="fFinanceSource">مصدر الدخل للأسرة</label>
			<input type="text" name="fFinanceSource" id="fFinanceSource" class="form-control" value="<?php echo getFieldData($yCode,"fFinanceSource"); ?>">
			<!--
			<label class="form-control"><input type="checkbox" >راتب شهري</label>
			<label class="form-control"><input type="checkbox" >مساعدات شهرية</label>
			<label class="form-control"><input type="checkbox">مصادر أخرى</label>
			-->
			<!-- final div -->
    </div>
    </div><!--End of row-->
    
		<input type="hidden" name="form_name" value="yayateeminfo1">
		<input type="submit" name="submit" value="حفظ + التالي" class="btn btn-primary col-md-6">
		<br><br>
	</form>
	</div>
</div>
<!-- footers -->
<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
