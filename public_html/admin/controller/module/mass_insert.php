<?php
class ControllerModuleMassInsert extends Controller {
	private $error = array();

	protected function get_bread_crumbs($human_name, $machine_name, $token)
	{
		$breadcrumbs = array();
		$breadcrumbs[] = array(	'text' => 'Home', 			'href' => $this->url->link('common/home', 'token=' . $token, 'SSL'), 							'separator' => false	);
		$breadcrumbs[] = array(	'text' => 'Modules', 		'href' => $this->url->link('extension/module', 'token=' . $token, 'SSL'),					'separator' => ' :: '	);
		$breadcrumbs[] = array(	'text' => $human_name,	'href' => $this->url->link('module/' . $machine_name, 'token=' . $token, 'SSL'),	'separator' => ' :: '	);
		return $breadcrumbs;
	}

	public function index() {
		$this->document->setTitle('Mass Insert');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		$this->data['breadcrumbs'] = $this->get_bread_crumbs('Mass Insert', 'mass_insert', $this->session->data['token']);
		$this->data['action'] = '';

		if (isset($this->request->post['mass_insert_module'])) {
			$this->load->model('catalog/product');
			foreach ($this->request->post['mass_insert_module'] as $product_data)
			{
				$default_vaules = array('sku' => '','upc' => '','ean' => '','jan' => '','isbn' => '','mpn' => '','location' => '','minimum' => '','subtract' => '',
					'manufacturer_id' => 0,'shipping' => 1,'points' => 0,'weight' => 0,'weight_class_id' => 0,'length' => 0,'width' => 0,'height' => 0,
					'length_class_id' => 0,'status' => 0,'sort_order' => 0, 'keyword' => null);
				$product_data = array_merge($default_vaules, $product_data);
				$product_data['product_description'][1] = array_merge(array('meta_keyword' => '', 'meta_description' => '', 'tag' => '', 'keyword' => ''), $product_data['product_description'][1]);
				$this->model_catalog_product->addProduct($product_data);
			}
		}

		$this->load->model('design/layout');
		$this->load->model('catalog/product');
		$this->load->model('localisation/tax_class');
		$this->load->model('localisation/stock_status');
		
		$this->data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();
		$this->data['stock_statuses'] = $this->model_localisation_stock_status->getStockStatuses();

		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/mass_insert.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/mass_insert')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>
