<?php echo $header; ?>
<script>
	function addProduct()
	{
		var table=document.getElementById("module");
		var row_count = table.getElementsByTagName("tr").length;
		var product_index = row_count - 2;
		var row=table.insertRow(row_count - 1);
		row.align="center";

		var cell;
		cell=row.insertCell(0);
		cell.innerHTML="<input type=\"checkbox\" name=\"mass_insert_module[" + product_index + "][ignore]\" checked=\"checked\" id=\"delete_module" + product_index + "\" />";

		cell=row.insertCell(1);
		cell.innerHTML="<input type=\"text\" name=\"mass_insert_module[" + product_index + "][product_description][1][name]\" onchange=\"enable_product(" + product_index + ")\" />";

		cell=row.insertCell(2);
		cell.innerHTML="<input type=\"text\" name=\"mass_insert_module[" + product_index + "][model]\" size=10 />";

		cell=row.insertCell(3);
		cell.innerHTML="<input type=\"text\" name=\"mass_insert_module[" + product_index + "][quantity]\" size=5 />";

		cell=row.insertCell(4);
		cell.innerHTML="<select name=\"mass_insert_module[" + product_index + "][stock_status_id]\"><?php foreach ($stock_statuses as $status) { 
		?><option value=<?php echo $status['stock_status_id']; ?>><?php echo $status['name']; ?></option><?php } ?></select>";

		cell=row.insertCell(5);
		cell.innerHTML="<input type=\"text\" name=\"mass_insert_module[" + product_index + "][price]\" size=5 />";

		cell=row.insertCell(6);
		cell.innerHTML="<select name=\"mass_insert_module[" + product_index + "][tax_class_id]\"><?php foreach ($tax_classes as $tax_class) { 
		?><option value=<?php echo $tax_class['tax_class_id']; ?>><?php echo $tax_class['title']; ?></option><?php } ?></select>";

		cell=row.insertCell(7);
		cell.innerHTML="<input class=\"date hasDatepicker\" type=\"date\" size=\"12\" value=\"2009-02-03\" name=\"mass_insert_module[" + product_index + "][date_available]\">";
	
		cell=row.insertCell(8);
		cell.innerHTML="<textarea name=\"mass_insert_module[" + product_index + "][product_description][1][description]\" cols=40 /></textarea>";
	}
	function enable_product(index)
	{
		document.getElementById("delete_module" + index).checked = false;
	}
	function addMultipleProducts()
	{
		for (i = 0;i < 4;i++)
		{
			addProduct();
		}
	}
	window.onload= addMultipleProducts;
</script>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" />Mass Insert Module</h1>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table id="module" class="list">
          <thead>
            <tr align="center">
							<td width=50>Delete</td>
							<td width=100>Product Name</td>
							<td width=100>Model</td>
							<td width=100>Quantity</td>
							<td width=100>Stock Status</td>
							<td width=100>Price</td>
							<td width=100>Tax Class</td>
							<td width=100>Date Available</td>
							<td>Description</td>
            </tr>
          </thead>
					<tfoot>
						<td colspan=9 height=40>
							<a onclick="addProduct()" class="button">Add Product</a>
							<a onclick="$('#form').submit();" class="button">Save</a>
						</td>
					</tfoot>
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>
