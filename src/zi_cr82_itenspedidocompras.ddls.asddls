@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Itens do Pedido de compras'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CR82_ItensPedidoCompras
  as select from zcr82_t_poi
  association to parent ZI_CR82_CabecalhoPedidoCompras as _Cabecalho on $projection.PoNumber = _Cabecalho.PoNumber
{
  key po_number     as PoNumber,
  key item_number   as ItemNumber,
      material      as Material,
      description   as Description,
      @Semantics.quantity.unitOfMeasure: 'Unit'
      quantity      as Quantity,
      unit          as Unit,
      @Semantics.amount.currencyCode: 'Currency'
      price         as Price,
      currency      as Currency,
      delivery_date as DeliveryDate,
      receipt_date  as ReceiptDate,
      status        as Status,
      _Cabecalho // Make association public
}
