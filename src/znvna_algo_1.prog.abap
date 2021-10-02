*&---------------------------------------------------------------------*
*& Report znvna_algo_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT znvna_algo_1.

*---Reverse an integer

PARAMETERS p_input TYPE i. " 120

DATA reversed_number TYPE i.
DATA last_digit TYPE i.

WHILE p_input GT 0.
  last_digit = p_input MOD 10.

  TRY.
      reversed_number = ( reversed_number * 10 ) + last_digit.
    CATCH cx_root INTO DATA(exception).
      WRITE exception->get_text( ).
  ENDTRY.

  " Clean-up for next iteration
  p_input /= 10.
ENDWHILE.

WRITE reversed_number.
