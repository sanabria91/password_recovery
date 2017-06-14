<?php

include 'dbConnect.php';
include 'passwordController.php';

$db = Connect::dbConnect();	
$passwordCtrl = new PasswordDAO($db);

	if(isset($_POST['forgotPass'])){

		$email = $_POST['email'];	

		$data = $passwordCtrl->emailVerification($email);

	}
/*		if($data->num_rows > 0){
			$str = "0123456789qwertyuiopasdfghjkl";
			$str = str_shuffle($str);
			$str = substr($str, 0, 10);

			echo $str;
		}else{
			echo "Email returns no records";
		}*/
	

?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Password Recovery</title>
</head>
<body>
	<form action="forgetPassword.php" method="post">
		<input type="text" name="email" placeholder="Email"><br />
		<input type="submit" name="forgotPass" value="Request New Password" />
	</form>
</body>
</html>