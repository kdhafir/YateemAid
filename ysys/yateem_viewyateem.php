<?php
// This is a user-facing page
/*
Aytam Aid System - Open Source
*/
require_once '../users/init.php';
if (!securePage($_SERVER['PHP_SELF'])){die();}
require_once $abs_us_root.$us_url_root.'users/includes/template/prep.php';
require_once $abs_us_root.$us_url_root.'ysys/functions.php';

// Processing Form
if(!empty($_POST)){
    processForm();
    }
    
$ycode = Input::get('ycode');
$yateemQ = $db->query("SELECT * FROM `yayateeminfo1` WHERE id = ?",[$ycode]);
$counY = $yateemQ->count();

?>

<div class="row text-right" dir="rtl">
<h2 class="col-md-12">استمارة يتيم</h2>    
<?php
if($counY){
    $resultY = $yateemQ->results();
		foreach($resultY as $rY){
            buildYateemReport($rY->id);
            /*
            echo $rY->dateOfEntry . '<br>';
            echo $rY->ySex . '<br>';
            echo $rY->yDateOfBirth . '<br>';
            echo $rY->yBirthPlace . '<br>';
            echo $rY->yNationality . '<br>';
            echo $rY->yFeatures . '<br>'; 
            echo $rY->yAddress . '<br>';
            echo $rY->yRankInFamily . '<br>';            
            echo $rY->fDeathDate . '<br>';
            echo $rY->fDeathReason . '<br>';
            echo $rY->yEduLevel . '<br>';
            echo $rY->yEduClass . '<br>';
            echo $rY->yEduSchoolName . '<br>';
            echo $rY->yEduSchoolPhone . '<br>';
            echo $rY->yEduNoEduReason . '<br>';
            echo $rY->yHealthStatus . '<br>';
            echo $rY->yHealthSickness . '<br>';
            echo $rY->yQuranLevel . '<br>';
            echo $rY->yQuranSchool . '<br>';
            echo $rY->rSectionName . '<br>';
            echo $rY->rName . '<br>';
            echo $rY->rSex . '<br>';
            echo $rY->rDateOfBirth . '<br>';
            echo $rY->rRelation . '<br>';
            echo $rY->rMobile . '<br>';
            echo $rY->rMobilePerson . '<br>';
            echo $rY->rWorkName . '<br>';
            echo $rY->rWorkType . '<br>';
            echo $rY->mSection . '<br>';
            echo $rY->mSectionName . '<br>';
            echo $rY->mName . '<br>';
            echo $rY->mAlive . '<br>';
            echo $rY->mStatus . '<br>';
            echo $rY->mWork . '<br>';
            echo $rY->fNumberOfBrothers . '<br>';
            echo $rY->fRankInFamily . '<br>';
            echo $rY->fHomeType . '<br>';
            echo $rY->fAddress . '<br>';
            echo $rY->fFinanceStatus . '<br>';
            echo $rY->fFinanceSalary . '<br>';
            echo $rY->fFinanceSource . '<br>';
            echo $rY->sOpinion . '<br>';
            echo $rY->BasicInfo . '<br>';
            echo $rY->identifierName . '<br>';
            echo $rY->identifierSection . '<br>';
            echo $rY->idName . '<br>';
            echo $rY->idMobile . '<br>';
            echo $rY->idAddress . '<br>';
            echo $rY->mIDCard . '<br>';
            echo $rY->rIDCard . '<br>';
            echo $rY->BasicInfoSection . '<br>';
            echo $rY->kafalahID . '<br>';
            echo $rY->kafalahAmountY . '<br>';
            echo $rY->kafalahCurrencyY . '<br>';
            echo $rY->kafalahSection . '<br>';
            echo $rY->kafalahStartDate . '<br>';
            echo $rY->kafalahEndDate . '<br>';
            echo $rY->kafalahEndreason . '<br>';
            echo $rY->yState . '<br>';
            echo $rY->cityName . '<br>';
            echo $rY->kafalahAmount . '<br>';
            echo $rY->kafalahCurrency . '<br>';
            echo $rY->yBirthCertLink . '<br>';
            echo $rY->yDeathCertLink . '<br>';
            */
            ?>
            <?php
            
        }
}else{
    echo "لا توجد بيانات";
}
    
?>
</div>



<!-- footers -->

<?php require_once $abs_us_root . $us_url_root . 'users/includes/html_footer.php'; ?>
