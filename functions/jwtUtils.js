const jwt = require('jsonwebtoken');

const jwtUtils = {
    async token(id, username, email) {
        return await jwt.sign( { id, username, email }, 'segredo', { expiresIn: '60D' } );
    },

    async decode(token) {
        let decoded = false;

        try {
            decoded = await jwt.verify(token.replace('Bearer ', ''), 'segredo')
          } catch (err) {
            decoded = false
          }

        return decoded
    },

    async tokenMail(email) { 
      const token = await jwt.sign({ email }, 'segredo', { expiresIn: '24h' });
      return token
    }
};
module.exports = jwtUtils;