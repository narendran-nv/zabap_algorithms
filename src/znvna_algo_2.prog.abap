*&---------------------------------------------------------------------*
*& Report znvna_algo_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT znvna_algo_2.

DATA words_list TYPE TABLE OF string.
DATA character_list TYPE HASHED TABLE OF char1 WITH UNIQUE KEY table_line.

words_list = VALUE #( ( `apple` )
                      ( `google` ) ).

character_list = VALUE #( ( 'a' ) ( 'l' ) ( 'g' ) ( 'o' ) ( 'e' ) ).

LOOP AT words_list ASSIGNING FIELD-SYMBOL(<word>).
  DATA(length_of_word) = strlen( <word> ).
  DATA(cursor) = 0.

  WHILE cursor LT length_of_word.
    DATA(character) = <word>+cursor(1).

    READ TABLE character_list TRANSPORTING NO FIELDS WITH KEY table_line = character.
    IF sy-subrc <> 0.
      WRITE |{ <word> } cannot be framed using the characters in the list|.
      NEW-LINE.
      EXIT.
    ENDIF.

    IF cursor EQ ( length_of_word - 1 ).
      WRITE |{ <word> } can be framed using the characters in the list|.
      NEW-LINE.
    ENDIF.

    cursor += 1.
  ENDWHILE.
ENDLOOP.
