<?php echo $header; ?>
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
            <tr>
							<td class="left" width=100>Product Name</td>
							<td class="left" width=100>Model</td>
							<td class="left" width=100>Quantity</td>
							<td class="left" width=100>Stock Status</td>
							<td class="left" width=100>Price</td>
							<td class="left" width=100>Tax Class</td>
							<td class="left" width=100>Date Available</td>
							<td class="left">Description</td>
            </tr>
          </thead>
					<?php for ($i = 0; $i < 5; $i++) { ?>
					<tr>
						<td>
							<input type="text" name="mass_insert_module[<? echo $i; ?>][product_description][1][name]" />
						</td>
						<td>
							<input type="text" name="mass_insert_module[<? echo $i; ?>][model]" size=10 />
						</td>
						<td>
							<input type="text" name="mass_insert_module[<? echo $i; ?>][quantity]" size=5 />
						</td>
						<td>
							<select name="mass_insert_module[<? echo $i; ?>][stock_status_id]">
								<?php foreach ($stock_statuses as $status) { ?>
								<option value=<?php echo $status['stock_status_id']; ?>><?php echo $status['name']; ?></option>
								<?php } ?>
							</select>
						</td>
						<td>
							<input type="text" name="mass_insert_module[<? echo $i; ?>][price]" size=5 />
						</td>
						<td>
							<select name="mass_insert_module[<? echo $i; ?>][tax_class_id]">
								<?php foreach ($tax_classes as $tax_class) { ?>
								<option value=<?php echo $tax_class['tax_class_id']; ?>><?php echo $tax_class['title']; ?></option>
								<?php } ?>
							</select>
						</td>
						<td>
							<input class="date hasDatepicker" type="date" size="12" value="2009-02-03" name="mass_insert_module[<? echo $i; ?>][date_available]">
						</td>
						<td>
							<textarea name="mass_insert_module[<? echo $i; ?>][product_description][1][description]" cols=40 /></textarea>
						</td>
					</tr>
					<?php } ?>
					<tfoot>
						<td colspan=8 height=40>
							<a onclick="$('#form').submit();" class="button">Add Products</a>
						</td>
					</tfoot>
        </table>
      </form>
    </div>
  </div>
</div>
<?php echo $footer; ?>
