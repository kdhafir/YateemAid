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
    //$goNext = $response['fields']['continueData'];
    postProcessForm($response);
    }
}
$goNext = Input::get('continueData');
if($goNext){
    $lastID = $db->lastId();
    Redirect::to("./yateem_addnew_02.php?ycode=". $lastID);
}
//$aytamQ = $db->query("SELECT * FROM `yy_yateem_main_info` ORDER BY id DESC");
//$counAytam = $aytamQ->count();

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
    <h2>نموذج اضافة يتيم جديد</h2>
    <div class="row">
    <table class="table">
        <tr>
            <td class="table-primary">البيانات الأساسية</td>
            <td class="table-secondary">المرفقات</td>
            <td class="table-secondary">بيانات الأسرة والأم</td>
            <td class="table-secondary">بيانات الوصي</td>
            <td class="table-secondary">بيانات المعرف</td>
            <td class="table-secondary">بيانات الكفالة</td>
        </tr>
    </table>
    </div>
    
    <form class="" action="<?php echo htmlentities($_SERVER['PHP_SELF']); ?>" method="post">
    <input type="hidden" name="csrf" value="<?php echo Token::generate(); ?>">
    <div class="row">
    <div class="form-group col-md-5">
              <label class="" for="DateOfEntry">تاريخ الادخال          *        </label>
              <input type="date" class="form-control hasDatepicker" name="DateOfEntry" id="DateOfEntry" value="">
            <!-- final div -->
          </div>
    <div class="form-group col-md-7">
    <label class="" for="yName">اسم اليتيم رباعياً مع اللقب                  </label>
    <input type="text" name="yName" id="yName" class="form-control" value="" style="background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABHklEQVQ4EaVTO26DQBD1ohQWaS2lg9JybZ+AK7hNwx2oIoVf4UPQ0Lj1FdKktevIpel8AKNUkDcWMxpgSaIEaTVv3sx7uztiTdu2s/98DywOw3Dued4Who/M2aIx5lZV1aEsy0+qiwHELyi+Ytl0PQ69SxAxkWIA4RMRTdNsKE59juMcuZd6xIAFeZ6fGCdJ8kY4y7KAuTRNGd7jyEBXsdOPE3a0QGPsniOnnYMO67LgSQN9T41F2QGrQRRFCwyzoIF2qyBuKKbcOgPXdVeY9rMWgNsjf9ccYesJhk3f5dYT1HX9gR0LLQR30TnjkUEcx2uIuS4RnI+aj6sJR0AM8AaumPaM/rRehyWhXqbFAA9kh3/8/NvHxAYGAsZ/il8IalkCLBfNVAAAAABJRU5ErkJggg==&quot;); background-repeat: no-repeat; background-attachment: scroll; background-size: 16px 18px; background-position: left center; cursor: auto;">    
    <!-- final div -->
    </div>
</div><!--end of div row-->
<div class="row">
    <div class="form-group col-md-5">
        <label class="" for="yDateOfBirth">تاريخ ميلاد اليتيم</label>
        <input type="date" class="form-control hasDatepicker" name="yDateOfBirth" id="yDateOfBirth" value="">
            <!-- final div -->
          </div>
              <div class="form-group col-md-7">
              <label class="" for="yBirthPlace">محل الميلاد</label>
              <input type="text" name="yBirthPlace" id="yBirthPlace" class="form-control" value="">
            <!-- final div -->
          </div>
          </div><!--end of div row-->
<div class="row">
<div class="form-group col-md-4">
              <label class="" for="ySex">جنس اليتيم</label>
                  <select name="ySex" id="ySex" class="form-control">
                            <option value="male">ذكر</option>
                              <option value="female">أنثى</option>
                          </select>
            <!-- final div -->
          </div>
              <div class="form-group col-md-4">
              <label class="" for="yNationality">جنسية اليتيم</label>
              <input type="text" name="yNationality" id="yNationality" class="form-control" value="">
            <!-- final div -->
          </div>
          </div><!--end of div row-->
<div class="row">
              <div class="form-group col-md-12">
              <label class="" for="yFeatures">مواهب ومميزات اليتيم</label>
              <textarea name="yFeatures" id="yFeatures" class="form-control"></textarea>
            <!-- final div -->
          </div>
    </div><!--end of div row-->
