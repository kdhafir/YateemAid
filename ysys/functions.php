<?php
// دالة رفع مرفقات اليتيم شهادة الميلاد وشهادة الوفاة
function uploadYateemDocs($fieldName,$yateemID){
    $target_dir = "aytamattachments/";
    $target_file = $target_dir . $yateemID. "_". $fieldName. ".png";//basename($_FILES[$fieldName]["name"]);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
    // Check if image file is a actual image or fake image
    if(isset($_POST["submit"])) {
        $check = getimagesize($_FILES[$fieldName]["tmp_name"]);
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
        echo "عذراً, ملف بنفس الاسم موجود فعلاً";
        $uploadOk = 0;
    }
    // Check file size
    if ($_FILES[$fieldName]["size"] > 5000000) {
        echo "عذراً، حجم الملف كبير جداً.";
        $uploadOk = 0;
    }
    // Allow certain file formats
    if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
    && $imageFileType != "gif" ) {
        echo "عذراً، يسمح فقط بالملفات من النوع JPG, JPEG, PNG & GIF";
        $uploadOk = 0;
    }
    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        echo "عذراً، لم يتم رفع الملف";
    // if everything is ok, try to upload file
    } else {
        if (move_uploaded_file($_FILES[$fieldName]["tmp_name"], $target_file)) {
            echo "الملف: ". basename( $_FILES[$fieldName]["name"]). " تم رفعه بنجاح.";
        } else {
            echo "Sorry, there was an error uploading your file.";
        }
    }
    return $uploadOk;
}

// دالة التحقق من حقل رابط شهادة الميلاد وشهادة الوفاة لليتيم واعادة الرابط في حال وجوده
function checkCertfield($recordID,$feildToCheck){
    $db = DB::getInstance();
    $certQ = $db->query("SELECT * FROM `yayateeminfo1` WHERE id = ?",[$recordID]);
    $counCert = $certQ->count();
    if($counCert){
        if($feildToCheck == "birthCert"){
            return $certQ->first()->yBirthCertLink;
        }elseif($feildToCheck == "personalPhoto"){
            return $certQ->first()->yPersonalPhotoLink;
        }else{
            return $certQ->first()->yDeathCertLink;
        }
    }else{
        return $counCert;
    }
}

// دالة لايجاد اسم اليتيم بناءاً على الاي دي الخاص به
function getYateemName($yateemID){
    $db = DB::getInstance();
    $yateemQ = $db->query("SELECT * FROM `yayateeminfo1` WHERE id = ?",[$yateemID]);
    if($yateemQ->count()){
        return $yateemQ->first()->yName;
    }else{
        return "غير معروف";
    }
}
// دالة لايجاد حالة كفالة اليتيم بناءاً على الاي دي الخاص به
function getYateemKafalahState($yateemID){
    $db = DB::getInstance();
    $yateemQ = $db->query("SELECT * FROM `yayateeminfo1` WHERE id = ?",[$yateemID]);
    if($yateemQ->count()){
        return $yateemQ->first()->yState;
    }else{
        return "غير معروف";
    }
}
function getFieldData($recordID,$fieldName){
    $db = DB::getInstance();
    $yFieldQ = $db->query("SELECT * FROM `yayateeminfo1` WHERE id = ?",[$recordID]);
    return $yFieldQ->first()->$fieldName;
}
function buildYateemReport($recordID){
    $db = DB::getInstance();
    $formQ = $db->query("SELECT * FROM `yayateeminfo1_form` order by ord");
    $counForm = $formQ->count();
    $formR = $formQ->results();
    foreach($formR as $rF){
        echo "<div class=\"border bg-dark text-white col-md-2\">\n";
        echo $rF->form_descrip;
        echo "</div>\n";
        echo "<div class=\"border bg-light col-md-4\">\n";
        if($rF->special_field_type == "image"){
            echo "<img src=\"";
            echo getFieldData($recordID,$rF->col);
            echo "\" height=\"50px\">";
        }else{
            echo getFieldData($recordID,$rF->col);
        }
        
        echo "</div>\n";
    }
}
// دالة بناء نموذج تحرير بيانات اليتيم
function buildYateemFormEditable($recordID){
    $db = DB::getInstance();
    $formQ = $db->query("SELECT * FROM `yayateeminfo1_form` order by ord");
    $counForm = $formQ->count();
    $formR = $formQ->results();
    echo "<form class=\"\" action=\"". htmlentities($_SERVER['PHP_SELF']) ."\" method=\"POST\">";
    echo "<input type=\"hidden\" name=\"csrf\" value=\"" . Token::generate() . "\">";
    echo "<input type=\"hidden\" name=\"ycode\" value=\"" . $yCode . "\">";
    foreach($formR as $rF){
        echo "<div class=\"form-group col\">";
		echo "<label class=\"\" for=\"kafalahID\">رقم الكفالة</label>";
		echo "<input type=\"number\" step=\"1\" name=\"kafalahID\" id=\"kafalahID\" class=\"form-control\" value=\"\">";
        echo "<div class=\"border bg-dark text-white col-md-2\">\n";
        echo $rF->form_descrip;
        echo "</div>\n";
        echo "<div class=\"border bg-light col-md-4\">\n";
        if($rF->special_field_type == "image"){
            echo "<img src=\"";
            echo getFieldData($recordID,$rF->col);
            echo "\" height=\"50px\">";
        }else{
            echo getFieldData($recordID,$rF->col);
        }
        
        echo "</div>\n";
    }
}

