<?php
	include 'public_html/config.php';

	mysql_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD) or die('Could not connect: ' . mysql_error());
	mysql_select_db(DB_DATABASE) or die('Could not select database');
	
	$query = "INSERT INTO `oc_product` (`model`, `quantity`, `stock_status_id`, `manufacturer_id`, `price`, `tax_class_id`, `date_available`) VALUES ('A',1,7,0,19.9,9,'2011-04-25');";
	$result = mysql_query($query) or die('Query failed: ' . mysql_error());

	$query = "INSERT INTO `oc_product_description` (`language_id`, `name`, `description`) VALUES (1,'Babel Fish','The Babel fish is small, yellow, leech-like, and probably the oddest thing in the universe. It feeds on brain wave energy, absorbing all unconscious frequencies and then excreting telepathically a matrix formed from the conscious frequencies and nerve signals picked up from the speech centres of the brain, the practical upshot of which is that if you stick one in your ear, you can instantly understand anything said to you in any form of language: the speech you hear decodes the brain wave matrix.');";
	$result = mysql_query($query) or die('Query failed: ' . mysql_error());


?>
