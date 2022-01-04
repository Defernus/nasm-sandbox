%ifndef MEMORY_ALLOCATE_S
%define MEMORY_ALLOCATE_S

%include 'utils/print.s'
%include 'utils/exit.s'

MEM_HEADER_SIZE     equ 8
 
section .data
allocate_error_msg     db     "Failed to allocate", 0Ah, 0

; allocate rax readers and store pointer to rbx
allocate:
  push    rax
  push    rcx
  push    rdx

  mov     rdx, rax

  xor     rbx, rbx
  mov     rax, 45
  int     80h

  cmp     rax, 0
  jl      allocate_error

  mov	    rcx, rax

  lea     rbx, [rax + rdx * MEM_HEADER_SIZE]
  mov     rax, 45
  int     80h

  mov     rbx, rcx

  pop     rdx
  pop     rcx
  pop     rax
  ret

allocate_error:
  mov     rax, allocate_error_msg
  call    print

  mov     rax, 1
  call    exit


%endif
