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
			$yCodeLink= "";
			foreach($yCode as $y){
				$db->update('yayateeminfo1',$y,$response['fields']);
				$yCodeLink .= "ycode[]=" . $y . "&";
			}
    		Redirect::to("./kafalh_dokafalah.php?". $yCodeLink);
	    	//postProcessForm($response);
		}
	}

?>
<div class="row text-right" dir="rtl">
	<div class="col-md-3">
		<br>
		<h4>التنقل السريع</h4>

	</div>
	<div class="col-sm-12 col-md-9">
		<br>
		<h2>تغيير حالة اليتيم  </h2>
		<hr>
		<?php 
		foreach($yCode as $y){
			echo " * " . getYateemName($y);
			echo " [ " . getYateemKafalahState($y) . " ] ";
		}	
		?>
		
		<hr>
		<div class="row">

		</div>
		<form class="" action="<?php echo htmlentities($_SERVER['PHP_SELF']); ?>" method="post">
    <input type="hidden" name="csrf" value="<?php echo Token::generate(); ?>">
    <input type="hidden" name="ycode" value="<?php echo $yCode; ?>">
		<div class="row">
		<div class="form-group col">
			<label class="" for="yState">حالة اليتيم</label>
			<?php menuQuery("w",0,"ya_settings_ystate","yState","yState"); ?>
			<!-- final div -->
		</div>
			<div class="form-group col">
			<label class="" for="kafalahID">رقم الكفالة</label>
			<?php kafalahQuery("w",0); ?>
			<!-- final div -->
		</div>
		</div><!--End of row-->
		<div class="row">
		<div class="form-group col">
			<label class="" for="kafalahAmount">مبلغ الكفالة لليتيم</label>
			<input type="number" step=".01" name="kafalahAmount" id="kafalahAmount" class="form-control" value="">
			<!-- final div -->
		</div>
		<div class="form-group col">
			<label class="" for="kafalahCurrency">عملة الكفالة</label>
			<?php menuQuery("w",0,"ya_settings_currency","cNameAra","kafalahCurrency"); ?>
			<!-- final div -->
		</div>
		</div><!--End of row-->
		<div class="row">
		<div class="form-group col">
			<label class="" for="kafalahStartDate">تاريخ بدء الكفالة لليتيم</label>
			<input type="date" class="form-control hasDatepicker" name="kafalahStartDate" id="kafalahStartDate" value="">

			<!-- final div -->
		</div>
		<div class="form-group col">
			<label class="" for="kafalahEndDate">تاريخ انتهاء الكفالة لليتيم</label>
			<input type="date" class="form-control hasDatepicker" name="kafalahEndDate" id="kafalahEndDate" value="">

			<!-- final div -->
		</div>
		</div><!--End of row-->
		<div class="row">
		<div class="form-group col">
			<label class="" for="kafalahEndreason">سبب انتهاء الكفالة</label>
			<textarea name="kafalahEndreason" id="kafalahEndreason" class="form-control"></textarea>
			<!-- final div -->
		</div>

	</div><!--End of row-->
<?php
		foreach($yCode as $y){
			echo "<input type=\"hidden\" name=\"ycode[]\" value=\"" . $y . "\">";
		}	
?>
		<input type="hidden" name="form_name" value="yayateeminfo1">
		<input type="submit" name="submit" value="حفظ + عرض استمارة اليتيم" class="btn btn-primary col-md-6">
		<br><br>
	</form>
	</div>
</div>
<!-- footers -->
<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
