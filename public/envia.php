<?php
// Import PHPMailer classes into the global namespace
// These must be at the top of your script, not inside a function
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

// Load Composer's autoloader
require '../PHPMailer-master/src/Exception.php';
require '../PHPMailer-master/src/PHPMailer.php';
require '../PHPMailer-master/src/SMTP.php';
// Instantiation and passing `true` enables exceptions
$mail = new PHPMailer(true); //criei um novo objeto email do tipo PHPMailer e seus atributos abaixo. Deve-se adicionar o 'new'
$nome = $_POST['nome'];
$assunto = $_POST['assunto'];
$email = $_POST['email'];
$msg = $_POST['msg'];
try {
    //Server settings
    $mail->SMTPDebug = SMTP::DEBUG_SERVER;                      // Enable verbose debug output
    $mail->isSMTP();                                            // usamos o SMTP porque estamos  trabalhando com o gmail
    $mail->Host       = 'smtp.gmail.com';                    // Set the SMTP server to send through
    $mail->SMTPAuth   = true;                                   // Enable SMTP authentication
    $mail->Username   = 'testeemailkamile@gmail.com';              // SMTP username. Esse email vai enviar para algum lugar os emails
    $mail->Password   = 'kamile18';                               // SMTP password
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;         // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` also accepted
    $mail->Port       = 587;                                    // porta do gmail

    //Quem recebe o email
    $mail->setFrom($email, $nome);
    //$mail->addAddress('joe@example.net', 'Joe User');     // Add a recipient
    $mail->addAddress('testeemailkamile@gmail.com');               // Name is optional
    $mail->addReplyTo($email, $nome);
    //$mail->addCC('cc@example.com');
    //$mail->addBCC('bcc@example.com');

    // Attachments
    //$mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
    //$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name

    // Content
    $mail->isHTML(true);                                  // Set email format to HTML
    $mail->Subject = $assunto;
    $mail->Body    = $msg; //Diferença de body e altbody: body; opção com código html
    $mail->AltBody = $msg;

    $mail->send();
    echo 'Email foi enviado';
} catch (Exception $e) {
    echo "Email não enviado. Mailer Error: {$mail->ErrorInfo}";
}