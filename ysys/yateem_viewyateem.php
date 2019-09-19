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
    processForm();
    }
    
$ycode = Input::get('ycode');
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
    <h2>تعديل بيانات اليتيم</h2>
    <hr>
<?php
    $usFormUpdate = $ycode;

    $options['update'] = $usFormUpdate; // $ycode The row you want to update
    //then call your form with
    displayform('yayateeminfo1',['update'=>$usFormUpdate]);
    //displayform('yayateeminfo1',$options);
    
?>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>



<!-- footers -->

<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
