<?php
// This is a user-facing page
/*
Aytam Aid System - Open Source
*/
require_once '../users/init.php';
if (!securePage($_SERVER['PHP_SELF'])){die();}
require_once $abs_us_root.$us_url_root.'users/includes/template/prep.php';
require_once $abs_us_root.$us_url_root.'ysys/functions.php';
    
$ycode = Input::get('ycode');

?>

<div class="row text-right" dir="rtl">
<h2 class="col-md-12">استمارة يتيم</h2>    
<?php
$usFormUpdate = $ycode; //The row you want to update
$options['update'] = $usFormUpdate;

//then call your form with

displayform('yayateeminfo1',['update'=>1]);
?>
</div>



<!-- footers -->

<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
