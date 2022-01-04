%ifndef STRLEN_S
%define STRLEN_S

; strlen(str: rax)
; return length of string to rax
strlen:
  push    rbx
  mov     rbx, rax
strlen_compare_char:
  cmp     byte [rax], 0
  jz      strlen_finish
  inc     rax
  jmp     strlen_compare_char
strlen_finish:
  sub     rax, rbx
  pop     rbx
  ret

%endif
