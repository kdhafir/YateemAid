<?php
// This is a user-facing page
/*
Aytam Aid System - Open Source
*/
require_once '../users/init.php';
if (!securePage($_SERVER['PHP_SELF'])){die();}
require_once $abs_us_root.$us_url_root.'users/includes/template/prep.php';

?>

<div class="row text-right" dir="rtl">
    <div class="col-md-4">
    <br>
    <h4>التنقل السريع</h4>
    <a href="./kafil_viewall.php">استعراض مشاريع الايتام</a><br>
    </div>
	<div class="col-sm-12 col-md-8">
    <br>
    <h2>اضافة مشروع جديد للأيتام</h2>
    <hr>
    <?php

    $options = array(
        'submit'=>'submit', //If you want a custom submit button you must do 'submit'=>something. This doubles as the field name
        'class'=>'btn btn-primary',
        'value'=>'حفظ البيانات',
        );
    //$options = ['noclose'=>1];
    displayForm('yayateemprojects',$options);
    ?>
    <br><br><br><br>
    </div>

</div>

<!-- footers -->

<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
