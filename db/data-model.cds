namespace novaconsulting;

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
    DELETE        = 'Delete';
}

type BusinessPartnerType : String enum {
    PF          = 'PF';
    PJ          = 'PJ';
}

type GeneroType : String enum {
    MASCULINO    = 'Masculino';
    FEMININO     = 'Feminino';
    NAOINFORMADO = 'Não Informar';
    NILL         = ''
}

type EstadoCivilType: String enum {
    SOLTEIRO     = 'Solteiro';
    CASADO       = 'Casado';
    DIVORCIADO   = 'Divorciado';
    NILL         = ''
}

type PartnerType : String enum {
    CLIENTE          = 'CLIENTE';
    FORNECEDOR       = 'FORNECEDOR';
    PROPRIEDADE      = 'PROPRIEDADE';
    COOPERADO        = 'COOPERADO';
}

type EstadosType : String enum {
    AC = 'Acre';
    AL = 'Alagoas';
    AP = 'Amapá';
    AM = 'Amazonas';
    BA = 'Bahia';
    CE = 'Ceará';
    DF = 'Distrito Federal';
    ES = 'Espírito Santo';
    GO = 'Goiás';
    MA = 'Maranhão';
    MT = 'Mato Grosso';
    MS = 'Mato Grosso do Sul';
    MG = 'Minas Gerais';
    PA = 'Pará';
    PB = 'Paraíba';
    PR = 'Paraná';
    PE = 'Pernambuco';
    PI = 'Piauí';
    RJ = 'Rio de Janeiro';
    RN = 'Rio Grande do Norte';
    RS = 'Rio Grande do Sul';
    RO = 'Rondônia';
    RR = 'Roraima';
    SC = 'Santa Catarina';
    SP = 'São Paulo';
    SE = 'Sergipe';
    TO = 'Tocantins';
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

entity Material: cuid, managed {
  codMaterial: String(20);
  subFamilia: String(20);
  descricao: String(20);
  fabricante: String(20);
  descricaoLong: String(60);
  pesoBruto: String(20);
  pesoLiquido: String(20);
  tipoMaterial: String(20);
  grupo: String(20);
  codMapa: String(20);
  subGrupo: String(20);
  codigoEan: String(20);
  categoriaEan: String(20);
  hierarquia: String(20);
  unidadeMedida: String(2);
  codLegado: String(20);
  setorAtividade: String(20);
  fisPaisOrigem: String(20);
  fisUnRemessa: String(20);
  fisNcm: String(20);
  fisQtdMinima: String(20);
  fisCfop: String(20);
  fisReceita: String(20);
  fisCentroLucro: String(20);
  fisOnu: String(20);
  fisOrigem: String(20);
  fisCompPa1: String(50);
  fisCompPa2: String(50);
  fisCompPa3: String(50);
  fisCompPa4: String(50);
  status: String(20);
}

entity BusinessPartners : cuid, managed {
  codigoNebula: String(15);
  tipoCadastro: BusinessPartnerType;
  tipoParceiro: PartnerType;
  avatar: String(200);
  statusNebula: String(10);

  //COMMON
  cpfCnpj: String(25);
  email: String(25);
  dataFundacao: Date;

  //Fornecedor - PJ 
  matriz: Boolean;

  // Cliente - PF  
  nomeCompleto: String(50);
  dataNascimento: Date default CURRENT_DATE;
  genero: GeneroType;
  nacionalidade: String(20);
  naturalidade: String(50);
  uf: String(2);
  estadoCivil: EstadoCivilType;
  profissao: String(20);
  nomeMae: String(20);
  nomePai: String(20);
  rgNumero: String(20);
  rgEmissor: String(20);
  rgEmissao: Date;

  //ENDEREÇO
  logradouro: String(100);
  numero: String(10);
  cep: String(10);
  bairro: String(50);
  municipio: String(50);
  estado: String(2);
  complemento: String(50);

  //FISCAL
  tipoContribIcms: String(30);
  inscricaoEstadual: String(30);
  inscricaoMunicipal: String(30);
  codMuncipioIbge: String(30);
  classificacaoFiscal: String(30);
  grupoContas: String(30);
  codSuframa: String(30);
  cnaePrincipal: String(30);
  naturezaJuridica: String(30);
  tipoSetorIndustrial: String(30);
  tipoDeclaracaoImposto: String(30);
  porteEmpresa: String(30);
  optanteSimples: Boolean;

}