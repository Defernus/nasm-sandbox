%ifndef PRINT_S
%define PRINT_S

%include        'utils/string/strlen.s'

; print(str: rax)
print:
  ; keep registers on the stack so as not to lose it
  push    rbx
  push    rcx
  push    rdx
  push    rax

  mov     rcx, rax

  call    strlen

  mov      rdx, rax
  mov      rbx, 1
  mov      rax, 4
  int      80h

  ; return registers from the stack
  pop      rax
  pop      rdx
  pop      rcx
  pop      rbx

  ret

%endif
