<?php

/* PHP Installer for workspace
 *
 * @version: 0.1
 * @author: David Anderson
 * @email: Dave@veodesign.co.uk
 *
 * Purpose is to allow installation of the database to a new system so a developer can instantly start working on the repository.
 * Workflow for this is defined in Workflow Document
 *
*/

$BUILD_DIRECTORY = "build/local";
$INSTALL_DIRECTORY = "public_html/";


//SORT OUT THE HTACCESS
//Shamlessly stolen from symphony installer
$rewrite_base = ltrim(preg_replace('/\/build/local$/i', NULL, dirname($_SERVER['PHP_SELF'])), '/public_html/');
$htaccess = str_replace(
	'<!-- REWRITE_BASE -->', $rewrite_base,
	file_get_contents($BUILD_DIRECTORY . '.htaccess')
);
file_put_contents($INSTALL_DIRECTORY.".htaccess",$htaccess);			


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