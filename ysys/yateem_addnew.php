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
    <div class="col-md-4"></div>
	<div class="col-sm-12 col-md-8">
    <br>
    <h2><a class="btn btn-primary" href="./index.php">استعراض الأيتام</a> نموذج اضافة يتيم جديد</h2>
    <hr>
    <?php
    fb_displayform('ya_yateeminfo_01');
    ?>
    <br><br><br><br>
    </div>

</div>



<!-- footers -->

<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
