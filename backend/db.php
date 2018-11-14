<?php

class DB extends PDO
{	
	var $m_DB;
	var $m_Debug;


	$url = parse_url(getenv("CLEARDB_DATABASE_URL"));

	$server = $url["host"];
	$username = $url["user"];
	$password = $url["pass"];
	$db = substr($url["path"], 1);
	
	function __construct(array $p_DriverOptions=array(), $p_Host=$server, $p_Name=$db, $p_User=$username, $p_Password=$password)
	{
		try{
			//var_dump('mysql:host=' . db_host . ';dbname=' . db_name);
			parent::__construct('mysql:host=' . $p_Host . ';dbname=' . $p_Name, $p_User, $p_Password, $p_DriverOptions);			
		} catch(PDOExection $e){
			//Log::advLog(array('PDOMysql error: ' . $e->getMessage()));
			echo 'Error: ' . $e->getMessage() . '<br/>';
			die();
		}
		//$this->m_DB=mysql_connect(db_host, db_user, db_password);
	}
	
	function __destruct(){
		$this->m_DB=null;
	}
	
	function __get($p_Key)
	{
		if($p_Key==='db')
		{
			return $this->m_DB;
		}
	}
}

?>