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
      Redirect::to("./yateem_viewyateem.php?ycode=". $yCode);
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
		<h2>بيانات الكفالة لليتيم  <?php echo getYateemName($yCode); ?></h2>
		<div class="row">
			<table class="table">
				<tr>
					<td class="table-primary">البيانات الأساسية</td>
					<td class="table-primary">المرفقات</td>
					<td class="table-primary">بيانات الأسرة والأم</td>
					<td class="table-primary">بيانات الوصي</td>
					<td class="table-primary">بيانات المعرف</td>
					<td class="table-primary">بيانات الكفالة</td>
				</tr>
			</table>
		</div>
		<form class="" action="<?php echo htmlentities($_SERVER['PHP_SELF']); ?>" method="post">
    <input type="hidden" name="csrf" value="<?php echo Token::generate(); ?>">
    <input type="hidden" name="ycode" value="<?php echo $yCode; ?>">
		<div class="row">
		<div class="form-group col">
			<label class="" for="yState">حالة اليتيم</label>
			<select name="yState" id="yState" class="form-control">
              <option value="<?php echo getFieldData($yCode,"yState"); ?>"><?php menuQuery("r",getFieldData($yCode,"yState"),"ya_settings_ystate","yState"); ?></option>
			<?php menuQuery("w",0,"ya_settings_ystate","yState"); ?>
			</select>
			<!-- final div -->
		</div>
			<div class="form-group col">
			<label class="" for="kafalahID">رقم الكفالة</label>
			<select name="kafalahID" id="kafalahID" class="form-control">
              <option value="<?php echo getFieldData($yCode,"kafalahID"); ?>"><?php kafalahQuery("r",getFieldData($yCode,"kafalahID")); ?></option>
			<?php kafalahQuery("w",0); ?>
			</select>
			<!-- final div -->
		</div>
		</div><!--End of row-->
		<div class="row">
		<div class="form-group col">
			<label class="" for="kafalahAmount">مبلغ الكفالة لليتيم</label>
			<input type="number" step=".01" name="kafalahAmount" id="kafalahAmount" class="form-control" value="<?php echo getFieldData($yCode,"kafalahAmount"); ?>">
			<!-- final div -->
		</div>
		<div class="form-group col">
			<label class="" for="kafalahCurrency">عملة الكفالة</label>
			<select name="kafalahCurrency" id="kafalahCurrency" class="form-control">
              <option value="<?php echo getFieldData($yCode,"kafalahCurrency"); ?>"><?php menuQuery("r",getFieldData($yCode,"kafalahCurrency"),"ya_settings_currency","cNameAra"); ?></option>
			<?php menuQuery("w",0,"ya_settings_currency","cNameAra"); ?>
			</select>
			<!-- final div -->
		</div>
		</div><!--End of row-->
		<div class="row">
		<div class="form-group col">
			<label class="" for="kafalahStartDate">تاريخ بدء الكفالة لليتيم</label>
			<input type="date" class="form-control hasDatepicker" name="kafalahStartDate" id="kafalahStartDate" value="<?php echo getFieldData($yCode,"kafalahStartDate"); ?>">

			<!-- final div -->
		</div>
		<div class="form-group col">
			<label class="" for="kafalahEndDate">تاريخ انتهاء الكفالة لليتيم</label>
			<input type="date" class="form-control hasDatepicker" name="kafalahEndDate" id="kafalahEndDate" value="<?php echo getFieldData($yCode,"kafalahEndDate"); ?>">

			<!-- final div -->
		</div>
		</div><!--End of row-->
		<div class="row">
		<div class="form-group col">
			<label class="" for="kafalahEndreason">سبب انتهاء الكفالة</label>
			<textarea name="kafalahEndreason" id="kafalahEndreason" class="form-control"><?php echo getFieldData($yCode,"kafalahEndreason"); ?></textarea>
			<!-- final div -->
		</div>

    </div><!--End of row-->
    
		<input type="hidden" name="form_name" value="yayateeminfo1">
		<input type="submit" name="submit" value="حفظ + عرض استمارة اليتيم" class="btn btn-primary col-md-6">
		<br><br>
	</form>
	</div>
</div>
<!-- footers -->
<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
