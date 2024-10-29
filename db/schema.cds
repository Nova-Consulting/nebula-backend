namespace br.com.novaconsulting;
using { cuid, managed } from '@sap/cds/common';

type PositionType : String enum {
    ADMIN               = 'Admin';
    CONSULTANT          = 'Consultant';
    HEAD                = 'Head';
    MANAGER             = 'Manager';
    LEADER              = 'Leader';
    ANALYST             = 'Analyst';
    SUPPORT             = 'Support';
    TRAINEE             = 'Trainee';
}

type EntityType : String enum {
    USERS          = 'Users';
    GROUPS         = 'Groups';
    GROUPROLES     = 'Group Roles';
    PRODUCTS       = 'Products';
    TENTANTS       = 'Tenants';
    USERGROUPS     = 'User Groups';
    USERTENANTS    = 'User Tenants';
}

type RoleType : String enum {
    READ          = 'Read';
    WRITE         = 'Write';
    DELETE        = 'Delete'
}

entity Users: cuid, managed {
    name        : String(100) @mandatory;
    username    : String(20) @mandatory;
    password    : String;
    email       : String(50) @mandatory;
    avatar      : Binary;
    position    : PositionType @mandatory;
    leadership  : Association to One Users;
    userGroups  : Association to Many Users.Groups on userGroups.user = $self;
};

entity Groups: cuid, managed {
    name        : String(100);
    description : String(100);
    groupsUsers  : Composition of Many Groups.Roles;
};

entity Groups.Roles: cuid, managed {
    group           : Association to Groups;
    entity          : EntityType;
    role            : RoleType;
}

entity Users.Groups: cuid, managed {   
    key group : Association to One Groups @mandatory;
    key user  : Association to One Users @mandatory; 
}

entity Products: cuid, managed {
    name        : String(100) @mandatory;
};

entity Tenants: cuid, managed {
    name        : String(100) @mandatory;
};

entity UserTenant: cuid, managed {
    name        : String(100) @mandatory;
    username    : String(20) @mandatory;
    password    : String;
    email       : String(50) @mandatory;
    avatar      : Binary;
    tenant      : Association to Tenants @mandatory;
};