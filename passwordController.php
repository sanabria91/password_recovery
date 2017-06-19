<?php

class PasswordDAO
{
	private $_db;

	public function __construct ($dbConnection)
	{
		$this->_db = $dbConnection;
	}

	public function checkUser($email){
		$query = "SELECT id FROM students WHERE ContactEmail = :email";
		$pdostmt = $this->_db->prepare($query);
		$pdostmt->bindValue(':email', $email);
		$pdostmt->execute();
		$num_of_rows = $pdostmt->fetchColumn();
		if($num_of_rows > 0){
			return 'true';
		}else{
			return 'false';
		}
	}

	public function UserID($email){
		$query = "SELECT id FROM students WHERE Contactemail = :email";
		$pdostmt = $this->_db->prepare($query);
		$pdostmt->bindValue(':email',$email);
		$pdostmt->execute();

		$row = $pdostmt->fetch();
		return $row['id'];
	}

	public function tokenInsert($userId,$token){
		$query = "INSERT INTO recovery_keys(userID, token) VALUES(:userId, :token)";
		$pdostmt = $this->_db->prepare($query);
		$pdostmt->bindValue(':userId',$userId);
		$pdostmt->bindValue(':token', $token);
		$pdostmt->execute();

		return true;

	}

	public function generateRandomString(){
		$length = 20;
		$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
 		$charactersLength = strlen($characters);
        $randomString = '';
        
		for ($i = 0; $i < $length; $i++){
 			$randomString .= $characters[rand(0, $charactersLength - 1)];
		}	
    	return md5($randomString);		
	}

	public function send_mail($to, $token){

		require 'PHPMailer/PHPMailerAutoload.php';
		$mail = new PHPMailer;

		$mail->isSMTP();
		$mail->SMTPDebug = 2;
		$mail->Debugoutput = 'html';
		$mail->Host = 'smtp.gmail.com';
        $mail->SMTPAuth = true;
 		$mail->SMTPSecure = 'ssl';
 		$mail->Port = 465;	

		$mail->smtpConnect(
		array(
			"ssl" => array(
				"verify_peer" => false,
				"verify_peer_name" => false,
				"allow_self_signed" => true
				)
			)
		);

		$mail->Username = "humberportfolio@gmail.com";
		$mail->Password = "humber123";

		$mail->From = 'humberportfolio@gmail.com';
		$mail->FromName = 'Humber Portfolsio';
		$mail->addAddress($to);	

		$mail->isHTML(true);

		$mail->Subject = 'Demo: Password Recovery Instruction';
		$link = 'localhost/passwordrecovery/forget.php?email='.$to.'&token='.$token;
		$mail->Body = "<b>Hello</b><br><br>You have requested for your password recovery. <a href='$link' target='_blank'>Click here</a> to reset your password. If you are unable to click the link then copy the below link and paste in your browser to reset your password.<br><i>". $link."</i>";
 
 		$mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

		if(!$mail->send()) {
            return 'fail';
		} else {
 			return 'success';
		}

	}

	public function verifytoken($userID, $token){
		$query = "SELECT valid FROM recovery_keys WHERE userID = :userID AND token = :token";
		$pdostmt = $this->_db->prepare($query);
		$pdostmt->bindValue(':userID',$userID);
		$pdostmt->bindValue(':token',$token);
		$pdostmt->execute();
		$row = $pdostmt->fetch();

		if($row['valid'] == 1){
		 	return 1;
		 }else{
		 	return 0;
		 }

	}

	// public function updatePassword()
			
}

