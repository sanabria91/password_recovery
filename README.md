# password_recovery

Basic Password Recovery using PHP and PHPMailer. Created for the Humber Portfolio Student Website

1. User enters email. 
   i. Validates if its an email
   ii. Checks email against database records
2. Sends user an email with a link to reset password
  i. Creates and stores a token in user table
  ii. link uses the following format: www.yourwebsite.ca/resetpassword.php?UserID={userID}&token={token}
3. User inputs new password and confirms the new password
  i. Validates both inputs are the same
  ii. Once saved, user get a success message
  
   
