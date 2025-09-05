@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cadastro de Fornecedores'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define root view entity ZI_CR82_CadastroFornecedor as select from zcr82_t_forn
{
    key supplier_id as SupplierId,
    name as Name,
    street as Street,
    addr_number as AddressNumber,
    city as City,
    state as State,
    postal_code as PostalCode,
    country as Country,
    phone as Phone,
    email as Email
}
