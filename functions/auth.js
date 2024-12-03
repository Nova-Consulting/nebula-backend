const jwtUtils = require('./jwtUtils')
const responseHandler = require('./responseHandler')

auth = async (req, res, next) => {
    if (req.path.startsWith('/$metadata')) return next();
    if (req.path.startsWith('/Users')) return next();
    if (req.path.startsWith('/login')) return next();

    const token = req.headers['authorization'];
    
    if (!token || token == undefined) 
        return responseHandler.error(res, 'Unauthorized', 401)

    const decoded = await jwtUtils.decode(token.replace('Bearer ', ''));

    if (!decoded) 
        return responseHandler.error(res, 'Unauthorized', 401)
    
    req.user = decoded;
    next();
}

module.exports = [auth];