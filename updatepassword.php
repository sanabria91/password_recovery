<?php

include 'dbConnect.php';
include 'passwordController.php';

$db = Connect::dbConnect();	
$passwordCtrl = new PasswordDAO($db);


$uemail = $_GET['email'];
$token = $_GET['token'];

$accountId = $passwordCtrl->UserID($uemail); 
var_dump($accountId);

$verifytoken = $passwordCtrl->verifytoken($uemail, $token);

var_dump($verifytoken);

if(isset($_POST['submit']))
{
	$new_password = $_POST['new_password'];
	$retype_password = $_POST['retype_password'];
	
	if($new_password == $retype_password)
	{
		$update_password = $passwordCtrl->updatePassword($new_password,$accountId);
		var_dump($update_password);
		if($update_password === true)
		{
				$destoryToken = $passwordCtrl->updateToken();

				if($destoryToken == true){
					$msg = 'Your password has changed successfully. Please login with your new passowrd.';
					$msgclass = 'bg-success';
				}else{
					$msg = "Update was unsuccessful";
					$msgclass = "bg-danger";
					return false;
				}
		}
	}else
	{
		 $msg = "Password doesn't match";
		 $msgclass = 'bg-danger';
		 return false;
	}
	
}


?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Forgot Password Recovery Script using PHP and MySQLi</title>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
   
	<?php if($verifytoken == 'true') { ?>
    	<div class="col-lg-4 col-lg-offset-4">
        

        	<form class="form-horizontal" role="form" method="post">
			    <h2>Reset Your Password</h2>

				<?php if(isset($msg)) { ?>
                    <div class="<?php echo $msgclass; ?>" style="padding:5px;"><?php echo $msg; ?></div>
                <?php } ?>
    
                <div class="row">
                    <div class="col-lg-12">
                    <label class="control-label">New Password</label>
                    </div>
                </div>
    
                <div class="row">
                    <div class="col-lg-12">
                        <input class="form-control" name="new_password" type="password" placeholder="New Password" required>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                    <label class="control-label">Re-type New Password</label>
                    </div>
                </div>
    
                <div class="row">
                    <div class="col-lg-12">
                        <input class="form-control" name="retype_password" type="password" placeholder="Re-type New Password" required>
                    </div>
                </div>
    
                <div class="row">
                    <div class="col-lg-12">
                        <button class="btn btn-success btn-block" name="submit" style="margin-top:8px;">Submit</button>
                    </div>
                </div>
			</form>
		</div>
        
        <?php }else {?>
	    	<div class="col-lg-4 col-lg-offset-4">
   		       	<h2>Invalid or Broken Token</h2>
	            <p>Opps! The link you have come with is maybe broken or already used. Please make sure that you copied the link correctly or request another token from <a href="forgetPassword.php">here</a>.</p>
			</div>
        <?php }?>
           
        
            

	</div>
    
  
</div>    






















<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="js/jquery-1.11.3.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="js/bootstrap.js"></script>
</body>
</html>
