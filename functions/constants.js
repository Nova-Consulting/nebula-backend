const UTF8 = 'utf-8';

const FRONTEND = 'http://localhost/'

const FROM_MAIL_TEXT = '"Nova Consulting 🌏" <ti@novaconsulting.com.br>'
const WELCOME_MAIL_TEMPLATE = './templates/welcome_mail.html';
const RECOVERY_MAIL_TEMPLATE = './templates/recovery_mail.html';

const WELCOME_TEXT = 'WELCOME' ;
const RECOVERY_PASSORD = "RECOVERY_PASSWORD"

const SUBJECT_MAIL_WELCOME = "Acesso ao App Liberado ✅"
const SUBJECT_MAIL_RECOVERY = "Solicitação de recuperação de senha"

const LOG_MESSAGE_SEND = "Mensagem enviada: %s"

module.exports = { 
    FRONTEND,
    WELCOME_MAIL_TEMPLATE,
    WELCOME_TEXT, 
    UTF8,
    FROM_MAIL_TEXT,
    SUBJECT_MAIL_WELCOME, 
    LOG_MESSAGE_SEND,
    RECOVERY_MAIL_TEMPLATE,
    RECOVERY_PASSORD,
    SUBJECT_MAIL_RECOVERY
}