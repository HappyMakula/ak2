SYSEXIT		=1
SYSWRITE	=4
SYSREAD		=3
STDIN		=0
STDOUT          =1
EXITSUCCESS	=0

.data
	s1: .space 16, 0xFF
	s1_len = .-s1
	s2: .space 16
	s2_len = .-s2
	.global _start
.text

_start:
	mov $s1_len, %eax
	mov $s2_len, %ebx
	subl $4, %ebx
	movl $1, s2(%ebx) #jeden do s2
	addl $4, %ebx

	subl $12, %eax
	movl $0xfffffffE, s1(%eax) #jeden do s2
	addl $12, %eax

	movl $1, %ecx


	
dodawaj:
	subl $4, %eax
	subl $4, %ebx
	movl s1(%eax), %edx
	cmp $1,%ecx
	adcl s2(%ebx), %edx
	movl %edx, s1(%eax)
	jae bez_przeniesienia
	movl $0, %ecx
	jmp porownaj
bez_przeniesienia:
	movl $1, %ecx
porownaj:
	cmp $0, %eax
	ja dodawaj
	

	movl $SYSWRITE, %eax
	movl $STDOUT, %ebx
	movl $s1, %ecx
	movl $s1_len, %edx
	int $0x80
	
	movl $SYSWRITE, %eax
	movl $STDOUT, %ebx
	movl $s2, %ecx
	movl $s2_len, %edx
	int $0x80

	mov $SYSEXIT, %eax
	mov $EXITSUCCESS, %ebx ;
	int $0x80
