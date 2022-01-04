%include        'utils/exit.s'
%include        'utils/print.s'
%include        'utils/memory/allocate.s'
%include        'utils/string/strlen.s'
%include        'utils/string/int-to-str.s'

section .data
finished_str      db    "Finish", 0Ah, 0
str_end           db    0Ah, 0

section .text
global  _start
 
_start:
   mov      rax, 1024
   call     allocate

   mov      rax, 1265
   call     int_to_str

   mov      rax, -1265
   call     int_to_str

   mov      rax, rbx
   call     print

   mov      rax, str_end
   call     print

   xor      rax, rax
   call     exit
