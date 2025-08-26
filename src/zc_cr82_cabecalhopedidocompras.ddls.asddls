@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cabeçalho do pedido de compras'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_CR82_CABECALHOPEDIDOCOMPRAS as projection on ZI_CR82_CabecalhoPedidoCompras
{
    key PoNumber,
    SupplierId,
    OrderDate,
    Status,
    @Semantics.amount.currencyCode: 'Currency'
    TotalAmount,
    Currency,
    CreatedBy,
    CreatedOn,
    ChangedBy,
    ChangedOn,
    /* Associations */
    _Itens: redirected to ZC_CR82_ITENSPEDIDOCOMPRAS,
    _Supplier: redirected to ZC_CR82_CADASTROFORNECEDOR
}
