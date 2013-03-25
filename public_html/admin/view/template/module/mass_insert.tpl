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
					<tr>
						<td>
							<input type="text" name="mass_insert_module[ProductName]" />
						</td>
						<td>
							<input type="text" name="mass_insert_module[Model]" size=10 />
						</td>
						<td>
							<input type="text" name="mass_insert_module[Quantity]" size=5 />
						</td>
						<td>
							<select name="mass_insert_module[StockStatus]">
								<option value=5>Out of Stock</option>
								<option value=6>2-3 Days</option>
								<option value=7 selected>In Stock</option>
								<option value=8>Pre-Order</option>
							</select>
						</td>
						<td>
							<input type="text" name="mass_insert_module[Price]" size=5 />
						</td>
						<td>
							<select name="mass_insert_module[TaxClass]">
								<option value=9 selected>Taxable Goods</option>
								<option value=10>Downloadable Products</option>
							</select>
						</td>
						<td>
							<input class="date hasDatepicker" type="date" size="12" value="2009-02-03" name="mass_insert_module[DateAvailable]">
						</td>
						<td>
							<textarea name="mass_insert_module[Description]" cols=40 /></textarea>
						</td>
					</tr>
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
