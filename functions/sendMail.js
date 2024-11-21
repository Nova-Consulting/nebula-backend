const nodemailer = require("nodemailer");
const cds = require('@sap/cds')
const fs = require('fs');
const handlebars = require('handlebars');

const { promisify } = require('util');
const { UTF8, WELCOME_MAIL_TEMPLATE, FROM_MAIL_TEXT, SUBJECT_MAIL_WELCOME, LOG_MESSAGE_SEND, RECOVERY_MAIL_TEMPLATE } = require('./constants')

const readFileAsync = promisify(fs.readFile);

const templateMap = {
    'WELCOME': { subject: SUBJECT_MAIL_WELCOME, template: WELCOME_MAIL_TEMPLATE },
    'RECOVERY_PASSWORD': { subject: SUBJECT_MAIL_WELCOME, template: RECOVERY_MAIL_TEMPLATE }
}

const transporter = nodemailer.createTransport({
    host: cds.env.requires.email.hostname,
    port: cds.env.requires.email.port,
    secure: cds.env.requires.email.secure,
    auth: {
      user: cds.env.requires.email.user,
      pass: cds.env.requires.email.password,
    },
  });
  
async function sendMail (to, template, dd=null) {
    var data = templateMap[template]

    const htmlTemplate = await readFileAsync(data.template, UTF8);
   
    var temp = handlebars.compile(htmlTemplate);
    var htmlToSend = temp();
    
    const info = await transporter.sendMail({
        from: FROM_MAIL_TEXT, 
        to, 
        subject: data.subject,
        html: htmlToSend,
    });


}
  
module.exports = sendMail;