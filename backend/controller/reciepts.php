<?php

include_once('backend/controller/controller.php');
include_once('backend/model/reciepts.php');

class RecieptController extends Controller{
	
	public function __construct($p_Service=null){
		parent::__construct($p_Service);
		
		$method=$_SERVER['REQUEST_METHOD'];
		
		$resources=array('GET'=>'getReciepts');
		
		call_user_func(array($this,$resources[$method]));
	}

	public function getReciepts(){
		$model=new RecieptsModel();
		$result=$model->getReciepts();
		
		echo json_encode($result);
	}
	
}


?>