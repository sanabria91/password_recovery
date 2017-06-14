<?php

class PasswordDAO
{
	private $_db;

	public function __construct ($dbConnection)
	{
		$this->_db = $dbConnection;
	}

	public function emailVerification($email){
		$query = "SELECT id FROM usertable WHERE email = :email";
		$pdostmt = $this->_db->prepare($query);
		$pdostmt->bindValue(':email', $email);
		$pdostmt->execute();
		
		$matchedUser = $pdostmt->fetch();
		return $matchedUser;
	}
}

