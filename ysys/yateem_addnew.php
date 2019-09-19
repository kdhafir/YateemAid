<?php
// This is a user-facing page
/*
Aytam Aid System - Open Source
*/
require_once '../users/init.php';
if (!securePage($_SERVER['PHP_SELF'])){die();}
require_once $abs_us_root.$us_url_root.'users/includes/template/prep.php';

// Processing Form
if(!empty($_POST)){
    $response = preProcessForm();
    if($response['form_valid'] == true){
    //do something here after the form has been validated
    postProcessForm($response);
    }
    }
//$aytamQ = $db->query("SELECT * FROM `yy_yateem_main_info` ORDER BY id DESC");
//$counAytam = $aytamQ->count();

?>

<div class="row text-right" dir="rtl">
    <div class="col-md-4">
    <br>
    <h4>التنقل السريع</h4>
    <a href="#dateOfEntry">البيانات الأساسية</a><br>
    <a href="#yQuranSchool">بيانات الوصي</a><br>
    <a href="#rWorkType">بيانات الأم</a><br>
    <a href="#idName">بيانات المعرف</a><br>
    <a href="./index.php">استعراض الأيتام</a>
    </div>
	<div class="col-sm-12 col-md-8">
    <br>
    <h2>نموذج اضافة يتيم جديد</h2>
    <div class="progress">
  <div class="progress-bar" role="progressbar" style="width: 41%" aria-valuenow="41" aria-valuemin="0" aria-valuemax="100"></div>
</div>
    <hr>
    <?php
    $options = array(
        'noclose'=>1,
        'submit'=>'submit', //If you want a custom submit button you must do 'submit'=>something. This doubles as the field name
        'class'=>'btn btn-success',
        'value'=>'حفظ البيانات',
        
        );
        displayView(1,$options);
        //displayForm('yayateeminfo1',$options);
        //displayForm('yayateeminfo01',$options);
        //fb_displayform('ya_yateeminfo_01',$options);
    ?>
    <button class="btn btn-primary" type="submit">حفظ البيانات الاساسية</button>
    <button class="btn btn-info" type="submit" name="continueData">حفظ واكمال بقية البيانات</button>
    </form>
    <br><br><br><br>
    </div>

</div>



<!-- footers -->

<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
