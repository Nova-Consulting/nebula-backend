using { br.com.novaconsulting as db } from '../db/schema';

service Admin {
    @readonly
    action login(username: String, password: String) returns String;
    action recoverPassword(email: String) returns String;

    function GetAvailablePositions() returns array of db.PositionType;

    function GetAvailableEntities() returns array of db.EntityType;

    function GetAvailableRoles() returns array of db.RoleType;

    entity Users as projection on db.Users;

    entity Groups as projection on db.Groups;

    entity GroupRoles as projection on db.Groups.Roles;

    entity UsersGroups as projection on db.Users.Groups;

    entity Products as projection on db.Products;

    entity Tenants as projection on db.Tenants;

    entity UserTenant as projection on db.UserTenant;
}