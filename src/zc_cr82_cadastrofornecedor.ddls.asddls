@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cadastro de Fornecedores'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_CR82_CADASTROFORNECEDOR
  as projection on ZI_CR82_CadastroFornecedor
{
      @EndUserText.label: 'Código do Fornecedor' // Nome amigável para o campo
  key SupplierId,
      @EndUserText.label: 'Nome do Fornecedor'
      Name,
      @EndUserText.label: 'Endereço'
      Address,
      @EndUserText.label: 'Cidade'
      City,
      @EndUserText.label: 'Código Postal'
      PostalCode,
      @EndUserText.label: 'País'
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CountryVH', element: 'Country' } }] // Permite pesquisa de país
      Country,
      @EndUserText.label: 'Telefone'
      Phone,
      @EndUserText.label: 'Email'
      Email
}
