<?php 
	$result = new stdClass;
	$myBuildId = @file_get_contents("/var/www/html/timeupdated");
	$newBuildId = file_get_contents("http://update.unturned.hosting/timeupdated");
	if($myBuildId && $myBuildId != $newBuildId) header("HTTP/1.1 500 Internal Server Error");
	
	$result->oldBuildId = $myBuildId;
	$result->newBuildId = $newBuildId;
	$result->uptodate = $myBuildId && $myBuildId == $newBuildId;
	$result->updating = !file_exists("/var/www/html/done");
	
	echo json_encode($result);
 ?> 
