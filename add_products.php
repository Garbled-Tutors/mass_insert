<?php
	include 'public_html/config.php';

	mysql_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD) or die('Could not connect: ' . mysql_error());
	mysql_select_db(DB_DATABASE) or die('Could not select database');
	
	$query = "INSERT INTO `oc_product` (`model`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `date_added`, `date_modified`, `viewed`) VALUES ('New Model',0,8,'data/demo/samsung_tab_1.jpg',0,1,199.9900,0,9,'2011-04-25',0.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,1,1,'2011-04-26 08:57:34','2011-09-30 01:06:23',0);";
	$result = mysql_query($query) or die('Query failed: ' . mysql_error());

	$query = "INSERT INTO `oc_product_description` (`language_id`, `name`, `description`) VALUES (1,'Test Product','Great Product');";
	$result = mysql_query($query) or die('Query failed: ' . mysql_error());





?>
