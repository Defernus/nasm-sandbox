clear: out
	rm main.o

out: main.o
	ld -o out main.o

main.o:
	nasm -gdwarf -f elf64 -o main.o main.s
