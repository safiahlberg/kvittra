<?php 

include_once('backend/model/model.php');
include_once('backend/query.php');

class RecieptsModel extends Model{
	
	public function getReciepts(){
		PDOMysqlQuery::Prepared('SELECT display, created FROM k_reciept',array());
		return PDOMysqlQuery::FetchAll();
	}
	
	public function addReciept($p_Data){
		PDOMysqlQuery::Prepared('INSERT INTO k_reciept (display,created) VALUES (?,?)',array($p_Data['display'],$p_Data['created']));
	}
	
	public function removeRecieptById($p_ID){
		PDOMysqlQuery::Prepared('DELETE FROM k_reciept WHERE id=?',array($p_ID));
	}
	
}


?>