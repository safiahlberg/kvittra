<?php

include_once('backend/query.php');

define('MAINTENENCE_MODE',false);
define('BASE_URI','kvitter');

class Router{
	public function __construct(){
		$uri=$_SERVER['REQUEST_URI'];
		$len=strpos($uri,'?');
		if($len===false){
			$len=strlen($uri);
		}
		//$start=strrpos($uri,'/')+1;
		if(substr($uri,-1)=='/'){
			$len=$len-1;
		}
		$request=substr($uri,1,$len-1); 
		
		$this->ParseRequest($request);
	}
	
	private function ParseRequest($p_Request){
		if($p_Request===false){
			$p_Request='itemgen';
		}
		
		$requests=$this->fetchRouting();
		
		if(isset($requests[$p_Request])){
			$this->routeTo($requests[$p_Request]);
		}else{
			$found=false;
			foreach($requests as $r){
				if(isset($r['signature'])){
					if(preg_match($r['signature'],$p_Request)===1){
						$this->routeTo($r);
						$found=true;
						break;
					}
				}
			}
			if(!$found){
				$this->NotFound();
			}
		}
	}
	private function routeTo($p_Req){
		$req=$p_Req;
		$privilege=$this->UserPrivilege();
		if($privilege>=$req['privilege']){
			if(file_exists($req['href'])){
				include_once($req['href']);
				if(isset($req['auto'])){ //for classes that handles request in the contructor
					$n=new $req['auto']($req['service']);
				}
			}else{
				$this->NotFound();
			}
		}else{	
			$loginpage='pages/login.inc';
			if(file_exists($loginpage)){
				include_once($loginpage);
			}
		}
	}
	
	private function Forbidden(){
		include_once('pages/forbidden.inc');
		exit();
	}
	private function NotFound(){
		include_once('pages/404.php');
		exit();
	}
	private function UserPrivilege(){
		return 2;
	}
	private function Forgot(){
		global $user;
		$mail=filter_input(INPUT_POST,'email',FILTER_SANITIZE_STRING);
		$user->Forgot($mail);
	}
	private function fetchRouting(){
		PDOMysqlQuery::Prepared('SELECT * FROM k_router',array());
		$result=PDOMysqlQuery::FetchAll();
		$ret=array();
		foreach($result as $item){
			$ret[$item['request']]=$item;
		}
		return $ret;
	}
}


?>