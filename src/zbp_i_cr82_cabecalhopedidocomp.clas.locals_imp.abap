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
