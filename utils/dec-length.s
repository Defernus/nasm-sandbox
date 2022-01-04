%ifndef DEC_LENGTH_S
%define DEC_LENGTH_S

; calc length of decimal int from rax to rbx
dec_length:
  push    rax
  push    rdx
  xor     rbx, rbx

dec_lengt_iteration:
  inc     rbx
  xor     rdx, rdx
  mov     rcx, 10
  div     rcx
  
  cmp     rax, 0
  jne      dec_lengt_iteration


dec_length_end:
  pop     rdx
  pop     rax
  ret

%endif
