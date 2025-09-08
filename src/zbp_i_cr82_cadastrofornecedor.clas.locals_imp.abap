CLASS lhc_ZI_CR82_CadastroFornecedor DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZI_CR82_CadastroFornecedor RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR ZI_CR82_CadastroFornecedor RESULT result.
*// - A002 - Inicio - Validação de Cadastro de Fornecedor
    METHODS validateEmail FOR VALIDATE ON SAVE
      IMPORTING keys FOR ZI_CR82_CadastroFornecedor~validateEmail.
*// - A002 - Fim - Validação de Cadastro de Fornecedor
ENDCLASS.

CLASS lhc_ZI_CR82_CadastroFornecedor IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

*// - A002 - Inicio - Validação de Cadastro de Fornecedor
  METHOD validateEmail.

    READ ENTITIES OF ZI_CR82_CadastroFornecedor IN LOCAL MODE
      ENTITY ZI_CR82_CadastroFornecedor
      ALL FIELDS
      WITH CORRESPONDING #( keys )
      RESULT DATA(lt_fornecedores).

    LOOP AT lt_fornecedores INTO DATA(ls_fornecedor).
      IF ls_fornecedor-Email EQ 'abc@123.com'.
        " Email Válido
      ELSEIF ls_fornecedor-Email CS '@'.
        APPEND VALUE #(
          %tky = ls_fornecedor-%tky
          %msg = new_message_with_text(
              text = |Email { ls_fornecedor-email } não é o correto mas é ok|
              severity = if_abap_behv_message=>severity-warning
          )
        ) TO reported-zi_cr82_cadastrofornecedor.

      ELSE.
        APPEND VALUE #(
          %tky = ls_fornecedor-%tky
          %msg = new_message_with_text(
              text = |Email inválido: { ls_fornecedor-email }|
              severity = if_abap_behv_message=>severity-error
          )
        ) TO reported-zi_cr82_cadastrofornecedor.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.
*// - A002 - Fim - Validação de Cadastro de Fornecedor

ENDCLASS.