function getKafil($kafalahID){
	$db = DB::getInstance();
	$kafaQ = $db->query("SELECT kafilID FROM `ya_kafalahinfo_01` WHERE id = ?",[$kafalahID]);
	if ($kafaQ->count()){
		$kafiID = $db->first()->kafilID;
		$kafiQ = $db->query("SELECT kName FROM `ya_kafilinfo_01` WHERE id = ?",[$kafiID]);
		return $db->first()->kName;
	}else{
		return "غير موجود";
	}
}

// get menu options function 
// الدالة لها وضعين اما انشاء القائمة أو البحث عن اسم عنصر بواسطة رقمه [ الاي دي ] 
function menuQuery($mode, $itemID,$menuTableName,$menuFieldName){ //,$formFieldName
    $db = DB::getInstance();
    //$menuTableName = "ya_settings_cities";
    //$menuFieldName = "cityName";
    if ($mode == "r"){
        $itemsQ = $db->query("SELECT * FROM $menuTableName WHERE id = ?",[$itemID]);
        if($itemsQ->count()){
            echo $itemsQ->first()->$menuFieldName;
        }else{
            echo "<span class='text-danger'>" . "خارج النطاق" . "</span>";
        }
    }elseif($mode == "w"){
        $itemsQ = $db->query("SELECT * FROM $menuTableName order by id");
        $counItems = $itemsQ->count();
        $itemsR = $itemsQ->results();
        //echo "<select name=\"" . $formFieldName . "\" id=\"" . $formFieldName . "\" class=\"form-control\">";
        //echo "<option disabled=\"\" selected=\"\" value=\"\">--اختر--</option>";
        foreach($itemsR as $r){
            echo "<option value=\"" . $r->id . "\">" . $r->$menuFieldName . "</option>";
        }
        //echo "</select>";
    } 
}

function kafalahQuery($mode,$itemID){
    $db = DB::getInstance();
    $menuTableName = " 	ya_kafalahinfo_01";
    $menuFieldName = "kafalahLable";
    $formFieldName = "kafalahID";
    if ($mode == "r" && $itemID > 0){
        $itemsQ = $db->query("SELECT * FROM $menuTableName WHERE id = ?",[$itemID]);
        if($itemsQ->count()){
            echo $itemsQ->first()->$menuFieldName;
        }else{
            echo "غير موجود";
        }
    }elseif($mode == "w"){
        $itemsQ = $db->query("SELECT * FROM $menuTableName order by id");
        $counItems = $itemsQ->count();
        $itemsR = $itemsQ->results();
        //echo "<select name=\"" . $formFieldName . "\" id=\"" . $formFieldName . "\" class=\"form-control\">";
        //echo "<option disabled=\"\" selected=\"\" value=\"\">--اختر--</option>";
        foreach($itemsR as $r){
            echo "<option value=\"" . $r->id . "\">" . $r->$menuFieldName . " [ " . getKafil($r->id) . " ] " . "</option>";
        }
        //echo "</select>";
    } 
}
?>