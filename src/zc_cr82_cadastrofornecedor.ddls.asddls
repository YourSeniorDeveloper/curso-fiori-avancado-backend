@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cadastro de Fornecedores'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_CR82_CADASTROFORNECEDOR as projection on ZI_CR82_CadastroFornecedor
{
    key SupplierId,
    Name,
    Address,
    City,
    PostalCode,
    Country,
    Phone,
    Email
}