<div class="row">
<div class="form-group col-md-5">
              <label class="" for="cityName">المدينة / المحافظة</label>
                  <select name="cityName" id="cityName" class="form-control">
                            <option value="sanaa">صنعاء</option>
                              <option value="aden">عدن</option>
                              <option value="ibb">إب</option>
                              <option value="taiz">تعز</option>
                              <option value="mareb">مارب</option>
                          </select>
            <!-- final div -->
          </div>
              <div class="form-group col-md-7">
              <label class="" for="yAddress">محل اقامة اليتيم [ مديرية - عزلة / حي ]</label>
              <input type="text" name="yAddress" id="yAddress" class="form-control" value="">
            <!-- final div -->
          </div>
          </div><!--end of div row-->
<div class="row">
              <div class="form-group col-md-4">
              <label class="" for="fDeathDate">تاريخ وفاة الأب</label>
              <input type="date" class="form-control hasDatepicker" name="fDeathDate" id="fDeathDate" value="">
            <!-- final div -->
          </div>
              <div class="form-group col-md-8">
              <label class="" for="fDeathReason">سبب وفاة الأب</label>
              <input type="text" name="fDeathReason" id="fDeathReason" class="form-control" value="">
            <!-- final div -->
          </div>
          </div><!--end of div row-->
<div class="row">
              <div class="form-group col-md-4">
              <label class="" for="yEduLevel">المستوى التعليمي</label>
              <input type="text" name="yEduLevel" id="yEduLevel" class="form-control" value="">
            <!-- final div -->
          </div>
              <div class="form-group col-md-4">
              <label class="" for="yEduClass">الصف الدراسي</label>
              <input type="text" name="yEduClass" id="yEduClass" class="form-control" value="">
            <!-- final div -->
          </div>
              <div class="form-group col-md-4">
              <label class="" for="yEduSchoolName">اسم المدرسة</label>
              <input type="text" name="yEduSchoolName" id="yEduSchoolName" class="form-control" value="">
            <!-- final div -->
          </div>
          </div><!--end of div row-->
<div class="row">
              <div class="form-group col-md-12">
              <label class="" for="yEduNoEduReason">سبب الانقاطع عن التعليم [ في حال الانقطاع ]</label>
              <textarea name="yEduNoEduReason" id="yEduNoEduReason" class="form-control"></textarea>
            <!-- final div -->
          </div>
          </div><!--end of div row-->
<div class="row">
              <div class="form-group col-md-12">
              <label class="" for="yHealthStatus">الحالة الصحية</label>
              <input type="text" name="yHealthStatus" id="yHealthStatus" class="form-control" value="">
            <!-- final div -->
          </div>
          </div><!--end of div row-->
<div class="row">
              <div class="form-group col-md-12">
              <label class="" for="yHealthSickness">بيان المرض [ إن وجد ]</label>
              <textarea name="yHealthSickness" id="yHealthSickness" class="form-control"></textarea>
            <!-- final div -->
          </div>
          </div><!--end of div row-->
<div class="row">
              <div class="form-group col-md-6">
              <label class="" for="yQuranLevel">مقدار الحفظ من القرآن</label>
              <input type="text" name="yQuranLevel" id="yQuranLevel" class="form-control" value="">
            <!-- final div -->
          </div>
              <div class="form-group col-md-6">
              <label class="" for="yQuranSchool">اسم مدرسة التحفيظ</label>
              <input type="text" name="yQuranSchool" id="yQuranSchool" class="form-control" value="">
            <!-- final div -->
          </div>
          </div><!--end of div row-->
<div class="row">
        <div class="form-group col-md-4">
            <button class="btn btn-primary" type="submit" name="continueData" value="false">حفظ + جديد</button>
              <input type="submit" name="submit" value="button" >
</div>
            <div class="form-group col-md-4">
            <button class="btn btn-info" type="submit" name="continueData" value="true">حفظ + التالي</button>
</div>
    </div><!--end of div row-->
    <input type="hidden" name="form_name" value="yayateeminfo1">
</form>
<br><br>
    </div>

</div>



<!-- footers -->

<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
