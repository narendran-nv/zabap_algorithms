*&---------------------------------------------------------------------*
*& Report znvna_algo_3
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT znvna_algo_3.

DATA number_list TYPE HASHED TABLE OF i WITH UNIQUE KEY table_line.
DATA complements_list TYPE HASHED TABLE OF i WITH UNIQUE KEY table_line.
DATA target_sum TYPE i.


number_list = VALUE #( ( 5 ) ( 3 ) ( 7 ) ( 10 ) ( 1 ) ( -2 ) ).
target_sum = 8.

LOOP AT number_list ASSIGNING FIELD-SYMBOL(<number>).
  DATA(desired_number) = target_sum - <number>.

  READ TABLE complements_list ASSIGNING FIELD-SYMBOL(<alt_number>) WITH KEY table_line = desired_number.
  IF sy-subrc = 0.
    WRITE |{ <number> } & { <alt_number> }|.
    NEW-LINE.
  ELSE.
    INSERT <number> INTO TABLE complements_list.
  ENDIF.
ENDLOOP.
