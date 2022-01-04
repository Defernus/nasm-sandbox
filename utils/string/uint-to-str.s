%ifndef UINT_TO_STR_S
%define UINT_TO_STR_S

%include 'utils/print.s'
%include 'utils/dec-length.s'

section .data
uint_to_str_end_str    db     0Ah, 0

; uint_to_str
; input:
;   rax: uint - number
;   rbx: char* result string
; convert dec number from rax to string at rdx

uint_to_str:
  push    rdx
  push    rcx
  push    rbx
  push    rax
  push    r8

  push    rbx
  call    dec_length
  mov     r8, rbx
  pop     rbx
  add     rbx, r8


uint_to_str_iteration:
  dec     rbx

  xor     rdx, rdx
  mov     rcx, 10
  div     rcx

  add     dl, 48
  mov     byte [rbx], dl
  
  cmp     rax, 0
  jne     uint_to_str_iteration

uint_to_str_end:
  pop     r8
  pop     rax
  pop     rbx
  pop     rcx
  pop     rdx
  ret

%endif
