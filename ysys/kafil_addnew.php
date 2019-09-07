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

<div class="row" dir="rtl">
	<div class="col-sm-12 col-md-12">
    <br>
    <h2><a class="btn btn-success" href="./kafil_viewall.php">استعراض الكل</a> نموذج اضافة كافل جديد</h2>
    <hr>
    <?php
    fb_displayform('ya_kafeelinfo_01');
    ?>
    <br><br><br><br>
    </div>

</div>



<!-- footers -->

<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
