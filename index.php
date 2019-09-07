<?php
if(file_exists("install/index.php")){
	//perform redirect if installer files exist
	//this if{} block may be deleted once installed
	header("Location: install/index.php");
}

require_once 'users/init.php';
require_once $abs_us_root.$us_url_root.'users/includes/template/prep.php';
if(isset($user) && $user->isLoggedIn()){
}
?>
<div id="page-wrapper">
	<div class="container" dir="rtl">
		<div class="jumbotron">
			<h1 align="center"> نظام مساعد اليتيم</h1>
			<p align="center" class="text-muted">لإدارة الأيتام وكفالاتهم</p>
			<p align="center">
				<?php
				if($user->isLoggedIn()){?>
					
					<a class="btn btn-primary" href="ysys/kafil_addnew.php" role="button">إضافة كافل &raquo;</a>
					<a class="btn btn-primary" href="ysys/kafil_viewall.php" role="button">ادارة الكافلين &raquo;</a>
					<br><br>
					<a class="btn btn-primary" href="ysys/kafalah_addnew.php" role="button">إضافة كفالة &raquo;</a>
					<a class="btn btn-primary" href="ysys/kafalah_viewall.php" role="button">ادارة الكفالات &raquo;</a>
					<br><br>
					<a class="btn btn-primary" href="ysys/yateem_addnew.php" role="button">إضافة يتيم &raquo;</a>
					<a class="btn btn-primary" href="ysys/index.php" role="button">استعراض الأيتام &raquo;</a>
					<br><br>
					<a class="btn btn-primary" href="users/account.php" role="button"><?=lang("ACCT_HOME");?> &raquo;</a>
				<?php }else{?>
					<a class="btn btn-warning" href="users/login.php" role="button"><?=lang("SIGNIN_TEXT");?> &raquo;</a>
					<a class="btn btn-info" href="users/join.php" role="button"><?=lang("SIGNUP_TEXT");?> &raquo;</a>
				<?php }?>
			</p>
			<br>
			
		</div>
<?php  languageSwitcher();?> 
	</div>
</div>

<!-- Place any per-page javascript here -->


<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
