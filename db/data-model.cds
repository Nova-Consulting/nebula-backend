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
  @title: 'Código do Material'
  codMaterial: String(20);
  
  @title: 'Subfamília'
  subFamilia: String(20);
  
  @title: 'Descrição'
  descricao: String(20);
  
  @title: 'Fabricante'
  fabricante: String(20);
  
  @title: 'Descrição Longa'
  descricaoLong: String(60);
  
  @title: 'Peso Bruto'
  pesoBruto: String(20);
  
  @title: 'Peso Líquido'
  pesoLiquido: String(20);
  
  @title: 'Tipo de Material'
  tipoMaterial: String(20);
  
  @title: 'Grupo'
  grupo: String(20);
  
  @title: 'Código do Mapa'
  codMapa: String(20);
  
  @title: 'Subgrupo'
  subGrupo: String(20);
  
  @title: 'Código EAN'
  codigoEan: String(20);
  
  @title: 'Categoria EAN'
  categoriaEan: String(20);
  
  @title: 'Hierarquia'
  hierarquia: String(20);
  
  @title: 'Unidade de Medida'
  unidadeMedida: String(2);
  
  @title: 'Código Legado'
  codLegado: String(20);
  
  @title: 'Setor de Atividade'
  setorAtividade: String(20);
  
  @title: 'País de Origem'
  fisPaisOrigem: String(20);
  
  @title: 'Unidade de Remessa'
  fisUnRemessa: String(20);
  
  @title: 'NCM'
  fisNcm: String(20);
  
  @title: 'Quantidade Mínima'
  fisQtdMinima: String(20);
  
  @title: 'CFOP'
  fisCfop: String(20);
  
  @title: 'Receita'
  fisReceita: String(20);
  
  @title: 'Centro de Lucro'
  fisCentroLucro: String(20);
  
  @title: 'ONU'
  fisOnu: String(20);
  
  @title: 'Origem'
  fisOrigem: String(20);
  
  @title: 'Componente Parte 1'
  fisCompPa1: String(50);
  
  @title: 'Componente Parte 2'
  fisCompPa2: String(50);
  
  @title: 'Componente Parte 3'
  fisCompPa3: String(50);
  
  @title: 'Componente Parte 4'
  fisCompPa4: String(50);
  
  @title: 'Status'
  status: String(20);
}
entity BusinessPartners : cuid, managed {
  @title: 'Código Nébula'
  codigoNebula: String(15);
  
  @title: 'Tipo de Cadastro'
  tipoCadastro: BusinessPartnerType;
  
  @title: 'Tipo de Parceiro'
  tipoParceiro: PartnerType;
  
  @title: 'Avatar'
  avatar: String(200);
  
  @title: 'Status Nébula'
  statusNebula: String(10);

  // COMUM
  @title: 'CPF/CNPJ'
  cpfCnpj: String(25);
  
  @title: 'E-mail'
  email: String(25);
  
  @title: 'Data de Fundação'
  dataFundacao: Date;

  // FORNECEDOR - PJ
  @title: 'É Matriz?'
  matriz: Boolean;

  // CLIENTE - PF
  @title: 'Nome Completo'
  nomeCompleto: String(50);
  
  @title: 'Data de Nascimento'
  dataNascimento: Date default CURRENT_DATE;
  
  @title: 'Gênero'
  genero: GeneroType;
  
  @title: 'Nacionalidade'
  nacionalidade: String(20);
  
  @title: 'Naturalidade'
  naturalidade: String(50);
  
  @title: 'UF'
  uf: String(2);
  
  @title: 'Estado Civil'
  estadoCivil: EstadoCivilType;
  
  @title: 'Profissão'
  profissao: String(20);
  
  @title: 'Nome da Mãe'
  nomeMae: String(20);
  
  @title: 'Nome do Pai'
  nomePai: String(20);
  
  @title: 'Número do RG'
  rgNumero: String(20);
  
  @title: 'Emissor do RG'
  rgEmissor: String(20);
  
  @title: 'Data de Emissão do RG'
  rgEmissao: Date;

  // ENDEREÇO
  @title: 'Logradouro'
  logradouro: String(100);
  
  @title: 'Número'
  numero: String(10);
  
  @title: 'CEP'
  cep: String(10);
  
  @title: 'Bairro'
  bairro: String(50);
  
  @title: 'Município'
  municipio: String(50);
  
  @title: 'Estado'
  estado: String(2);
  
  @title: 'Complemento'
  complemento: String(50);

  // FISCAL
  @title: 'Tipo de Contribuinte ICMS'
  tipoContribIcms: String(30);
  
  @title: 'Inscrição Estadual'
  inscricaoEstadual: String(30);
  
  @title: 'Inscrição Municipal'
  inscricaoMunicipal: String(30);
  
  @title: 'Código do Município IBGE'
  codMuncipioIbge: String(30);
  
  @title: 'Classificação Fiscal'
  classificacaoFiscal: String(30);
  
  @title: 'Grupo de Contas'
  grupoContas: String(30);
  
  @title: 'Código SUFRAMA'
  codSuframa: String(30);
  
  @title: 'CNAE Principal'
  cnaePrincipal: String(30);
  
  @title: 'Natureza Jurídica'
  naturezaJuridica: String(30);
  
  @title: 'Tipo de Setor Industrial'
  tipoSetorIndustrial: String(30);
  
  @title: 'Tipo de Declaração de Imposto'
  tipoDeclaracaoImposto: String(30);
  
  @title: 'Porte da Empresa'
  porteEmpresa: String(30);
  
  @title: 'Optante pelo Simples Nacional?'
  optanteSimples: Boolean;
}



entity SolicitacaoMaterial: cuid, managed {
  codMaterial: String(20) @title : 'Código Material';
  subFamilia: String(20) @title : 'Sub Familia';
  descricao: String(20) @mandatory;
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

entity SolicitacaoBp : cuid, managed { 
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