<?php 
	$myBuildId = @file_get_contents("/var/www/html/timeupdated");
	$newBuildId = file_get_contents("http://update.unturned.hosting/timeupdated");
	if($myBuildId && $myBuildId != $newBuildId) header("HTTP/1.1 500 Internal Server Error");
	else echo "Up to date.";
 ?>