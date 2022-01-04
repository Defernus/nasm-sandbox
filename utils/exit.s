%ifndef EXIT_S
%define EXIT_S

; exit(rbx: code)
exit:
  mov     rbx, rax
  mov     rax, 1
  int     80h

%endif
