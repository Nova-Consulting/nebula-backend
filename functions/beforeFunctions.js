
const cds = require('@sap/cds');
const { Users } = cds.entities('br.com.novaconsulting')

const PasswordEncryptor = require('./passwordEncryptor');
const sendMail = require("./sendMail")

const { WELCOME_TEXT } = require("./constants")
 
BeforeCreateUser = async (req) => {
    const { email, username } = req.data;

    // const emailExists = await  SELECT.one.from(Users).where({email})
    // if (emailExists) return req.error(409, 'EMAIL_ALREADY_EXISTS', [email]);

    // const usernameExists = await SELECT.one.from(Users).where({ username });
    // if (usernameExists) return req.error(409, 'USERNAME_ALREADY_EXISTS', [username]);
    
    // const { password } = req.data;
    // if (password) req.data.password = await PasswordEncryptor.encryptPassword(password);

    // sendMail(email, WELCOME_TEXT)
}

module.exports = { BeforeCreateUser }