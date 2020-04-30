.data
	pot1:	.float 1.0
	.lcomm 	stan, 2	#2 bajty jak rejestr stanu 
	.global fung, funf, setP
.text

fung:
	pushl %ebp		
	movl %esp, %ebp
	fld 8(%ebp) #x
	fld 8(%ebp) #x	
	fmul %ST(0), %ST(1) #st1 x^2
	fmul %ST(0), %ST(0) #st0 x^2
	fadd pot1 #st0 x^2+1
	fsqrt #	       sqr(x^2+1)
	fadd pot1 #st0 sqr(x^2+1)+1
	fxch %ST(1)
	fdiv %ST(1),%ST(0) # x^2/sqr(x^2+1)+1
	movl %ebp, %esp
	pop %ebp	
	ret

funf:
	pushl %ebp		
	movl %esp, %ebp
	fld 8(%ebp) #x
	fmul %ST(0), %ST(0) #x^2	
	fadd pot1 #x^2+1
	fsqrt #sqr(x^2+1)
	fsub pot1 #sqr(x^2+1)-1
	movl %ebp, %esp
	pop %ebp	
	ret

setP:
	fstcw 	stan	
	movw	stan, %ax
	and $0xfcff, %ax	

	movl	%eax, stan
	fldcw 	stan
	ret
