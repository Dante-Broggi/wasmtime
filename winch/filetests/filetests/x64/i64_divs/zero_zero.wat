;;! target = "x86_64"

(module
    (func (result i64)
	(i64.const 0)
	(i64.const 0)
	(i64.div_s)
    )
)
;;    0:	 55                   	push	rbp
;;    1:	 4889e5               	mov	rbp, rsp
;;    4:	 48c7c100000000       	mov	rcx, 0
;;    b:	 48c7c000000000       	mov	rax, 0
;;   12:	 4883f900             	cmp	rcx, 0
;;   16:	 0f8407000000         	je	0x23
;;   1c:	 4899                 	cqo	
;;   1e:	 48f7f9               	idiv	rcx
;;   21:	 5d                   	pop	rbp
;;   22:	 c3                   	ret	
;;   23:	 0f0b                 	ud2	