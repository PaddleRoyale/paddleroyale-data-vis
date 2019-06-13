<?
echo "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>";
$agencyNames = array( "Leo Burnett", "Razorfish","FCB","Artic Fanny Pack","Gigiddy", "Digitas","Agency.com","Giant Squid","Inverted","Laughing Squid","Pew Pew Pew", "Jurassic Park", "Catfish", "2Advanced", "Giggiddy");

function randomScore()
{
	return rand(1,10);
}

function randomKnockOut()
{
	return rand(1,2) == 1 ? "true" : "false";
	//return "true";
}
?>
<!--
	Data for Paddle Royale
	Created by Michael Minor on 2011-09-16.
	Copyright (c) 2011 Arc World Wide. All rights reserved.
	
	Sample
	<agencies>
		<agency id:String="#" name:String="###">
			<player id:String="#" name="#" score:String="#" knockedOut:Boolean="false"/>
		</agency>
	<agencies>
-->

<agencies>
	<?
	for( $i = 0 ; $i < count($agencyNames) - 3 ; $i++)
	{
	?>
	<agency id="<?=$i;?>" name="<?=$agencyNames[$i];?>">
		<players>
			<player id="<?=$i;?>0" 	firstName="Michael" 	lastName="Minor<?=$i;?>" 		score="<?=randomScore();?>"  	knockedOut="<?=randomKnockOut();?>" />
			<player id="<?=$i;?>1" 	firstName="Chad" 		lastName="Ziolkowski<?=$i;?>" 	score="<?=randomScore();?>"  	knockedOut="<?=randomKnockOut();?>" />
			<player id="<?=$i;?>2" 	firstName="Char" 		lastName="Mirshak<?=$i;?>" 		score="<?=randomScore();?>"  	knockedOut="<?=randomKnockOut();?>" />
			<player id="<?=$i;?>3" 	firstName="Leonard" 	lastName="Nemoi<?=$i;?>" 		score="<?=randomScore();?>"  	knockedOut="<?=randomKnockOut();?>" />
			<player id="<?=$i;?>4" 	firstName="Scott" 		lastName="North<?=$i;?>" 		score="<?=randomScore();?>"  	knockedOut="<?=randomKnockOut();?>" />
			<player id="<?=$i;?>5" 	firstName="Michael" 	lastName="Miano<?=$i;?>" 		score="<?=randomScore();?>"  	knockedOut="<?=randomKnockOut();?>" />
			<player id="<?=$i;?>6" 	firstName="Ariel" 		lastName="Hammer<?=$i;?>" 		score="<?=randomScore();?>"  	knockedOut="<?=randomKnockOut();?>" />
			<player id="<?=$i;?>7" 	firstName="Ahubha" 		lastName="Dubey<?=$i;?>" 		score="<?=randomScore();?>"  	knockedOut="<?=randomKnockOut();?>" />
			<player id="<?=$i;?>8" 	firstName="Damien" 		lastName="Van Horn<?=$i;?>" 	score="<?=randomScore();?>"  	knockedOut="<?=randomKnockOut();?>" />
			<player id="<?=$i;?>9" 	firstName="Miles" 		lastName="Green<?=$i;?>" 		score="<?=randomScore();?>"  	knockedOut="<?=randomKnockOut();?>" />
		</players>
	</agency>
	<? } ?>
</agencies>