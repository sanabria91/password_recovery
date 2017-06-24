<?php

include 'dbConnect.php';
include 'passwordController.php';

$db = Connect::dbConnect();	
$passwordCtrl = new PasswordDAO($db);

	if(isset($_POST['submit'])){
		$uemail = $_POST['uemail'];

		if($passwordCtrl->checkUser($uemail)=="true"){
			$accountId = $passwordCtrl->UserID($uemail);
			$token = $passwordCtrl->generateRandomString();

			$query = $passwordCtrl->tokenInsert($accountId,$token);

			if($query){
				$mailReset = $passwordCtrl->mailReset($uemail, $token);
				if($mailReset == 'true'){
					$msg = 'A mail with recovery instruction has sent to your email';
					$msgclass = 'bg-success';
				}else{
					$msg = 'Problem sending email';
					$msgclass = 'bg-danger';
				} 
			}else{
				$msg = 'Failed to generate token';
				$msgclass = 'bg-danger';
			}
		}else{
			$msg = "This email doesn't exist in our database.";
			$msgclass = 'bg-danger';
		} 
	}


?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Password Recovery</title>
	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">

    	<div class="col-lg-4 col-lg-offset-4">
        

        	<form class="form-horizontal" role="form" method="post">
			    <h2>Forgot Password</h2>

				<?php if(isset($msg)) {?>
                    <div class="<?php echo $msgclass; ?>" style="padding:5px;"><?php echo $msg; ?></div>
                <?php } ?>

                <p>
                    Forgot your password? No problem, we will fix it. Just type your email below and we will send you password recovery instruction to your email. Follow easy steps to get back to your account.
                </p>
    
                <div class="row">
                    <div class="col-lg-12">
                    <label class="control-label">Your Email</label>
                    </div>
                </div>
    
                <div class="row">
                    <div class="col-lg-12">
                        <input class="form-control" name="uemail" type="email" placeholder="Enter your email here..." required>
                    </div>
                </div>
    
                <div class="row">
                    <div class="col-lg-12">
                        <button class="btn btn-success btn-block" name="submit" style="margin-top:8px;">Submit</button>
                    </div>
                </div>
			</form>
		</div>
           

	</div>
    

    </div>
</div>  
</body>
</html>