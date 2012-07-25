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


// This file will be copied to the root directory when the install_local.sh script is run so can thus be accessed
// from http://mydomain.com/install.php


//PSEUDO CODE

// CONNECT TO DB
include("manifest/config.php");

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
$mysqli::multi_query(file_get_contents('workspace/migrations/baseline.sql')); 

//delete the file
unlink('install.php');

//redirect to index
header('Location: /');

?>