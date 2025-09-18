@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Itens do Pedido de compras'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_CR82_ITENSPEDIDOCOMPRAS
  as projection on ZI_CR82_ItensPedidoCompras
{
      @EndUserText.label: 'Número do Pedido de compras'

  key PoNumber,
      @EndUserText.label: 'Número do Item'
  key ItemNumber,
      @EndUserText.label: 'Código do Material'
      Material,
      @EndUserText.label: 'Descrição do Material'
      Description,
      @EndUserText.label: 'Quantidade'
      @Semantics.quantity.unitOfMeasure: 'Unit'
      Quantity,
      @EndUserText.label: 'Unidade de Medida'
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_UNITOFMEASURE', element: 'UnitOfMeasure' } }] // Permite pesquisa de país
      Unit,
      @EndUserText.label: 'Preço'
      @Semantics.amount.currencyCode: 'Currency'
      Price,
      @EndUserText.label: 'Moeda'
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CURRENCY', element: 'Currency' } }] // Permite pesquisa de país
      Currency,
      @EndUserText.label: 'Data de Entrega'
      DeliveryDate,
      @EndUserText.label: 'Data de Recebimento'
      ReceiptDate,
      @EndUserText.label: 'Status do Item'
      @Consumption.valueHelpDefinition: [
        {
          entity : { name : 'ZI_CR82_VH_STATUSITEMPEDCOMPRA', element : 'value_low' }
        }
      ]
      Status,
      /* Associations */
      _Cabecalho : redirected to parent ZC_CR82_CABECALHOPEDIDOCOMPRAS
}
