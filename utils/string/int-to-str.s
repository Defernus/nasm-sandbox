%ifndef INT_TO_STR_S
%define INT_TO_STR_S

%include 'utils/string/uint-to-str.s'
%include 'utils/print.s'
%include 'utils/dec-length.s'

; int_to_str
; input:
;   rax: int - number
;   rbx: char* result string
; convert dec number from rax to string at rdx

int_to_str:
  push    rbx
  push    rax

  cmp     rax, 0
  jge     int_to_str_uint

  neg     rax
  mov     byte [rbx], 45

  inc     rbx

int_to_str_uint:
  call uint_to_str

int_to_str_end:

  pop     rax
  pop     rbx
  ret

%endif
