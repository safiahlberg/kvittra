<?php

include_once('backend/controller/controller.php');
include_once('backend/model/category.php');

class CategoryController extends Controller{
	
	public function __construct($p_Service=null){
		parent::__construct($p_Service);
		
		$method=$_SERVER['REQUEST_METHOD'];
		
		$resources=array('GET'=>'getCategories');
		
		call_user_func(array($this,$resources[$method]));
	}

	public function getCategories(){
		$model=new CategoryModel();
		$result=$model->getCategories();
		
		echo json_encode($result);
	}
	
}


?>