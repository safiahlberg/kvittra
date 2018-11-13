<?php 

include_once('backend/model/model.php');
include_once('backend/query.php');

class RecieptsModel extends Model{
	
	public function getReciepts(){
		PDOMysqlQuery::Prepared('SELECT display, created FROM k_reciept',array());
		return PDOMysqlQuery::FetchAll();
	}
	
}


?>