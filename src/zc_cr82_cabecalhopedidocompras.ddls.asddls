@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cabeçalho do pedido de compras'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_CR82_CABECALHOPEDIDOCOMPRAS
  provider contract transactional_query
  as projection on ZI_CR82_CabecalhoPedidoCompras
{
      @EndUserText.label: 'Número do pedido'
  key PoNumber,
      @EndUserText.label: 'ID do fornecedor'
      @ObjectModel.foreignKey.association: '_Supplier'
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_CR82_CADASTROFORNECEDOR', element: 'SupplierId' } }] // Permite pesquisa de país
      SupplierId,
      @EndUserText.label: 'Data do pedido'
      OrderDate,
      @EndUserText.label: 'Status do pedido'
      @Consumption.valueHelpDefinition: [
        {
          entity : { name : 'ZI_CR82_VH_StatusPedidoCompra', element : 'value_low' }
        }
      ]
      Status,
      @Semantics.amount.currencyCode: 'Currency'
      @EndUserText.label: 'Valor total'
      TotalAmount,
      @Semantics.currencyCode: true
      @EndUserText.label: 'Moeda'
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CURRENCY', element: 'Currency' } }] // Permite pesquisa de país
      Currency,
      @EndUserText.label: 'Criado por'
      CreatedBy,
      @EndUserText.label: 'Data de criação'
      CreatedOn,
      @EndUserText.label: 'Alterado por'
      ChangedBy,
      @EndUserText.label: 'Data de alteração'
      ChangedOn,
      /* Associations */
      _Itens    : redirected to composition child ZC_CR82_ITENSPEDIDOCOMPRAS,
      _Supplier : redirected to ZC_CR82_CADASTROFORNECEDOR
}
