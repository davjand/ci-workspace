<?php

/* PHP Installer for workspace
 *
 * @version: 0.1
 * @author: David Anderson
 * @email: Dave@veodesign.co.uk
 *
 * This file should be runn to auto install the software in a testing environment
 *
*/

$BUILD_DIRECTORY = "build/local/";
$INSTALL_DIRECTORY = "public_html/";


//SORT OUT THE HTACCESS
//Shamlessly stolen from symphony installer
file_put_contents($INSTALL_DIRECTORY.".htaccess",file_get_contents($BUILD_DIRECTORY . 'htaccess.txt'));			


// CONNECT TO DB
include("public_html/manifest/config.php");

$mysqli = new mysqli(
	$settings['database']['host'],
	$settings['database']['user'],
	$settings['database']['password'],
	$settings['database']['db'],
	$settings['database']['port']
	);
	
// check connection
if ($mysqli->connect_errno) {
    printf("Connect failed: %s\n", $mysqli->connect_error);
    exit();
}

//run the query
$mysqli->multi_query(file_get_contents('public_html/workspace/migrations/baseline.sql')); 

?>