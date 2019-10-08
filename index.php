<?php
if(file_exists("install/index.php")){
	//perform redirect if installer files exist
	//this if{} block may be deleted once installed
	header("Location: install/index.php");
}

require_once 'users/init.php';
require_once $abs_us_root.$us_url_root.'users/includes/template/prep.php';
require_once $abs_us_root.$us_url_root.'ysys/functions.php';
if(isset($user) && $user->isLoggedIn()){
}


function getOptions($option,$optionID){
	$db = DB::getInstance();
	if($option == "city"){
		$optionQ = $db->query("SELECT cityName FROM `ya_settings_cities` WHERE id = ?",[$optionID]);
		return $db->first()->cityName;
	}elseif($option == "kafalahLable"){
		$optionQ = $db->query("SELECT kafalahLable FROM `ya_kafalahinfo_01` WHERE id = ?",[$optionID]);
		return $db->first()->kafalahLable;
	}elseif($option == "yState"){
		$optionQ = $db->query("SELECT yState FROM `ya_settings_ystate` WHERE id = ?",[$optionID]);
		return $db->first()->yState;
	}
}
$aytamQ = $db->query("SELECT * FROM `yayateeminfo1` ORDER BY id DESC");
$counAytam = $aytamQ->count();
?>
<div id="page-wrapper">
	<div class="container" dir="rtl">
	<br>
	<?php
		if($user->isLoggedIn()){?>
			<div class="row text-right" dir="rtl">
			<div class="col-sm-12 col-md-12">
			<br>
			<form method="GET" action="./ysys/kafalh_dokafalah.php">
			<div class="d-flex justify-content-start bg-secondary">
				<a class="btn btn-info" href="ysys/yateem_addnew_01.php">إضافة يتيم</a>&nbsp;
				<button class="btn btn-info" type="submit">تغيير حالة اليتيم</button>
				&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
				<input class="form-control col-md-4" type="text" id="searchInput" onkeyup="searchtable()" placeholder="بحث وفرز" style="text-align: center;">
			</div>
			<br>
			<table class="table table-striped" id="searchTable">

			<thead class="thead-light">
			<tr>
		      <th>#</th>
		      <th>الاسم</th>
		      <th>العنوان</th>
			  	<th>الحالة</th>
			  	<th>اسم الكافل</th>
			  	<th>الكفالة</th>
			  	<th>المرفقات</th>
		    </tr>
			</thead>
			<tbody>
	<?php
	if($counAytam > 0){
	    $aytamResult = $aytamQ->results();
	    $x = 1;
	    foreach($aytamResult as $ar){
	?>
			<tr>
			<td><input type="checkbox" class="form-check-input" name="ycode[]" value="<?php echo $ar->id; ?>"></td>
			<td>
				<a href="./ysys/yateem_viewyateem.php?ycode=<?php echo $ar->id; ?>"><?php echo $ar->yName; ?></a><br>
				<a href="./ysys/yateem_edityateemdata.php?ycode=<?php echo $ar->id; ?>">[تحرير البيانات]</a>
			</td>
			<td>
			المدينة: <?php menuQuery("r",$ar->cityName," 	ya_settings_cities","cityName","cityName");// getOptions("city",$ar->cityName); ?><br>
			<?php echo $ar->yAddress; ?>
			</td>
			<td><?php menuQuery("r",$ar->yState,"ya_settings_ystate","yState","yState");//echo getOptions("yState",$ar->yState); ?></td>
			<td><?php echo getKafil($ar->kafalahID); ?></td>
			<td>
			رقم: <?php echo $ar->kafalahID; ?> <br>
			<?php echo kafalahQuery("r",$ar->kafalahID);// getOptions("kafalahLable",$ar->kafalahID); ?> <br>
			مبلغ: <?php echo $ar->kafalahAmount; ?> <br>
			</td>
			<td>
				<?php
				if($ar->yPersonalPhotoLink){
				echo "<a href=\"ysys/" . $ar->yPersonalPhotoLink . "\" target=\"_blank\">صورة شخصية</a><br>";
				}
				if($ar->yBirthCertLink){
					echo "<a href=\"ysys/" . $ar->yBirthCertLink . "\" target=\"_blank\">شهادة الميلاد</a><br>";
				}
				if($ar->yPersonalPhotoLink){
					echo "<a href=\"ysys/" . $ar->yDeathCertLink . "\" target=\"_blank\">شهادة الوفاة</a>";
				}
				?>
			</td>
			</tr>
	<?php
		} // end of foreach($aytamResult as $ar)
	} // end of if($counAytam > 0)
	?>
		</tbody>
		</table>
		</div>
<?php }else{?>
		<div class="jumbotron">
			<h1 align="center"> نظام مساعد اليتيم</h1>
			<p align="center" class="text-muted">لإدارة الأيتام وكفالاتهم</p>
			<p align="center">
				<div class="row text-center">
					<a class="btn btn-warning col" href="users/login.php" role="button"><?=lang("SIGNIN_TEXT");?> &raquo;</a>
					<a class="btn btn-info col" href="users/join.php" role="button"><?=lang("SIGNUP_TEXT");?> &raquo;</a>
				</div>
		</div>
<?php }?>


	</form>
	</div>
</div>
<?php  languageSwitcher();?>
<!-- Place any per-page javascript here -->
<script>
function searchtable() {
    // Declare variables
    var input, filter, table, tr, td, i;
    input = document.getElementById("searchInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("searchTable");
    tr = table.getElementsByTagName("tr");
    // number of columns
    var cols = 7;
    // Loop through all table rows, and hide those who don't match the search query
    for (i = 0; i < tr.length; i++) {
        //loop through table columns
        for(j = 0; j < cols; j++){
            //td = tr[i].getElementsByTagName("td")[colname];
            td = tr[i].getElementsByTagName("td")[j];
            if (td) {
                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                    break;
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }
}
function submitdelete() {
     var confirmdel = confirm('هل أنت متأكد من أنك تريد حذف الأسماء المحددة ؟');
    if(confirmdel){
        document.getElementById("control").value = "delete";
        document.getElementById("contacttablefrm").submit();
    }
}
</script>
<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
