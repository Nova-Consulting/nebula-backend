
const { Users } = cds.entities('br.com.novaconsulting')

const PasswordEncryptor = require('./passwordEncryptor');
const jwtUtils = require('./jwtUtils');
const sendMail = require('./sendMail')
const { RECOVERY_PASSORD, FRONTEND } = require("./constants") 

Login = async (req) => {
    const { username, password } = req.data;

    const user = await SELECT.one.from(Users).where({ username });
    
    if (user == undefined) {
        return req.error(401, "USER_NOT_EXiSTS");
    }

    const isPasswordValid = PasswordEncryptor.comparePassword(password, user.password);
    if (!isPasswordValid) {
        return req.error(401, 'VALIDATION_USER_NOT_FOUND');
    }

    const token = jwtUtils.token(user.ID, user.username, user.email)

    return token;
}

RecoverPassword = async (req) => {
    const { email } = req.data;
    
    const user = await SELECT.one.from(Users).where({ email: email });
    console.log(email)
    if (user == undefined) return req.reject(404, 'E-mail não encontrado.');
    
    const token = await jwtUtils.tokenMail(email)
    
    const recoveryLink = `https://${FRONTEND}recover-password?token=${token}`;

    sendMail(email, RECOVERY_PASSORD, { recoveryLink })

    return 'e-mail enviado'
}

module.exports = { Login, RecoverPassword }