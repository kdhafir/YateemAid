<?php
// This is a user-facing page
/*
Aytam Aid System - Open Source
*/
require_once '../users/init.php';
if (!securePage($_SERVER['PHP_SELF'])){die();}
require_once $abs_us_root.$us_url_root.'users/includes/template/prep.php';

//$aytamQ = $db->query("SELECT * FROM `yy_yateem_main_info` ORDER BY id DESC");
//$counAytam = $aytamQ->count();

?>

<div class="row text-right" dir="rtl">
    <div class="col-md-4">
    <br>
    <h4>التنقل السريع</h4>
    <a href="./kafil_viewall.php">استعراض جميع الكافلين</a><br>
    </div>
	<div class="col-sm-12 col-md-8">
    <br>
    <h2> نموذج اضافة كافل جديد</h2>
    <hr>
    <?php
    /*
    $options = array(
        'submit'=>'ارسال', //If you want a custom submit button you must do 'submit'=>something. This doubles as the field name
        'class'=>'btn btn-success',
        'value'=>'This is the submit button',
        );
        */
    $options = ['noclose'=>1];
    fb_displayform('ya_kafilinfo_01',$options);
    ?>
    <input class="btn btn-primary" type="submit" value="حفظ البيانات">
    </form>
    <br><br><br><br>
    </div>

</div>



<!-- footers -->

<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
