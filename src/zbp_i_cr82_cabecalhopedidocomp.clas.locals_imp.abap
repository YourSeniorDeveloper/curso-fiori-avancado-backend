CLASS lhc_zi_cr82_itenspedidocompras DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

*// - A002 - Inicio - Preenchendo dados via Determination

    METHODS PreencheStatusItem FOR DETERMINE ON SAVE
      IMPORTING keys FOR ZI_CR82_ItensPedidoCompras~PreencheStatusItem.
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZI_CR82_ItensPedidoCompras RESULT result.

*// - A002 - Fim - Preenchendo dados via Determination

*// - A003 - Inicio - Criando Action com Parâmetros

    METHODS ReceberItem FOR MODIFY
      IMPORTING keys FOR ACTION ZI_CR82_ItensPedidoCompras~ReceberItem RESULT result.

    METHODS AnularRecebimento FOR MODIFY
      IMPORTING keys FOR ACTION ZI_CR82_ItensPedidoCompras~AnularRecebimento RESULT result.

*// - A003 - Fim - Criando Action com Parâmetros

ENDCLASS.

CLASS lhc_zi_cr82_itenspedidocompras IMPLEMENTATION.

*// - A002 - Inicio - Preenchendo dados via Determination

  METHOD PreencheStatusItem.

    READ ENTITIES OF ZI_CR82_CabecalhoPedidoCompras IN LOCAL MODE
      ENTITY ZI_CR82_ItensPedidoCompras
      ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(lt_itens).

    LOOP AT lt_itens ASSIGNING FIELD-SYMBOL(<fs_itens>).
      <fs_itens>-status = 'Pendente'.
    ENDLOOP.

    MODIFY ENTITIES OF ZI_CR82_CabecalhoPedidoCompras IN LOCAL MODE
      ENTITY ZI_CR82_ItensPedidoCompras
        UPDATE FIELDS ( status )
        WITH VALUE #( FOR ls_item IN lt_itens  (
                           %tky      = ls_item-%tky
                           status    = ls_item-status ) ).

  ENDMETHOD.

*// - A002 - Fim - Preenchendo dados via Determination

  METHOD get_instance_authorizations.
  ENDMETHOD.

*// - A003 - Inicio - Criando Action com Parâmetros

  METHOD ReceberItem.

    DATA(ls_param) = keys[ 1 ]-%param.

    READ ENTITIES OF ZI_CR82_CabecalhoPedidoCompras IN LOCAL MODE
      ENTITY ZI_CR82_ItensPedidoCompras
      ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(lt_itens).

    LOOP AT lt_itens ASSIGNING FIELD-SYMBOL(<fs_itens>).
      <fs_itens>-status = 'Fornecido'.
      <fs_itens>-ReceiptDate = ls_param-ReceiptDate.
    ENDLOOP.

    MODIFY ENTITIES OF ZI_CR82_CabecalhoPedidoCompras IN LOCAL MODE
      ENTITY ZI_CR82_ItensPedidoCompras
        UPDATE FIELDS ( status  ReceiptDate )
        WITH VALUE #( FOR ls_item IN lt_itens  (
                           %tky         = ls_item-%tky
                           status       = ls_item-status
                           ReceiptDate  = ls_item-ReceiptDate ) ).



    result = VALUE #( FOR ls_item IN lt_itens ( %tky = ls_item-%tky %param = ls_item ) ).

  ENDMETHOD.

  METHOD AnularRecebimento.
  ENDMETHOD.

*// - A003 - Fim - Criando Action com Parâmetros


ENDCLASS.

CLASS lhc_ZI_CR82_CabecalhoPedidoCom DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZI_CR82_CabecalhoPedidoCompras RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR ZI_CR82_CabecalhoPedidoCompras RESULT result.

*// - A002 - Inicio - Preenchendo dados via Determination

    METHODS PreencheStatus FOR DETERMINE ON SAVE
      IMPORTING keys FOR ZI_CR82_CabecalhoPedidoCompras~PreencheStatus.

*// - A002 - Fim - Preenchendo dados via Determination

ENDCLASS.

CLASS lhc_ZI_CR82_CabecalhoPedidoCom IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

*// - A002 - Inicio - Preenchendo dados via Determination

  METHOD PreencheStatus.

    READ ENTITIES OF ZI_CR82_CabecalhoPedidoCompras IN LOCAL MODE
      ENTITY ZI_CR82_CabecalhoPedidoCompras
      ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(lt_cabecalhos).

    LOOP AT lt_cabecalhos ASSIGNING FIELD-SYMBOL(<fs_cabecalho>).
      <fs_cabecalho>-status = 'Novo'.
    ENDLOOP.

    MODIFY ENTITIES OF ZI_CR82_CabecalhoPedidoCompras IN LOCAL MODE
      ENTITY ZI_CR82_CabecalhoPedidoCompras
        UPDATE FIELDS ( status )
        WITH VALUE #( FOR cabecalho IN lt_cabecalhos  (
                           %tky      = cabecalho-%tky
                           status    = cabecalho-status ) ).


*    READ ENTITIES OF zi_fe_travel_001811 IN LOCAL MODE
*      ENTITY travel
*        FIELDS ( bookingfee )
*           WITH CORRESPONDING #( keys )
*         RESULT DATA(lt_travels).
*
*    LOOP AT lt_travels ASSIGNING FIELD-SYMBOL(<fs_travel>).
*      <fs_travel>-totalprice = <fs_travel>-bookingfee.
*
*      READ ENTITIES OF zi_fe_travel_001811 IN LOCAL MODE
*          ENTITY travel
*          BY \_booking
*          FIELDS ( flightprice )
*           WITH VALUE #( ( %tky = <fs_travel>-%tky ) )
*           RESULT DATA(lt_bookings).
*
*      LOOP AT lt_bookings ASSIGNING FIELD-SYMBOL(<fs_booking>).
*        <fs_travel>-totalprice = <fs_travel>-totalprice + <fs_booking>-flightprice.
*      ENDLOOP.
*
*    ENDLOOP.
*
*    MODIFY ENTITIES OF zi_fe_travel_001811 IN LOCAL MODE
*      ENTITY travel
*        UPDATE FIELDS ( totalprice )
*        WITH VALUE #( FOR travel IN lt_travels  (
*                           %tky      = travel-%tky
*                           totalprice  = travel-totalprice ) ).





  ENDMETHOD.

*// - A002 - Fim - Preenchendo dados via Determination

ENDCLASS.
