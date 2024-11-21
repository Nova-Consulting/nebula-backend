const bcrypt = require('bcryptjs');

const PasswordEncryptor = {
    async encryptPassword(password) {
        const salt = await bcrypt.genSalt(10);
        return await bcrypt.hash(password, salt);
    },

    async comparePassword(plainPassword, hashedPassword) {
        return await bcrypt.compare(plainPassword, hashedPassword);
    }
};
module.exports = PasswordEncryptor;