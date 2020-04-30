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
_start:

	mov $SYSREAD, %eax
	mov $STDIN, %ebx
	mov $buf, %ecx
	mov $buf_len, %edx
	int $0x80	

	mov $SYSWRITE, %eax
	mov $STDOUT, %ebx
	mov $buf, %ecx
	mov $buf_len, %edx
	int $0x80

	mov $SYSEXIT, %eax
	mov $EXITSUCCESS, %ebx ;
	int $0x80
