<?php

class DB extends PDO
{	
	var $m_DB;
	var $m_Debug;

	function __construct()
	{

		$url = parse_url(getenv("CLEARDB_DATABASE_URL"));

		$server = $url["host"];
		$username = $url["user"];
		$password = $url["pass"];
		$db = substr($url["path"], 1);

		// $this->m_DB=mysql_connect($server, db_user, db_password);
		$this->m_DB=new mysqli($server, $username, $password, $db);
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