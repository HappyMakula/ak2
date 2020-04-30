SYSEXIT		=1
SYSWRITE	=4
SYSREAD		=3
STDIN		=0
STDOUT          =1
EXITSUCCESS	=0

.data
	buf: .space 1000
	buf_len = .-buf
	.global _start
.text

_start:

	mov $SYSREAD, %eax
	mov $STDIN, %ebx
	mov $buf, %ecx
	mov $buf_len, %edx
	int $0x80

	mov %eax, %ebx #dlugosc napisu w ebx
	mov %eax, %edx
	mov $0, %ecx 
	#sub $1, %ebx #a

zamiana:
	sub $1, %ebx		
	movb buf(,%ebx, 1), %al
	movb buf(,%ecx, 1), %ah
	movb %al, buf(,%ecx, 1)
	movb %ah, buf(,%ebx, 1)
	add $1, %ecx
	cmp %ebx, %ecx
	jb zamiana
		
	mov $SYSWRITE, %eax
	mov $STDOUT, %ebx
	mov $buf, %ecx
	mov $buf_len, %edx
	int $0x80

	mov $SYSEXIT, %eax
	mov $EXITSUCCESS, %ebx ;
	int $0x80
