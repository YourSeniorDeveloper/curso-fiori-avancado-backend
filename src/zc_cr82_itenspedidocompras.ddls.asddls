@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Itens do Pedido de compras'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_CR82_ITENSPEDIDOCOMPRAS as projection on ZI_CR82_ItensPedidoCompras
{
    key PoNumber,
    key ItemNumber,
    Material,
    Description,
    @Semantics.quantity.unitOfMeasure: 'Unit'
    Quantity,
    Unit,
    @Semantics.amount.currencyCode: 'Currency'
    Price,
    Currency,
    DeliveryDate,
    Status,
    /* Associations */
    _Cabecalho: redirected to parent ZC_CR82_CABECALHOPEDIDOCOMPRAS
}
