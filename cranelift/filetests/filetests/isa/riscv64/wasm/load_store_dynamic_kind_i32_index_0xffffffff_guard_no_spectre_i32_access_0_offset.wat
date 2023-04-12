;;! target = "riscv64"
;;!
;;! settings = ['enable_heap_access_spectre_mitigation=false']
;;!
;;! compile = true
;;!
;;! [globals.vmctx]
;;! type = "i64"
;;! vmctx = true
;;!
;;! [globals.heap_base]
;;! type = "i64"
;;! load = { base = "vmctx", offset = 0, readonly = true }
;;!
;;! [globals.heap_bound]
;;! type = "i64"
;;! load = { base = "vmctx", offset = 8, readonly = true }
;;!
;;! [[heaps]]
;;! base = "heap_base"
;;! min_size = 0x10000
;;! offset_guard_size = 0xffffffff
;;! index_type = "i32"
;;! style = { kind = "dynamic", bound = "heap_bound" }

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i32 1)

  (func (export "do_store") (param i32 i32)
    local.get 0
    local.get 1
    i32.store offset=0)

  (func (export "do_load") (param i32) (result i32)
    local.get 0
    i32.load offset=0))

;; function u0:0:
;; block0:
;;   slli a5,a0,32
;;   srli a7,a5,32
;;   ld a6,8(a2)
;;   ugt a6,a7,a6##ty=i64
;;   bne a6,zero,taken(label3),not_taken(label1)
;; block1:
;;   ld t3,0(a2)
;;   add a7,t3,a7
;;   sw a1,0(a7)
;;   j label2
;; block2:
;;   ret
;; block3:
;;   udf##trap_code=heap_oob
;;
;; function u0:1:
;; block0:
;;   slli a5,a0,32
;;   srli a7,a5,32
;;   ld a6,8(a1)
;;   ugt a6,a7,a6##ty=i64
;;   bne a6,zero,taken(label3),not_taken(label1)
;; block1:
;;   ld t3,0(a1)
;;   add a7,t3,a7
;;   lw a0,0(a7)
;;   j label2
;; block2:
;;   ret
;; block3:
;;   udf##trap_code=heap_oob