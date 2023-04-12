;;! target = "riscv64"
;;!
;;! settings = ['enable_heap_access_spectre_mitigation=true']
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
;;! offset_guard_size = 0
;;! index_type = "i64"
;;! style = { kind = "dynamic", bound = "heap_bound" }

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i64 1)

  (func (export "do_store") (param i64 i32)
    local.get 0
    local.get 1
    i32.store8 offset=0)

  (func (export "do_load") (param i64) (result i32)
    local.get 0
    i32.load8_u offset=0))

;; function u0:0:
;; block0:
;;   ld t2,8(a2)
;;   uge a3,a0,t2##ty=i64
;;   ld t2,0(a2)
;;   add t2,t2,a0
;;   li a2,0
;;   andi a6,a3,255
;;   sltu t3,zero,a6
;;   sub t0,zero,t3
;;   and a0,a2,t0
;;   not a2,t0
;;   and a3,t2,a2
;;   or a5,a0,a3
;;   sb a1,0(a5)
;;   j label1
;; block1:
;;   ret
;;
;; function u0:1:
;; block0:
;;   ld t2,8(a1)
;;   uge a2,a0,t2##ty=i64
;;   ld t2,0(a1)
;;   add t2,t2,a0
;;   li a1,0
;;   andi a6,a2,255
;;   sltu t3,zero,a6
;;   sub t0,zero,t3
;;   and a0,a1,t0
;;   not a1,t0
;;   and a3,t2,a1
;;   or a5,a0,a3
;;   lbu a0,0(a5)
;;   j label1
;; block1:
;;   ret