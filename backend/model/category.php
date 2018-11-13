<?php 

include_once('backend/model/model.php');
include_once('backend/query.php');

class CategoryModel extends Model{
	
	public function getCategories(){
		PDOMysqlQuery::Prepared('SELECT name, uuid FROM k_category',array());
		return PDOMysqlQuery::FetchAll();
	}
	
}


?>