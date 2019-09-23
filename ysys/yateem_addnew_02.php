<?php
// This is a user-facing page
/*
Aytam Aid System - Open Source
*/
require_once '../users/init.php';
if (!securePage($_SERVER['PHP_SELF'])){die();}
require_once $abs_us_root.$us_url_root.'users/includes/template/prep.php';
/*
// Processing Form
if(!empty($_POST)){
    $response = preProcessForm();
    if($response['form_valid'] == true){
    //do something here after the form has been validated
    //$goNext = $response['fields']['continueData'];
    postProcessForm($response);
    }
}*/
if(!empty($_POST)){
    uploadYateemDocs();
}
function uploadYateemDocs(){
$target_dir = "aytamattachments/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
// Check if image file is a actual image or fake image
if(isset($_POST["submit"])) {
    $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
    if($check !== false) {
        echo "File is an image - " . $check["mime"] . ".";
        $uploadOk = 1;
    } else {
        echo "File is not an image.";
        $uploadOk = 0;
    }
}
// Check if file already exists
if (file_exists($target_file)) {
    echo "Sorry, file already exists.";
    $uploadOk = 0;
}
// Check file size
if ($_FILES["fileToUpload"]["size"] > 500000) {
    echo "Sorry, your file is too large.";
    $uploadOk = 0;
}
// Allow certain file formats
if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
&& $imageFileType != "gif" ) {
    echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
    $uploadOk = 0;
}
// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    echo "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
} else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}
}
$goNext = Input::get('continueData');
if($goNext){
    Redirect::to("./yateem_addnew_02.php?ycode=");
}else{
        
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
    <h2>رفع المرفقات الخاصة باليتيم</h2>
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
            <td>شهادة الميلاد</td>
            <td>
                <form class="" method="post" target="<?php echo $_SERVER['PHP_SELF']; ?>" enctype="multipart/form-data">
                <div class="form-group row">
                <input type="file" class="form-control-file col" name="birthCert">
                <input type="submit" class="btn btn-info col" value="رفع">
                </div>
                </form>
            </td>
        </tr>
        <tr>
            <td>شهادة وفاة الأب</td>
            <td>
                <form class="" target="<?php echo $_SERVER['PHP_SELF']; ?>" method="post" enctype="multipart/form-data">
                <div class="form-group row">
                <input type="file" class="form-control-file col" name="deathCert">
                <input type="submit" class="btn btn-info col" value="رفع">
                </div>
                </form>
            </td>
        </tr>
        </tbody>
    </table>
    
</div>
</div>

<!-- footers -->

<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
