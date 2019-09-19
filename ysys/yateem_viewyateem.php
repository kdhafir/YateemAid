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
<br>
<br><br><br>
<?php

    $options['update'] = $ycode; // $ycode The row you want to update
    //then call your form with
    displayform('yayateeminfo1',$options);
    
?>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>



<!-- footers -->

<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
