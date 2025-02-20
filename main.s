	.file	"main.c"
# GNU C17 (GCC) version 14.2.1 20250207 (x86_64-pc-linux-gnu)
#	compiled by GNU C version 14.2.1 20250207, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.27-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -Os
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"i need a file\n"
.LC1:
	.string	"r"
.LC2:
	.string	"Error opening file\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%r13	#
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12	#
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp	#
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx	#
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$12312, %rsp	#,
	.cfi_def_cfa_offset 12352
# main.c:9: {
	movq	%fs:40, %rax	# MEM[(<address-space-1> long unsigned int *)40B], tmp123
	movq	%rax, 12296(%rsp)	# tmp123, D.3820
	xorl	%eax, %eax	# tmp123
# main.c:10:     if (argc != 2)
	cmpl	$2, %edi	#, tmp140
	je	.L2	#,
# main.c:12:         perror("i need a file\n");
	leaq	.LC0(%rip), %rdi	#, tmp124
	jmp	.L33	#
.L2:
# main.c:16:     FILE *bffile = fopen(argv[1], "r");
	movq	8(%rsi), %rdi	# MEM[(char * *)argv_24(D) + 8B], MEM[(char * *)argv_24(D) + 8B]
	leaq	.LC1(%rip), %rsi	#, tmp126
	call	fopen@PLT	#
	movq	%rax, %rbp	# tmp142, bffile
# main.c:17:     if (bffile == NULL)
	testq	%rax, %rax	# bffile
	jne	.L4	#,
# main.c:19:         perror("Error opening file\n");
	leaq	.LC2(%rip), %rdi	#, tmp128
.L33:
	call	perror@PLT	#
# main.c:13:         return 1;
	movl	$1, %eax	#, <retval>
	jmp	.L1	#
.L4:
# main.c:23:     int array[ARRAY_SIZE] = {0};
	xorl	%eax, %eax	# tmp130
	leaq	4104(%rsp), %rdi	#, tmp129
# main.c:26:     size_t index_stack = 0;
	xorl	%r12d, %r12d	# index_stack
# main.c:24:     size_t index = 0;
	xorl	%ebx, %ebx	# index
# main.c:23:     int array[ARRAY_SIZE] = {0};
	movl	$2048, %ecx	#, tmp131
	rep stosl
# main.c:25:     int stack[STACK_SIZE] = {0};
	leaq	8(%rsp), %rdi	#, tmp132
	movl	$1024, %ecx	#, tmp134
	rep stosl
.L6:
# main.c:29:     while ((ch = getc(bffile)) != EOF)
	movq	%rbp, %rdi	# bffile,
	call	getc@PLT	#
	cmpl	$46, %eax	#, ch
	jne	.L35	#,
# main.c:51:             putchar(array[index]);
	movl	4104(%rsp,%rbx,4), %edi	# array[index_16], array[index_16]
	call	putchar@PLT	#
	jmp	.L6	#
.L35:
	jg	.L15	#,
	cmpl	$44, %eax	#, ch
	jne	.L36	#,
# main.c:55:             array[index] = getchar();
	call	getchar@PLT	#
# main.c:55:             array[index] = getchar();
	movl	%eax, 4104(%rsp,%rbx,4)	# tmp143, array[index_16]
	jmp	.L6	#
.L36:
	cmpl	$45, %eax	#, ch
	jne	.L37	#,
# main.c:47:             array[index]--;
	decl	4104(%rsp,%rbx,4)	# array[index_16]
	jmp	.L6	#
.L37:
	cmpl	$-1, %eax	#, ch
	je	.L18	#,
	cmpl	$43, %eax	#, ch
	jne	.L6	#,
# main.c:43:             array[index]++;
	incl	4104(%rsp,%rbx,4)	# array[index_16]
	jmp	.L6	#
.L15:
	cmpl	$91, %eax	#, ch
	jne	.L38	#,
# main.c:59:             if (array[index] == 0)
	cmpl	$0, 4104(%rsp,%rbx,4)	#, array[index_16]
	jne	.L10	#,
# main.c:61:                 int depth = 1;
	movl	$1, %r13d	#, depth
.L13:
# main.c:64:                     ch = getc(bffile);
	movq	%rbp, %rdi	# bffile,
	call	getc@PLT	#
# main.c:65:                     if (ch == '[')
	cmpl	$91, %eax	#, ch
	jne	.L11	#,
# main.c:66:                         depth++;
	incl	%r13d	# depth
	jmp	.L13	#
.L11:
# main.c:67:                     else if (ch == ']')
	cmpl	$93, %eax	#, ch
	jne	.L13	#,
# main.c:62:                 while (depth > 0)
	decl	%r13d	# depth
	je	.L6	#,
	jmp	.L13	#
.L10:
# main.c:73:                 stack[index_stack++] = ftell(bffile);
	movq	%rbp, %rdi	# bffile,
	call	ftell@PLT	#
# main.c:73:                 stack[index_stack++] = ftell(bffile);
	movl	%eax, 8(%rsp,%r12,4)	# tmp145, stack[index_stack_17]
# main.c:73:                 stack[index_stack++] = ftell(bffile);
	incq	%r12	# index_stack
	jmp	.L6	#
.L38:
	jg	.L21	#,
	cmpl	$60, %eax	#, ch
	jne	.L39	#,
# main.c:39:                 index--;
	cmpq	$1, %rbx	#, index
	adcq	$-1, %rbx	#, index
	jmp	.L6	#
.L39:
	cmpl	$62, %eax	#, ch
	jne	.L6	#,
# main.c:34:                 index++;
	cmpq	$2047, %rbx	#, index
	adcq	$0, %rbx	#, index
	jmp	.L6	#
.L21:
	cmpl	$93, %eax	#, ch
	jne	.L6	#,
# main.c:78:             if (array[index] != 0)
	cmpl	$0, 4104(%rsp,%rbx,4)	#, array[index_16]
# main.c:80:                 fseek(bffile, stack[index_stack - 1], SEEK_SET);
	leaq	-1(%r12), %rax	#, _40
# main.c:78:             if (array[index] != 0)
	je	.L26	#,
# main.c:80:                 fseek(bffile, stack[index_stack - 1], SEEK_SET);
	movslq	8(%rsp,%rax,4), %rsi	# stack[_40], _15
	xorl	%edx, %edx	#
	movq	%rbp, %rdi	# bffile,
	call	fseek@PLT	#
	jmp	.L6	#
.L26:
# main.c:84:                 index_stack--;
	movq	%rax, %r12	# _40, index_stack
	jmp	.L6	#
.L18:
# main.c:92:     fclose(bffile);
	movq	%rbp, %rdi	# bffile,
	call	fclose@PLT	#
# main.c:93:     return 0;
	xorl	%eax, %eax	# <retval>
.L1:
# main.c:94: }
	movq	12296(%rsp), %rdx	# D.3820, tmp147
	subq	%fs:40, %rdx	# MEM[(<address-space-1> long unsigned int *)40B], tmp147
	je	.L25	#,
	call	__stack_chk_fail@PLT	#
.L25:
	addq	$12312, %rsp	#,
	.cfi_def_cfa_offset 40
	popq	%rbx	#
	.cfi_def_cfa_offset 32
	popq	%rbp	#
	.cfi_def_cfa_offset 24
	popq	%r12	#
	.cfi_def_cfa_offset 16
	popq	%r13	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (GNU) 14.2.1 20250207"
	.section	.note.GNU-stack,"",@progbits
