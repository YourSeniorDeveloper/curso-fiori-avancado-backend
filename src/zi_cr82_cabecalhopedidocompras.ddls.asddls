@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cabeçalho do pedido de compras'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_CR82_CabecalhoPedidoCompras as select from zcr82_t_poh
composition [0..*] of ZI_CR82_ItensPedidoCompras as _Itens
association [0..1] to ZI_CR82_CadastroFornecedor as _Supplier on $projection.SupplierId = _Supplier.SupplierId
{
    key po_number as PoNumber,
    supplier_id as SupplierId,
    order_date as OrderDate,
    status as Status,
    @Semantics.amount.currencyCode: 'Currency'
    total_amount as TotalAmount,
    currency as Currency,
    created_by as CreatedBy,
    created_on as CreatedOn,
    changed_by as ChangedBy,
    changed_on as ChangedOn,
    _Supplier, // Make association public
    _Itens // Make association public
}
