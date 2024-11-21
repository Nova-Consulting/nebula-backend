const cds = require('@sap/cds');

const { Login, RecoverPassword } = require('../functions/authUtils')
const { GetAvailablePositions, GetAvailableEntities, GetAvailableRoles } = require("../functions/getFunctions")
const { BeforeCreateUser } = require("../functions/beforeFunctions")

module.exports = cds.service.impl(function () {
    this.on('login', Login)
 
    this.on('recoverPassword', RecoverPassword)

    this.on('GetAvailablePositions', GetAvailablePositions);

    this.on('GetAvailableEntities', GetAvailableEntities);

    this.on('GetAvailableRoles', GetAvailableRoles);

    this.before('CREATE', 'Users', BeforeCreateUser);
});