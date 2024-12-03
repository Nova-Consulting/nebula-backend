using { novaconsulting as db } from '../db/data-model';

service Nebula { 
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

    entity BusinessPartners as projection on db.BusinessPartners;

    entity Material as projection on db.Material;

    entity SolicitacaoBp as projection on db.SolicitacaoBp;

    entity SolicitacaoMaterial as projection on db.SolicitacaoMaterial;
    
}