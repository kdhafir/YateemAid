<?php
// This is a user-facing page
/*
Aytam Aid System - Open Source
*/
error_reporting(E_ALL);
ini_set('display_errors', 1);
require_once '../users/init.php';
if (!securePage($_SERVER['PHP_SELF'])){die();}
require_once $abs_us_root.$us_url_root.'users/includes/template/prep.php';
require_once $abs_us_root.$us_url_root.'ysys/functions.php';

$yCode = Input::get('ycode');
if(!empty($_POST)){
    $aType = Input::get('aType');
    if(uploadYateemDocs($aType,$yCode)){
        $uploadMsg = "تم رفع الصورة بنجاح";
        
        $yCertLink = "/aytamattachments/". $yCode . "_" . $aType . ".png";
        $dbFieldName = "y". $aType . "Link";
        $fields = array(
            $dbFieldName   => $yCertLink,
        );
        $db->update('yayateeminfo1',$yCode,$fields);
    }else{
        $uploadMsg = "خطأ، لم يتم رفع الصورة";
    }
    Redirect::to("/yateem_addnew_02.php?ycode=". $yCode."&msg=" . $uploadMsg);
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
    <h2>رفع المرفقات الخاصة باليتيم <?php echo getYateemName($yCode); ?></h2>
    <div class="row">
    <table class="table">
        <tr>
            <td class="table-primary">البيانات الأساسية</td>
            <td class="table-primary">المرفقات</td>
            <td class="table-secondary">بيانات الأسرة والأم</td>
            <td class="table-secondary">بيانات الوصي</td>
            <td class="table-secondary">بيانات المعرف</td>
            <td class="table-secondary">بيانات الكفالة</td>
        </tr>
    </table>
    </div>
    <table class="table">
        <thead>
            <tr>
                <th>الوثيقة</th>
                <th>ملفها</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>صورة شخصية لليتيم</td>
            <td>
                <?php
                $pPhoto = checkCertfield($yCode,"personalPhoto");
                if($pPhoto){
                    echo "<a href=\"".$pPhoto."\" target=\"_blank\"><img src=\"".$pPhoto."\" height=\"50\" ></a>";
                }else{
                    ?>
                
                <form class="" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST" enctype="multipart/form-data">
                <div class="form-group row">
                <input type="hidden" name="aType" value="personalPhoto">
                <input type="hidden" name="ycode" value="<?php echo $yCode; ?>">
                <input type="file" class="form-control-file col" name="personalPhoto" id="personalPhoto"><!--birthCert-->
                <input type="submit" class="btn btn-info col" value="رفع">
                </div>
                </form>
                <?php
                }
                ?>
            </td>
        </tr>
        <tr>
            <td>شهادة الميلاد</td>
            <td>
                <?php
                $yCertB = checkCertfield($yCode,"birthCert");
                if($yCertB){
                    echo "<a href=\"".$yCertB."\" target=\"_blank\"><img src=\"".$yCertB."\" height=\"50\" ></a>";
                }else{
                    ?>
                
                <form class="" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST" enctype="multipart/form-data">
                <div class="form-group row">
                <input type="hidden" name="aType" value="birthCert">
                <input type="hidden" name="ycode" value="<?php echo $yCode; ?>">
                <input type="file" class="form-control-file col" name="birthCert" id="birthCert"><!--birthCert-->
                <input type="submit" class="btn btn-info col" value="رفع">
                </div>
                </form>
                <?php
                }
                ?>
            </td>
        </tr>
        <tr>
            <td>شهادة وفاة الأب</td>
            <td>
            <?php
                $yCertD = checkCertfield($yCode,"deathCert");
                if($yCertD){
                    echo "<a href=\"".$yCertD."\" target=\"_blank\"><img src=\"".$yCertD."\" height=\"50\" ></a>";
                }else{
                    ?>
                <form class="" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST" enctype="multipart/form-data">
                <div class="form-group row">
                <input type="hidden" name="aType" value="deathCert">
                <input type="hidden" name="ycode" value="<?php echo $yCode; ?>">
                <input type="file" class="form-control-file col" name="deathCert">
                <input type="submit" class="btn btn-info col" value="رفع">
                </div>
                </form>
                <?php
                }
                ?>
            </td>
        </tr>
        </tbody>
    </table>
    <a class="btn btn-primary" href="./yateem_addnew_03.php?ycode=<?php echo $yCode; ?>">التالي</a>
</div>
</div>

<!-- footers -->

<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
