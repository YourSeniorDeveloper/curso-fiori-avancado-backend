@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help para status de pedido'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_CR82_VH_STATUSITEMPEDCOMPRA as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name: 'ZD_CR82_STATUSITEMPEDIDO' )
{
    @UI.hidden: true
    key domain_name,
    @UI.hidden: true
    key value_position,
    @UI.hidden: true
    key language,
    value_low,
    text
}
