	# standard Decaf preamble 
	  .text
	  .align 2
	  .globl main
  _offset_Random_0:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp0 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp0
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Random
	  .data
	  .align 2
	  Random:		# label for class Random vtable
	  .word _offset_Random_0
	  .word f_Random.Init
	  .word f_Random.GenRandom
	  .word f_Random.RndInt
	  .text
  f_Random.Init:
	# BeginFunc 20
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 20	# decrement sp to make space for locals/temps
	# _tmp1 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp2 = this + _tmp1
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp3 = *(_tmp2)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp4 = 4
	  li $t4, 4		# load constant value 4 into $t4
	# _tmp5 = this + _tmp4
	  add $t5, $t1, $t4	
	# *(_tmp5) = seedVal
	  lw $t6, 8($fp)	# load seedVal from $fp+8 into $t6
	  sw $t6, 0($t5) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_Random.GenRandom:
	# BeginFunc 76
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 76	# decrement sp to make space for locals/temps
	# _tmp6 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp7 = this + _tmp6
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp8 = *(_tmp7)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp9 = 15625
	  li $t4, 15625		# load constant value 15625 into $t4
	# _tmp10 = 4
	  li $t5, 4		# load constant value 4 into $t5
	# _tmp11 = this + _tmp10
	  add $t6, $t1, $t5	
	# _tmp12 = *(_tmp11)
	  lw $t7, 0($t6) 	# load with offset
	# _tmp13 = 10000
	  li $s0, 10000		# load constant value 10000 into $s0
	# _tmp14 = _tmp12 % _tmp13
	  rem $s1, $t7, $s0	
	# _tmp15 = _tmp9 * _tmp14
	  mul $s2, $t4, $s1	
	# _tmp16 = 22221
	  li $s3, 22221		# load constant value 22221 into $s3
	# _tmp17 = _tmp15 + _tmp16
	  add $s4, $s2, $s3	
	# _tmp18 = 65536
	  li $s5, 65536		# load constant value 65536 into $s5
	# _tmp19 = _tmp17 % _tmp18
	  rem $s6, $s4, $s5	
	# _tmp20 = 4
	  li $s7, 4		# load constant value 4 into $s7
	# _tmp21 = this + _tmp20
	  add $t8, $t1, $s7	
	# *(_tmp21) = _tmp19
	  sw $s6, 0($t8) 	# store with offset
	# _tmp22 = 4
	  li $t9, 4		# load constant value 4 into $t9
	# _tmp23 = this + _tmp22
	  sw $t0, -8($fp)	# spill _tmp6 from $t0 to $fp-8
	  add $t0, $t1, $t9	
	# _tmp24 = *(_tmp23)
	  lw $t1, 0($t0) 	# load with offset
	# Return _tmp24
	  move $v0, $t1		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_Random.RndInt:
	# BeginFunc 28
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 28	# decrement sp to make space for locals/temps
	# _tmp25 = *(this)
	  lw $t0, 4($fp)	# load this from $fp+4 into $t0
	  lw $t1, 0($t0) 	# load with offset
	# _tmp26 = *(_tmp25)
	  lw $t2, 0($t1) 	# load with offset
	# _tmp27 = ACall _tmp26
	# (save modified registers before flow of control change)
	  sw $t1, -8($fp)	# spill _tmp25 from $t1 to $fp-8
	  sw $t2, -12($fp)	# spill _tmp26 from $t2 to $fp-12
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp28 = this - _tmp27
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  sub $t2, $t1, $t0	
	# _tmp29 = *(_tmp25 + 8)
	  lw $t3, -8($fp)	# load _tmp25 from $fp-8 into $t3
	  lw $t4, 8($t3) 	# load with offset
	# PushParam _tmp28
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp30 = ACall _tmp29
	# (save modified registers before flow of control change)
	  sw $t0, -16($fp)	# spill _tmp27 from $t0 to $fp-16
	  sw $t2, -20($fp)	# spill _tmp28 from $t2 to $fp-20
	  sw $t4, -24($fp)	# spill _tmp29 from $t4 to $fp-24
	  jalr $t4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp31 = _tmp30 % max
	  lw $t1, 8($fp)	# load max from $fp+8 into $t1
	  rem $t2, $t0, $t1	
	# Return _tmp31
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _offset_Deck_0:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp32 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp32
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Deck
	  .data
	  .align 2
	  Deck:		# label for class Deck vtable
	  .word _offset_Deck_0
	  .word f_Deck.Init
	  .word f_Deck.Shuffle
	  .word f_Deck.GetCard
	  .text
  f_Deck.Init:
	# BeginFunc 52
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 52	# decrement sp to make space for locals/temps
	# _tmp33 = 8
	  li $t0, 8		# load constant value 8 into $t0
	# _tmp34 = this + _tmp33
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp35 = *(_tmp34)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp36 = 52
	  li $t4, 52		# load constant value 52 into $t4
	# _tmp37 = 0
	  li $t5, 0		# load constant value 0 into $t5
	# _tmp38 = 4
	  li $t6, 4		# load constant value 4 into $t6
	# _tmp39 = _tmp37 < _tmp36
	  slt $t7, $t5, $t4	
	# IfZ _tmp39 Goto _L0
	# (save modified registers before flow of control change)
	  sw $t0, -8($fp)	# spill _tmp33 from $t0 to $fp-8
	  sw $t2, -12($fp)	# spill _tmp34 from $t2 to $fp-12
	  sw $t3, -16($fp)	# spill _tmp35 from $t3 to $fp-16
	  sw $t4, -20($fp)	# spill _tmp36 from $t4 to $fp-20
	  sw $t5, -24($fp)	# spill _tmp37 from $t5 to $fp-24
	  sw $t6, -28($fp)	# spill _tmp38 from $t6 to $fp-28
	  sw $t7, -32($fp)	# spill _tmp39 from $t7 to $fp-32
	  beqz $t7, _L0	# branch if _tmp39 is zero 
	# Goto _L1
	  b _L1		# unconditional branch
  _L0:
	# _tmp40 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string1: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t0, _string1	# load label
	# PushParam _tmp40
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -36($fp)	# spill _tmp40 from $t0 to $fp-36
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L1:
	# _tmp41 = _tmp36 * _tmp38
	  lw $t0, -20($fp)	# load _tmp36 from $fp-20 into $t0
	  lw $t1, -28($fp)	# load _tmp38 from $fp-28 into $t1
	  mul $t2, $t0, $t1	
	# _tmp42 = _tmp41 + _tmp38
	  add $t3, $t2, $t1	
	# PushParam _tmp42
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp43 = LCall _Alloc
	# (save modified registers before flow of control change)
	  sw $t2, -40($fp)	# spill _tmp41 from $t2 to $fp-40
	  sw $t3, -44($fp)	# spill _tmp42 from $t3 to $fp-44
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp43) = _tmp36
	  lw $t1, -20($fp)	# load _tmp36 from $fp-20 into $t1
	  sw $t1, 0($t0) 	# store with offset
	# _tmp44 = 8
	  li $t2, 8		# load constant value 8 into $t2
	# _tmp45 = this + _tmp44
	  lw $t3, 4($fp)	# load this from $fp+4 into $t3
	  add $t4, $t3, $t2	
	# *(_tmp45) = _tmp43
	  sw $t0, 0($t4) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_Deck.Shuffle:
	# BeginFunc 776
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 776	# decrement sp to make space for locals/temps
	# _tmp46 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp47 = this + _tmp46
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp48 = *(_tmp47)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp49 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp50 = 4
	  li $t5, 4		# load constant value 4 into $t5
	# _tmp51 = this + _tmp50
	  add $t6, $t1, $t5	
	# *(_tmp51) = _tmp49
	  sw $t4, 0($t6) 	# store with offset
	# (save modified registers before flow of control change)
	  sw $t0, -8($fp)	# spill _tmp46 from $t0 to $fp-8
	  sw $t2, -12($fp)	# spill _tmp47 from $t2 to $fp-12
	  sw $t3, -16($fp)	# spill _tmp48 from $t3 to $fp-16
	  sw $t4, -20($fp)	# spill _tmp49 from $t4 to $fp-20
	  sw $t5, -24($fp)	# spill _tmp50 from $t5 to $fp-24
	  sw $t6, -28($fp)	# spill _tmp51 from $t6 to $fp-28
  _L2:
	# _tmp52 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp53 = this + _tmp52
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp54 = *(_tmp53)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp55 = 52
	  li $t4, 52		# load constant value 52 into $t4
	# _tmp56 = _tmp54 < _tmp55
	  slt $t5, $t3, $t4	
	# IfZ _tmp56 Goto _L3
	# (save modified registers before flow of control change)
	  sw $t0, -32($fp)	# spill _tmp52 from $t0 to $fp-32
	  sw $t2, -36($fp)	# spill _tmp53 from $t2 to $fp-36
	  sw $t3, -40($fp)	# spill _tmp54 from $t3 to $fp-40
	  sw $t4, -44($fp)	# spill _tmp55 from $t4 to $fp-44
	  sw $t5, -48($fp)	# spill _tmp56 from $t5 to $fp-48
	  beqz $t5, _L3	# branch if _tmp56 is zero 
	# _tmp57 = 8
	  li $t0, 8		# load constant value 8 into $t0
	# _tmp58 = this + _tmp57
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp59 = *(_tmp58)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp60 = 4
	  li $t4, 4		# load constant value 4 into $t4
	# _tmp61 = this + _tmp60
	  add $t5, $t1, $t4	
	# _tmp62 = *(_tmp61)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp63 = 0
	  li $t7, 0		# load constant value 0 into $t7
	# _tmp64 = 4
	  li $s0, 4		# load constant value 4 into $s0
	# _tmp65 = *(_tmp59)
	  lw $s1, 0($t3) 	# load with offset
	# _tmp66 = _tmp65 == _tmp62
	  seq $s2, $s1, $t6	
	# _tmp67 = _tmp65 < _tmp62
	  slt $s3, $s1, $t6	
	# _tmp68 = _tmp67 || _tmp66
	  or $s4, $s3, $s2	
	# _tmp69 = _tmp62 < _tmp63
	  slt $s5, $t6, $t7	
	# _tmp70 = _tmp69 || _tmp68
	  or $s6, $s5, $s4	
	# IfZ _tmp70 Goto _L4
	# (save modified registers before flow of control change)
	  sw $t0, -52($fp)	# spill _tmp57 from $t0 to $fp-52
	  sw $t2, -56($fp)	# spill _tmp58 from $t2 to $fp-56
	  sw $t3, -60($fp)	# spill _tmp59 from $t3 to $fp-60
	  sw $t4, -64($fp)	# spill _tmp60 from $t4 to $fp-64
	  sw $t5, -68($fp)	# spill _tmp61 from $t5 to $fp-68
	  sw $t6, -72($fp)	# spill _tmp62 from $t6 to $fp-72
	  sw $t7, -76($fp)	# spill _tmp63 from $t7 to $fp-76
	  sw $s0, -80($fp)	# spill _tmp64 from $s0 to $fp-80
	  sw $s1, -84($fp)	# spill _tmp65 from $s1 to $fp-84
	  sw $s2, -88($fp)	# spill _tmp66 from $s2 to $fp-88
	  sw $s3, -92($fp)	# spill _tmp67 from $s3 to $fp-92
	  sw $s4, -96($fp)	# spill _tmp68 from $s4 to $fp-96
	  sw $s5, -100($fp)	# spill _tmp69 from $s5 to $fp-100
	  sw $s6, -104($fp)	# spill _tmp70 from $s6 to $fp-104
	  beqz $s6, _L4	# branch if _tmp70 is zero 
	# _tmp71 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string2: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string2	# load label
	# PushParam _tmp71
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -108($fp)	# spill _tmp71 from $t0 to $fp-108
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L4:
	# _tmp72 = _tmp62 * _tmp64
	  lw $t0, -72($fp)	# load _tmp62 from $fp-72 into $t0
	  lw $t1, -80($fp)	# load _tmp64 from $fp-80 into $t1
	  mul $t2, $t0, $t1	
	# _tmp73 = _tmp72 + _tmp64
	  add $t3, $t2, $t1	
	# _tmp74 = _tmp59 + _tmp73
	  lw $t4, -60($fp)	# load _tmp59 from $fp-60 into $t4
	  add $t5, $t4, $t3	
	# _tmp75 = *(_tmp74)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp76 = 4
	  li $t7, 4		# load constant value 4 into $t7
	# _tmp77 = this + _tmp76
	  lw $s0, 4($fp)	# load this from $fp+4 into $s0
	  add $s1, $s0, $t7	
	# _tmp78 = *(_tmp77)
	  lw $s2, 0($s1) 	# load with offset
	# _tmp79 = 1
	  li $s3, 1		# load constant value 1 into $s3
	# _tmp80 = _tmp78 + _tmp79
	  add $s4, $s2, $s3	
	# _tmp81 = 13
	  li $s5, 13		# load constant value 13 into $s5
	# _tmp82 = _tmp80 % _tmp81
	  rem $s6, $s4, $s5	
	# _tmp83 = 8
	  li $s7, 8		# load constant value 8 into $s7
	# _tmp84 = this + _tmp83
	  add $t8, $s0, $s7	
	# _tmp85 = *(_tmp84)
	  lw $t9, 0($t8) 	# load with offset
	# _tmp86 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp87 = this + _tmp86
	  add $t1, $s0, $t0	
	# _tmp88 = *(_tmp87)
	  lw $t4, 0($t1) 	# load with offset
	# _tmp89 = 0
	  li $s0, 0		# load constant value 0 into $s0
	# _tmp90 = 4
	  sw $t1, -172($fp)	# spill _tmp87 from $t1 to $fp-172
	  li $t1, 4		# load constant value 4 into $t1
	# _tmp91 = *(_tmp85)
	  sw $t2, -112($fp)	# spill _tmp72 from $t2 to $fp-112
	  lw $t2, 0($t9) 	# load with offset
	# _tmp92 = _tmp91 == _tmp88
	  sw $t3, -116($fp)	# spill _tmp73 from $t3 to $fp-116
	  seq $t3, $t2, $t4	
	# _tmp93 = _tmp91 < _tmp88
	  sw $t5, -120($fp)	# spill _tmp74 from $t5 to $fp-120
	  slt $t5, $t2, $t4	
	# _tmp94 = _tmp93 || _tmp92
	  sw $t6, -124($fp)	# spill _tmp75 from $t6 to $fp-124
	  or $t6, $t5, $t3	
	# _tmp95 = _tmp88 < _tmp89
	  sw $t7, -128($fp)	# spill _tmp76 from $t7 to $fp-128
	  slt $t7, $t4, $s0	
	# _tmp96 = _tmp95 || _tmp94
	  sw $s0, -180($fp)	# spill _tmp89 from $s0 to $fp-180
	  or $s0, $t7, $t6	
	# IfZ _tmp96 Goto _L5
	# (save modified registers before flow of control change)
	  sw $t0, -168($fp)	# spill _tmp86 from $t0 to $fp-168
	  sw $t1, -184($fp)	# spill _tmp90 from $t1 to $fp-184
	  sw $t2, -188($fp)	# spill _tmp91 from $t2 to $fp-188
	  sw $t3, -192($fp)	# spill _tmp92 from $t3 to $fp-192
	  sw $t4, -176($fp)	# spill _tmp88 from $t4 to $fp-176
	  sw $t5, -196($fp)	# spill _tmp93 from $t5 to $fp-196
	  sw $t6, -200($fp)	# spill _tmp94 from $t6 to $fp-200
	  sw $t7, -204($fp)	# spill _tmp95 from $t7 to $fp-204
	  sw $s0, -208($fp)	# spill _tmp96 from $s0 to $fp-208
	  sw $s1, -132($fp)	# spill _tmp77 from $s1 to $fp-132
	  sw $s2, -136($fp)	# spill _tmp78 from $s2 to $fp-136
	  sw $s3, -140($fp)	# spill _tmp79 from $s3 to $fp-140
	  sw $s4, -144($fp)	# spill _tmp80 from $s4 to $fp-144
	  sw $s5, -148($fp)	# spill _tmp81 from $s5 to $fp-148
	  sw $s6, -152($fp)	# spill _tmp82 from $s6 to $fp-152
	  sw $s7, -156($fp)	# spill _tmp83 from $s7 to $fp-156
	  sw $t8, -160($fp)	# spill _tmp84 from $t8 to $fp-160
	  sw $t9, -164($fp)	# spill _tmp85 from $t9 to $fp-164
	  beqz $s0, _L5	# branch if _tmp96 is zero 
	# _tmp97 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string3: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string3	# load label
	# PushParam _tmp97
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -212($fp)	# spill _tmp97 from $t0 to $fp-212
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L5:
	# _tmp98 = _tmp88 * _tmp90
	  lw $t0, -176($fp)	# load _tmp88 from $fp-176 into $t0
	  lw $t1, -184($fp)	# load _tmp90 from $fp-184 into $t1
	  mul $t2, $t0, $t1	
	# _tmp99 = _tmp98 + _tmp90
	  add $t3, $t2, $t1	
	# _tmp100 = _tmp85 + _tmp99
	  lw $t4, -164($fp)	# load _tmp85 from $fp-164 into $t4
	  add $t5, $t4, $t3	
	# *(_tmp100) = _tmp82
	  lw $t6, -152($fp)	# load _tmp82 from $fp-152 into $t6
	  sw $t6, 0($t5) 	# store with offset
	# _tmp101 = 4
	  li $t7, 4		# load constant value 4 into $t7
	# _tmp102 = this + _tmp101
	  lw $s0, 4($fp)	# load this from $fp+4 into $s0
	  add $s1, $s0, $t7	
	# _tmp103 = *(_tmp102)
	  lw $s2, 0($s1) 	# load with offset
	# _tmp104 = 4
	  li $s3, 4		# load constant value 4 into $s3
	# _tmp105 = this + _tmp104
	  add $s4, $s0, $s3	
	# _tmp106 = *(_tmp105)
	  lw $s5, 0($s4) 	# load with offset
	# _tmp107 = 1
	  li $s6, 1		# load constant value 1 into $s6
	# _tmp108 = _tmp106 + _tmp107
	  add $s7, $s5, $s6	
	# _tmp109 = 4
	  li $t8, 4		# load constant value 4 into $t8
	# _tmp110 = this + _tmp109
	  add $t9, $s0, $t8	
	# *(_tmp110) = _tmp108
	  sw $s7, 0($t9) 	# store with offset
	# Goto _L2
	# (save modified registers before flow of control change)
	  sw $t2, -216($fp)	# spill _tmp98 from $t2 to $fp-216
	  sw $t3, -220($fp)	# spill _tmp99 from $t3 to $fp-220
	  sw $t5, -224($fp)	# spill _tmp100 from $t5 to $fp-224
	  sw $t7, -228($fp)	# spill _tmp101 from $t7 to $fp-228
	  sw $s1, -232($fp)	# spill _tmp102 from $s1 to $fp-232
	  sw $s2, -236($fp)	# spill _tmp103 from $s2 to $fp-236
	  sw $s3, -240($fp)	# spill _tmp104 from $s3 to $fp-240
	  sw $s4, -244($fp)	# spill _tmp105 from $s4 to $fp-244
	  sw $s5, -248($fp)	# spill _tmp106 from $s5 to $fp-248
	  sw $s6, -252($fp)	# spill _tmp107 from $s6 to $fp-252
	  sw $s7, -256($fp)	# spill _tmp108 from $s7 to $fp-256
	  sw $t8, -260($fp)	# spill _tmp109 from $t8 to $fp-260
	  sw $t9, -264($fp)	# spill _tmp110 from $t9 to $fp-264
	  b _L2		# unconditional branch
  _L3:
  _L6:
	# _tmp111 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp112 = this + _tmp111
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp113 = *(_tmp112)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp114 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp115 = _tmp114 < _tmp113
	  slt $t5, $t4, $t3	
	# IfZ _tmp115 Goto _L7
	# (save modified registers before flow of control change)
	  sw $t0, -268($fp)	# spill _tmp111 from $t0 to $fp-268
	  sw $t2, -272($fp)	# spill _tmp112 from $t2 to $fp-272
	  sw $t3, -276($fp)	# spill _tmp113 from $t3 to $fp-276
	  sw $t4, -280($fp)	# spill _tmp114 from $t4 to $fp-280
	  sw $t5, -284($fp)	# spill _tmp115 from $t5 to $fp-284
	  beqz $t5, _L7	# branch if _tmp115 is zero 
	# _tmp116 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp117 = this + _tmp116
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp118 = *(_tmp117)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp118
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp119 = *(gRnd)
	  lw $t4, 0($gp)	# load gRnd from $gp+0 into $t4
	  lw $t5, 0($t4) 	# load with offset
	# _tmp120 = *(_tmp119)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp121 = ACall _tmp120
	# (save modified registers before flow of control change)
	  sw $t0, -296($fp)	# spill _tmp116 from $t0 to $fp-296
	  sw $t2, -300($fp)	# spill _tmp117 from $t2 to $fp-300
	  sw $t3, -304($fp)	# spill _tmp118 from $t3 to $fp-304
	  sw $t5, -308($fp)	# spill _tmp119 from $t5 to $fp-308
	  sw $t6, -312($fp)	# spill _tmp120 from $t6 to $fp-312
	  jalr $t6            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp122 = gRnd - _tmp121
	  lw $t1, 0($gp)	# load gRnd from $gp+0 into $t1
	  sub $t2, $t1, $t0	
	# _tmp123 = *(_tmp119 + 12)
	  lw $t3, -308($fp)	# load _tmp119 from $fp-308 into $t3
	  lw $t4, 12($t3) 	# load with offset
	# PushParam _tmp122
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp124 = ACall _tmp123
	# (save modified registers before flow of control change)
	  sw $t0, -316($fp)	# spill _tmp121 from $t0 to $fp-316
	  sw $t2, -320($fp)	# spill _tmp122 from $t2 to $fp-320
	  sw $t4, -324($fp)	# spill _tmp123 from $t4 to $fp-324
	  jalr $t4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# r = _tmp124
	  move $t1, $t0		# copy value
	# _tmp125 = 4
	  li $t2, 4		# load constant value 4 into $t2
	# _tmp126 = this + _tmp125
	  lw $t3, 4($fp)	# load this from $fp+4 into $t3
	  add $t4, $t3, $t2	
	# _tmp127 = *(_tmp126)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp128 = 4
	  li $t6, 4		# load constant value 4 into $t6
	# _tmp129 = this + _tmp128
	  add $t7, $t3, $t6	
	# _tmp130 = *(_tmp129)
	  lw $s0, 0($t7) 	# load with offset
	# _tmp131 = 1
	  li $s1, 1		# load constant value 1 into $s1
	# _tmp132 = _tmp130 - _tmp131
	  sub $s2, $s0, $s1	
	# _tmp133 = 4
	  li $s3, 4		# load constant value 4 into $s3
	# _tmp134 = this + _tmp133
	  add $s4, $t3, $s3	
	# *(_tmp134) = _tmp132
	  sw $s2, 0($s4) 	# store with offset
	# _tmp135 = 8
	  li $s5, 8		# load constant value 8 into $s5
	# _tmp136 = this + _tmp135
	  add $s6, $t3, $s5	
	# _tmp137 = *(_tmp136)
	  lw $s7, 0($s6) 	# load with offset
	# _tmp138 = 4
	  li $t8, 4		# load constant value 4 into $t8
	# _tmp139 = this + _tmp138
	  add $t9, $t3, $t8	
	# _tmp140 = *(_tmp139)
	  lw $t3, 0($t9) 	# load with offset
	# _tmp141 = 0
	  sw $s1, -356($fp)	# spill _tmp131 from $s1 to $fp-356
	  li $s1, 0		# load constant value 0 into $s1
	# _tmp142 = 4
	  sw $s2, -360($fp)	# spill _tmp132 from $s2 to $fp-360
	  li $s2, 4		# load constant value 4 into $s2
	# _tmp143 = *(_tmp137)
	  sw $s3, -364($fp)	# spill _tmp133 from $s3 to $fp-364
	  lw $s3, 0($s7) 	# load with offset
	# _tmp144 = _tmp143 == _tmp140
	  sw $s4, -368($fp)	# spill _tmp134 from $s4 to $fp-368
	  seq $s4, $s3, $t3	
	# _tmp145 = _tmp143 < _tmp140
	  sw $s5, -372($fp)	# spill _tmp135 from $s5 to $fp-372
	  slt $s5, $s3, $t3	
	# _tmp146 = _tmp145 || _tmp144
	  sw $s6, -376($fp)	# spill _tmp136 from $s6 to $fp-376
	  or $s6, $s5, $s4	
	# _tmp147 = _tmp140 < _tmp141
	  sw $s7, -380($fp)	# spill _tmp137 from $s7 to $fp-380
	  slt $s7, $t3, $s1	
	# _tmp148 = _tmp147 || _tmp146
	  sw $t8, -384($fp)	# spill _tmp138 from $t8 to $fp-384
	  or $t8, $s7, $s6	
	# IfZ _tmp148 Goto _L8
	# (save modified registers before flow of control change)
	  sw $t0, -328($fp)	# spill _tmp124 from $t0 to $fp-328
	  sw $t1, -288($fp)	# spill r from $t1 to $fp-288
	  sw $t2, -332($fp)	# spill _tmp125 from $t2 to $fp-332
	  sw $t3, -392($fp)	# spill _tmp140 from $t3 to $fp-392
	  sw $t4, -336($fp)	# spill _tmp126 from $t4 to $fp-336
	  sw $t5, -340($fp)	# spill _tmp127 from $t5 to $fp-340
	  sw $t6, -344($fp)	# spill _tmp128 from $t6 to $fp-344
	  sw $t7, -348($fp)	# spill _tmp129 from $t7 to $fp-348
	  sw $s0, -352($fp)	# spill _tmp130 from $s0 to $fp-352
	  sw $s1, -396($fp)	# spill _tmp141 from $s1 to $fp-396
	  sw $s2, -400($fp)	# spill _tmp142 from $s2 to $fp-400
	  sw $s3, -404($fp)	# spill _tmp143 from $s3 to $fp-404
	  sw $s4, -408($fp)	# spill _tmp144 from $s4 to $fp-408
	  sw $s5, -412($fp)	# spill _tmp145 from $s5 to $fp-412
	  sw $s6, -416($fp)	# spill _tmp146 from $s6 to $fp-416
	  sw $s7, -420($fp)	# spill _tmp147 from $s7 to $fp-420
	  sw $t8, -424($fp)	# spill _tmp148 from $t8 to $fp-424
	  sw $t9, -388($fp)	# spill _tmp139 from $t9 to $fp-388
	  beqz $t8, _L8	# branch if _tmp148 is zero 
	# _tmp149 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string4: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string4	# load label
	# PushParam _tmp149
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -428($fp)	# spill _tmp149 from $t0 to $fp-428
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L8:
	# _tmp150 = _tmp140 * _tmp142
	  lw $t0, -392($fp)	# load _tmp140 from $fp-392 into $t0
	  lw $t1, -400($fp)	# load _tmp142 from $fp-400 into $t1
	  mul $t2, $t0, $t1	
	# _tmp151 = _tmp150 + _tmp142
	  add $t3, $t2, $t1	
	# _tmp152 = _tmp137 + _tmp151
	  lw $t4, -380($fp)	# load _tmp137 from $fp-380 into $t4
	  add $t5, $t4, $t3	
	# _tmp153 = *(_tmp152)
	  lw $t6, 0($t5) 	# load with offset
	# temp = _tmp153
	  move $t7, $t6		# copy value
	# _tmp154 = 8
	  li $s0, 8		# load constant value 8 into $s0
	# _tmp155 = this + _tmp154
	  lw $s1, 4($fp)	# load this from $fp+4 into $s1
	  add $s2, $s1, $s0	
	# _tmp156 = *(_tmp155)
	  lw $s3, 0($s2) 	# load with offset
	# _tmp157 = 4
	  li $s4, 4		# load constant value 4 into $s4
	# _tmp158 = this + _tmp157
	  add $s5, $s1, $s4	
	# _tmp159 = *(_tmp158)
	  lw $s6, 0($s5) 	# load with offset
	# _tmp160 = 0
	  li $s7, 0		# load constant value 0 into $s7
	# _tmp161 = 4
	  li $t8, 4		# load constant value 4 into $t8
	# _tmp162 = *(_tmp156)
	  lw $t9, 0($s3) 	# load with offset
	# _tmp163 = _tmp162 == _tmp159
	  seq $t0, $t9, $s6	
	# _tmp164 = _tmp162 < _tmp159
	  slt $t1, $t9, $s6	
	# _tmp165 = _tmp164 || _tmp163
	  or $t4, $t1, $t0	
	# _tmp166 = _tmp159 < _tmp160
	  slt $s1, $s6, $s7	
	# _tmp167 = _tmp166 || _tmp165
	  sw $t9, -480($fp)	# spill _tmp162 from $t9 to $fp-480
	  or $t9, $s1, $t4	
	# IfZ _tmp167 Goto _L9
	# (save modified registers before flow of control change)
	  sw $t0, -484($fp)	# spill _tmp163 from $t0 to $fp-484
	  sw $t1, -488($fp)	# spill _tmp164 from $t1 to $fp-488
	  sw $t2, -432($fp)	# spill _tmp150 from $t2 to $fp-432
	  sw $t3, -436($fp)	# spill _tmp151 from $t3 to $fp-436
	  sw $t4, -492($fp)	# spill _tmp165 from $t4 to $fp-492
	  sw $t5, -440($fp)	# spill _tmp152 from $t5 to $fp-440
	  sw $t6, -444($fp)	# spill _tmp153 from $t6 to $fp-444
	  sw $t7, -292($fp)	# spill temp from $t7 to $fp-292
	  sw $s0, -448($fp)	# spill _tmp154 from $s0 to $fp-448
	  sw $s1, -496($fp)	# spill _tmp166 from $s1 to $fp-496
	  sw $s2, -452($fp)	# spill _tmp155 from $s2 to $fp-452
	  sw $s3, -456($fp)	# spill _tmp156 from $s3 to $fp-456
	  sw $s4, -460($fp)	# spill _tmp157 from $s4 to $fp-460
	  sw $s5, -464($fp)	# spill _tmp158 from $s5 to $fp-464
	  sw $s6, -468($fp)	# spill _tmp159 from $s6 to $fp-468
	  sw $s7, -472($fp)	# spill _tmp160 from $s7 to $fp-472
	  sw $t8, -476($fp)	# spill _tmp161 from $t8 to $fp-476
	  sw $t9, -500($fp)	# spill _tmp167 from $t9 to $fp-500
	  beqz $t9, _L9	# branch if _tmp167 is zero 
	# _tmp168 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string5: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string5	# load label
	# PushParam _tmp168
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -504($fp)	# spill _tmp168 from $t0 to $fp-504
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L9:
	# _tmp169 = _tmp159 * _tmp161
	  lw $t0, -468($fp)	# load _tmp159 from $fp-468 into $t0
	  lw $t1, -476($fp)	# load _tmp161 from $fp-476 into $t1
	  mul $t2, $t0, $t1	
	# _tmp170 = _tmp169 + _tmp161
	  add $t3, $t2, $t1	
	# _tmp171 = _tmp156 + _tmp170
	  lw $t4, -456($fp)	# load _tmp156 from $fp-456 into $t4
	  add $t5, $t4, $t3	
	# _tmp172 = *(_tmp171)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp173 = 8
	  li $t7, 8		# load constant value 8 into $t7
	# _tmp174 = this + _tmp173
	  lw $s0, 4($fp)	# load this from $fp+4 into $s0
	  add $s1, $s0, $t7	
	# _tmp175 = *(_tmp174)
	  lw $s2, 0($s1) 	# load with offset
	# _tmp176 = 0
	  li $s3, 0		# load constant value 0 into $s3
	# _tmp177 = 4
	  li $s4, 4		# load constant value 4 into $s4
	# _tmp178 = *(_tmp175)
	  lw $s5, 0($s2) 	# load with offset
	# _tmp179 = _tmp178 == r
	  lw $s6, -288($fp)	# load r from $fp-288 into $s6
	  seq $s7, $s5, $s6	
	# _tmp180 = _tmp178 < r
	  slt $t8, $s5, $s6	
	# _tmp181 = _tmp180 || _tmp179
	  or $t9, $t8, $s7	
	# _tmp182 = r < _tmp176
	  slt $t0, $s6, $s3	
	# _tmp183 = _tmp182 || _tmp181
	  or $t1, $t0, $t9	
	# IfZ _tmp183 Goto _L10
	# (save modified registers before flow of control change)
	  sw $t0, -560($fp)	# spill _tmp182 from $t0 to $fp-560
	  sw $t1, -564($fp)	# spill _tmp183 from $t1 to $fp-564
	  sw $t2, -508($fp)	# spill _tmp169 from $t2 to $fp-508
	  sw $t3, -512($fp)	# spill _tmp170 from $t3 to $fp-512
	  sw $t5, -516($fp)	# spill _tmp171 from $t5 to $fp-516
	  sw $t6, -520($fp)	# spill _tmp172 from $t6 to $fp-520
	  sw $t7, -524($fp)	# spill _tmp173 from $t7 to $fp-524
	  sw $s1, -528($fp)	# spill _tmp174 from $s1 to $fp-528
	  sw $s2, -532($fp)	# spill _tmp175 from $s2 to $fp-532
	  sw $s3, -536($fp)	# spill _tmp176 from $s3 to $fp-536
	  sw $s4, -540($fp)	# spill _tmp177 from $s4 to $fp-540
	  sw $s5, -544($fp)	# spill _tmp178 from $s5 to $fp-544
	  sw $s7, -548($fp)	# spill _tmp179 from $s7 to $fp-548
	  sw $t8, -552($fp)	# spill _tmp180 from $t8 to $fp-552
	  sw $t9, -556($fp)	# spill _tmp181 from $t9 to $fp-556
	  beqz $t1, _L10	# branch if _tmp183 is zero 
	# _tmp184 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string6: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string6	# load label
	# PushParam _tmp184
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -568($fp)	# spill _tmp184 from $t0 to $fp-568
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L10:
	# _tmp185 = r * _tmp177
	  lw $t0, -288($fp)	# load r from $fp-288 into $t0
	  lw $t1, -540($fp)	# load _tmp177 from $fp-540 into $t1
	  mul $t2, $t0, $t1	
	# _tmp186 = _tmp185 + _tmp177
	  add $t3, $t2, $t1	
	# _tmp187 = _tmp175 + _tmp186
	  lw $t4, -532($fp)	# load _tmp175 from $fp-532 into $t4
	  add $t5, $t4, $t3	
	# _tmp188 = *(_tmp187)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp189 = 8
	  li $t7, 8		# load constant value 8 into $t7
	# _tmp190 = this + _tmp189
	  lw $s0, 4($fp)	# load this from $fp+4 into $s0
	  add $s1, $s0, $t7	
	# _tmp191 = *(_tmp190)
	  lw $s2, 0($s1) 	# load with offset
	# _tmp192 = 4
	  li $s3, 4		# load constant value 4 into $s3
	# _tmp193 = this + _tmp192
	  add $s4, $s0, $s3	
	# _tmp194 = *(_tmp193)
	  lw $s5, 0($s4) 	# load with offset
	# _tmp195 = 0
	  li $s6, 0		# load constant value 0 into $s6
	# _tmp196 = 4
	  li $s7, 4		# load constant value 4 into $s7
	# _tmp197 = *(_tmp191)
	  lw $t8, 0($s2) 	# load with offset
	# _tmp198 = _tmp197 == _tmp194
	  seq $t9, $t8, $s5	
	# _tmp199 = _tmp197 < _tmp194
	  slt $t0, $t8, $s5	
	# _tmp200 = _tmp199 || _tmp198
	  or $t1, $t0, $t9	
	# _tmp201 = _tmp194 < _tmp195
	  slt $t4, $s5, $s6	
	# _tmp202 = _tmp201 || _tmp200
	  or $s0, $t4, $t1	
	# IfZ _tmp202 Goto _L11
	# (save modified registers before flow of control change)
	  sw $t0, -628($fp)	# spill _tmp199 from $t0 to $fp-628
	  sw $t1, -632($fp)	# spill _tmp200 from $t1 to $fp-632
	  sw $t2, -572($fp)	# spill _tmp185 from $t2 to $fp-572
	  sw $t3, -576($fp)	# spill _tmp186 from $t3 to $fp-576
	  sw $t4, -636($fp)	# spill _tmp201 from $t4 to $fp-636
	  sw $t5, -580($fp)	# spill _tmp187 from $t5 to $fp-580
	  sw $t6, -584($fp)	# spill _tmp188 from $t6 to $fp-584
	  sw $t7, -588($fp)	# spill _tmp189 from $t7 to $fp-588
	  sw $s0, -640($fp)	# spill _tmp202 from $s0 to $fp-640
	  sw $s1, -592($fp)	# spill _tmp190 from $s1 to $fp-592
	  sw $s2, -596($fp)	# spill _tmp191 from $s2 to $fp-596
	  sw $s3, -600($fp)	# spill _tmp192 from $s3 to $fp-600
	  sw $s4, -604($fp)	# spill _tmp193 from $s4 to $fp-604
	  sw $s5, -608($fp)	# spill _tmp194 from $s5 to $fp-608
	  sw $s6, -612($fp)	# spill _tmp195 from $s6 to $fp-612
	  sw $s7, -616($fp)	# spill _tmp196 from $s7 to $fp-616
	  sw $t8, -620($fp)	# spill _tmp197 from $t8 to $fp-620
	  sw $t9, -624($fp)	# spill _tmp198 from $t9 to $fp-624
	  beqz $s0, _L11	# branch if _tmp202 is zero 
	# _tmp203 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string7: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string7	# load label
	# PushParam _tmp203
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -644($fp)	# spill _tmp203 from $t0 to $fp-644
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L11:
	# _tmp204 = _tmp194 * _tmp196
	  lw $t0, -608($fp)	# load _tmp194 from $fp-608 into $t0
	  lw $t1, -616($fp)	# load _tmp196 from $fp-616 into $t1
	  mul $t2, $t0, $t1	
	# _tmp205 = _tmp204 + _tmp196
	  add $t3, $t2, $t1	
	# _tmp206 = _tmp191 + _tmp205
	  lw $t4, -596($fp)	# load _tmp191 from $fp-596 into $t4
	  add $t5, $t4, $t3	
	# *(_tmp206) = _tmp188
	  lw $t6, -584($fp)	# load _tmp188 from $fp-584 into $t6
	  sw $t6, 0($t5) 	# store with offset
	# _tmp207 = 8
	  li $t7, 8		# load constant value 8 into $t7
	# _tmp208 = this + _tmp207
	  lw $s0, 4($fp)	# load this from $fp+4 into $s0
	  add $s1, $s0, $t7	
	# _tmp209 = *(_tmp208)
	  lw $s2, 0($s1) 	# load with offset
	# _tmp210 = 0
	  li $s3, 0		# load constant value 0 into $s3
	# _tmp211 = 4
	  li $s4, 4		# load constant value 4 into $s4
	# _tmp212 = *(_tmp209)
	  lw $s5, 0($s2) 	# load with offset
	# _tmp213 = _tmp212 == r
	  lw $s6, -288($fp)	# load r from $fp-288 into $s6
	  seq $s7, $s5, $s6	
	# _tmp214 = _tmp212 < r
	  slt $t8, $s5, $s6	
	# _tmp215 = _tmp214 || _tmp213
	  or $t9, $t8, $s7	
	# _tmp216 = r < _tmp210
	  slt $t0, $s6, $s3	
	# _tmp217 = _tmp216 || _tmp215
	  or $t1, $t0, $t9	
	# IfZ _tmp217 Goto _L12
	# (save modified registers before flow of control change)
	  sw $t0, -696($fp)	# spill _tmp216 from $t0 to $fp-696
	  sw $t1, -700($fp)	# spill _tmp217 from $t1 to $fp-700
	  sw $t2, -648($fp)	# spill _tmp204 from $t2 to $fp-648
	  sw $t3, -652($fp)	# spill _tmp205 from $t3 to $fp-652
	  sw $t5, -656($fp)	# spill _tmp206 from $t5 to $fp-656
	  sw $t7, -660($fp)	# spill _tmp207 from $t7 to $fp-660
	  sw $s1, -664($fp)	# spill _tmp208 from $s1 to $fp-664
	  sw $s2, -668($fp)	# spill _tmp209 from $s2 to $fp-668
	  sw $s3, -672($fp)	# spill _tmp210 from $s3 to $fp-672
	  sw $s4, -676($fp)	# spill _tmp211 from $s4 to $fp-676
	  sw $s5, -680($fp)	# spill _tmp212 from $s5 to $fp-680
	  sw $s7, -684($fp)	# spill _tmp213 from $s7 to $fp-684
	  sw $t8, -688($fp)	# spill _tmp214 from $t8 to $fp-688
	  sw $t9, -692($fp)	# spill _tmp215 from $t9 to $fp-692
	  beqz $t1, _L12	# branch if _tmp217 is zero 
	# _tmp218 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string8: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string8	# load label
	# PushParam _tmp218
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -704($fp)	# spill _tmp218 from $t0 to $fp-704
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L12:
	# _tmp219 = r * _tmp211
	  lw $t0, -288($fp)	# load r from $fp-288 into $t0
	  lw $t1, -676($fp)	# load _tmp211 from $fp-676 into $t1
	  mul $t2, $t0, $t1	
	# _tmp220 = _tmp219 + _tmp211
	  add $t3, $t2, $t1	
	# _tmp221 = _tmp209 + _tmp220
	  lw $t4, -668($fp)	# load _tmp209 from $fp-668 into $t4
	  add $t5, $t4, $t3	
	# _tmp222 = *(_tmp221)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp223 = 8
	  li $t7, 8		# load constant value 8 into $t7
	# _tmp224 = this + _tmp223
	  lw $s0, 4($fp)	# load this from $fp+4 into $s0
	  add $s1, $s0, $t7	
	# _tmp225 = *(_tmp224)
	  lw $s2, 0($s1) 	# load with offset
	# _tmp226 = 0
	  li $s3, 0		# load constant value 0 into $s3
	# _tmp227 = 4
	  li $s4, 4		# load constant value 4 into $s4
	# _tmp228 = *(_tmp225)
	  lw $s5, 0($s2) 	# load with offset
	# _tmp229 = _tmp228 == r
	  seq $s6, $s5, $t0	
	# _tmp230 = _tmp228 < r
	  slt $s7, $s5, $t0	
	# _tmp231 = _tmp230 || _tmp229
	  or $t8, $s7, $s6	
	# _tmp232 = r < _tmp226
	  slt $t9, $t0, $s3	
	# _tmp233 = _tmp232 || _tmp231
	  or $t0, $t9, $t8	
	# IfZ _tmp233 Goto _L13
	# (save modified registers before flow of control change)
	  sw $t0, -764($fp)	# spill _tmp233 from $t0 to $fp-764
	  sw $t2, -708($fp)	# spill _tmp219 from $t2 to $fp-708
	  sw $t3, -712($fp)	# spill _tmp220 from $t3 to $fp-712
	  sw $t5, -716($fp)	# spill _tmp221 from $t5 to $fp-716
	  sw $t6, -720($fp)	# spill _tmp222 from $t6 to $fp-720
	  sw $t7, -724($fp)	# spill _tmp223 from $t7 to $fp-724
	  sw $s1, -728($fp)	# spill _tmp224 from $s1 to $fp-728
	  sw $s2, -732($fp)	# spill _tmp225 from $s2 to $fp-732
	  sw $s3, -736($fp)	# spill _tmp226 from $s3 to $fp-736
	  sw $s4, -740($fp)	# spill _tmp227 from $s4 to $fp-740
	  sw $s5, -744($fp)	# spill _tmp228 from $s5 to $fp-744
	  sw $s6, -748($fp)	# spill _tmp229 from $s6 to $fp-748
	  sw $s7, -752($fp)	# spill _tmp230 from $s7 to $fp-752
	  sw $t8, -756($fp)	# spill _tmp231 from $t8 to $fp-756
	  sw $t9, -760($fp)	# spill _tmp232 from $t9 to $fp-760
	  beqz $t0, _L13	# branch if _tmp233 is zero 
	# _tmp234 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string9: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string9	# load label
	# PushParam _tmp234
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -768($fp)	# spill _tmp234 from $t0 to $fp-768
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L13:
	# _tmp235 = r * _tmp227
	  lw $t0, -288($fp)	# load r from $fp-288 into $t0
	  lw $t1, -740($fp)	# load _tmp227 from $fp-740 into $t1
	  mul $t2, $t0, $t1	
	# _tmp236 = _tmp235 + _tmp227
	  add $t3, $t2, $t1	
	# _tmp237 = _tmp225 + _tmp236
	  lw $t4, -732($fp)	# load _tmp225 from $fp-732 into $t4
	  add $t5, $t4, $t3	
	# *(_tmp237) = temp
	  lw $t6, -292($fp)	# load temp from $fp-292 into $t6
	  sw $t6, 0($t5) 	# store with offset
	# Goto _L6
	# (save modified registers before flow of control change)
	  sw $t2, -772($fp)	# spill _tmp235 from $t2 to $fp-772
	  sw $t3, -776($fp)	# spill _tmp236 from $t3 to $fp-776
	  sw $t5, -780($fp)	# spill _tmp237 from $t5 to $fp-780
	  b _L6		# unconditional branch
  _L7:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_Deck.GetCard:
	# BeginFunc 152
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 152	# decrement sp to make space for locals/temps
	# _tmp238 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp239 = this + _tmp238
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp240 = *(_tmp239)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp241 = 52
	  li $t4, 52		# load constant value 52 into $t4
	# _tmp242 = _tmp240 == _tmp241
	  seq $t5, $t3, $t4	
	# _tmp243 = _tmp241 < _tmp240
	  slt $t6, $t4, $t3	
	# _tmp244 = _tmp243 || _tmp242
	  or $t7, $t6, $t5	
	# IfZ _tmp244 Goto _L14
	# (save modified registers before flow of control change)
	  sw $t0, -12($fp)	# spill _tmp238 from $t0 to $fp-12
	  sw $t2, -16($fp)	# spill _tmp239 from $t2 to $fp-16
	  sw $t3, -20($fp)	# spill _tmp240 from $t3 to $fp-20
	  sw $t4, -24($fp)	# spill _tmp241 from $t4 to $fp-24
	  sw $t5, -28($fp)	# spill _tmp242 from $t5 to $fp-28
	  sw $t6, -32($fp)	# spill _tmp243 from $t6 to $fp-32
	  sw $t7, -36($fp)	# spill _tmp244 from $t7 to $fp-36
	  beqz $t7, _L14	# branch if _tmp244 is zero 
	# _tmp245 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp245
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L14:
	# _tmp246 = 8
	  li $t0, 8		# load constant value 8 into $t0
	# _tmp247 = this + _tmp246
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp248 = *(_tmp247)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp249 = 4
	  li $t4, 4		# load constant value 4 into $t4
	# _tmp250 = this + _tmp249
	  add $t5, $t1, $t4	
	# _tmp251 = *(_tmp250)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp252 = 0
	  li $t7, 0		# load constant value 0 into $t7
	# _tmp253 = 4
	  li $s0, 4		# load constant value 4 into $s0
	# _tmp254 = *(_tmp248)
	  lw $s1, 0($t3) 	# load with offset
	# _tmp255 = _tmp254 == _tmp251
	  seq $s2, $s1, $t6	
	# _tmp256 = _tmp254 < _tmp251
	  slt $s3, $s1, $t6	
	# _tmp257 = _tmp256 || _tmp255
	  or $s4, $s3, $s2	
	# _tmp258 = _tmp251 < _tmp252
	  slt $s5, $t6, $t7	
	# _tmp259 = _tmp258 || _tmp257
	  or $s6, $s5, $s4	
	# IfZ _tmp259 Goto _L15
	# (save modified registers before flow of control change)
	  sw $t0, -44($fp)	# spill _tmp246 from $t0 to $fp-44
	  sw $t2, -48($fp)	# spill _tmp247 from $t2 to $fp-48
	  sw $t3, -52($fp)	# spill _tmp248 from $t3 to $fp-52
	  sw $t4, -56($fp)	# spill _tmp249 from $t4 to $fp-56
	  sw $t5, -60($fp)	# spill _tmp250 from $t5 to $fp-60
	  sw $t6, -64($fp)	# spill _tmp251 from $t6 to $fp-64
	  sw $t7, -68($fp)	# spill _tmp252 from $t7 to $fp-68
	  sw $s0, -72($fp)	# spill _tmp253 from $s0 to $fp-72
	  sw $s1, -76($fp)	# spill _tmp254 from $s1 to $fp-76
	  sw $s2, -80($fp)	# spill _tmp255 from $s2 to $fp-80
	  sw $s3, -84($fp)	# spill _tmp256 from $s3 to $fp-84
	  sw $s4, -88($fp)	# spill _tmp257 from $s4 to $fp-88
	  sw $s5, -92($fp)	# spill _tmp258 from $s5 to $fp-92
	  sw $s6, -96($fp)	# spill _tmp259 from $s6 to $fp-96
	  beqz $s6, _L15	# branch if _tmp259 is zero 
	# _tmp260 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string10: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string10	# load label
	# PushParam _tmp260
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -100($fp)	# spill _tmp260 from $t0 to $fp-100
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L15:
	# _tmp261 = _tmp251 * _tmp253
	  lw $t0, -64($fp)	# load _tmp251 from $fp-64 into $t0
	  lw $t1, -72($fp)	# load _tmp253 from $fp-72 into $t1
	  mul $t2, $t0, $t1	
	# _tmp262 = _tmp261 + _tmp253
	  add $t3, $t2, $t1	
	# _tmp263 = _tmp248 + _tmp262
	  lw $t4, -52($fp)	# load _tmp248 from $fp-52 into $t4
	  add $t5, $t4, $t3	
	# _tmp264 = *(_tmp263)
	  lw $t6, 0($t5) 	# load with offset
	# result = _tmp264
	  move $t7, $t6		# copy value
	# _tmp265 = 4
	  li $s0, 4		# load constant value 4 into $s0
	# _tmp266 = this + _tmp265
	  lw $s1, 4($fp)	# load this from $fp+4 into $s1
	  add $s2, $s1, $s0	
	# _tmp267 = *(_tmp266)
	  lw $s3, 0($s2) 	# load with offset
	# _tmp268 = 4
	  li $s4, 4		# load constant value 4 into $s4
	# _tmp269 = this + _tmp268
	  add $s5, $s1, $s4	
	# _tmp270 = *(_tmp269)
	  lw $s6, 0($s5) 	# load with offset
	# _tmp271 = 1
	  li $s7, 1		# load constant value 1 into $s7
	# _tmp272 = _tmp270 + _tmp271
	  add $t8, $s6, $s7	
	# _tmp273 = 4
	  li $t9, 4		# load constant value 4 into $t9
	# _tmp274 = this + _tmp273
	  add $t0, $s1, $t9	
	# *(_tmp274) = _tmp272
	  sw $t8, 0($t0) 	# store with offset
	# Return result
	  move $v0, $t7		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _offset_BJDeck_0:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp275 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp275
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class BJDeck
	  .data
	  .align 2
	  BJDeck:		# label for class BJDeck vtable
	  .word _offset_BJDeck_0
	  .word f_BJDeck.Init
	  .word f_BJDeck.DealCard
	  .word f_BJDeck.Shuffle
	  .word f_BJDeck.NumCardsRemaining
	  .text
  f_BJDeck.Init:
	# BeginFunc 300
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 300	# decrement sp to make space for locals/temps
	# _tmp276 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp277 = this + _tmp276
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp278 = *(_tmp277)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp279 = 8
	  li $t4, 8		# load constant value 8 into $t4
	# _tmp280 = 0
	  li $t5, 0		# load constant value 0 into $t5
	# _tmp281 = 4
	  li $t6, 4		# load constant value 4 into $t6
	# _tmp282 = _tmp280 < _tmp279
	  slt $t7, $t5, $t4	
	# IfZ _tmp282 Goto _L16
	# (save modified registers before flow of control change)
	  sw $t0, -12($fp)	# spill _tmp276 from $t0 to $fp-12
	  sw $t2, -16($fp)	# spill _tmp277 from $t2 to $fp-16
	  sw $t3, -20($fp)	# spill _tmp278 from $t3 to $fp-20
	  sw $t4, -24($fp)	# spill _tmp279 from $t4 to $fp-24
	  sw $t5, -28($fp)	# spill _tmp280 from $t5 to $fp-28
	  sw $t6, -32($fp)	# spill _tmp281 from $t6 to $fp-32
	  sw $t7, -36($fp)	# spill _tmp282 from $t7 to $fp-36
	  beqz $t7, _L16	# branch if _tmp282 is zero 
	# Goto _L17
	  b _L17		# unconditional branch
  _L16:
	# _tmp283 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string11: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t0, _string11	# load label
	# PushParam _tmp283
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -40($fp)	# spill _tmp283 from $t0 to $fp-40
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L17:
	# _tmp284 = _tmp279 * _tmp281
	  lw $t0, -24($fp)	# load _tmp279 from $fp-24 into $t0
	  lw $t1, -32($fp)	# load _tmp281 from $fp-32 into $t1
	  mul $t2, $t0, $t1	
	# _tmp285 = _tmp284 + _tmp281
	  add $t3, $t2, $t1	
	# PushParam _tmp285
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp286 = LCall _Alloc
	# (save modified registers before flow of control change)
	  sw $t2, -44($fp)	# spill _tmp284 from $t2 to $fp-44
	  sw $t3, -48($fp)	# spill _tmp285 from $t3 to $fp-48
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp286) = _tmp279
	  lw $t1, -24($fp)	# load _tmp279 from $fp-24 into $t1
	  sw $t1, 0($t0) 	# store with offset
	# _tmp287 = 4
	  li $t2, 4		# load constant value 4 into $t2
	# _tmp288 = this + _tmp287
	  lw $t3, 4($fp)	# load this from $fp+4 into $t3
	  add $t4, $t3, $t2	
	# *(_tmp288) = _tmp286
	  sw $t0, 0($t4) 	# store with offset
	# _tmp289 = 0
	  li $t5, 0		# load constant value 0 into $t5
	# i = _tmp289
	  move $t6, $t5		# copy value
	# (save modified registers before flow of control change)
	  sw $t0, -52($fp)	# spill _tmp286 from $t0 to $fp-52
	  sw $t2, -56($fp)	# spill _tmp287 from $t2 to $fp-56
	  sw $t4, -60($fp)	# spill _tmp288 from $t4 to $fp-60
	  sw $t5, -64($fp)	# spill _tmp289 from $t5 to $fp-64
	  sw $t6, -8($fp)	# spill i from $t6 to $fp-8
  _L18:
	# _tmp290 = 8
	  li $t0, 8		# load constant value 8 into $t0
	# _tmp291 = i < _tmp290
	  lw $t1, -8($fp)	# load i from $fp-8 into $t1
	  slt $t2, $t1, $t0	
	# IfZ _tmp291 Goto _L19
	# (save modified registers before flow of control change)
	  sw $t0, -68($fp)	# spill _tmp290 from $t0 to $fp-68
	  sw $t2, -72($fp)	# spill _tmp291 from $t2 to $fp-72
	  beqz $t2, _L19	# branch if _tmp291 is zero 
	# _tmp292 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp293 = this + _tmp292
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp294 = *(_tmp293)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp295 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp296 = 4
	  li $t5, 4		# load constant value 4 into $t5
	# _tmp297 = *(_tmp294)
	  lw $t6, 0($t3) 	# load with offset
	# _tmp298 = _tmp297 == i
	  lw $t7, -8($fp)	# load i from $fp-8 into $t7
	  seq $s0, $t6, $t7	
	# _tmp299 = _tmp297 < i
	  slt $s1, $t6, $t7	
	# _tmp300 = _tmp299 || _tmp298
	  or $s2, $s1, $s0	
	# _tmp301 = i < _tmp295
	  slt $s3, $t7, $t4	
	# _tmp302 = _tmp301 || _tmp300
	  or $s4, $s3, $s2	
	# IfZ _tmp302 Goto _L20
	# (save modified registers before flow of control change)
	  sw $t0, -76($fp)	# spill _tmp292 from $t0 to $fp-76
	  sw $t2, -80($fp)	# spill _tmp293 from $t2 to $fp-80
	  sw $t3, -84($fp)	# spill _tmp294 from $t3 to $fp-84
	  sw $t4, -88($fp)	# spill _tmp295 from $t4 to $fp-88
	  sw $t5, -92($fp)	# spill _tmp296 from $t5 to $fp-92
	  sw $t6, -96($fp)	# spill _tmp297 from $t6 to $fp-96
	  sw $s0, -100($fp)	# spill _tmp298 from $s0 to $fp-100
	  sw $s1, -104($fp)	# spill _tmp299 from $s1 to $fp-104
	  sw $s2, -108($fp)	# spill _tmp300 from $s2 to $fp-108
	  sw $s3, -112($fp)	# spill _tmp301 from $s3 to $fp-112
	  sw $s4, -116($fp)	# spill _tmp302 from $s4 to $fp-116
	  beqz $s4, _L20	# branch if _tmp302 is zero 
	# _tmp303 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string12: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string12	# load label
	# PushParam _tmp303
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -120($fp)	# spill _tmp303 from $t0 to $fp-120
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L20:
	# _tmp304 = i * _tmp296
	  lw $t0, -8($fp)	# load i from $fp-8 into $t0
	  lw $t1, -92($fp)	# load _tmp296 from $fp-92 into $t1
	  mul $t2, $t0, $t1	
	# _tmp305 = _tmp304 + _tmp296
	  add $t3, $t2, $t1	
	# _tmp306 = _tmp294 + _tmp305
	  lw $t4, -84($fp)	# load _tmp294 from $fp-84 into $t4
	  add $t5, $t4, $t3	
	# _tmp307 = *(_tmp306)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp308 = 12
	  li $t7, 12		# load constant value 12 into $t7
	# PushParam _tmp308
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t7, 4($sp)	# copy param value to stack
	# _tmp309 = LCall _Alloc
	# (save modified registers before flow of control change)
	  sw $t2, -124($fp)	# spill _tmp304 from $t2 to $fp-124
	  sw $t3, -128($fp)	# spill _tmp305 from $t3 to $fp-128
	  sw $t5, -132($fp)	# spill _tmp306 from $t5 to $fp-132
	  sw $t6, -136($fp)	# spill _tmp307 from $t6 to $fp-136
	  sw $t7, -140($fp)	# spill _tmp308 from $t7 to $fp-140
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp310 = Deck
	  la $t1, Deck	# load label
	# *(_tmp309) = _tmp310
	  sw $t1, 0($t0) 	# store with offset
	# _tmp311 = 4
	  li $t2, 4		# load constant value 4 into $t2
	# _tmp312 = this + _tmp311
	  lw $t3, 4($fp)	# load this from $fp+4 into $t3
	  add $t4, $t3, $t2	
	# _tmp313 = *(_tmp312)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp314 = 0
	  li $t6, 0		# load constant value 0 into $t6
	# _tmp315 = 4
	  li $t7, 4		# load constant value 4 into $t7
	# _tmp316 = *(_tmp313)
	  lw $s0, 0($t5) 	# load with offset
	# _tmp317 = _tmp316 == i
	  lw $s1, -8($fp)	# load i from $fp-8 into $s1
	  seq $s2, $s0, $s1	
	# _tmp318 = _tmp316 < i
	  slt $s3, $s0, $s1	
	# _tmp319 = _tmp318 || _tmp317
	  or $s4, $s3, $s2	
	# _tmp320 = i < _tmp314
	  slt $s5, $s1, $t6	
	# _tmp321 = _tmp320 || _tmp319
	  or $s6, $s5, $s4	
	# IfZ _tmp321 Goto _L21
	# (save modified registers before flow of control change)
	  sw $t0, -144($fp)	# spill _tmp309 from $t0 to $fp-144
	  sw $t1, -148($fp)	# spill _tmp310 from $t1 to $fp-148
	  sw $t2, -152($fp)	# spill _tmp311 from $t2 to $fp-152
	  sw $t4, -156($fp)	# spill _tmp312 from $t4 to $fp-156
	  sw $t5, -160($fp)	# spill _tmp313 from $t5 to $fp-160
	  sw $t6, -164($fp)	# spill _tmp314 from $t6 to $fp-164
	  sw $t7, -168($fp)	# spill _tmp315 from $t7 to $fp-168
	  sw $s0, -172($fp)	# spill _tmp316 from $s0 to $fp-172
	  sw $s2, -176($fp)	# spill _tmp317 from $s2 to $fp-176
	  sw $s3, -180($fp)	# spill _tmp318 from $s3 to $fp-180
	  sw $s4, -184($fp)	# spill _tmp319 from $s4 to $fp-184
	  sw $s5, -188($fp)	# spill _tmp320 from $s5 to $fp-188
	  sw $s6, -192($fp)	# spill _tmp321 from $s6 to $fp-192
	  beqz $s6, _L21	# branch if _tmp321 is zero 
	# _tmp322 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string13: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string13	# load label
	# PushParam _tmp322
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -196($fp)	# spill _tmp322 from $t0 to $fp-196
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L21:
	# _tmp323 = i * _tmp315
	  lw $t0, -8($fp)	# load i from $fp-8 into $t0
	  lw $t1, -168($fp)	# load _tmp315 from $fp-168 into $t1
	  mul $t2, $t0, $t1	
	# _tmp324 = _tmp323 + _tmp315
	  add $t3, $t2, $t1	
	# _tmp325 = _tmp313 + _tmp324
	  lw $t4, -160($fp)	# load _tmp313 from $fp-160 into $t4
	  add $t5, $t4, $t3	
	# *(_tmp325) = _tmp309
	  lw $t6, -144($fp)	# load _tmp309 from $fp-144 into $t6
	  sw $t6, 0($t5) 	# store with offset
	# _tmp326 = 4
	  li $t7, 4		# load constant value 4 into $t7
	# _tmp327 = this + _tmp326
	  lw $s0, 4($fp)	# load this from $fp+4 into $s0
	  add $s1, $s0, $t7	
	# _tmp328 = *(_tmp327)
	  lw $s2, 0($s1) 	# load with offset
	# _tmp329 = 0
	  li $s3, 0		# load constant value 0 into $s3
	# _tmp330 = 4
	  li $s4, 4		# load constant value 4 into $s4
	# _tmp331 = *(_tmp328)
	  lw $s5, 0($s2) 	# load with offset
	# _tmp332 = _tmp331 == i
	  seq $s6, $s5, $t0	
	# _tmp333 = _tmp331 < i
	  slt $s7, $s5, $t0	
	# _tmp334 = _tmp333 || _tmp332
	  or $t8, $s7, $s6	
	# _tmp335 = i < _tmp329
	  slt $t9, $t0, $s3	
	# _tmp336 = _tmp335 || _tmp334
	  or $t0, $t9, $t8	
	# IfZ _tmp336 Goto _L22
	# (save modified registers before flow of control change)
	  sw $t0, -252($fp)	# spill _tmp336 from $t0 to $fp-252
	  sw $t2, -200($fp)	# spill _tmp323 from $t2 to $fp-200
	  sw $t3, -204($fp)	# spill _tmp324 from $t3 to $fp-204
	  sw $t5, -208($fp)	# spill _tmp325 from $t5 to $fp-208
	  sw $t7, -212($fp)	# spill _tmp326 from $t7 to $fp-212
	  sw $s1, -216($fp)	# spill _tmp327 from $s1 to $fp-216
	  sw $s2, -220($fp)	# spill _tmp328 from $s2 to $fp-220
	  sw $s3, -224($fp)	# spill _tmp329 from $s3 to $fp-224
	  sw $s4, -228($fp)	# spill _tmp330 from $s4 to $fp-228
	  sw $s5, -232($fp)	# spill _tmp331 from $s5 to $fp-232
	  sw $s6, -236($fp)	# spill _tmp332 from $s6 to $fp-236
	  sw $s7, -240($fp)	# spill _tmp333 from $s7 to $fp-240
	  sw $t8, -244($fp)	# spill _tmp334 from $t8 to $fp-244
	  sw $t9, -248($fp)	# spill _tmp335 from $t9 to $fp-248
	  beqz $t0, _L22	# branch if _tmp336 is zero 
	# _tmp337 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string14: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string14	# load label
	# PushParam _tmp337
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -256($fp)	# spill _tmp337 from $t0 to $fp-256
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L22:
	# _tmp338 = i * _tmp330
	  lw $t0, -8($fp)	# load i from $fp-8 into $t0
	  lw $t1, -228($fp)	# load _tmp330 from $fp-228 into $t1
	  mul $t2, $t0, $t1	
	# _tmp339 = _tmp338 + _tmp330
	  add $t3, $t2, $t1	
	# _tmp340 = _tmp328 + _tmp339
	  lw $t4, -220($fp)	# load _tmp328 from $fp-220 into $t4
	  add $t5, $t4, $t3	
	# _tmp341 = *(_tmp340)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp342 = *(_tmp341)
	  lw $t7, 0($t6) 	# load with offset
	# _tmp343 = *(_tmp342)
	  lw $s0, 0($t7) 	# load with offset
	# _tmp344 = ACall _tmp343
	# (save modified registers before flow of control change)
	  sw $t2, -260($fp)	# spill _tmp338 from $t2 to $fp-260
	  sw $t3, -264($fp)	# spill _tmp339 from $t3 to $fp-264
	  sw $t5, -268($fp)	# spill _tmp340 from $t5 to $fp-268
	  sw $t6, -272($fp)	# spill _tmp341 from $t6 to $fp-272
	  sw $t7, -276($fp)	# spill _tmp342 from $t7 to $fp-276
	  sw $s0, -280($fp)	# spill _tmp343 from $s0 to $fp-280
	  jalr $s0            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp345 = _tmp341 - _tmp344
	  lw $t1, -272($fp)	# load _tmp341 from $fp-272 into $t1
	  sub $t2, $t1, $t0	
	# _tmp346 = *(_tmp342 + 4)
	  lw $t3, -276($fp)	# load _tmp342 from $fp-276 into $t3
	  lw $t4, 4($t3) 	# load with offset
	# PushParam _tmp345
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp346
	# (save modified registers before flow of control change)
	  sw $t0, -284($fp)	# spill _tmp344 from $t0 to $fp-284
	  sw $t2, -288($fp)	# spill _tmp345 from $t2 to $fp-288
	  sw $t4, -292($fp)	# spill _tmp346 from $t4 to $fp-292
	  jalr $t4            	# jump to function
	# _tmp347 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp348 = 1
	  li $t1, 1		# load constant value 1 into $t1
	# _tmp349 = i + _tmp348
	  lw $t2, -8($fp)	# load i from $fp-8 into $t2
	  add $t3, $t2, $t1	
	# i = _tmp349
	  move $t2, $t3		# copy value
	# Goto _L18
	# (save modified registers before flow of control change)
	  sw $t0, -296($fp)	# spill _tmp347 from $t0 to $fp-296
	  sw $t1, -300($fp)	# spill _tmp348 from $t1 to $fp-300
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	  sw $t3, -304($fp)	# spill _tmp349 from $t3 to $fp-304
	  b _L18		# unconditional branch
  _L19:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_BJDeck.DealCard:
	# BeginFunc 240
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 240	# decrement sp to make space for locals/temps
	# _tmp350 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# c = _tmp350
	  move $t1, $t0		# copy value
	# _tmp351 = 8
	  li $t2, 8		# load constant value 8 into $t2
	# _tmp352 = this + _tmp351
	  lw $t3, 4($fp)	# load this from $fp+4 into $t3
	  add $t4, $t3, $t2	
	# _tmp353 = *(_tmp352)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp354 = 8
	  li $t6, 8		# load constant value 8 into $t6
	# _tmp355 = 52
	  li $t7, 52		# load constant value 52 into $t7
	# _tmp356 = _tmp354 * _tmp355
	  mul $s0, $t6, $t7	
	# _tmp357 = _tmp353 == _tmp356
	  seq $s1, $t5, $s0	
	# _tmp358 = _tmp356 < _tmp353
	  slt $s2, $s0, $t5	
	# _tmp359 = _tmp358 || _tmp357
	  or $s3, $s2, $s1	
	# IfZ _tmp359 Goto _L23
	# (save modified registers before flow of control change)
	  sw $t0, -12($fp)	# spill _tmp350 from $t0 to $fp-12
	  sw $t1, -8($fp)	# spill c from $t1 to $fp-8
	  sw $t2, -16($fp)	# spill _tmp351 from $t2 to $fp-16
	  sw $t4, -20($fp)	# spill _tmp352 from $t4 to $fp-20
	  sw $t5, -24($fp)	# spill _tmp353 from $t5 to $fp-24
	  sw $t6, -28($fp)	# spill _tmp354 from $t6 to $fp-28
	  sw $t7, -32($fp)	# spill _tmp355 from $t7 to $fp-32
	  sw $s0, -36($fp)	# spill _tmp356 from $s0 to $fp-36
	  sw $s1, -40($fp)	# spill _tmp357 from $s1 to $fp-40
	  sw $s2, -44($fp)	# spill _tmp358 from $s2 to $fp-44
	  sw $s3, -48($fp)	# spill _tmp359 from $s3 to $fp-48
	  beqz $s3, _L23	# branch if _tmp359 is zero 
	# _tmp360 = 11
	  li $t0, 11		# load constant value 11 into $t0
	# Return _tmp360
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L23:
  _L24:
	# _tmp361 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# _tmp362 = c == _tmp361
	  lw $t1, -8($fp)	# load c from $fp-8 into $t1
	  seq $t2, $t1, $t0	
	# IfZ _tmp362 Goto _L25
	# (save modified registers before flow of control change)
	  sw $t0, -56($fp)	# spill _tmp361 from $t0 to $fp-56
	  sw $t2, -60($fp)	# spill _tmp362 from $t2 to $fp-60
	  beqz $t2, _L25	# branch if _tmp362 is zero 
	# _tmp363 = 8
	  li $t0, 8		# load constant value 8 into $t0
	# PushParam _tmp363
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp364 = *(gRnd)
	  lw $t1, 0($gp)	# load gRnd from $gp+0 into $t1
	  lw $t2, 0($t1) 	# load with offset
	# _tmp365 = *(_tmp364)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp366 = ACall _tmp365
	# (save modified registers before flow of control change)
	  sw $t0, -68($fp)	# spill _tmp363 from $t0 to $fp-68
	  sw $t2, -72($fp)	# spill _tmp364 from $t2 to $fp-72
	  sw $t3, -76($fp)	# spill _tmp365 from $t3 to $fp-76
	  jalr $t3            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp367 = gRnd - _tmp366
	  lw $t1, 0($gp)	# load gRnd from $gp+0 into $t1
	  sub $t2, $t1, $t0	
	# _tmp368 = *(_tmp364 + 12)
	  lw $t3, -72($fp)	# load _tmp364 from $fp-72 into $t3
	  lw $t4, 12($t3) 	# load with offset
	# PushParam _tmp367
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp369 = ACall _tmp368
	# (save modified registers before flow of control change)
	  sw $t0, -80($fp)	# spill _tmp366 from $t0 to $fp-80
	  sw $t2, -84($fp)	# spill _tmp367 from $t2 to $fp-84
	  sw $t4, -88($fp)	# spill _tmp368 from $t4 to $fp-88
	  jalr $t4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# d = _tmp369
	  move $t1, $t0		# copy value
	# _tmp370 = 4
	  li $t2, 4		# load constant value 4 into $t2
	# _tmp371 = this + _tmp370
	  lw $t3, 4($fp)	# load this from $fp+4 into $t3
	  add $t4, $t3, $t2	
	# _tmp372 = *(_tmp371)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp373 = 0
	  li $t6, 0		# load constant value 0 into $t6
	# _tmp374 = 4
	  li $t7, 4		# load constant value 4 into $t7
	# _tmp375 = *(_tmp372)
	  lw $s0, 0($t5) 	# load with offset
	# _tmp376 = _tmp375 == d
	  seq $s1, $s0, $t1	
	# _tmp377 = _tmp375 < d
	  slt $s2, $s0, $t1	
	# _tmp378 = _tmp377 || _tmp376
	  or $s3, $s2, $s1	
	# _tmp379 = d < _tmp373
	  slt $s4, $t1, $t6	
	# _tmp380 = _tmp379 || _tmp378
	  or $s5, $s4, $s3	
	# IfZ _tmp380 Goto _L26
	# (save modified registers before flow of control change)
	  sw $t0, -92($fp)	# spill _tmp369 from $t0 to $fp-92
	  sw $t1, -64($fp)	# spill d from $t1 to $fp-64
	  sw $t2, -96($fp)	# spill _tmp370 from $t2 to $fp-96
	  sw $t4, -100($fp)	# spill _tmp371 from $t4 to $fp-100
	  sw $t5, -104($fp)	# spill _tmp372 from $t5 to $fp-104
	  sw $t6, -108($fp)	# spill _tmp373 from $t6 to $fp-108
	  sw $t7, -112($fp)	# spill _tmp374 from $t7 to $fp-112
	  sw $s0, -116($fp)	# spill _tmp375 from $s0 to $fp-116
	  sw $s1, -120($fp)	# spill _tmp376 from $s1 to $fp-120
	  sw $s2, -124($fp)	# spill _tmp377 from $s2 to $fp-124
	  sw $s3, -128($fp)	# spill _tmp378 from $s3 to $fp-128
	  sw $s4, -132($fp)	# spill _tmp379 from $s4 to $fp-132
	  sw $s5, -136($fp)	# spill _tmp380 from $s5 to $fp-136
	  beqz $s5, _L26	# branch if _tmp380 is zero 
	# _tmp381 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string15: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string15	# load label
	# PushParam _tmp381
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -140($fp)	# spill _tmp381 from $t0 to $fp-140
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L26:
	# _tmp382 = d * _tmp374
	  lw $t0, -64($fp)	# load d from $fp-64 into $t0
	  lw $t1, -112($fp)	# load _tmp374 from $fp-112 into $t1
	  mul $t2, $t0, $t1	
	# _tmp383 = _tmp382 + _tmp374
	  add $t3, $t2, $t1	
	# _tmp384 = _tmp372 + _tmp383
	  lw $t4, -104($fp)	# load _tmp372 from $fp-104 into $t4
	  add $t5, $t4, $t3	
	# _tmp385 = *(_tmp384)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp386 = *(_tmp385)
	  lw $t7, 0($t6) 	# load with offset
	# _tmp387 = *(_tmp386)
	  lw $s0, 0($t7) 	# load with offset
	# _tmp388 = ACall _tmp387
	# (save modified registers before flow of control change)
	  sw $t2, -144($fp)	# spill _tmp382 from $t2 to $fp-144
	  sw $t3, -148($fp)	# spill _tmp383 from $t3 to $fp-148
	  sw $t5, -152($fp)	# spill _tmp384 from $t5 to $fp-152
	  sw $t6, -156($fp)	# spill _tmp385 from $t6 to $fp-156
	  sw $t7, -160($fp)	# spill _tmp386 from $t7 to $fp-160
	  sw $s0, -164($fp)	# spill _tmp387 from $s0 to $fp-164
	  jalr $s0            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp389 = _tmp385 - _tmp388
	  lw $t1, -156($fp)	# load _tmp385 from $fp-156 into $t1
	  sub $t2, $t1, $t0	
	# _tmp390 = *(_tmp386 + 12)
	  lw $t3, -160($fp)	# load _tmp386 from $fp-160 into $t3
	  lw $t4, 12($t3) 	# load with offset
	# PushParam _tmp389
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp391 = ACall _tmp390
	# (save modified registers before flow of control change)
	  sw $t0, -168($fp)	# spill _tmp388 from $t0 to $fp-168
	  sw $t2, -172($fp)	# spill _tmp389 from $t2 to $fp-172
	  sw $t4, -176($fp)	# spill _tmp390 from $t4 to $fp-176
	  jalr $t4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# c = _tmp391
	  move $t1, $t0		# copy value
	# Goto _L24
	# (save modified registers before flow of control change)
	  sw $t0, -180($fp)	# spill _tmp391 from $t0 to $fp-180
	  sw $t1, -8($fp)	# spill c from $t1 to $fp-8
	  b _L24		# unconditional branch
  _L25:
	# _tmp392 = 10
	  li $t0, 10		# load constant value 10 into $t0
	# _tmp393 = _tmp392 < c
	  lw $t1, -8($fp)	# load c from $fp-8 into $t1
	  slt $t2, $t0, $t1	
	# IfZ _tmp393 Goto _L28
	# (save modified registers before flow of control change)
	  sw $t0, -184($fp)	# spill _tmp392 from $t0 to $fp-184
	  sw $t2, -188($fp)	# spill _tmp393 from $t2 to $fp-188
	  beqz $t2, _L28	# branch if _tmp393 is zero 
	# _tmp394 = 10
	  li $t0, 10		# load constant value 10 into $t0
	# c = _tmp394
	  move $t1, $t0		# copy value
	# Goto _L27
	# (save modified registers before flow of control change)
	  sw $t0, -192($fp)	# spill _tmp394 from $t0 to $fp-192
	  sw $t1, -8($fp)	# spill c from $t1 to $fp-8
	  b _L27		# unconditional branch
  _L28:
	# _tmp395 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp396 = c == _tmp395
	  lw $t1, -8($fp)	# load c from $fp-8 into $t1
	  seq $t2, $t1, $t0	
	# IfZ _tmp396 Goto _L29
	# (save modified registers before flow of control change)
	  sw $t0, -196($fp)	# spill _tmp395 from $t0 to $fp-196
	  sw $t2, -200($fp)	# spill _tmp396 from $t2 to $fp-200
	  beqz $t2, _L29	# branch if _tmp396 is zero 
	# _tmp397 = 11
	  li $t0, 11		# load constant value 11 into $t0
	# c = _tmp397
	  move $t1, $t0		# copy value
	# (save modified registers before flow of control change)
	  sw $t0, -204($fp)	# spill _tmp397 from $t0 to $fp-204
	  sw $t1, -8($fp)	# spill c from $t1 to $fp-8
  _L29:
  _L27:
	# _tmp398 = 8
	  li $t0, 8		# load constant value 8 into $t0
	# _tmp399 = this + _tmp398
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp400 = *(_tmp399)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp401 = 8
	  li $t4, 8		# load constant value 8 into $t4
	# _tmp402 = this + _tmp401
	  add $t5, $t1, $t4	
	# _tmp403 = *(_tmp402)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp404 = 1
	  li $t7, 1		# load constant value 1 into $t7
	# _tmp405 = _tmp403 + _tmp404
	  add $s0, $t6, $t7	
	# _tmp406 = 8
	  li $s1, 8		# load constant value 8 into $s1
	# _tmp407 = this + _tmp406
	  add $s2, $t1, $s1	
	# *(_tmp407) = _tmp405
	  sw $s0, 0($s2) 	# store with offset
	# Return c
	  lw $s3, -8($fp)	# load c from $fp-8 into $s3
	  move $v0, $s3		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_BJDeck.Shuffle:
	# BeginFunc 144
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 144	# decrement sp to make space for locals/temps
	# _tmp408 = "Shuffling..."
	  .data			# create string constant marked with label
	  _string16: .asciiz "Shuffling..."
	  .text
	  la $t0, _string16	# load label
	# PushParam _tmp408
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -12($fp)	# spill _tmp408 from $t0 to $fp-12
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp409 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp409
	  move $t1, $t0		# copy value
	# (save modified registers before flow of control change)
	  sw $t0, -16($fp)	# spill _tmp409 from $t0 to $fp-16
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
  _L30:
	# _tmp410 = 8
	  li $t0, 8		# load constant value 8 into $t0
	# _tmp411 = i < _tmp410
	  lw $t1, -8($fp)	# load i from $fp-8 into $t1
	  slt $t2, $t1, $t0	
	# IfZ _tmp411 Goto _L31
	# (save modified registers before flow of control change)
	  sw $t0, -20($fp)	# spill _tmp410 from $t0 to $fp-20
	  sw $t2, -24($fp)	# spill _tmp411 from $t2 to $fp-24
	  beqz $t2, _L31	# branch if _tmp411 is zero 
	# _tmp412 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp413 = this + _tmp412
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp414 = *(_tmp413)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp415 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp416 = 4
	  li $t5, 4		# load constant value 4 into $t5
	# _tmp417 = *(_tmp414)
	  lw $t6, 0($t3) 	# load with offset
	# _tmp418 = _tmp417 == i
	  lw $t7, -8($fp)	# load i from $fp-8 into $t7
	  seq $s0, $t6, $t7	
	# _tmp419 = _tmp417 < i
	  slt $s1, $t6, $t7	
	# _tmp420 = _tmp419 || _tmp418
	  or $s2, $s1, $s0	
	# _tmp421 = i < _tmp415
	  slt $s3, $t7, $t4	
	# _tmp422 = _tmp421 || _tmp420
	  or $s4, $s3, $s2	
	# IfZ _tmp422 Goto _L32
	# (save modified registers before flow of control change)
	  sw $t0, -28($fp)	# spill _tmp412 from $t0 to $fp-28
	  sw $t2, -32($fp)	# spill _tmp413 from $t2 to $fp-32
	  sw $t3, -36($fp)	# spill _tmp414 from $t3 to $fp-36
	  sw $t4, -40($fp)	# spill _tmp415 from $t4 to $fp-40
	  sw $t5, -44($fp)	# spill _tmp416 from $t5 to $fp-44
	  sw $t6, -48($fp)	# spill _tmp417 from $t6 to $fp-48
	  sw $s0, -52($fp)	# spill _tmp418 from $s0 to $fp-52
	  sw $s1, -56($fp)	# spill _tmp419 from $s1 to $fp-56
	  sw $s2, -60($fp)	# spill _tmp420 from $s2 to $fp-60
	  sw $s3, -64($fp)	# spill _tmp421 from $s3 to $fp-64
	  sw $s4, -68($fp)	# spill _tmp422 from $s4 to $fp-68
	  beqz $s4, _L32	# branch if _tmp422 is zero 
	# _tmp423 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string17: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string17	# load label
	# PushParam _tmp423
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -72($fp)	# spill _tmp423 from $t0 to $fp-72
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L32:
	# _tmp424 = i * _tmp416
	  lw $t0, -8($fp)	# load i from $fp-8 into $t0
	  lw $t1, -44($fp)	# load _tmp416 from $fp-44 into $t1
	  mul $t2, $t0, $t1	
	# _tmp425 = _tmp424 + _tmp416
	  add $t3, $t2, $t1	
	# _tmp426 = _tmp414 + _tmp425
	  lw $t4, -36($fp)	# load _tmp414 from $fp-36 into $t4
	  add $t5, $t4, $t3	
	# _tmp427 = *(_tmp426)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp428 = *(_tmp427)
	  lw $t7, 0($t6) 	# load with offset
	# _tmp429 = *(_tmp428)
	  lw $s0, 0($t7) 	# load with offset
	# _tmp430 = ACall _tmp429
	# (save modified registers before flow of control change)
	  sw $t2, -76($fp)	# spill _tmp424 from $t2 to $fp-76
	  sw $t3, -80($fp)	# spill _tmp425 from $t3 to $fp-80
	  sw $t5, -84($fp)	# spill _tmp426 from $t5 to $fp-84
	  sw $t6, -88($fp)	# spill _tmp427 from $t6 to $fp-88
	  sw $t7, -92($fp)	# spill _tmp428 from $t7 to $fp-92
	  sw $s0, -96($fp)	# spill _tmp429 from $s0 to $fp-96
	  jalr $s0            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp431 = _tmp427 - _tmp430
	  lw $t1, -88($fp)	# load _tmp427 from $fp-88 into $t1
	  sub $t2, $t1, $t0	
	# _tmp432 = *(_tmp428 + 8)
	  lw $t3, -92($fp)	# load _tmp428 from $fp-92 into $t3
	  lw $t4, 8($t3) 	# load with offset
	# PushParam _tmp431
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp432
	# (save modified registers before flow of control change)
	  sw $t0, -100($fp)	# spill _tmp430 from $t0 to $fp-100
	  sw $t2, -104($fp)	# spill _tmp431 from $t2 to $fp-104
	  sw $t4, -108($fp)	# spill _tmp432 from $t4 to $fp-108
	  jalr $t4            	# jump to function
	# _tmp433 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp434 = 1
	  li $t1, 1		# load constant value 1 into $t1
	# _tmp435 = i + _tmp434
	  lw $t2, -8($fp)	# load i from $fp-8 into $t2
	  add $t3, $t2, $t1	
	# i = _tmp435
	  move $t2, $t3		# copy value
	# Goto _L30
	# (save modified registers before flow of control change)
	  sw $t0, -112($fp)	# spill _tmp433 from $t0 to $fp-112
	  sw $t1, -116($fp)	# spill _tmp434 from $t1 to $fp-116
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	  sw $t3, -120($fp)	# spill _tmp435 from $t3 to $fp-120
	  b _L30		# unconditional branch
  _L31:
	# _tmp436 = 8
	  li $t0, 8		# load constant value 8 into $t0
	# _tmp437 = this + _tmp436
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp438 = *(_tmp437)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp439 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp440 = 8
	  li $t5, 8		# load constant value 8 into $t5
	# _tmp441 = this + _tmp440
	  add $t6, $t1, $t5	
	# *(_tmp441) = _tmp439
	  sw $t4, 0($t6) 	# store with offset
	# _tmp442 = "done.\n"
	  .data			# create string constant marked with label
	  _string18: .asciiz "done.\n"
	  .text
	  la $t7, _string18	# load label
	# PushParam _tmp442
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t7, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -124($fp)	# spill _tmp436 from $t0 to $fp-124
	  sw $t2, -128($fp)	# spill _tmp437 from $t2 to $fp-128
	  sw $t3, -132($fp)	# spill _tmp438 from $t3 to $fp-132
	  sw $t4, -136($fp)	# spill _tmp439 from $t4 to $fp-136
	  sw $t5, -140($fp)	# spill _tmp440 from $t5 to $fp-140
	  sw $t6, -144($fp)	# spill _tmp441 from $t6 to $fp-144
	  sw $t7, -148($fp)	# spill _tmp442 from $t7 to $fp-148
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_BJDeck.NumCardsRemaining:
	# BeginFunc 28
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 28	# decrement sp to make space for locals/temps
	# _tmp443 = 8
	  li $t0, 8		# load constant value 8 into $t0
	# _tmp444 = 52
	  li $t1, 52		# load constant value 52 into $t1
	# _tmp445 = _tmp443 * _tmp444
	  mul $t2, $t0, $t1	
	# _tmp446 = 8
	  li $t3, 8		# load constant value 8 into $t3
	# _tmp447 = this + _tmp446
	  lw $t4, 4($fp)	# load this from $fp+4 into $t4
	  add $t5, $t4, $t3	
	# _tmp448 = *(_tmp447)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp449 = _tmp445 - _tmp448
	  sub $t7, $t2, $t6	
	# Return _tmp449
	  move $v0, $t7		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _offset_Player_0:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp450 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp450
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Player
	  .data
	  .align 2
	  Player:		# label for class Player vtable
	  .word _offset_Player_0
	  .word f_Player.Init
	  .word f_Player.Hit
	  .word f_Player.DoubleDown
	  .word f_Player.TakeTurn
	  .word f_Player.HasMoney
	  .word f_Player.PrintMoney
	  .word f_Player.PlaceBet
	  .word f_Player.GetTotal
	  .word f_Player.Resolve
	  .text
  f_Player.Init:
	# BeginFunc 56
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 56	# decrement sp to make space for locals/temps
	# _tmp451 = 20
	  li $t0, 20		# load constant value 20 into $t0
	# _tmp452 = this + _tmp451
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp453 = *(_tmp452)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp454 = 1000
	  li $t4, 1000		# load constant value 1000 into $t4
	# _tmp455 = 20
	  li $t5, 20		# load constant value 20 into $t5
	# _tmp456 = this + _tmp455
	  add $t6, $t1, $t5	
	# *(_tmp456) = _tmp454
	  sw $t4, 0($t6) 	# store with offset
	# _tmp457 = "What is the name of player #"
	  .data			# create string constant marked with label
	  _string19: .asciiz "What is the name of player #"
	  .text
	  la $t7, _string19	# load label
	# PushParam _tmp457
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t7, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -8($fp)	# spill _tmp451 from $t0 to $fp-8
	  sw $t2, -12($fp)	# spill _tmp452 from $t2 to $fp-12
	  sw $t3, -16($fp)	# spill _tmp453 from $t3 to $fp-16
	  sw $t4, -20($fp)	# spill _tmp454 from $t4 to $fp-20
	  sw $t5, -24($fp)	# spill _tmp455 from $t5 to $fp-24
	  sw $t6, -28($fp)	# spill _tmp456 from $t6 to $fp-28
	  sw $t7, -32($fp)	# spill _tmp457 from $t7 to $fp-32
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam num
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# load num from $fp+8 into $t0
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp458 = "? "
	  .data			# create string constant marked with label
	  _string20: .asciiz "? "
	  .text
	  la $t0, _string20	# load label
	# PushParam _tmp458
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -36($fp)	# spill _tmp458 from $t0 to $fp-36
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp459 = 24
	  li $t0, 24		# load constant value 24 into $t0
	# _tmp460 = this + _tmp459
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp461 = *(_tmp460)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp462 = LCall _ReadLine
	# (save modified registers before flow of control change)
	  sw $t0, -40($fp)	# spill _tmp459 from $t0 to $fp-40
	  sw $t2, -44($fp)	# spill _tmp460 from $t2 to $fp-44
	  sw $t3, -48($fp)	# spill _tmp461 from $t3 to $fp-48
	  jal _ReadLine      	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp463 = 24
	  li $t1, 24		# load constant value 24 into $t1
	# _tmp464 = this + _tmp463
	  lw $t2, 4($fp)	# load this from $fp+4 into $t2
	  add $t3, $t2, $t1	
	# *(_tmp464) = _tmp462
	  sw $t0, 0($t3) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_Player.Hit:
	# BeginFunc 296
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 296	# decrement sp to make space for locals/temps
	# _tmp465 = *(deck)
	  lw $t0, 8($fp)	# load deck from $fp+8 into $t0
	  lw $t1, 0($t0) 	# load with offset
	# _tmp466 = *(_tmp465)
	  lw $t2, 0($t1) 	# load with offset
	# _tmp467 = ACall _tmp466
	# (save modified registers before flow of control change)
	  sw $t1, -12($fp)	# spill _tmp465 from $t1 to $fp-12
	  sw $t2, -16($fp)	# spill _tmp466 from $t2 to $fp-16
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp468 = deck - _tmp467
	  lw $t1, 8($fp)	# load deck from $fp+8 into $t1
	  sub $t2, $t1, $t0	
	# _tmp469 = *(_tmp465 + 8)
	  lw $t3, -12($fp)	# load _tmp465 from $fp-12 into $t3
	  lw $t4, 8($t3) 	# load with offset
	# PushParam _tmp468
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp470 = ACall _tmp469
	# (save modified registers before flow of control change)
	  sw $t0, -20($fp)	# spill _tmp467 from $t0 to $fp-20
	  sw $t2, -24($fp)	# spill _tmp468 from $t2 to $fp-24
	  sw $t4, -28($fp)	# spill _tmp469 from $t4 to $fp-28
	  jalr $t4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# card = _tmp470
	  move $t1, $t0		# copy value
	# _tmp471 = 24
	  li $t2, 24		# load constant value 24 into $t2
	# _tmp472 = this + _tmp471
	  lw $t3, 4($fp)	# load this from $fp+4 into $t3
	  add $t4, $t3, $t2	
	# _tmp473 = *(_tmp472)
	  lw $t5, 0($t4) 	# load with offset
	# PushParam _tmp473
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -32($fp)	# spill _tmp470 from $t0 to $fp-32
	  sw $t1, -8($fp)	# spill card from $t1 to $fp-8
	  sw $t2, -36($fp)	# spill _tmp471 from $t2 to $fp-36
	  sw $t4, -40($fp)	# spill _tmp472 from $t4 to $fp-40
	  sw $t5, -44($fp)	# spill _tmp473 from $t5 to $fp-44
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp474 = " was dealt a "
	  .data			# create string constant marked with label
	  _string21: .asciiz " was dealt a "
	  .text
	  la $t0, _string21	# load label
	# PushParam _tmp474
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -48($fp)	# spill _tmp474 from $t0 to $fp-48
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam card
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# load card from $fp-8 into $t0
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp475 = ".\n"
	  .data			# create string constant marked with label
	  _string22: .asciiz ".\n"
	  .text
	  la $t0, _string22	# load label
	# PushParam _tmp475
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -52($fp)	# spill _tmp475 from $t0 to $fp-52
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp476 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp477 = this + _tmp476
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp478 = *(_tmp477)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp479 = 4
	  li $t4, 4		# load constant value 4 into $t4
	# _tmp480 = this + _tmp479
	  add $t5, $t1, $t4	
	# _tmp481 = *(_tmp480)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp482 = _tmp481 + card
	  lw $t7, -8($fp)	# load card from $fp-8 into $t7
	  add $s0, $t6, $t7	
	# _tmp483 = 4
	  li $s1, 4		# load constant value 4 into $s1
	# _tmp484 = this + _tmp483
	  add $s2, $t1, $s1	
	# *(_tmp484) = _tmp482
	  sw $s0, 0($s2) 	# store with offset
	# _tmp485 = 12
	  li $s3, 12		# load constant value 12 into $s3
	# _tmp486 = this + _tmp485
	  add $s4, $t1, $s3	
	# _tmp487 = *(_tmp486)
	  lw $s5, 0($s4) 	# load with offset
	# _tmp488 = 12
	  li $s6, 12		# load constant value 12 into $s6
	# _tmp489 = this + _tmp488
	  add $s7, $t1, $s6	
	# _tmp490 = *(_tmp489)
	  lw $t8, 0($s7) 	# load with offset
	# _tmp491 = 1
	  li $t9, 1		# load constant value 1 into $t9
	# _tmp492 = _tmp490 + _tmp491
	  add $t1, $t8, $t9	
	# _tmp493 = 12
	  li $t7, 12		# load constant value 12 into $t7
	# _tmp494 = this + _tmp493
	  sw $t0, -56($fp)	# spill _tmp476 from $t0 to $fp-56
	  lw $t0, 4($fp)	# load this from $fp+4 into $t0
	  sw $t1, -120($fp)	# spill _tmp492 from $t1 to $fp-120
	  add $t1, $t0, $t7	
	# *(_tmp494) = _tmp492
	  lw $t0, -120($fp)	# load _tmp492 from $fp-120 into $t0
	  sw $t0, 0($t1) 	# store with offset
	# _tmp495 = 11
	  li $t0, 11		# load constant value 11 into $t0
	# _tmp496 = card == _tmp495
	  sw $t2, -60($fp)	# spill _tmp477 from $t2 to $fp-60
	  lw $t2, -8($fp)	# load card from $fp-8 into $t2
	  sw $t3, -64($fp)	# spill _tmp478 from $t3 to $fp-64
	  seq $t3, $t2, $t0	
	# IfZ _tmp496 Goto _L33
	# (save modified registers before flow of control change)
	  sw $t0, -132($fp)	# spill _tmp495 from $t0 to $fp-132
	  sw $t1, -128($fp)	# spill _tmp494 from $t1 to $fp-128
	  sw $t3, -136($fp)	# spill _tmp496 from $t3 to $fp-136
	  sw $t4, -68($fp)	# spill _tmp479 from $t4 to $fp-68
	  sw $t5, -72($fp)	# spill _tmp480 from $t5 to $fp-72
	  sw $t6, -76($fp)	# spill _tmp481 from $t6 to $fp-76
	  sw $t7, -124($fp)	# spill _tmp493 from $t7 to $fp-124
	  sw $s0, -80($fp)	# spill _tmp482 from $s0 to $fp-80
	  sw $s1, -84($fp)	# spill _tmp483 from $s1 to $fp-84
	  sw $s2, -88($fp)	# spill _tmp484 from $s2 to $fp-88
	  sw $s3, -92($fp)	# spill _tmp485 from $s3 to $fp-92
	  sw $s4, -96($fp)	# spill _tmp486 from $s4 to $fp-96
	  sw $s5, -100($fp)	# spill _tmp487 from $s5 to $fp-100
	  sw $s6, -104($fp)	# spill _tmp488 from $s6 to $fp-104
	  sw $s7, -108($fp)	# spill _tmp489 from $s7 to $fp-108
	  sw $t8, -112($fp)	# spill _tmp490 from $t8 to $fp-112
	  sw $t9, -116($fp)	# spill _tmp491 from $t9 to $fp-116
	  beqz $t3, _L33	# branch if _tmp496 is zero 
	# _tmp497 = 8
	  li $t0, 8		# load constant value 8 into $t0
	# _tmp498 = this + _tmp497
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp499 = *(_tmp498)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp500 = 8
	  li $t4, 8		# load constant value 8 into $t4
	# _tmp501 = this + _tmp500
	  add $t5, $t1, $t4	
	# _tmp502 = *(_tmp501)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp503 = 1
	  li $t7, 1		# load constant value 1 into $t7
	# _tmp504 = _tmp502 + _tmp503
	  add $s0, $t6, $t7	
	# _tmp505 = 8
	  li $s1, 8		# load constant value 8 into $s1
	# _tmp506 = this + _tmp505
	  add $s2, $t1, $s1	
	# *(_tmp506) = _tmp504
	  sw $s0, 0($s2) 	# store with offset
	# (save modified registers before flow of control change)
	  sw $t0, -140($fp)	# spill _tmp497 from $t0 to $fp-140
	  sw $t2, -144($fp)	# spill _tmp498 from $t2 to $fp-144
	  sw $t3, -148($fp)	# spill _tmp499 from $t3 to $fp-148
	  sw $t4, -152($fp)	# spill _tmp500 from $t4 to $fp-152
	  sw $t5, -156($fp)	# spill _tmp501 from $t5 to $fp-156
	  sw $t6, -160($fp)	# spill _tmp502 from $t6 to $fp-160
	  sw $t7, -164($fp)	# spill _tmp503 from $t7 to $fp-164
	  sw $s0, -168($fp)	# spill _tmp504 from $s0 to $fp-168
	  sw $s1, -172($fp)	# spill _tmp505 from $s1 to $fp-172
	  sw $s2, -176($fp)	# spill _tmp506 from $s2 to $fp-176
  _L33:
  _L34:
	# _tmp507 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp508 = this + _tmp507
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp509 = *(_tmp508)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp510 = 21
	  li $t4, 21		# load constant value 21 into $t4
	# _tmp511 = _tmp510 < _tmp509
	  slt $t5, $t4, $t3	
	# _tmp512 = 8
	  li $t6, 8		# load constant value 8 into $t6
	# _tmp513 = this + _tmp512
	  add $t7, $t1, $t6	
	# _tmp514 = *(_tmp513)
	  lw $s0, 0($t7) 	# load with offset
	# _tmp515 = 0
	  li $s1, 0		# load constant value 0 into $s1
	# _tmp516 = _tmp515 < _tmp514
	  slt $s2, $s1, $s0	
	# _tmp517 = _tmp511 && _tmp516
	  and $s3, $t5, $s2	
	# IfZ _tmp517 Goto _L35
	# (save modified registers before flow of control change)
	  sw $t0, -180($fp)	# spill _tmp507 from $t0 to $fp-180
	  sw $t2, -184($fp)	# spill _tmp508 from $t2 to $fp-184
	  sw $t3, -188($fp)	# spill _tmp509 from $t3 to $fp-188
	  sw $t4, -192($fp)	# spill _tmp510 from $t4 to $fp-192
	  sw $t5, -196($fp)	# spill _tmp511 from $t5 to $fp-196
	  sw $t6, -200($fp)	# spill _tmp512 from $t6 to $fp-200
	  sw $t7, -204($fp)	# spill _tmp513 from $t7 to $fp-204
	  sw $s0, -208($fp)	# spill _tmp514 from $s0 to $fp-208
	  sw $s1, -212($fp)	# spill _tmp515 from $s1 to $fp-212
	  sw $s2, -216($fp)	# spill _tmp516 from $s2 to $fp-216
	  sw $s3, -220($fp)	# spill _tmp517 from $s3 to $fp-220
	  beqz $s3, _L35	# branch if _tmp517 is zero 
	# _tmp518 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp519 = this + _tmp518
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp520 = *(_tmp519)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp521 = 4
	  li $t4, 4		# load constant value 4 into $t4
	# _tmp522 = this + _tmp521
	  add $t5, $t1, $t4	
	# _tmp523 = *(_tmp522)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp524 = 10
	  li $t7, 10		# load constant value 10 into $t7
	# _tmp525 = _tmp523 - _tmp524
	  sub $s0, $t6, $t7	
	# _tmp526 = 4
	  li $s1, 4		# load constant value 4 into $s1
	# _tmp527 = this + _tmp526
	  add $s2, $t1, $s1	
	# *(_tmp527) = _tmp525
	  sw $s0, 0($s2) 	# store with offset
	# _tmp528 = 8
	  li $s3, 8		# load constant value 8 into $s3
	# _tmp529 = this + _tmp528
	  add $s4, $t1, $s3	
	# _tmp530 = *(_tmp529)
	  lw $s5, 0($s4) 	# load with offset
	# _tmp531 = 8
	  li $s6, 8		# load constant value 8 into $s6
	# _tmp532 = this + _tmp531
	  add $s7, $t1, $s6	
	# _tmp533 = *(_tmp532)
	  lw $t8, 0($s7) 	# load with offset
	# _tmp534 = 1
	  li $t9, 1		# load constant value 1 into $t9
	# _tmp535 = _tmp533 - _tmp534
	  sub $t1, $t8, $t9	
	# _tmp536 = 8
	  sw $t4, -236($fp)	# spill _tmp521 from $t4 to $fp-236
	  li $t4, 8		# load constant value 8 into $t4
	# _tmp537 = this + _tmp536
	  sw $t5, -240($fp)	# spill _tmp522 from $t5 to $fp-240
	  lw $t5, 4($fp)	# load this from $fp+4 into $t5
	  sw $t6, -244($fp)	# spill _tmp523 from $t6 to $fp-244
	  add $t6, $t5, $t4	
	# *(_tmp537) = _tmp535
	  sw $t1, 0($t6) 	# store with offset
	# Goto _L34
	# (save modified registers before flow of control change)
	  sw $t0, -224($fp)	# spill _tmp518 from $t0 to $fp-224
	  sw $t1, -292($fp)	# spill _tmp535 from $t1 to $fp-292
	  sw $t2, -228($fp)	# spill _tmp519 from $t2 to $fp-228
	  sw $t3, -232($fp)	# spill _tmp520 from $t3 to $fp-232
	  sw $t4, -296($fp)	# spill _tmp536 from $t4 to $fp-296
	  sw $t6, -300($fp)	# spill _tmp537 from $t6 to $fp-300
	  sw $t7, -248($fp)	# spill _tmp524 from $t7 to $fp-248
	  sw $s0, -252($fp)	# spill _tmp525 from $s0 to $fp-252
	  sw $s1, -256($fp)	# spill _tmp526 from $s1 to $fp-256
	  sw $s2, -260($fp)	# spill _tmp527 from $s2 to $fp-260
	  sw $s3, -264($fp)	# spill _tmp528 from $s3 to $fp-264
	  sw $s4, -268($fp)	# spill _tmp529 from $s4 to $fp-268
	  sw $s5, -272($fp)	# spill _tmp530 from $s5 to $fp-272
	  sw $s6, -276($fp)	# spill _tmp531 from $s6 to $fp-276
	  sw $s7, -280($fp)	# spill _tmp532 from $s7 to $fp-280
	  sw $t8, -284($fp)	# spill _tmp533 from $t8 to $fp-284
	  sw $t9, -288($fp)	# spill _tmp534 from $t9 to $fp-288
	  b _L34		# unconditional branch
  _L35:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_Player.DoubleDown:
	# BeginFunc 180
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 180	# decrement sp to make space for locals/temps
	# _tmp538 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp539 = this + _tmp538
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp540 = *(_tmp539)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp541 = 10
	  li $t4, 10		# load constant value 10 into $t4
	# _tmp542 = 0
	  li $t5, 0		# load constant value 0 into $t5
	# _tmp543 = _tmp540 == _tmp541
	  seq $t6, $t3, $t4	
	# _tmp544 = _tmp543 == _tmp542
	  seq $t7, $t6, $t5	
	# _tmp545 = 4
	  li $s0, 4		# load constant value 4 into $s0
	# _tmp546 = this + _tmp545
	  add $s1, $t1, $s0	
	# _tmp547 = *(_tmp546)
	  lw $s2, 0($s1) 	# load with offset
	# _tmp548 = 11
	  li $s3, 11		# load constant value 11 into $s3
	# _tmp549 = 0
	  li $s4, 0		# load constant value 0 into $s4
	# _tmp550 = _tmp547 == _tmp548
	  seq $s5, $s2, $s3	
	# _tmp551 = _tmp550 == _tmp549
	  seq $s6, $s5, $s4	
	# _tmp552 = _tmp544 && _tmp551
	  and $s7, $t7, $s6	
	# IfZ _tmp552 Goto _L36
	# (save modified registers before flow of control change)
	  sw $t0, -12($fp)	# spill _tmp538 from $t0 to $fp-12
	  sw $t2, -16($fp)	# spill _tmp539 from $t2 to $fp-16
	  sw $t3, -20($fp)	# spill _tmp540 from $t3 to $fp-20
	  sw $t4, -24($fp)	# spill _tmp541 from $t4 to $fp-24
	  sw $t5, -28($fp)	# spill _tmp542 from $t5 to $fp-28
	  sw $t6, -32($fp)	# spill _tmp543 from $t6 to $fp-32
	  sw $t7, -36($fp)	# spill _tmp544 from $t7 to $fp-36
	  sw $s0, -40($fp)	# spill _tmp545 from $s0 to $fp-40
	  sw $s1, -44($fp)	# spill _tmp546 from $s1 to $fp-44
	  sw $s2, -48($fp)	# spill _tmp547 from $s2 to $fp-48
	  sw $s3, -52($fp)	# spill _tmp548 from $s3 to $fp-52
	  sw $s4, -56($fp)	# spill _tmp549 from $s4 to $fp-56
	  sw $s5, -60($fp)	# spill _tmp550 from $s5 to $fp-60
	  sw $s6, -64($fp)	# spill _tmp551 from $s6 to $fp-64
	  sw $s7, -68($fp)	# spill _tmp552 from $s7 to $fp-68
	  beqz $s7, _L36	# branch if _tmp552 is zero 
	# _tmp553 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp553
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L36:
	# _tmp554 = "Would you like to double down?"
	  .data			# create string constant marked with label
	  _string23: .asciiz "Would you like to double down?"
	  .text
	  la $t0, _string23	# load label
	# PushParam _tmp554
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp555 = LCall f_GetYesOrNo
	# (save modified registers before flow of control change)
	  sw $t0, -76($fp)	# spill _tmp554 from $t0 to $fp-76
	  jal f_GetYesOrNo   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp555 Goto _L37
	# (save modified registers before flow of control change)
	  sw $t0, -80($fp)	# spill _tmp555 from $t0 to $fp-80
	  beqz $t0, _L37	# branch if _tmp555 is zero 
	# _tmp556 = 16
	  li $t0, 16		# load constant value 16 into $t0
	# _tmp557 = this + _tmp556
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp558 = *(_tmp557)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp559 = 16
	  li $t4, 16		# load constant value 16 into $t4
	# _tmp560 = this + _tmp559
	  add $t5, $t1, $t4	
	# _tmp561 = *(_tmp560)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp562 = 2
	  li $t7, 2		# load constant value 2 into $t7
	# _tmp563 = _tmp561 * _tmp562
	  mul $s0, $t6, $t7	
	# _tmp564 = 16
	  li $s1, 16		# load constant value 16 into $s1
	# _tmp565 = this + _tmp564
	  add $s2, $t1, $s1	
	# *(_tmp565) = _tmp563
	  sw $s0, 0($s2) 	# store with offset
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $s3, 8($fp)	# load deck from $fp+8 into $s3
	  sw $s3, 4($sp)	# copy param value to stack
	# _tmp566 = *(this)
	  lw $s4, 0($t1) 	# load with offset
	# _tmp567 = *(_tmp566)
	  lw $s5, 0($s4) 	# load with offset
	# _tmp568 = ACall _tmp567
	# (save modified registers before flow of control change)
	  sw $t0, -84($fp)	# spill _tmp556 from $t0 to $fp-84
	  sw $t2, -88($fp)	# spill _tmp557 from $t2 to $fp-88
	  sw $t3, -92($fp)	# spill _tmp558 from $t3 to $fp-92
	  sw $t4, -96($fp)	# spill _tmp559 from $t4 to $fp-96
	  sw $t5, -100($fp)	# spill _tmp560 from $t5 to $fp-100
	  sw $t6, -104($fp)	# spill _tmp561 from $t6 to $fp-104
	  sw $t7, -108($fp)	# spill _tmp562 from $t7 to $fp-108
	  sw $s0, -112($fp)	# spill _tmp563 from $s0 to $fp-112
	  sw $s1, -116($fp)	# spill _tmp564 from $s1 to $fp-116
	  sw $s2, -120($fp)	# spill _tmp565 from $s2 to $fp-120
	  sw $s4, -124($fp)	# spill _tmp566 from $s4 to $fp-124
	  sw $s5, -128($fp)	# spill _tmp567 from $s5 to $fp-128
	  jalr $s5            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp569 = this - _tmp568
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  sub $t2, $t1, $t0	
	# _tmp570 = *(_tmp566 + 8)
	  lw $t3, -124($fp)	# load _tmp566 from $fp-124 into $t3
	  lw $t4, 8($t3) 	# load with offset
	# PushParam _tmp569
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp570
	# (save modified registers before flow of control change)
	  sw $t0, -132($fp)	# spill _tmp568 from $t0 to $fp-132
	  sw $t2, -136($fp)	# spill _tmp569 from $t2 to $fp-136
	  sw $t4, -140($fp)	# spill _tmp570 from $t4 to $fp-140
	  jalr $t4            	# jump to function
	# _tmp571 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp572 = 24
	  li $t1, 24		# load constant value 24 into $t1
	# _tmp573 = this + _tmp572
	  lw $t2, 4($fp)	# load this from $fp+4 into $t2
	  add $t3, $t2, $t1	
	# _tmp574 = *(_tmp573)
	  lw $t4, 0($t3) 	# load with offset
	# PushParam _tmp574
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -144($fp)	# spill _tmp571 from $t0 to $fp-144
	  sw $t1, -148($fp)	# spill _tmp572 from $t1 to $fp-148
	  sw $t3, -152($fp)	# spill _tmp573 from $t3 to $fp-152
	  sw $t4, -156($fp)	# spill _tmp574 from $t4 to $fp-156
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp575 = ", your total is "
	  .data			# create string constant marked with label
	  _string24: .asciiz ", your total is "
	  .text
	  la $t0, _string24	# load label
	# PushParam _tmp575
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -160($fp)	# spill _tmp575 from $t0 to $fp-160
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp576 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp577 = this + _tmp576
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp578 = *(_tmp577)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp578
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# (save modified registers before flow of control change)
	  sw $t0, -164($fp)	# spill _tmp576 from $t0 to $fp-164
	  sw $t2, -168($fp)	# spill _tmp577 from $t2 to $fp-168
	  sw $t3, -172($fp)	# spill _tmp578 from $t3 to $fp-172
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp579 = ".\n"
	  .data			# create string constant marked with label
	  _string25: .asciiz ".\n"
	  .text
	  la $t0, _string25	# load label
	# PushParam _tmp579
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -176($fp)	# spill _tmp579 from $t0 to $fp-176
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp580 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# Return _tmp580
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L37:
	# _tmp581 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp581
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_Player.TakeTurn:
	# BeginFunc 360
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 360	# decrement sp to make space for locals/temps
	# _tmp582 = "\n"
	  .data			# create string constant marked with label
	  _string26: .asciiz "\n"
	  .text
	  la $t0, _string26	# load label
	# PushParam _tmp582
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -12($fp)	# spill _tmp582 from $t0 to $fp-12
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp583 = 24
	  li $t0, 24		# load constant value 24 into $t0
	# _tmp584 = this + _tmp583
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp585 = *(_tmp584)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp585
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -16($fp)	# spill _tmp583 from $t0 to $fp-16
	  sw $t2, -20($fp)	# spill _tmp584 from $t2 to $fp-20
	  sw $t3, -24($fp)	# spill _tmp585 from $t3 to $fp-24
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp586 = "'s turn.\n"
	  .data			# create string constant marked with label
	  _string27: .asciiz "'s turn.\n"
	  .text
	  la $t0, _string27	# load label
	# PushParam _tmp586
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -28($fp)	# spill _tmp586 from $t0 to $fp-28
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp587 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp588 = this + _tmp587
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp589 = *(_tmp588)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp590 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp591 = 4
	  li $t5, 4		# load constant value 4 into $t5
	# _tmp592 = this + _tmp591
	  add $t6, $t1, $t5	
	# *(_tmp592) = _tmp590
	  sw $t4, 0($t6) 	# store with offset
	# _tmp593 = 8
	  li $t7, 8		# load constant value 8 into $t7
	# _tmp594 = this + _tmp593
	  add $s0, $t1, $t7	
	# _tmp595 = *(_tmp594)
	  lw $s1, 0($s0) 	# load with offset
	# _tmp596 = 0
	  li $s2, 0		# load constant value 0 into $s2
	# _tmp597 = 8
	  li $s3, 8		# load constant value 8 into $s3
	# _tmp598 = this + _tmp597
	  add $s4, $t1, $s3	
	# *(_tmp598) = _tmp596
	  sw $s2, 0($s4) 	# store with offset
	# _tmp599 = 12
	  li $s5, 12		# load constant value 12 into $s5
	# _tmp600 = this + _tmp599
	  add $s6, $t1, $s5	
	# _tmp601 = *(_tmp600)
	  lw $s7, 0($s6) 	# load with offset
	# _tmp602 = 0
	  li $t8, 0		# load constant value 0 into $t8
	# _tmp603 = 12
	  li $t9, 12		# load constant value 12 into $t9
	# _tmp604 = this + _tmp603
	  sw $t7, -56($fp)	# spill _tmp593 from $t7 to $fp-56
	  add $t7, $t1, $t9	
	# *(_tmp604) = _tmp602
	  sw $t8, 0($t7) 	# store with offset
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t1, 8($fp)	# load deck from $fp+8 into $t1
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp605 = *(this)
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  sw $s0, -60($fp)	# spill _tmp594 from $s0 to $fp-60
	  lw $s0, 0($t1) 	# load with offset
	# _tmp606 = *(_tmp605)
	  lw $t1, 0($s0) 	# load with offset
	# _tmp607 = ACall _tmp606
	# (save modified registers before flow of control change)
	  sw $t0, -32($fp)	# spill _tmp587 from $t0 to $fp-32
	  sw $t1, -108($fp)	# spill _tmp606 from $t1 to $fp-108
	  sw $t2, -36($fp)	# spill _tmp588 from $t2 to $fp-36
	  sw $t3, -40($fp)	# spill _tmp589 from $t3 to $fp-40
	  sw $t4, -44($fp)	# spill _tmp590 from $t4 to $fp-44
	  sw $t5, -48($fp)	# spill _tmp591 from $t5 to $fp-48
	  sw $t6, -52($fp)	# spill _tmp592 from $t6 to $fp-52
	  sw $t7, -100($fp)	# spill _tmp604 from $t7 to $fp-100
	  sw $s0, -104($fp)	# spill _tmp605 from $s0 to $fp-104
	  sw $s1, -64($fp)	# spill _tmp595 from $s1 to $fp-64
	  sw $s2, -68($fp)	# spill _tmp596 from $s2 to $fp-68
	  sw $s3, -72($fp)	# spill _tmp597 from $s3 to $fp-72
	  sw $s4, -76($fp)	# spill _tmp598 from $s4 to $fp-76
	  sw $s5, -80($fp)	# spill _tmp599 from $s5 to $fp-80
	  sw $s6, -84($fp)	# spill _tmp600 from $s6 to $fp-84
	  sw $s7, -88($fp)	# spill _tmp601 from $s7 to $fp-88
	  sw $t8, -92($fp)	# spill _tmp602 from $t8 to $fp-92
	  sw $t9, -96($fp)	# spill _tmp603 from $t9 to $fp-96
	  jalr $t1            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp608 = this - _tmp607
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  sub $t2, $t1, $t0	
	# _tmp609 = *(_tmp605 + 8)
	  lw $t3, -104($fp)	# load _tmp605 from $fp-104 into $t3
	  lw $t4, 8($t3) 	# load with offset
	# PushParam _tmp608
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp609
	# (save modified registers before flow of control change)
	  sw $t0, -112($fp)	# spill _tmp607 from $t0 to $fp-112
	  sw $t2, -116($fp)	# spill _tmp608 from $t2 to $fp-116
	  sw $t4, -120($fp)	# spill _tmp609 from $t4 to $fp-120
	  jalr $t4            	# jump to function
	# _tmp610 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t1, 8($fp)	# load deck from $fp+8 into $t1
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp611 = *(this)
	  lw $t2, 4($fp)	# load this from $fp+4 into $t2
	  lw $t3, 0($t2) 	# load with offset
	# _tmp612 = *(_tmp611)
	  lw $t4, 0($t3) 	# load with offset
	# _tmp613 = ACall _tmp612
	# (save modified registers before flow of control change)
	  sw $t0, -124($fp)	# spill _tmp610 from $t0 to $fp-124
	  sw $t3, -128($fp)	# spill _tmp611 from $t3 to $fp-128
	  sw $t4, -132($fp)	# spill _tmp612 from $t4 to $fp-132
	  jalr $t4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp614 = this - _tmp613
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  sub $t2, $t1, $t0	
	# _tmp615 = *(_tmp611 + 8)
	  lw $t3, -128($fp)	# load _tmp611 from $fp-128 into $t3
	  lw $t4, 8($t3) 	# load with offset
	# PushParam _tmp614
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp615
	# (save modified registers before flow of control change)
	  sw $t0, -136($fp)	# spill _tmp613 from $t0 to $fp-136
	  sw $t2, -140($fp)	# spill _tmp614 from $t2 to $fp-140
	  sw $t4, -144($fp)	# spill _tmp615 from $t4 to $fp-144
	  jalr $t4            	# jump to function
	# _tmp616 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t1, 8($fp)	# load deck from $fp+8 into $t1
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp617 = *(this)
	  lw $t2, 4($fp)	# load this from $fp+4 into $t2
	  lw $t3, 0($t2) 	# load with offset
	# _tmp618 = *(_tmp617)
	  lw $t4, 0($t3) 	# load with offset
	# _tmp619 = ACall _tmp618
	# (save modified registers before flow of control change)
	  sw $t0, -148($fp)	# spill _tmp616 from $t0 to $fp-148
	  sw $t3, -152($fp)	# spill _tmp617 from $t3 to $fp-152
	  sw $t4, -156($fp)	# spill _tmp618 from $t4 to $fp-156
	  jalr $t4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp620 = this - _tmp619
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  sub $t2, $t1, $t0	
	# _tmp621 = *(_tmp617 + 12)
	  lw $t3, -152($fp)	# load _tmp617 from $fp-152 into $t3
	  lw $t4, 12($t3) 	# load with offset
	# PushParam _tmp620
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp622 = ACall _tmp621
	# (save modified registers before flow of control change)
	  sw $t0, -160($fp)	# spill _tmp619 from $t0 to $fp-160
	  sw $t2, -164($fp)	# spill _tmp620 from $t2 to $fp-164
	  sw $t4, -168($fp)	# spill _tmp621 from $t4 to $fp-168
	  jalr $t4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp623 = 0
	  li $t1, 0		# load constant value 0 into $t1
	# _tmp624 = _tmp622 == _tmp623
	  seq $t2, $t0, $t1	
	# IfZ _tmp624 Goto _L38
	# (save modified registers before flow of control change)
	  sw $t0, -172($fp)	# spill _tmp622 from $t0 to $fp-172
	  sw $t1, -176($fp)	# spill _tmp623 from $t1 to $fp-176
	  sw $t2, -180($fp)	# spill _tmp624 from $t2 to $fp-180
	  beqz $t2, _L38	# branch if _tmp624 is zero 
	# _tmp625 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# stillGoing = _tmp625
	  move $t1, $t0		# copy value
	# (save modified registers before flow of control change)
	  sw $t0, -184($fp)	# spill _tmp625 from $t0 to $fp-184
	  sw $t1, -8($fp)	# spill stillGoing from $t1 to $fp-8
  _L39:
	# _tmp626 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp627 = this + _tmp626
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp628 = *(_tmp627)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp629 = 21
	  li $t4, 21		# load constant value 21 into $t4
	# _tmp630 = _tmp628 == _tmp629
	  seq $t5, $t3, $t4	
	# _tmp631 = _tmp628 < _tmp629
	  slt $t6, $t3, $t4	
	# _tmp632 = _tmp631 || _tmp630
	  or $t7, $t6, $t5	
	# _tmp633 = _tmp632 && stillGoing
	  lw $s0, -8($fp)	# load stillGoing from $fp-8 into $s0
	  and $s1, $t7, $s0	
	# IfZ _tmp633 Goto _L40
	# (save modified registers before flow of control change)
	  sw $t0, -188($fp)	# spill _tmp626 from $t0 to $fp-188
	  sw $t2, -192($fp)	# spill _tmp627 from $t2 to $fp-192
	  sw $t3, -196($fp)	# spill _tmp628 from $t3 to $fp-196
	  sw $t4, -200($fp)	# spill _tmp629 from $t4 to $fp-200
	  sw $t5, -204($fp)	# spill _tmp630 from $t5 to $fp-204
	  sw $t6, -208($fp)	# spill _tmp631 from $t6 to $fp-208
	  sw $t7, -212($fp)	# spill _tmp632 from $t7 to $fp-212
	  sw $s1, -216($fp)	# spill _tmp633 from $s1 to $fp-216
	  beqz $s1, _L40	# branch if _tmp633 is zero 
	# _tmp634 = 24
	  li $t0, 24		# load constant value 24 into $t0
	# _tmp635 = this + _tmp634
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp636 = *(_tmp635)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp636
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -220($fp)	# spill _tmp634 from $t0 to $fp-220
	  sw $t2, -224($fp)	# spill _tmp635 from $t2 to $fp-224
	  sw $t3, -228($fp)	# spill _tmp636 from $t3 to $fp-228
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp637 = ", your total is "
	  .data			# create string constant marked with label
	  _string28: .asciiz ", your total is "
	  .text
	  la $t0, _string28	# load label
	# PushParam _tmp637
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -232($fp)	# spill _tmp637 from $t0 to $fp-232
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp638 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp639 = this + _tmp638
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp640 = *(_tmp639)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp640
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# (save modified registers before flow of control change)
	  sw $t0, -236($fp)	# spill _tmp638 from $t0 to $fp-236
	  sw $t2, -240($fp)	# spill _tmp639 from $t2 to $fp-240
	  sw $t3, -244($fp)	# spill _tmp640 from $t3 to $fp-244
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp641 = ".\n"
	  .data			# create string constant marked with label
	  _string29: .asciiz ".\n"
	  .text
	  la $t0, _string29	# load label
	# PushParam _tmp641
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -248($fp)	# spill _tmp641 from $t0 to $fp-248
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp642 = "Would you like a hit?"
	  .data			# create string constant marked with label
	  _string30: .asciiz "Would you like a hit?"
	  .text
	  la $t0, _string30	# load label
	# PushParam _tmp642
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp643 = LCall f_GetYesOrNo
	# (save modified registers before flow of control change)
	  sw $t0, -252($fp)	# spill _tmp642 from $t0 to $fp-252
	  jal f_GetYesOrNo   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# stillGoing = _tmp643
	  move $t1, $t0		# copy value
	# IfZ stillGoing Goto _L41
	# (save modified registers before flow of control change)
	  sw $t0, -256($fp)	# spill _tmp643 from $t0 to $fp-256
	  sw $t1, -8($fp)	# spill stillGoing from $t1 to $fp-8
	  beqz $t1, _L41	# branch if stillGoing is zero 
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# load deck from $fp+8 into $t0
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp644 = *(this)
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  lw $t2, 0($t1) 	# load with offset
	# _tmp645 = *(_tmp644)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp646 = ACall _tmp645
	# (save modified registers before flow of control change)
	  sw $t2, -260($fp)	# spill _tmp644 from $t2 to $fp-260
	  sw $t3, -264($fp)	# spill _tmp645 from $t3 to $fp-264
	  jalr $t3            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp647 = this - _tmp646
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  sub $t2, $t1, $t0	
	# _tmp648 = *(_tmp644 + 8)
	  lw $t3, -260($fp)	# load _tmp644 from $fp-260 into $t3
	  lw $t4, 8($t3) 	# load with offset
	# PushParam _tmp647
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp648
	# (save modified registers before flow of control change)
	  sw $t0, -268($fp)	# spill _tmp646 from $t0 to $fp-268
	  sw $t2, -272($fp)	# spill _tmp647 from $t2 to $fp-272
	  sw $t4, -276($fp)	# spill _tmp648 from $t4 to $fp-276
	  jalr $t4            	# jump to function
	# _tmp649 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# (save modified registers before flow of control change)
	  sw $t0, -280($fp)	# spill _tmp649 from $t0 to $fp-280
  _L41:
	# Goto _L39
	  b _L39		# unconditional branch
  _L40:
  _L38:
	# _tmp650 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp651 = this + _tmp650
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp652 = *(_tmp651)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp653 = 21
	  li $t4, 21		# load constant value 21 into $t4
	# _tmp654 = _tmp653 < _tmp652
	  slt $t5, $t4, $t3	
	# IfZ _tmp654 Goto _L43
	# (save modified registers before flow of control change)
	  sw $t0, -284($fp)	# spill _tmp650 from $t0 to $fp-284
	  sw $t2, -288($fp)	# spill _tmp651 from $t2 to $fp-288
	  sw $t3, -292($fp)	# spill _tmp652 from $t3 to $fp-292
	  sw $t4, -296($fp)	# spill _tmp653 from $t4 to $fp-296
	  sw $t5, -300($fp)	# spill _tmp654 from $t5 to $fp-300
	  beqz $t5, _L43	# branch if _tmp654 is zero 
	# _tmp655 = 24
	  li $t0, 24		# load constant value 24 into $t0
	# _tmp656 = this + _tmp655
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp657 = *(_tmp656)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp657
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -304($fp)	# spill _tmp655 from $t0 to $fp-304
	  sw $t2, -308($fp)	# spill _tmp656 from $t2 to $fp-308
	  sw $t3, -312($fp)	# spill _tmp657 from $t3 to $fp-312
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp658 = " busts with the big "
	  .data			# create string constant marked with label
	  _string31: .asciiz " busts with the big "
	  .text
	  la $t0, _string31	# load label
	# PushParam _tmp658
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -316($fp)	# spill _tmp658 from $t0 to $fp-316
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp659 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp660 = this + _tmp659
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp661 = *(_tmp660)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp661
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# (save modified registers before flow of control change)
	  sw $t0, -320($fp)	# spill _tmp659 from $t0 to $fp-320
	  sw $t2, -324($fp)	# spill _tmp660 from $t2 to $fp-324
	  sw $t3, -328($fp)	# spill _tmp661 from $t3 to $fp-328
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp662 = "!\n"
	  .data			# create string constant marked with label
	  _string32: .asciiz "!\n"
	  .text
	  la $t0, _string32	# load label
	# PushParam _tmp662
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -332($fp)	# spill _tmp662 from $t0 to $fp-332
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L42
	  b _L42		# unconditional branch
  _L43:
	# _tmp663 = 24
	  li $t0, 24		# load constant value 24 into $t0
	# _tmp664 = this + _tmp663
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp665 = *(_tmp664)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp665
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -336($fp)	# spill _tmp663 from $t0 to $fp-336
	  sw $t2, -340($fp)	# spill _tmp664 from $t2 to $fp-340
	  sw $t3, -344($fp)	# spill _tmp665 from $t3 to $fp-344
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp666 = " stays at "
	  .data			# create string constant marked with label
	  _string33: .asciiz " stays at "
	  .text
	  la $t0, _string33	# load label
	# PushParam _tmp666
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -348($fp)	# spill _tmp666 from $t0 to $fp-348
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp667 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp668 = this + _tmp667
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp669 = *(_tmp668)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp669
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# (save modified registers before flow of control change)
	  sw $t0, -352($fp)	# spill _tmp667 from $t0 to $fp-352
	  sw $t2, -356($fp)	# spill _tmp668 from $t2 to $fp-356
	  sw $t3, -360($fp)	# spill _tmp669 from $t3 to $fp-360
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp670 = ".\n"
	  .data			# create string constant marked with label
	  _string34: .asciiz ".\n"
	  .text
	  la $t0, _string34	# load label
	# PushParam _tmp670
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -364($fp)	# spill _tmp670 from $t0 to $fp-364
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L42:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_Player.HasMoney:
	# BeginFunc 20
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 20	# decrement sp to make space for locals/temps
	# _tmp671 = 20
	  li $t0, 20		# load constant value 20 into $t0
	# _tmp672 = this + _tmp671
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp673 = *(_tmp672)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp674 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp675 = _tmp674 < _tmp673
	  slt $t5, $t4, $t3	
	# Return _tmp675
	  move $v0, $t5		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_Player.PrintMoney:
	# BeginFunc 32
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 32	# decrement sp to make space for locals/temps
	# _tmp676 = 24
	  li $t0, 24		# load constant value 24 into $t0
	# _tmp677 = this + _tmp676
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp678 = *(_tmp677)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp678
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -8($fp)	# spill _tmp676 from $t0 to $fp-8
	  sw $t2, -12($fp)	# spill _tmp677 from $t2 to $fp-12
	  sw $t3, -16($fp)	# spill _tmp678 from $t3 to $fp-16
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp679 = ", you have $"
	  .data			# create string constant marked with label
	  _string35: .asciiz ", you have $"
	  .text
	  la $t0, _string35	# load label
	# PushParam _tmp679
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -20($fp)	# spill _tmp679 from $t0 to $fp-20
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp680 = 20
	  li $t0, 20		# load constant value 20 into $t0
	# _tmp681 = this + _tmp680
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp682 = *(_tmp681)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp682
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# (save modified registers before flow of control change)
	  sw $t0, -24($fp)	# spill _tmp680 from $t0 to $fp-24
	  sw $t2, -28($fp)	# spill _tmp681 from $t2 to $fp-28
	  sw $t3, -32($fp)	# spill _tmp682 from $t3 to $fp-32
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp683 = ".\n"
	  .data			# create string constant marked with label
	  _string36: .asciiz ".\n"
	  .text
	  la $t0, _string36	# load label
	# PushParam _tmp683
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -36($fp)	# spill _tmp683 from $t0 to $fp-36
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_Player.PlaceBet:
	# BeginFunc 136
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 136	# decrement sp to make space for locals/temps
	# _tmp684 = 16
	  li $t0, 16		# load constant value 16 into $t0
	# _tmp685 = this + _tmp684
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp686 = *(_tmp685)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp687 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp688 = 16
	  li $t5, 16		# load constant value 16 into $t5
	# _tmp689 = this + _tmp688
	  add $t6, $t1, $t5	
	# *(_tmp689) = _tmp687
	  sw $t4, 0($t6) 	# store with offset
	# _tmp690 = *(this)
	  lw $t7, 0($t1) 	# load with offset
	# _tmp691 = *(_tmp690)
	  lw $s0, 0($t7) 	# load with offset
	# _tmp692 = ACall _tmp691
	# (save modified registers before flow of control change)
	  sw $t0, -8($fp)	# spill _tmp684 from $t0 to $fp-8
	  sw $t2, -12($fp)	# spill _tmp685 from $t2 to $fp-12
	  sw $t3, -16($fp)	# spill _tmp686 from $t3 to $fp-16
	  sw $t4, -20($fp)	# spill _tmp687 from $t4 to $fp-20
	  sw $t5, -24($fp)	# spill _tmp688 from $t5 to $fp-24
	  sw $t6, -28($fp)	# spill _tmp689 from $t6 to $fp-28
	  sw $t7, -32($fp)	# spill _tmp690 from $t7 to $fp-32
	  sw $s0, -36($fp)	# spill _tmp691 from $s0 to $fp-36
	  jalr $s0            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp693 = this - _tmp692
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  sub $t2, $t1, $t0	
	# _tmp694 = *(_tmp690 + 24)
	  lw $t3, -32($fp)	# load _tmp690 from $fp-32 into $t3
	  lw $t4, 24($t3) 	# load with offset
	# PushParam _tmp693
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp694
	# (save modified registers before flow of control change)
	  sw $t0, -40($fp)	# spill _tmp692 from $t0 to $fp-40
	  sw $t2, -44($fp)	# spill _tmp693 from $t2 to $fp-44
	  sw $t4, -48($fp)	# spill _tmp694 from $t4 to $fp-48
	  jalr $t4            	# jump to function
	# _tmp695 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# (save modified registers before flow of control change)
	  sw $t0, -52($fp)	# spill _tmp695 from $t0 to $fp-52
  _L44:
	# _tmp696 = 16
	  li $t0, 16		# load constant value 16 into $t0
	# _tmp697 = this + _tmp696
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp698 = *(_tmp697)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp699 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp700 = _tmp698 == _tmp699
	  seq $t5, $t3, $t4	
	# _tmp701 = _tmp698 < _tmp699
	  slt $t6, $t3, $t4	
	# _tmp702 = _tmp701 || _tmp700
	  or $t7, $t6, $t5	
	# _tmp703 = 16
	  li $s0, 16		# load constant value 16 into $s0
	# _tmp704 = this + _tmp703
	  add $s1, $t1, $s0	
	# _tmp705 = *(_tmp704)
	  lw $s2, 0($s1) 	# load with offset
	# _tmp706 = 20
	  li $s3, 20		# load constant value 20 into $s3
	# _tmp707 = this + _tmp706
	  add $s4, $t1, $s3	
	# _tmp708 = *(_tmp707)
	  lw $s5, 0($s4) 	# load with offset
	# _tmp709 = _tmp708 < _tmp705
	  slt $s6, $s5, $s2	
	# _tmp710 = _tmp702 || _tmp709
	  or $s7, $t7, $s6	
	# IfZ _tmp710 Goto _L45
	# (save modified registers before flow of control change)
	  sw $t0, -56($fp)	# spill _tmp696 from $t0 to $fp-56
	  sw $t2, -60($fp)	# spill _tmp697 from $t2 to $fp-60
	  sw $t3, -64($fp)	# spill _tmp698 from $t3 to $fp-64
	  sw $t4, -68($fp)	# spill _tmp699 from $t4 to $fp-68
	  sw $t5, -72($fp)	# spill _tmp700 from $t5 to $fp-72
	  sw $t6, -76($fp)	# spill _tmp701 from $t6 to $fp-76
	  sw $t7, -80($fp)	# spill _tmp702 from $t7 to $fp-80
	  sw $s0, -84($fp)	# spill _tmp703 from $s0 to $fp-84
	  sw $s1, -88($fp)	# spill _tmp704 from $s1 to $fp-88
	  sw $s2, -92($fp)	# spill _tmp705 from $s2 to $fp-92
	  sw $s3, -96($fp)	# spill _tmp706 from $s3 to $fp-96
	  sw $s4, -100($fp)	# spill _tmp707 from $s4 to $fp-100
	  sw $s5, -104($fp)	# spill _tmp708 from $s5 to $fp-104
	  sw $s6, -108($fp)	# spill _tmp709 from $s6 to $fp-108
	  sw $s7, -112($fp)	# spill _tmp710 from $s7 to $fp-112
	  beqz $s7, _L45	# branch if _tmp710 is zero 
	# _tmp711 = "How much would you like to bet? "
	  .data			# create string constant marked with label
	  _string37: .asciiz "How much would you like to bet? "
	  .text
	  la $t0, _string37	# load label
	# PushParam _tmp711
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -116($fp)	# spill _tmp711 from $t0 to $fp-116
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp712 = 16
	  li $t0, 16		# load constant value 16 into $t0
	# _tmp713 = this + _tmp712
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp714 = *(_tmp713)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp715 = LCall _ReadInteger
	# (save modified registers before flow of control change)
	  sw $t0, -120($fp)	# spill _tmp712 from $t0 to $fp-120
	  sw $t2, -124($fp)	# spill _tmp713 from $t2 to $fp-124
	  sw $t3, -128($fp)	# spill _tmp714 from $t3 to $fp-128
	  jal _ReadInteger   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp716 = 16
	  li $t1, 16		# load constant value 16 into $t1
	# _tmp717 = this + _tmp716
	  lw $t2, 4($fp)	# load this from $fp+4 into $t2
	  add $t3, $t2, $t1	
	# *(_tmp717) = _tmp715
	  sw $t0, 0($t3) 	# store with offset
	# Goto _L44
	# (save modified registers before flow of control change)
	  sw $t0, -132($fp)	# spill _tmp715 from $t0 to $fp-132
	  sw $t1, -136($fp)	# spill _tmp716 from $t1 to $fp-136
	  sw $t3, -140($fp)	# spill _tmp717 from $t3 to $fp-140
	  b _L44		# unconditional branch
  _L45:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_Player.GetTotal:
	# BeginFunc 12
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 12	# decrement sp to make space for locals/temps
	# _tmp718 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp719 = this + _tmp718
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp720 = *(_tmp719)
	  lw $t3, 0($t2) 	# load with offset
	# Return _tmp720
	  move $v0, $t3		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_Player.Resolve:
	# BeginFunc 324
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 324	# decrement sp to make space for locals/temps
	# _tmp721 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# win = _tmp721
	  move $t1, $t0		# copy value
	# _tmp722 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# lose = _tmp722
	  move $t3, $t2		# copy value
	# _tmp723 = 4
	  li $t4, 4		# load constant value 4 into $t4
	# _tmp724 = this + _tmp723
	  lw $t5, 4($fp)	# load this from $fp+4 into $t5
	  add $t6, $t5, $t4	
	# _tmp725 = *(_tmp724)
	  lw $t7, 0($t6) 	# load with offset
	# _tmp726 = 21
	  li $s0, 21		# load constant value 21 into $s0
	# _tmp727 = _tmp725 == _tmp726
	  seq $s1, $t7, $s0	
	# _tmp728 = 12
	  li $s2, 12		# load constant value 12 into $s2
	# _tmp729 = this + _tmp728
	  add $s3, $t5, $s2	
	# _tmp730 = *(_tmp729)
	  lw $s4, 0($s3) 	# load with offset
	# _tmp731 = 2
	  li $s5, 2		# load constant value 2 into $s5
	# _tmp732 = _tmp730 == _tmp731
	  seq $s6, $s4, $s5	
	# _tmp733 = _tmp727 && _tmp732
	  and $s7, $s1, $s6	
	# IfZ _tmp733 Goto _L47
	# (save modified registers before flow of control change)
	  sw $t0, -16($fp)	# spill _tmp721 from $t0 to $fp-16
	  sw $t1, -8($fp)	# spill win from $t1 to $fp-8
	  sw $t2, -20($fp)	# spill _tmp722 from $t2 to $fp-20
	  sw $t3, -12($fp)	# spill lose from $t3 to $fp-12
	  sw $t4, -24($fp)	# spill _tmp723 from $t4 to $fp-24
	  sw $t6, -28($fp)	# spill _tmp724 from $t6 to $fp-28
	  sw $t7, -32($fp)	# spill _tmp725 from $t7 to $fp-32
	  sw $s0, -36($fp)	# spill _tmp726 from $s0 to $fp-36
	  sw $s1, -40($fp)	# spill _tmp727 from $s1 to $fp-40
	  sw $s2, -44($fp)	# spill _tmp728 from $s2 to $fp-44
	  sw $s3, -48($fp)	# spill _tmp729 from $s3 to $fp-48
	  sw $s4, -52($fp)	# spill _tmp730 from $s4 to $fp-52
	  sw $s5, -56($fp)	# spill _tmp731 from $s5 to $fp-56
	  sw $s6, -60($fp)	# spill _tmp732 from $s6 to $fp-60
	  sw $s7, -64($fp)	# spill _tmp733 from $s7 to $fp-64
	  beqz $s7, _L47	# branch if _tmp733 is zero 
	# _tmp734 = 2
	  li $t0, 2		# load constant value 2 into $t0
	# win = _tmp734
	  move $t1, $t0		# copy value
	# Goto _L46
	# (save modified registers before flow of control change)
	  sw $t0, -68($fp)	# spill _tmp734 from $t0 to $fp-68
	  sw $t1, -8($fp)	# spill win from $t1 to $fp-8
	  b _L46		# unconditional branch
  _L47:
	# _tmp735 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp736 = this + _tmp735
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp737 = *(_tmp736)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp738 = 21
	  li $t4, 21		# load constant value 21 into $t4
	# _tmp739 = _tmp738 < _tmp737
	  slt $t5, $t4, $t3	
	# IfZ _tmp739 Goto _L49
	# (save modified registers before flow of control change)
	  sw $t0, -72($fp)	# spill _tmp735 from $t0 to $fp-72
	  sw $t2, -76($fp)	# spill _tmp736 from $t2 to $fp-76
	  sw $t3, -80($fp)	# spill _tmp737 from $t3 to $fp-80
	  sw $t4, -84($fp)	# spill _tmp738 from $t4 to $fp-84
	  sw $t5, -88($fp)	# spill _tmp739 from $t5 to $fp-88
	  beqz $t5, _L49	# branch if _tmp739 is zero 
	# _tmp740 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# lose = _tmp740
	  move $t1, $t0		# copy value
	# Goto _L48
	# (save modified registers before flow of control change)
	  sw $t0, -92($fp)	# spill _tmp740 from $t0 to $fp-92
	  sw $t1, -12($fp)	# spill lose from $t1 to $fp-12
	  b _L48		# unconditional branch
  _L49:
	# _tmp741 = 21
	  li $t0, 21		# load constant value 21 into $t0
	# _tmp742 = _tmp741 < dealer
	  lw $t1, 8($fp)	# load dealer from $fp+8 into $t1
	  slt $t2, $t0, $t1	
	# IfZ _tmp742 Goto _L51
	# (save modified registers before flow of control change)
	  sw $t0, -96($fp)	# spill _tmp741 from $t0 to $fp-96
	  sw $t2, -100($fp)	# spill _tmp742 from $t2 to $fp-100
	  beqz $t2, _L51	# branch if _tmp742 is zero 
	# _tmp743 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# win = _tmp743
	  move $t1, $t0		# copy value
	# Goto _L50
	# (save modified registers before flow of control change)
	  sw $t0, -104($fp)	# spill _tmp743 from $t0 to $fp-104
	  sw $t1, -8($fp)	# spill win from $t1 to $fp-8
	  b _L50		# unconditional branch
  _L51:
	# _tmp744 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp745 = this + _tmp744
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp746 = *(_tmp745)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp747 = dealer < _tmp746
	  lw $t4, 8($fp)	# load dealer from $fp+8 into $t4
	  slt $t5, $t4, $t3	
	# IfZ _tmp747 Goto _L53
	# (save modified registers before flow of control change)
	  sw $t0, -108($fp)	# spill _tmp744 from $t0 to $fp-108
	  sw $t2, -112($fp)	# spill _tmp745 from $t2 to $fp-112
	  sw $t3, -116($fp)	# spill _tmp746 from $t3 to $fp-116
	  sw $t5, -120($fp)	# spill _tmp747 from $t5 to $fp-120
	  beqz $t5, _L53	# branch if _tmp747 is zero 
	# _tmp748 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# win = _tmp748
	  move $t1, $t0		# copy value
	# Goto _L52
	# (save modified registers before flow of control change)
	  sw $t0, -124($fp)	# spill _tmp748 from $t0 to $fp-124
	  sw $t1, -8($fp)	# spill win from $t1 to $fp-8
	  b _L52		# unconditional branch
  _L53:
	# _tmp749 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp750 = this + _tmp749
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp751 = *(_tmp750)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp752 = _tmp751 < dealer
	  lw $t4, 8($fp)	# load dealer from $fp+8 into $t4
	  slt $t5, $t3, $t4	
	# IfZ _tmp752 Goto _L54
	# (save modified registers before flow of control change)
	  sw $t0, -128($fp)	# spill _tmp749 from $t0 to $fp-128
	  sw $t2, -132($fp)	# spill _tmp750 from $t2 to $fp-132
	  sw $t3, -136($fp)	# spill _tmp751 from $t3 to $fp-136
	  sw $t5, -140($fp)	# spill _tmp752 from $t5 to $fp-140
	  beqz $t5, _L54	# branch if _tmp752 is zero 
	# _tmp753 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# lose = _tmp753
	  move $t1, $t0		# copy value
	# (save modified registers before flow of control change)
	  sw $t0, -144($fp)	# spill _tmp753 from $t0 to $fp-144
	  sw $t1, -12($fp)	# spill lose from $t1 to $fp-12
  _L54:
  _L52:
  _L50:
  _L48:
  _L46:
	# _tmp754 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp755 = win == _tmp754
	  lw $t1, -8($fp)	# load win from $fp-8 into $t1
	  seq $t2, $t1, $t0	
	# _tmp756 = _tmp754 < win
	  slt $t3, $t0, $t1	
	# _tmp757 = _tmp756 || _tmp755
	  or $t4, $t3, $t2	
	# IfZ _tmp757 Goto _L56
	# (save modified registers before flow of control change)
	  sw $t0, -148($fp)	# spill _tmp754 from $t0 to $fp-148
	  sw $t2, -152($fp)	# spill _tmp755 from $t2 to $fp-152
	  sw $t3, -156($fp)	# spill _tmp756 from $t3 to $fp-156
	  sw $t4, -160($fp)	# spill _tmp757 from $t4 to $fp-160
	  beqz $t4, _L56	# branch if _tmp757 is zero 
	# _tmp758 = 24
	  li $t0, 24		# load constant value 24 into $t0
	# _tmp759 = this + _tmp758
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp760 = *(_tmp759)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp760
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -164($fp)	# spill _tmp758 from $t0 to $fp-164
	  sw $t2, -168($fp)	# spill _tmp759 from $t2 to $fp-168
	  sw $t3, -172($fp)	# spill _tmp760 from $t3 to $fp-172
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp761 = ", you won $"
	  .data			# create string constant marked with label
	  _string38: .asciiz ", you won $"
	  .text
	  la $t0, _string38	# load label
	# PushParam _tmp761
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -176($fp)	# spill _tmp761 from $t0 to $fp-176
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp762 = 16
	  li $t0, 16		# load constant value 16 into $t0
	# _tmp763 = this + _tmp762
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp764 = *(_tmp763)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp764
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# (save modified registers before flow of control change)
	  sw $t0, -180($fp)	# spill _tmp762 from $t0 to $fp-180
	  sw $t2, -184($fp)	# spill _tmp763 from $t2 to $fp-184
	  sw $t3, -188($fp)	# spill _tmp764 from $t3 to $fp-188
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp765 = ".\n"
	  .data			# create string constant marked with label
	  _string39: .asciiz ".\n"
	  .text
	  la $t0, _string39	# load label
	# PushParam _tmp765
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -192($fp)	# spill _tmp765 from $t0 to $fp-192
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L55
	  b _L55		# unconditional branch
  _L56:
	# _tmp766 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp767 = lose == _tmp766
	  lw $t1, -12($fp)	# load lose from $fp-12 into $t1
	  seq $t2, $t1, $t0	
	# _tmp768 = _tmp766 < lose
	  slt $t3, $t0, $t1	
	# _tmp769 = _tmp768 || _tmp767
	  or $t4, $t3, $t2	
	# IfZ _tmp769 Goto _L58
	# (save modified registers before flow of control change)
	  sw $t0, -196($fp)	# spill _tmp766 from $t0 to $fp-196
	  sw $t2, -200($fp)	# spill _tmp767 from $t2 to $fp-200
	  sw $t3, -204($fp)	# spill _tmp768 from $t3 to $fp-204
	  sw $t4, -208($fp)	# spill _tmp769 from $t4 to $fp-208
	  beqz $t4, _L58	# branch if _tmp769 is zero 
	# _tmp770 = 24
	  li $t0, 24		# load constant value 24 into $t0
	# _tmp771 = this + _tmp770
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp772 = *(_tmp771)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp772
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -212($fp)	# spill _tmp770 from $t0 to $fp-212
	  sw $t2, -216($fp)	# spill _tmp771 from $t2 to $fp-216
	  sw $t3, -220($fp)	# spill _tmp772 from $t3 to $fp-220
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp773 = ", you lost $"
	  .data			# create string constant marked with label
	  _string40: .asciiz ", you lost $"
	  .text
	  la $t0, _string40	# load label
	# PushParam _tmp773
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -224($fp)	# spill _tmp773 from $t0 to $fp-224
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp774 = 16
	  li $t0, 16		# load constant value 16 into $t0
	# _tmp775 = this + _tmp774
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp776 = *(_tmp775)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp776
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# (save modified registers before flow of control change)
	  sw $t0, -228($fp)	# spill _tmp774 from $t0 to $fp-228
	  sw $t2, -232($fp)	# spill _tmp775 from $t2 to $fp-232
	  sw $t3, -236($fp)	# spill _tmp776 from $t3 to $fp-236
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp777 = ".\n"
	  .data			# create string constant marked with label
	  _string41: .asciiz ".\n"
	  .text
	  la $t0, _string41	# load label
	# PushParam _tmp777
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -240($fp)	# spill _tmp777 from $t0 to $fp-240
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L57
	  b _L57		# unconditional branch
  _L58:
	# _tmp778 = 24
	  li $t0, 24		# load constant value 24 into $t0
	# _tmp779 = this + _tmp778
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp780 = *(_tmp779)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp780
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -244($fp)	# spill _tmp778 from $t0 to $fp-244
	  sw $t2, -248($fp)	# spill _tmp779 from $t2 to $fp-248
	  sw $t3, -252($fp)	# spill _tmp780 from $t3 to $fp-252
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp781 = ", you push!\n"
	  .data			# create string constant marked with label
	  _string42: .asciiz ", you push!\n"
	  .text
	  la $t0, _string42	# load label
	# PushParam _tmp781
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -256($fp)	# spill _tmp781 from $t0 to $fp-256
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L57:
  _L55:
	# _tmp782 = 16
	  li $t0, 16		# load constant value 16 into $t0
	# _tmp783 = this + _tmp782
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp784 = *(_tmp783)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp785 = win * _tmp784
	  lw $t4, -8($fp)	# load win from $fp-8 into $t4
	  mul $t5, $t4, $t3	
	# win = _tmp785
	  move $t4, $t5		# copy value
	# _tmp786 = 16
	  li $t6, 16		# load constant value 16 into $t6
	# _tmp787 = this + _tmp786
	  add $t7, $t1, $t6	
	# _tmp788 = *(_tmp787)
	  lw $s0, 0($t7) 	# load with offset
	# _tmp789 = lose * _tmp788
	  lw $s1, -12($fp)	# load lose from $fp-12 into $s1
	  mul $s2, $s1, $s0	
	# lose = _tmp789
	  move $s1, $s2		# copy value
	# _tmp790 = 20
	  li $s3, 20		# load constant value 20 into $s3
	# _tmp791 = this + _tmp790
	  add $s4, $t1, $s3	
	# _tmp792 = *(_tmp791)
	  lw $s5, 0($s4) 	# load with offset
	# _tmp793 = 20
	  li $s6, 20		# load constant value 20 into $s6
	# _tmp794 = this + _tmp793
	  add $s7, $t1, $s6	
	# _tmp795 = *(_tmp794)
	  lw $t8, 0($s7) 	# load with offset
	# _tmp796 = _tmp795 + win
	  add $t9, $t8, $t4	
	# _tmp797 = _tmp796 - lose
	  sub $t1, $t9, $s1	
	# _tmp798 = 20
	  sw $s1, -12($fp)	# spill lose from $s1 to $fp-12
	  li $s1, 20		# load constant value 20 into $s1
	# _tmp799 = this + _tmp798
	  sw $s2, -288($fp)	# spill _tmp789 from $s2 to $fp-288
	  lw $s2, 4($fp)	# load this from $fp+4 into $s2
	  sw $s3, -292($fp)	# spill _tmp790 from $s3 to $fp-292
	  add $s3, $s2, $s1	
	# *(_tmp799) = _tmp797
	  sw $t1, 0($s3) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _offset_Dealer_0:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp800 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp800
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class Dealer
	  .data
	  .align 2
	  Dealer:		# label for class Dealer vtable
	  .word _offset_Dealer_0
	  .word f_Dealer.Init
	  .word f_Dealer.Hit
	  .word f_Dealer.DoubleDown
	  .word f_Dealer.TakeTurn
	  .word f_Dealer.HasMoney
	  .word f_Dealer.PrintMoney
	  .word f_Dealer.PlaceBet
	  .word f_Dealer.GetTotal
	  .word f_Dealer.Resolve
	  .text
  f_Dealer.Init:
	# BeginFunc 96
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 96	# decrement sp to make space for locals/temps
	# _tmp801 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp802 = this + _tmp801
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp803 = *(_tmp802)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp804 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp805 = 4
	  li $t5, 4		# load constant value 4 into $t5
	# _tmp806 = this + _tmp805
	  add $t6, $t1, $t5	
	# *(_tmp806) = _tmp804
	  sw $t4, 0($t6) 	# store with offset
	# _tmp807 = 8
	  li $t7, 8		# load constant value 8 into $t7
	# _tmp808 = this + _tmp807
	  add $s0, $t1, $t7	
	# _tmp809 = *(_tmp808)
	  lw $s1, 0($s0) 	# load with offset
	# _tmp810 = 0
	  li $s2, 0		# load constant value 0 into $s2
	# _tmp811 = 8
	  li $s3, 8		# load constant value 8 into $s3
	# _tmp812 = this + _tmp811
	  add $s4, $t1, $s3	
	# *(_tmp812) = _tmp810
	  sw $s2, 0($s4) 	# store with offset
	# _tmp813 = 12
	  li $s5, 12		# load constant value 12 into $s5
	# _tmp814 = this + _tmp813
	  add $s6, $t1, $s5	
	# _tmp815 = *(_tmp814)
	  lw $s7, 0($s6) 	# load with offset
	# _tmp816 = 0
	  li $t8, 0		# load constant value 0 into $t8
	# _tmp817 = 12
	  li $t9, 12		# load constant value 12 into $t9
	# _tmp818 = this + _tmp817
	  sw $s4, -52($fp)	# spill _tmp812 from $s4 to $fp-52
	  add $s4, $t1, $t9	
	# *(_tmp818) = _tmp816
	  sw $t8, 0($s4) 	# store with offset
	# _tmp819 = 24
	  li $t1, 24		# load constant value 24 into $t1
	# _tmp820 = this + _tmp819
	  sw $s5, -56($fp)	# spill _tmp813 from $s5 to $fp-56
	  lw $s5, 4($fp)	# load this from $fp+4 into $s5
	  sw $s6, -60($fp)	# spill _tmp814 from $s6 to $fp-60
	  add $s6, $s5, $t1	
	# _tmp821 = *(_tmp820)
	  lw $s5, 0($s6) 	# load with offset
	# _tmp822 = "Dealer"
	  .data			# create string constant marked with label
	  _string43: .asciiz "Dealer"
	  .text
	  sw $s7, -64($fp)	# spill _tmp815 from $s7 to $fp-64
	  la $s7, _string43	# load label
	# _tmp823 = 24
	  sw $t8, -68($fp)	# spill _tmp816 from $t8 to $fp-68
	  li $t8, 24		# load constant value 24 into $t8
	# _tmp824 = this + _tmp823
	  sw $t9, -72($fp)	# spill _tmp817 from $t9 to $fp-72
	  lw $t9, 4($fp)	# load this from $fp+4 into $t9
	  sw $t0, -8($fp)	# spill _tmp801 from $t0 to $fp-8
	  add $t0, $t9, $t8	
	# *(_tmp824) = _tmp822
	  sw $s7, 0($t0) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_Dealer.TakeTurn:
	# BeginFunc 156
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 156	# decrement sp to make space for locals/temps
	# _tmp825 = "\n"
	  .data			# create string constant marked with label
	  _string44: .asciiz "\n"
	  .text
	  la $t0, _string44	# load label
	# PushParam _tmp825
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -8($fp)	# spill _tmp825 from $t0 to $fp-8
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp826 = 24
	  li $t0, 24		# load constant value 24 into $t0
	# _tmp827 = this + _tmp826
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp828 = *(_tmp827)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp828
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -12($fp)	# spill _tmp826 from $t0 to $fp-12
	  sw $t2, -16($fp)	# spill _tmp827 from $t2 to $fp-16
	  sw $t3, -20($fp)	# spill _tmp828 from $t3 to $fp-20
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp829 = "'s turn.\n"
	  .data			# create string constant marked with label
	  _string45: .asciiz "'s turn.\n"
	  .text
	  la $t0, _string45	# load label
	# PushParam _tmp829
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -24($fp)	# spill _tmp829 from $t0 to $fp-24
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L59:
	# _tmp830 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp831 = this + _tmp830
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp832 = *(_tmp831)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp833 = 16
	  li $t4, 16		# load constant value 16 into $t4
	# _tmp834 = _tmp832 == _tmp833
	  seq $t5, $t3, $t4	
	# _tmp835 = _tmp832 < _tmp833
	  slt $t6, $t3, $t4	
	# _tmp836 = _tmp835 || _tmp834
	  or $t7, $t6, $t5	
	# IfZ _tmp836 Goto _L60
	# (save modified registers before flow of control change)
	  sw $t0, -28($fp)	# spill _tmp830 from $t0 to $fp-28
	  sw $t2, -32($fp)	# spill _tmp831 from $t2 to $fp-32
	  sw $t3, -36($fp)	# spill _tmp832 from $t3 to $fp-36
	  sw $t4, -40($fp)	# spill _tmp833 from $t4 to $fp-40
	  sw $t5, -44($fp)	# spill _tmp834 from $t5 to $fp-44
	  sw $t6, -48($fp)	# spill _tmp835 from $t6 to $fp-48
	  sw $t7, -52($fp)	# spill _tmp836 from $t7 to $fp-52
	  beqz $t7, _L60	# branch if _tmp836 is zero 
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 8($fp)	# load deck from $fp+8 into $t0
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp837 = *(this)
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  lw $t2, 0($t1) 	# load with offset
	# _tmp838 = *(_tmp837)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp839 = ACall _tmp838
	# (save modified registers before flow of control change)
	  sw $t2, -56($fp)	# spill _tmp837 from $t2 to $fp-56
	  sw $t3, -60($fp)	# spill _tmp838 from $t3 to $fp-60
	  jalr $t3            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp840 = this - _tmp839
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  sub $t2, $t1, $t0	
	# _tmp841 = *(_tmp837 + 8)
	  lw $t3, -56($fp)	# load _tmp837 from $fp-56 into $t3
	  lw $t4, 8($t3) 	# load with offset
	# PushParam _tmp840
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp841
	# (save modified registers before flow of control change)
	  sw $t0, -64($fp)	# spill _tmp839 from $t0 to $fp-64
	  sw $t2, -68($fp)	# spill _tmp840 from $t2 to $fp-68
	  sw $t4, -72($fp)	# spill _tmp841 from $t4 to $fp-72
	  jalr $t4            	# jump to function
	# _tmp842 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# Goto _L59
	# (save modified registers before flow of control change)
	  sw $t0, -76($fp)	# spill _tmp842 from $t0 to $fp-76
	  b _L59		# unconditional branch
  _L60:
	# _tmp843 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp844 = this + _tmp843
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp845 = *(_tmp844)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp846 = 21
	  li $t4, 21		# load constant value 21 into $t4
	# _tmp847 = _tmp846 < _tmp845
	  slt $t5, $t4, $t3	
	# IfZ _tmp847 Goto _L62
	# (save modified registers before flow of control change)
	  sw $t0, -80($fp)	# spill _tmp843 from $t0 to $fp-80
	  sw $t2, -84($fp)	# spill _tmp844 from $t2 to $fp-84
	  sw $t3, -88($fp)	# spill _tmp845 from $t3 to $fp-88
	  sw $t4, -92($fp)	# spill _tmp846 from $t4 to $fp-92
	  sw $t5, -96($fp)	# spill _tmp847 from $t5 to $fp-96
	  beqz $t5, _L62	# branch if _tmp847 is zero 
	# _tmp848 = 24
	  li $t0, 24		# load constant value 24 into $t0
	# _tmp849 = this + _tmp848
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp850 = *(_tmp849)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp850
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -100($fp)	# spill _tmp848 from $t0 to $fp-100
	  sw $t2, -104($fp)	# spill _tmp849 from $t2 to $fp-104
	  sw $t3, -108($fp)	# spill _tmp850 from $t3 to $fp-108
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp851 = " busts with the big "
	  .data			# create string constant marked with label
	  _string46: .asciiz " busts with the big "
	  .text
	  la $t0, _string46	# load label
	# PushParam _tmp851
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -112($fp)	# spill _tmp851 from $t0 to $fp-112
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp852 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp853 = this + _tmp852
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp854 = *(_tmp853)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp854
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# (save modified registers before flow of control change)
	  sw $t0, -116($fp)	# spill _tmp852 from $t0 to $fp-116
	  sw $t2, -120($fp)	# spill _tmp853 from $t2 to $fp-120
	  sw $t3, -124($fp)	# spill _tmp854 from $t3 to $fp-124
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp855 = "!\n"
	  .data			# create string constant marked with label
	  _string47: .asciiz "!\n"
	  .text
	  la $t0, _string47	# load label
	# PushParam _tmp855
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -128($fp)	# spill _tmp855 from $t0 to $fp-128
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L61
	  b _L61		# unconditional branch
  _L62:
	# _tmp856 = 24
	  li $t0, 24		# load constant value 24 into $t0
	# _tmp857 = this + _tmp856
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp858 = *(_tmp857)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp858
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -132($fp)	# spill _tmp856 from $t0 to $fp-132
	  sw $t2, -136($fp)	# spill _tmp857 from $t2 to $fp-136
	  sw $t3, -140($fp)	# spill _tmp858 from $t3 to $fp-140
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp859 = " stays at "
	  .data			# create string constant marked with label
	  _string48: .asciiz " stays at "
	  .text
	  la $t0, _string48	# load label
	# PushParam _tmp859
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -144($fp)	# spill _tmp859 from $t0 to $fp-144
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp860 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp861 = this + _tmp860
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp862 = *(_tmp861)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp862
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# (save modified registers before flow of control change)
	  sw $t0, -148($fp)	# spill _tmp860 from $t0 to $fp-148
	  sw $t2, -152($fp)	# spill _tmp861 from $t2 to $fp-152
	  sw $t3, -156($fp)	# spill _tmp862 from $t3 to $fp-156
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp863 = ".\n"
	  .data			# create string constant marked with label
	  _string49: .asciiz ".\n"
	  .text
	  la $t0, _string49	# load label
	# PushParam _tmp863
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -160($fp)	# spill _tmp863 from $t0 to $fp-160
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L61:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_Dealer.Hit:
	# BeginFunc 296
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 296	# decrement sp to make space for locals/temps
	# _tmp864 = *(deck)
	  lw $t0, 8($fp)	# load deck from $fp+8 into $t0
	  lw $t1, 0($t0) 	# load with offset
	# _tmp865 = *(_tmp864)
	  lw $t2, 0($t1) 	# load with offset
	# _tmp866 = ACall _tmp865
	# (save modified registers before flow of control change)
	  sw $t1, -12($fp)	# spill _tmp864 from $t1 to $fp-12
	  sw $t2, -16($fp)	# spill _tmp865 from $t2 to $fp-16
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp867 = deck - _tmp866
	  lw $t1, 8($fp)	# load deck from $fp+8 into $t1
	  sub $t2, $t1, $t0	
	# _tmp868 = *(_tmp864 + 8)
	  lw $t3, -12($fp)	# load _tmp864 from $fp-12 into $t3
	  lw $t4, 8($t3) 	# load with offset
	# PushParam _tmp867
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp869 = ACall _tmp868
	# (save modified registers before flow of control change)
	  sw $t0, -20($fp)	# spill _tmp866 from $t0 to $fp-20
	  sw $t2, -24($fp)	# spill _tmp867 from $t2 to $fp-24
	  sw $t4, -28($fp)	# spill _tmp868 from $t4 to $fp-28
	  jalr $t4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# card = _tmp869
	  move $t1, $t0		# copy value
	# _tmp870 = 24
	  li $t2, 24		# load constant value 24 into $t2
	# _tmp871 = this + _tmp870
	  lw $t3, 4($fp)	# load this from $fp+4 into $t3
	  add $t4, $t3, $t2	
	# _tmp872 = *(_tmp871)
	  lw $t5, 0($t4) 	# load with offset
	# PushParam _tmp872
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -32($fp)	# spill _tmp869 from $t0 to $fp-32
	  sw $t1, -8($fp)	# spill card from $t1 to $fp-8
	  sw $t2, -36($fp)	# spill _tmp870 from $t2 to $fp-36
	  sw $t4, -40($fp)	# spill _tmp871 from $t4 to $fp-40
	  sw $t5, -44($fp)	# spill _tmp872 from $t5 to $fp-44
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp873 = " was dealt a "
	  .data			# create string constant marked with label
	  _string50: .asciiz " was dealt a "
	  .text
	  la $t0, _string50	# load label
	# PushParam _tmp873
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -48($fp)	# spill _tmp873 from $t0 to $fp-48
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam card
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, -8($fp)	# load card from $fp-8 into $t0
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp874 = ".\n"
	  .data			# create string constant marked with label
	  _string51: .asciiz ".\n"
	  .text
	  la $t0, _string51	# load label
	# PushParam _tmp874
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -52($fp)	# spill _tmp874 from $t0 to $fp-52
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp875 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp876 = this + _tmp875
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp877 = *(_tmp876)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp878 = 4
	  li $t4, 4		# load constant value 4 into $t4
	# _tmp879 = this + _tmp878
	  add $t5, $t1, $t4	
	# _tmp880 = *(_tmp879)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp881 = _tmp880 + card
	  lw $t7, -8($fp)	# load card from $fp-8 into $t7
	  add $s0, $t6, $t7	
	# _tmp882 = 4
	  li $s1, 4		# load constant value 4 into $s1
	# _tmp883 = this + _tmp882
	  add $s2, $t1, $s1	
	# *(_tmp883) = _tmp881
	  sw $s0, 0($s2) 	# store with offset
	# _tmp884 = 12
	  li $s3, 12		# load constant value 12 into $s3
	# _tmp885 = this + _tmp884
	  add $s4, $t1, $s3	
	# _tmp886 = *(_tmp885)
	  lw $s5, 0($s4) 	# load with offset
	# _tmp887 = 12
	  li $s6, 12		# load constant value 12 into $s6
	# _tmp888 = this + _tmp887
	  add $s7, $t1, $s6	
	# _tmp889 = *(_tmp888)
	  lw $t8, 0($s7) 	# load with offset
	# _tmp890 = 1
	  li $t9, 1		# load constant value 1 into $t9
	# _tmp891 = _tmp889 + _tmp890
	  add $t1, $t8, $t9	
	# _tmp892 = 12
	  li $t7, 12		# load constant value 12 into $t7
	# _tmp893 = this + _tmp892
	  sw $t1, -120($fp)	# spill _tmp891 from $t1 to $fp-120
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  sw $t2, -60($fp)	# spill _tmp876 from $t2 to $fp-60
	  add $t2, $t1, $t7	
	# *(_tmp893) = _tmp891
	  lw $t1, -120($fp)	# load _tmp891 from $fp-120 into $t1
	  sw $t1, 0($t2) 	# store with offset
	# _tmp894 = 11
	  li $t1, 11		# load constant value 11 into $t1
	# _tmp895 = card == _tmp894
	  sw $t3, -64($fp)	# spill _tmp877 from $t3 to $fp-64
	  lw $t3, -8($fp)	# load card from $fp-8 into $t3
	  sw $t4, -68($fp)	# spill _tmp878 from $t4 to $fp-68
	  seq $t4, $t3, $t1	
	# IfZ _tmp895 Goto _L63
	# (save modified registers before flow of control change)
	  sw $t0, -56($fp)	# spill _tmp875 from $t0 to $fp-56
	  sw $t1, -132($fp)	# spill _tmp894 from $t1 to $fp-132
	  sw $t2, -128($fp)	# spill _tmp893 from $t2 to $fp-128
	  sw $t4, -136($fp)	# spill _tmp895 from $t4 to $fp-136
	  sw $t5, -72($fp)	# spill _tmp879 from $t5 to $fp-72
	  sw $t6, -76($fp)	# spill _tmp880 from $t6 to $fp-76
	  sw $t7, -124($fp)	# spill _tmp892 from $t7 to $fp-124
	  sw $s0, -80($fp)	# spill _tmp881 from $s0 to $fp-80
	  sw $s1, -84($fp)	# spill _tmp882 from $s1 to $fp-84
	  sw $s2, -88($fp)	# spill _tmp883 from $s2 to $fp-88
	  sw $s3, -92($fp)	# spill _tmp884 from $s3 to $fp-92
	  sw $s4, -96($fp)	# spill _tmp885 from $s4 to $fp-96
	  sw $s5, -100($fp)	# spill _tmp886 from $s5 to $fp-100
	  sw $s6, -104($fp)	# spill _tmp887 from $s6 to $fp-104
	  sw $s7, -108($fp)	# spill _tmp888 from $s7 to $fp-108
	  sw $t8, -112($fp)	# spill _tmp889 from $t8 to $fp-112
	  sw $t9, -116($fp)	# spill _tmp890 from $t9 to $fp-116
	  beqz $t4, _L63	# branch if _tmp895 is zero 
	# _tmp896 = 8
	  li $t0, 8		# load constant value 8 into $t0
	# _tmp897 = this + _tmp896
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp898 = *(_tmp897)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp899 = 8
	  li $t4, 8		# load constant value 8 into $t4
	# _tmp900 = this + _tmp899
	  add $t5, $t1, $t4	
	# _tmp901 = *(_tmp900)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp902 = 1
	  li $t7, 1		# load constant value 1 into $t7
	# _tmp903 = _tmp901 + _tmp902
	  add $s0, $t6, $t7	
	# _tmp904 = 8
	  li $s1, 8		# load constant value 8 into $s1
	# _tmp905 = this + _tmp904
	  add $s2, $t1, $s1	
	# *(_tmp905) = _tmp903
	  sw $s0, 0($s2) 	# store with offset
	# (save modified registers before flow of control change)
	  sw $t0, -140($fp)	# spill _tmp896 from $t0 to $fp-140
	  sw $t2, -144($fp)	# spill _tmp897 from $t2 to $fp-144
	  sw $t3, -148($fp)	# spill _tmp898 from $t3 to $fp-148
	  sw $t4, -152($fp)	# spill _tmp899 from $t4 to $fp-152
	  sw $t5, -156($fp)	# spill _tmp900 from $t5 to $fp-156
	  sw $t6, -160($fp)	# spill _tmp901 from $t6 to $fp-160
	  sw $t7, -164($fp)	# spill _tmp902 from $t7 to $fp-164
	  sw $s0, -168($fp)	# spill _tmp903 from $s0 to $fp-168
	  sw $s1, -172($fp)	# spill _tmp904 from $s1 to $fp-172
	  sw $s2, -176($fp)	# spill _tmp905 from $s2 to $fp-176
  _L63:
  _L64:
	# _tmp906 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp907 = this + _tmp906
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp908 = *(_tmp907)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp909 = 21
	  li $t4, 21		# load constant value 21 into $t4
	# _tmp910 = _tmp909 < _tmp908
	  slt $t5, $t4, $t3	
	# _tmp911 = 8
	  li $t6, 8		# load constant value 8 into $t6
	# _tmp912 = this + _tmp911
	  add $t7, $t1, $t6	
	# _tmp913 = *(_tmp912)
	  lw $s0, 0($t7) 	# load with offset
	# _tmp914 = 0
	  li $s1, 0		# load constant value 0 into $s1
	# _tmp915 = _tmp914 < _tmp913
	  slt $s2, $s1, $s0	
	# _tmp916 = _tmp910 && _tmp915
	  and $s3, $t5, $s2	
	# IfZ _tmp916 Goto _L65
	# (save modified registers before flow of control change)
	  sw $t0, -180($fp)	# spill _tmp906 from $t0 to $fp-180
	  sw $t2, -184($fp)	# spill _tmp907 from $t2 to $fp-184
	  sw $t3, -188($fp)	# spill _tmp908 from $t3 to $fp-188
	  sw $t4, -192($fp)	# spill _tmp909 from $t4 to $fp-192
	  sw $t5, -196($fp)	# spill _tmp910 from $t5 to $fp-196
	  sw $t6, -200($fp)	# spill _tmp911 from $t6 to $fp-200
	  sw $t7, -204($fp)	# spill _tmp912 from $t7 to $fp-204
	  sw $s0, -208($fp)	# spill _tmp913 from $s0 to $fp-208
	  sw $s1, -212($fp)	# spill _tmp914 from $s1 to $fp-212
	  sw $s2, -216($fp)	# spill _tmp915 from $s2 to $fp-216
	  sw $s3, -220($fp)	# spill _tmp916 from $s3 to $fp-220
	  beqz $s3, _L65	# branch if _tmp916 is zero 
	# _tmp917 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp918 = this + _tmp917
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp919 = *(_tmp918)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp920 = 4
	  li $t4, 4		# load constant value 4 into $t4
	# _tmp921 = this + _tmp920
	  add $t5, $t1, $t4	
	# _tmp922 = *(_tmp921)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp923 = 10
	  li $t7, 10		# load constant value 10 into $t7
	# _tmp924 = _tmp922 - _tmp923
	  sub $s0, $t6, $t7	
	# _tmp925 = 4
	  li $s1, 4		# load constant value 4 into $s1
	# _tmp926 = this + _tmp925
	  add $s2, $t1, $s1	
	# *(_tmp926) = _tmp924
	  sw $s0, 0($s2) 	# store with offset
	# _tmp927 = 8
	  li $s3, 8		# load constant value 8 into $s3
	# _tmp928 = this + _tmp927
	  add $s4, $t1, $s3	
	# _tmp929 = *(_tmp928)
	  lw $s5, 0($s4) 	# load with offset
	# _tmp930 = 8
	  li $s6, 8		# load constant value 8 into $s6
	# _tmp931 = this + _tmp930
	  add $s7, $t1, $s6	
	# _tmp932 = *(_tmp931)
	  lw $t8, 0($s7) 	# load with offset
	# _tmp933 = 1
	  li $t9, 1		# load constant value 1 into $t9
	# _tmp934 = _tmp932 - _tmp933
	  sub $t1, $t8, $t9	
	# _tmp935 = 8
	  sw $t5, -240($fp)	# spill _tmp921 from $t5 to $fp-240
	  li $t5, 8		# load constant value 8 into $t5
	# _tmp936 = this + _tmp935
	  sw $t6, -244($fp)	# spill _tmp922 from $t6 to $fp-244
	  lw $t6, 4($fp)	# load this from $fp+4 into $t6
	  sw $t7, -248($fp)	# spill _tmp923 from $t7 to $fp-248
	  add $t7, $t6, $t5	
	# *(_tmp936) = _tmp934
	  sw $t1, 0($t7) 	# store with offset
	# Goto _L64
	# (save modified registers before flow of control change)
	  sw $t0, -224($fp)	# spill _tmp917 from $t0 to $fp-224
	  sw $t1, -292($fp)	# spill _tmp934 from $t1 to $fp-292
	  sw $t2, -228($fp)	# spill _tmp918 from $t2 to $fp-228
	  sw $t3, -232($fp)	# spill _tmp919 from $t3 to $fp-232
	  sw $t4, -236($fp)	# spill _tmp920 from $t4 to $fp-236
	  sw $t5, -296($fp)	# spill _tmp935 from $t5 to $fp-296
	  sw $t7, -300($fp)	# spill _tmp936 from $t7 to $fp-300
	  sw $s0, -252($fp)	# spill _tmp924 from $s0 to $fp-252
	  sw $s1, -256($fp)	# spill _tmp925 from $s1 to $fp-256
	  sw $s2, -260($fp)	# spill _tmp926 from $s2 to $fp-260
	  sw $s3, -264($fp)	# spill _tmp927 from $s3 to $fp-264
	  sw $s4, -268($fp)	# spill _tmp928 from $s4 to $fp-268
	  sw $s5, -272($fp)	# spill _tmp929 from $s5 to $fp-272
	  sw $s6, -276($fp)	# spill _tmp930 from $s6 to $fp-276
	  sw $s7, -280($fp)	# spill _tmp931 from $s7 to $fp-280
	  sw $t8, -284($fp)	# spill _tmp932 from $t8 to $fp-284
	  sw $t9, -288($fp)	# spill _tmp933 from $t9 to $fp-288
	  b _L64		# unconditional branch
  _L65:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_Dealer.DoubleDown:
	# BeginFunc 180
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 180	# decrement sp to make space for locals/temps
	# _tmp937 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp938 = this + _tmp937
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp939 = *(_tmp938)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp940 = 10
	  li $t4, 10		# load constant value 10 into $t4
	# _tmp941 = 0
	  li $t5, 0		# load constant value 0 into $t5
	# _tmp942 = _tmp939 == _tmp940
	  seq $t6, $t3, $t4	
	# _tmp943 = _tmp942 == _tmp941
	  seq $t7, $t6, $t5	
	# _tmp944 = 4
	  li $s0, 4		# load constant value 4 into $s0
	# _tmp945 = this + _tmp944
	  add $s1, $t1, $s0	
	# _tmp946 = *(_tmp945)
	  lw $s2, 0($s1) 	# load with offset
	# _tmp947 = 11
	  li $s3, 11		# load constant value 11 into $s3
	# _tmp948 = 0
	  li $s4, 0		# load constant value 0 into $s4
	# _tmp949 = _tmp946 == _tmp947
	  seq $s5, $s2, $s3	
	# _tmp950 = _tmp949 == _tmp948
	  seq $s6, $s5, $s4	
	# _tmp951 = _tmp943 && _tmp950
	  and $s7, $t7, $s6	
	# IfZ _tmp951 Goto _L66
	# (save modified registers before flow of control change)
	  sw $t0, -12($fp)	# spill _tmp937 from $t0 to $fp-12
	  sw $t2, -16($fp)	# spill _tmp938 from $t2 to $fp-16
	  sw $t3, -20($fp)	# spill _tmp939 from $t3 to $fp-20
	  sw $t4, -24($fp)	# spill _tmp940 from $t4 to $fp-24
	  sw $t5, -28($fp)	# spill _tmp941 from $t5 to $fp-28
	  sw $t6, -32($fp)	# spill _tmp942 from $t6 to $fp-32
	  sw $t7, -36($fp)	# spill _tmp943 from $t7 to $fp-36
	  sw $s0, -40($fp)	# spill _tmp944 from $s0 to $fp-40
	  sw $s1, -44($fp)	# spill _tmp945 from $s1 to $fp-44
	  sw $s2, -48($fp)	# spill _tmp946 from $s2 to $fp-48
	  sw $s3, -52($fp)	# spill _tmp947 from $s3 to $fp-52
	  sw $s4, -56($fp)	# spill _tmp948 from $s4 to $fp-56
	  sw $s5, -60($fp)	# spill _tmp949 from $s5 to $fp-60
	  sw $s6, -64($fp)	# spill _tmp950 from $s6 to $fp-64
	  sw $s7, -68($fp)	# spill _tmp951 from $s7 to $fp-68
	  beqz $s7, _L66	# branch if _tmp951 is zero 
	# _tmp952 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp952
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L66:
	# _tmp953 = "Would you like to double down?"
	  .data			# create string constant marked with label
	  _string52: .asciiz "Would you like to double down?"
	  .text
	  la $t0, _string52	# load label
	# PushParam _tmp953
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp954 = LCall f_GetYesOrNo
	# (save modified registers before flow of control change)
	  sw $t0, -76($fp)	# spill _tmp953 from $t0 to $fp-76
	  jal f_GetYesOrNo   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp954 Goto _L67
	# (save modified registers before flow of control change)
	  sw $t0, -80($fp)	# spill _tmp954 from $t0 to $fp-80
	  beqz $t0, _L67	# branch if _tmp954 is zero 
	# _tmp955 = 16
	  li $t0, 16		# load constant value 16 into $t0
	# _tmp956 = this + _tmp955
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp957 = *(_tmp956)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp958 = 16
	  li $t4, 16		# load constant value 16 into $t4
	# _tmp959 = this + _tmp958
	  add $t5, $t1, $t4	
	# _tmp960 = *(_tmp959)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp961 = 2
	  li $t7, 2		# load constant value 2 into $t7
	# _tmp962 = _tmp960 * _tmp961
	  mul $s0, $t6, $t7	
	# _tmp963 = 16
	  li $s1, 16		# load constant value 16 into $s1
	# _tmp964 = this + _tmp963
	  add $s2, $t1, $s1	
	# *(_tmp964) = _tmp962
	  sw $s0, 0($s2) 	# store with offset
	# PushParam deck
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $s3, 8($fp)	# load deck from $fp+8 into $s3
	  sw $s3, 4($sp)	# copy param value to stack
	# _tmp965 = *(this)
	  lw $s4, 0($t1) 	# load with offset
	# _tmp966 = *(_tmp965)
	  lw $s5, 0($s4) 	# load with offset
	# _tmp967 = ACall _tmp966
	# (save modified registers before flow of control change)
	  sw $t0, -84($fp)	# spill _tmp955 from $t0 to $fp-84
	  sw $t2, -88($fp)	# spill _tmp956 from $t2 to $fp-88
	  sw $t3, -92($fp)	# spill _tmp957 from $t3 to $fp-92
	  sw $t4, -96($fp)	# spill _tmp958 from $t4 to $fp-96
	  sw $t5, -100($fp)	# spill _tmp959 from $t5 to $fp-100
	  sw $t6, -104($fp)	# spill _tmp960 from $t6 to $fp-104
	  sw $t7, -108($fp)	# spill _tmp961 from $t7 to $fp-108
	  sw $s0, -112($fp)	# spill _tmp962 from $s0 to $fp-112
	  sw $s1, -116($fp)	# spill _tmp963 from $s1 to $fp-116
	  sw $s2, -120($fp)	# spill _tmp964 from $s2 to $fp-120
	  sw $s4, -124($fp)	# spill _tmp965 from $s4 to $fp-124
	  sw $s5, -128($fp)	# spill _tmp966 from $s5 to $fp-128
	  jalr $s5            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp968 = this - _tmp967
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  sub $t2, $t1, $t0	
	# _tmp969 = *(_tmp965 + 8)
	  lw $t3, -124($fp)	# load _tmp965 from $fp-124 into $t3
	  lw $t4, 8($t3) 	# load with offset
	# PushParam _tmp968
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp969
	# (save modified registers before flow of control change)
	  sw $t0, -132($fp)	# spill _tmp967 from $t0 to $fp-132
	  sw $t2, -136($fp)	# spill _tmp968 from $t2 to $fp-136
	  sw $t4, -140($fp)	# spill _tmp969 from $t4 to $fp-140
	  jalr $t4            	# jump to function
	# _tmp970 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp971 = 24
	  li $t1, 24		# load constant value 24 into $t1
	# _tmp972 = this + _tmp971
	  lw $t2, 4($fp)	# load this from $fp+4 into $t2
	  add $t3, $t2, $t1	
	# _tmp973 = *(_tmp972)
	  lw $t4, 0($t3) 	# load with offset
	# PushParam _tmp973
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -144($fp)	# spill _tmp970 from $t0 to $fp-144
	  sw $t1, -148($fp)	# spill _tmp971 from $t1 to $fp-148
	  sw $t3, -152($fp)	# spill _tmp972 from $t3 to $fp-152
	  sw $t4, -156($fp)	# spill _tmp973 from $t4 to $fp-156
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp974 = ", your total is "
	  .data			# create string constant marked with label
	  _string53: .asciiz ", your total is "
	  .text
	  la $t0, _string53	# load label
	# PushParam _tmp974
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -160($fp)	# spill _tmp974 from $t0 to $fp-160
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp975 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp976 = this + _tmp975
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp977 = *(_tmp976)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp977
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# (save modified registers before flow of control change)
	  sw $t0, -164($fp)	# spill _tmp975 from $t0 to $fp-164
	  sw $t2, -168($fp)	# spill _tmp976 from $t2 to $fp-168
	  sw $t3, -172($fp)	# spill _tmp977 from $t3 to $fp-172
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp978 = ".\n"
	  .data			# create string constant marked with label
	  _string54: .asciiz ".\n"
	  .text
	  la $t0, _string54	# load label
	# PushParam _tmp978
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -176($fp)	# spill _tmp978 from $t0 to $fp-176
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp979 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# Return _tmp979
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _L67:
	# _tmp980 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp980
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_Dealer.HasMoney:
	# BeginFunc 20
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 20	# decrement sp to make space for locals/temps
	# _tmp981 = 20
	  li $t0, 20		# load constant value 20 into $t0
	# _tmp982 = this + _tmp981
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp983 = *(_tmp982)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp984 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp985 = _tmp984 < _tmp983
	  slt $t5, $t4, $t3	
	# Return _tmp985
	  move $v0, $t5		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_Dealer.PrintMoney:
	# BeginFunc 32
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 32	# decrement sp to make space for locals/temps
	# _tmp986 = 24
	  li $t0, 24		# load constant value 24 into $t0
	# _tmp987 = this + _tmp986
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp988 = *(_tmp987)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp988
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -8($fp)	# spill _tmp986 from $t0 to $fp-8
	  sw $t2, -12($fp)	# spill _tmp987 from $t2 to $fp-12
	  sw $t3, -16($fp)	# spill _tmp988 from $t3 to $fp-16
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp989 = ", you have $"
	  .data			# create string constant marked with label
	  _string55: .asciiz ", you have $"
	  .text
	  la $t0, _string55	# load label
	# PushParam _tmp989
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -20($fp)	# spill _tmp989 from $t0 to $fp-20
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp990 = 20
	  li $t0, 20		# load constant value 20 into $t0
	# _tmp991 = this + _tmp990
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp992 = *(_tmp991)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp992
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# (save modified registers before flow of control change)
	  sw $t0, -24($fp)	# spill _tmp990 from $t0 to $fp-24
	  sw $t2, -28($fp)	# spill _tmp991 from $t2 to $fp-28
	  sw $t3, -32($fp)	# spill _tmp992 from $t3 to $fp-32
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp993 = ".\n"
	  .data			# create string constant marked with label
	  _string56: .asciiz ".\n"
	  .text
	  la $t0, _string56	# load label
	# PushParam _tmp993
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -36($fp)	# spill _tmp993 from $t0 to $fp-36
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_Dealer.PlaceBet:
	# BeginFunc 136
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 136	# decrement sp to make space for locals/temps
	# _tmp994 = 16
	  li $t0, 16		# load constant value 16 into $t0
	# _tmp995 = this + _tmp994
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp996 = *(_tmp995)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp997 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp998 = 16
	  li $t5, 16		# load constant value 16 into $t5
	# _tmp999 = this + _tmp998
	  add $t6, $t1, $t5	
	# *(_tmp999) = _tmp997
	  sw $t4, 0($t6) 	# store with offset
	# _tmp1000 = *(this)
	  lw $t7, 0($t1) 	# load with offset
	# _tmp1001 = *(_tmp1000)
	  lw $s0, 0($t7) 	# load with offset
	# _tmp1002 = ACall _tmp1001
	# (save modified registers before flow of control change)
	  sw $t0, -8($fp)	# spill _tmp994 from $t0 to $fp-8
	  sw $t2, -12($fp)	# spill _tmp995 from $t2 to $fp-12
	  sw $t3, -16($fp)	# spill _tmp996 from $t3 to $fp-16
	  sw $t4, -20($fp)	# spill _tmp997 from $t4 to $fp-20
	  sw $t5, -24($fp)	# spill _tmp998 from $t5 to $fp-24
	  sw $t6, -28($fp)	# spill _tmp999 from $t6 to $fp-28
	  sw $t7, -32($fp)	# spill _tmp1000 from $t7 to $fp-32
	  sw $s0, -36($fp)	# spill _tmp1001 from $s0 to $fp-36
	  jalr $s0            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1003 = this - _tmp1002
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1004 = *(_tmp1000 + 24)
	  lw $t3, -32($fp)	# load _tmp1000 from $fp-32 into $t3
	  lw $t4, 24($t3) 	# load with offset
	# PushParam _tmp1003
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp1004
	# (save modified registers before flow of control change)
	  sw $t0, -40($fp)	# spill _tmp1002 from $t0 to $fp-40
	  sw $t2, -44($fp)	# spill _tmp1003 from $t2 to $fp-44
	  sw $t4, -48($fp)	# spill _tmp1004 from $t4 to $fp-48
	  jalr $t4            	# jump to function
	# _tmp1005 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# (save modified registers before flow of control change)
	  sw $t0, -52($fp)	# spill _tmp1005 from $t0 to $fp-52
  _L68:
	# _tmp1006 = 16
	  li $t0, 16		# load constant value 16 into $t0
	# _tmp1007 = this + _tmp1006
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1008 = *(_tmp1007)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1009 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp1010 = _tmp1008 == _tmp1009
	  seq $t5, $t3, $t4	
	# _tmp1011 = _tmp1008 < _tmp1009
	  slt $t6, $t3, $t4	
	# _tmp1012 = _tmp1011 || _tmp1010
	  or $t7, $t6, $t5	
	# _tmp1013 = 16
	  li $s0, 16		# load constant value 16 into $s0
	# _tmp1014 = this + _tmp1013
	  add $s1, $t1, $s0	
	# _tmp1015 = *(_tmp1014)
	  lw $s2, 0($s1) 	# load with offset
	# _tmp1016 = 20
	  li $s3, 20		# load constant value 20 into $s3
	# _tmp1017 = this + _tmp1016
	  add $s4, $t1, $s3	
	# _tmp1018 = *(_tmp1017)
	  lw $s5, 0($s4) 	# load with offset
	# _tmp1019 = _tmp1018 < _tmp1015
	  slt $s6, $s5, $s2	
	# _tmp1020 = _tmp1012 || _tmp1019
	  or $s7, $t7, $s6	
	# IfZ _tmp1020 Goto _L69
	# (save modified registers before flow of control change)
	  sw $t0, -56($fp)	# spill _tmp1006 from $t0 to $fp-56
	  sw $t2, -60($fp)	# spill _tmp1007 from $t2 to $fp-60
	  sw $t3, -64($fp)	# spill _tmp1008 from $t3 to $fp-64
	  sw $t4, -68($fp)	# spill _tmp1009 from $t4 to $fp-68
	  sw $t5, -72($fp)	# spill _tmp1010 from $t5 to $fp-72
	  sw $t6, -76($fp)	# spill _tmp1011 from $t6 to $fp-76
	  sw $t7, -80($fp)	# spill _tmp1012 from $t7 to $fp-80
	  sw $s0, -84($fp)	# spill _tmp1013 from $s0 to $fp-84
	  sw $s1, -88($fp)	# spill _tmp1014 from $s1 to $fp-88
	  sw $s2, -92($fp)	# spill _tmp1015 from $s2 to $fp-92
	  sw $s3, -96($fp)	# spill _tmp1016 from $s3 to $fp-96
	  sw $s4, -100($fp)	# spill _tmp1017 from $s4 to $fp-100
	  sw $s5, -104($fp)	# spill _tmp1018 from $s5 to $fp-104
	  sw $s6, -108($fp)	# spill _tmp1019 from $s6 to $fp-108
	  sw $s7, -112($fp)	# spill _tmp1020 from $s7 to $fp-112
	  beqz $s7, _L69	# branch if _tmp1020 is zero 
	# _tmp1021 = "How much would you like to bet? "
	  .data			# create string constant marked with label
	  _string57: .asciiz "How much would you like to bet? "
	  .text
	  la $t0, _string57	# load label
	# PushParam _tmp1021
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -116($fp)	# spill _tmp1021 from $t0 to $fp-116
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1022 = 16
	  li $t0, 16		# load constant value 16 into $t0
	# _tmp1023 = this + _tmp1022
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1024 = *(_tmp1023)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1025 = LCall _ReadInteger
	# (save modified registers before flow of control change)
	  sw $t0, -120($fp)	# spill _tmp1022 from $t0 to $fp-120
	  sw $t2, -124($fp)	# spill _tmp1023 from $t2 to $fp-124
	  sw $t3, -128($fp)	# spill _tmp1024 from $t3 to $fp-128
	  jal _ReadInteger   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1026 = 16
	  li $t1, 16		# load constant value 16 into $t1
	# _tmp1027 = this + _tmp1026
	  lw $t2, 4($fp)	# load this from $fp+4 into $t2
	  add $t3, $t2, $t1	
	# *(_tmp1027) = _tmp1025
	  sw $t0, 0($t3) 	# store with offset
	# Goto _L68
	# (save modified registers before flow of control change)
	  sw $t0, -132($fp)	# spill _tmp1025 from $t0 to $fp-132
	  sw $t1, -136($fp)	# spill _tmp1026 from $t1 to $fp-136
	  sw $t3, -140($fp)	# spill _tmp1027 from $t3 to $fp-140
	  b _L68		# unconditional branch
  _L69:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_Dealer.GetTotal:
	# BeginFunc 12
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 12	# decrement sp to make space for locals/temps
	# _tmp1028 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp1029 = this + _tmp1028
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1030 = *(_tmp1029)
	  lw $t3, 0($t2) 	# load with offset
	# Return _tmp1030
	  move $v0, $t3		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_Dealer.Resolve:
	# BeginFunc 324
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 324	# decrement sp to make space for locals/temps
	# _tmp1031 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# win = _tmp1031
	  move $t1, $t0		# copy value
	# _tmp1032 = 0
	  li $t2, 0		# load constant value 0 into $t2
	# lose = _tmp1032
	  move $t3, $t2		# copy value
	# _tmp1033 = 4
	  li $t4, 4		# load constant value 4 into $t4
	# _tmp1034 = this + _tmp1033
	  lw $t5, 4($fp)	# load this from $fp+4 into $t5
	  add $t6, $t5, $t4	
	# _tmp1035 = *(_tmp1034)
	  lw $t7, 0($t6) 	# load with offset
	# _tmp1036 = 21
	  li $s0, 21		# load constant value 21 into $s0
	# _tmp1037 = _tmp1035 == _tmp1036
	  seq $s1, $t7, $s0	
	# _tmp1038 = 12
	  li $s2, 12		# load constant value 12 into $s2
	# _tmp1039 = this + _tmp1038
	  add $s3, $t5, $s2	
	# _tmp1040 = *(_tmp1039)
	  lw $s4, 0($s3) 	# load with offset
	# _tmp1041 = 2
	  li $s5, 2		# load constant value 2 into $s5
	# _tmp1042 = _tmp1040 == _tmp1041
	  seq $s6, $s4, $s5	
	# _tmp1043 = _tmp1037 && _tmp1042
	  and $s7, $s1, $s6	
	# IfZ _tmp1043 Goto _L71
	# (save modified registers before flow of control change)
	  sw $t0, -16($fp)	# spill _tmp1031 from $t0 to $fp-16
	  sw $t1, -8($fp)	# spill win from $t1 to $fp-8
	  sw $t2, -20($fp)	# spill _tmp1032 from $t2 to $fp-20
	  sw $t3, -12($fp)	# spill lose from $t3 to $fp-12
	  sw $t4, -24($fp)	# spill _tmp1033 from $t4 to $fp-24
	  sw $t6, -28($fp)	# spill _tmp1034 from $t6 to $fp-28
	  sw $t7, -32($fp)	# spill _tmp1035 from $t7 to $fp-32
	  sw $s0, -36($fp)	# spill _tmp1036 from $s0 to $fp-36
	  sw $s1, -40($fp)	# spill _tmp1037 from $s1 to $fp-40
	  sw $s2, -44($fp)	# spill _tmp1038 from $s2 to $fp-44
	  sw $s3, -48($fp)	# spill _tmp1039 from $s3 to $fp-48
	  sw $s4, -52($fp)	# spill _tmp1040 from $s4 to $fp-52
	  sw $s5, -56($fp)	# spill _tmp1041 from $s5 to $fp-56
	  sw $s6, -60($fp)	# spill _tmp1042 from $s6 to $fp-60
	  sw $s7, -64($fp)	# spill _tmp1043 from $s7 to $fp-64
	  beqz $s7, _L71	# branch if _tmp1043 is zero 
	# _tmp1044 = 2
	  li $t0, 2		# load constant value 2 into $t0
	# win = _tmp1044
	  move $t1, $t0		# copy value
	# Goto _L70
	# (save modified registers before flow of control change)
	  sw $t0, -68($fp)	# spill _tmp1044 from $t0 to $fp-68
	  sw $t1, -8($fp)	# spill win from $t1 to $fp-8
	  b _L70		# unconditional branch
  _L71:
	# _tmp1045 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp1046 = this + _tmp1045
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1047 = *(_tmp1046)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1048 = 21
	  li $t4, 21		# load constant value 21 into $t4
	# _tmp1049 = _tmp1048 < _tmp1047
	  slt $t5, $t4, $t3	
	# IfZ _tmp1049 Goto _L73
	# (save modified registers before flow of control change)
	  sw $t0, -72($fp)	# spill _tmp1045 from $t0 to $fp-72
	  sw $t2, -76($fp)	# spill _tmp1046 from $t2 to $fp-76
	  sw $t3, -80($fp)	# spill _tmp1047 from $t3 to $fp-80
	  sw $t4, -84($fp)	# spill _tmp1048 from $t4 to $fp-84
	  sw $t5, -88($fp)	# spill _tmp1049 from $t5 to $fp-88
	  beqz $t5, _L73	# branch if _tmp1049 is zero 
	# _tmp1050 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# lose = _tmp1050
	  move $t1, $t0		# copy value
	# Goto _L72
	# (save modified registers before flow of control change)
	  sw $t0, -92($fp)	# spill _tmp1050 from $t0 to $fp-92
	  sw $t1, -12($fp)	# spill lose from $t1 to $fp-12
	  b _L72		# unconditional branch
  _L73:
	# _tmp1051 = 21
	  li $t0, 21		# load constant value 21 into $t0
	# _tmp1052 = _tmp1051 < dealer
	  lw $t1, 8($fp)	# load dealer from $fp+8 into $t1
	  slt $t2, $t0, $t1	
	# IfZ _tmp1052 Goto _L75
	# (save modified registers before flow of control change)
	  sw $t0, -96($fp)	# spill _tmp1051 from $t0 to $fp-96
	  sw $t2, -100($fp)	# spill _tmp1052 from $t2 to $fp-100
	  beqz $t2, _L75	# branch if _tmp1052 is zero 
	# _tmp1053 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# win = _tmp1053
	  move $t1, $t0		# copy value
	# Goto _L74
	# (save modified registers before flow of control change)
	  sw $t0, -104($fp)	# spill _tmp1053 from $t0 to $fp-104
	  sw $t1, -8($fp)	# spill win from $t1 to $fp-8
	  b _L74		# unconditional branch
  _L75:
	# _tmp1054 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp1055 = this + _tmp1054
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1056 = *(_tmp1055)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1057 = dealer < _tmp1056
	  lw $t4, 8($fp)	# load dealer from $fp+8 into $t4
	  slt $t5, $t4, $t3	
	# IfZ _tmp1057 Goto _L77
	# (save modified registers before flow of control change)
	  sw $t0, -108($fp)	# spill _tmp1054 from $t0 to $fp-108
	  sw $t2, -112($fp)	# spill _tmp1055 from $t2 to $fp-112
	  sw $t3, -116($fp)	# spill _tmp1056 from $t3 to $fp-116
	  sw $t5, -120($fp)	# spill _tmp1057 from $t5 to $fp-120
	  beqz $t5, _L77	# branch if _tmp1057 is zero 
	# _tmp1058 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# win = _tmp1058
	  move $t1, $t0		# copy value
	# Goto _L76
	# (save modified registers before flow of control change)
	  sw $t0, -124($fp)	# spill _tmp1058 from $t0 to $fp-124
	  sw $t1, -8($fp)	# spill win from $t1 to $fp-8
	  b _L76		# unconditional branch
  _L77:
	# _tmp1059 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp1060 = this + _tmp1059
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1061 = *(_tmp1060)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1062 = _tmp1061 < dealer
	  lw $t4, 8($fp)	# load dealer from $fp+8 into $t4
	  slt $t5, $t3, $t4	
	# IfZ _tmp1062 Goto _L78
	# (save modified registers before flow of control change)
	  sw $t0, -128($fp)	# spill _tmp1059 from $t0 to $fp-128
	  sw $t2, -132($fp)	# spill _tmp1060 from $t2 to $fp-132
	  sw $t3, -136($fp)	# spill _tmp1061 from $t3 to $fp-136
	  sw $t5, -140($fp)	# spill _tmp1062 from $t5 to $fp-140
	  beqz $t5, _L78	# branch if _tmp1062 is zero 
	# _tmp1063 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# lose = _tmp1063
	  move $t1, $t0		# copy value
	# (save modified registers before flow of control change)
	  sw $t0, -144($fp)	# spill _tmp1063 from $t0 to $fp-144
	  sw $t1, -12($fp)	# spill lose from $t1 to $fp-12
  _L78:
  _L76:
  _L74:
  _L72:
  _L70:
	# _tmp1064 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp1065 = win == _tmp1064
	  lw $t1, -8($fp)	# load win from $fp-8 into $t1
	  seq $t2, $t1, $t0	
	# _tmp1066 = _tmp1064 < win
	  slt $t3, $t0, $t1	
	# _tmp1067 = _tmp1066 || _tmp1065
	  or $t4, $t3, $t2	
	# IfZ _tmp1067 Goto _L80
	# (save modified registers before flow of control change)
	  sw $t0, -148($fp)	# spill _tmp1064 from $t0 to $fp-148
	  sw $t2, -152($fp)	# spill _tmp1065 from $t2 to $fp-152
	  sw $t3, -156($fp)	# spill _tmp1066 from $t3 to $fp-156
	  sw $t4, -160($fp)	# spill _tmp1067 from $t4 to $fp-160
	  beqz $t4, _L80	# branch if _tmp1067 is zero 
	# _tmp1068 = 24
	  li $t0, 24		# load constant value 24 into $t0
	# _tmp1069 = this + _tmp1068
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1070 = *(_tmp1069)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp1070
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -164($fp)	# spill _tmp1068 from $t0 to $fp-164
	  sw $t2, -168($fp)	# spill _tmp1069 from $t2 to $fp-168
	  sw $t3, -172($fp)	# spill _tmp1070 from $t3 to $fp-172
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1071 = ", you won $"
	  .data			# create string constant marked with label
	  _string58: .asciiz ", you won $"
	  .text
	  la $t0, _string58	# load label
	# PushParam _tmp1071
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -176($fp)	# spill _tmp1071 from $t0 to $fp-176
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1072 = 16
	  li $t0, 16		# load constant value 16 into $t0
	# _tmp1073 = this + _tmp1072
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1074 = *(_tmp1073)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp1074
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# (save modified registers before flow of control change)
	  sw $t0, -180($fp)	# spill _tmp1072 from $t0 to $fp-180
	  sw $t2, -184($fp)	# spill _tmp1073 from $t2 to $fp-184
	  sw $t3, -188($fp)	# spill _tmp1074 from $t3 to $fp-188
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1075 = ".\n"
	  .data			# create string constant marked with label
	  _string59: .asciiz ".\n"
	  .text
	  la $t0, _string59	# load label
	# PushParam _tmp1075
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -192($fp)	# spill _tmp1075 from $t0 to $fp-192
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L79
	  b _L79		# unconditional branch
  _L80:
	# _tmp1076 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp1077 = lose == _tmp1076
	  lw $t1, -12($fp)	# load lose from $fp-12 into $t1
	  seq $t2, $t1, $t0	
	# _tmp1078 = _tmp1076 < lose
	  slt $t3, $t0, $t1	
	# _tmp1079 = _tmp1078 || _tmp1077
	  or $t4, $t3, $t2	
	# IfZ _tmp1079 Goto _L82
	# (save modified registers before flow of control change)
	  sw $t0, -196($fp)	# spill _tmp1076 from $t0 to $fp-196
	  sw $t2, -200($fp)	# spill _tmp1077 from $t2 to $fp-200
	  sw $t3, -204($fp)	# spill _tmp1078 from $t3 to $fp-204
	  sw $t4, -208($fp)	# spill _tmp1079 from $t4 to $fp-208
	  beqz $t4, _L82	# branch if _tmp1079 is zero 
	# _tmp1080 = 24
	  li $t0, 24		# load constant value 24 into $t0
	# _tmp1081 = this + _tmp1080
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1082 = *(_tmp1081)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp1082
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -212($fp)	# spill _tmp1080 from $t0 to $fp-212
	  sw $t2, -216($fp)	# spill _tmp1081 from $t2 to $fp-216
	  sw $t3, -220($fp)	# spill _tmp1082 from $t3 to $fp-220
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1083 = ", you lost $"
	  .data			# create string constant marked with label
	  _string60: .asciiz ", you lost $"
	  .text
	  la $t0, _string60	# load label
	# PushParam _tmp1083
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -224($fp)	# spill _tmp1083 from $t0 to $fp-224
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1084 = 16
	  li $t0, 16		# load constant value 16 into $t0
	# _tmp1085 = this + _tmp1084
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1086 = *(_tmp1085)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp1086
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintInt
	# (save modified registers before flow of control change)
	  sw $t0, -228($fp)	# spill _tmp1084 from $t0 to $fp-228
	  sw $t2, -232($fp)	# spill _tmp1085 from $t2 to $fp-232
	  sw $t3, -236($fp)	# spill _tmp1086 from $t3 to $fp-236
	  jal _PrintInt      	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1087 = ".\n"
	  .data			# create string constant marked with label
	  _string61: .asciiz ".\n"
	  .text
	  la $t0, _string61	# load label
	# PushParam _tmp1087
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -240($fp)	# spill _tmp1087 from $t0 to $fp-240
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# Goto _L81
	  b _L81		# unconditional branch
  _L82:
	# _tmp1088 = 24
	  li $t0, 24		# load constant value 24 into $t0
	# _tmp1089 = this + _tmp1088
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1090 = *(_tmp1089)
	  lw $t3, 0($t2) 	# load with offset
	# PushParam _tmp1090
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -244($fp)	# spill _tmp1088 from $t0 to $fp-244
	  sw $t2, -248($fp)	# spill _tmp1089 from $t2 to $fp-248
	  sw $t3, -252($fp)	# spill _tmp1090 from $t3 to $fp-252
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1091 = ", you push!\n"
	  .data			# create string constant marked with label
	  _string62: .asciiz ", you push!\n"
	  .text
	  la $t0, _string62	# load label
	# PushParam _tmp1091
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -256($fp)	# spill _tmp1091 from $t0 to $fp-256
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
  _L81:
  _L79:
	# _tmp1092 = 16
	  li $t0, 16		# load constant value 16 into $t0
	# _tmp1093 = this + _tmp1092
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1094 = *(_tmp1093)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1095 = win * _tmp1094
	  lw $t4, -8($fp)	# load win from $fp-8 into $t4
	  mul $t5, $t4, $t3	
	# win = _tmp1095
	  move $t4, $t5		# copy value
	# _tmp1096 = 16
	  li $t6, 16		# load constant value 16 into $t6
	# _tmp1097 = this + _tmp1096
	  add $t7, $t1, $t6	
	# _tmp1098 = *(_tmp1097)
	  lw $s0, 0($t7) 	# load with offset
	# _tmp1099 = lose * _tmp1098
	  lw $s1, -12($fp)	# load lose from $fp-12 into $s1
	  mul $s2, $s1, $s0	
	# lose = _tmp1099
	  move $s1, $s2		# copy value
	# _tmp1100 = 20
	  li $s3, 20		# load constant value 20 into $s3
	# _tmp1101 = this + _tmp1100
	  add $s4, $t1, $s3	
	# _tmp1102 = *(_tmp1101)
	  lw $s5, 0($s4) 	# load with offset
	# _tmp1103 = 20
	  li $s6, 20		# load constant value 20 into $s6
	# _tmp1104 = this + _tmp1103
	  add $s7, $t1, $s6	
	# _tmp1105 = *(_tmp1104)
	  lw $t8, 0($s7) 	# load with offset
	# _tmp1106 = _tmp1105 + win
	  add $t9, $t8, $t4	
	# _tmp1107 = _tmp1106 - lose
	  sub $t1, $t9, $s1	
	# _tmp1108 = 20
	  sw $s0, -284($fp)	# spill _tmp1098 from $s0 to $fp-284
	  li $s0, 20		# load constant value 20 into $s0
	# _tmp1109 = this + _tmp1108
	  sw $s1, -12($fp)	# spill lose from $s1 to $fp-12
	  lw $s1, 4($fp)	# load this from $fp+4 into $s1
	  sw $s2, -288($fp)	# spill _tmp1099 from $s2 to $fp-288
	  add $s2, $s1, $s0	
	# *(_tmp1109) = _tmp1107
	  sw $t1, 0($s2) 	# store with offset
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  _offset_House_0:
	# BeginFunc 4
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 4	# decrement sp to make space for locals/temps
	# _tmp1110 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# Return _tmp1110
	  move $v0, $t0		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# VTable for class House
	  .data
	  .align 2
	  House:		# label for class House vtable
	  .word _offset_House_0
	  .word f_House.SetupGame
	  .word f_House.SetupPlayers
	  .word f_House.TakeAllBets
	  .word f_House.TakeAllTurns
	  .word f_House.ResolveAllPlayers
	  .word f_House.PrintAllMoney
	  .word f_House.PlayOneGame
	  .text
  f_House.SetupGame:
	# BeginFunc 188
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 188	# decrement sp to make space for locals/temps
	# _tmp1111 = "\nWelcome to CS143 BlackJack!\n"
	  .data			# create string constant marked with label
	  _string63: .asciiz "\nWelcome to CS143 BlackJack!\n"
	  .text
	  la $t0, _string63	# load label
	# PushParam _tmp1111
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -8($fp)	# spill _tmp1111 from $t0 to $fp-8
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1112 = "---------------------------\n"
	  .data			# create string constant marked with label
	  _string64: .asciiz "---------------------------\n"
	  .text
	  la $t0, _string64	# load label
	# PushParam _tmp1112
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -12($fp)	# spill _tmp1112 from $t0 to $fp-12
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1113 = 8
	  li $t0, 8		# load constant value 8 into $t0
	# PushParam _tmp1113
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1114 = LCall _Alloc
	# (save modified registers before flow of control change)
	  sw $t0, -16($fp)	# spill _tmp1113 from $t0 to $fp-16
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1115 = Random
	  la $t1, Random	# load label
	# *(_tmp1114) = _tmp1115
	  sw $t1, 0($t0) 	# store with offset
	# gRnd = _tmp1114
	  move $t2, $t0		# copy value
	# _tmp1116 = "Please enter a random number seed: "
	  .data			# create string constant marked with label
	  _string65: .asciiz "Please enter a random number seed: "
	  .text
	  la $t3, _string65	# load label
	# PushParam _tmp1116
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -20($fp)	# spill _tmp1114 from $t0 to $fp-20
	  sw $t1, -24($fp)	# spill _tmp1115 from $t1 to $fp-24
	  sw $t2, 0($gp)	# spill gRnd from $t2 to $gp+0
	  sw $t3, -28($fp)	# spill _tmp1116 from $t3 to $fp-28
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1117 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PushParam _tmp1117
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1118 = *(gRnd)
	  lw $t1, 0($gp)	# load gRnd from $gp+0 into $t1
	  lw $t2, 0($t1) 	# load with offset
	# _tmp1119 = *(_tmp1118)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1120 = ACall _tmp1119
	# (save modified registers before flow of control change)
	  sw $t0, -32($fp)	# spill _tmp1117 from $t0 to $fp-32
	  sw $t2, -36($fp)	# spill _tmp1118 from $t2 to $fp-36
	  sw $t3, -40($fp)	# spill _tmp1119 from $t3 to $fp-40
	  jalr $t3            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1121 = gRnd - _tmp1120
	  lw $t1, 0($gp)	# load gRnd from $gp+0 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1122 = *(_tmp1118 + 4)
	  lw $t3, -36($fp)	# load _tmp1118 from $fp-36 into $t3
	  lw $t4, 4($t3) 	# load with offset
	# PushParam _tmp1121
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp1122
	# (save modified registers before flow of control change)
	  sw $t0, -44($fp)	# spill _tmp1120 from $t0 to $fp-44
	  sw $t2, -48($fp)	# spill _tmp1121 from $t2 to $fp-48
	  sw $t4, -52($fp)	# spill _tmp1122 from $t4 to $fp-52
	  jalr $t4            	# jump to function
	# _tmp1123 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1124 = 12
	  li $t1, 12		# load constant value 12 into $t1
	# _tmp1125 = this + _tmp1124
	  lw $t2, 4($fp)	# load this from $fp+4 into $t2
	  add $t3, $t2, $t1	
	# _tmp1126 = *(_tmp1125)
	  lw $t4, 0($t3) 	# load with offset
	# _tmp1127 = 12
	  li $t5, 12		# load constant value 12 into $t5
	# PushParam _tmp1127
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t5, 4($sp)	# copy param value to stack
	# _tmp1128 = LCall _Alloc
	# (save modified registers before flow of control change)
	  sw $t0, -56($fp)	# spill _tmp1123 from $t0 to $fp-56
	  sw $t1, -60($fp)	# spill _tmp1124 from $t1 to $fp-60
	  sw $t3, -64($fp)	# spill _tmp1125 from $t3 to $fp-64
	  sw $t4, -68($fp)	# spill _tmp1126 from $t4 to $fp-68
	  sw $t5, -72($fp)	# spill _tmp1127 from $t5 to $fp-72
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1129 = BJDeck
	  la $t1, BJDeck	# load label
	# *(_tmp1128) = _tmp1129
	  sw $t1, 0($t0) 	# store with offset
	# _tmp1130 = 12
	  li $t2, 12		# load constant value 12 into $t2
	# _tmp1131 = this + _tmp1130
	  lw $t3, 4($fp)	# load this from $fp+4 into $t3
	  add $t4, $t3, $t2	
	# *(_tmp1131) = _tmp1128
	  sw $t0, 0($t4) 	# store with offset
	# _tmp1132 = 8
	  li $t5, 8		# load constant value 8 into $t5
	# _tmp1133 = this + _tmp1132
	  add $t6, $t3, $t5	
	# _tmp1134 = *(_tmp1133)
	  lw $t7, 0($t6) 	# load with offset
	# _tmp1135 = 28
	  li $s0, 28		# load constant value 28 into $s0
	# PushParam _tmp1135
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s0, 4($sp)	# copy param value to stack
	# _tmp1136 = LCall _Alloc
	# (save modified registers before flow of control change)
	  sw $t0, -76($fp)	# spill _tmp1128 from $t0 to $fp-76
	  sw $t1, -80($fp)	# spill _tmp1129 from $t1 to $fp-80
	  sw $t2, -84($fp)	# spill _tmp1130 from $t2 to $fp-84
	  sw $t4, -88($fp)	# spill _tmp1131 from $t4 to $fp-88
	  sw $t5, -92($fp)	# spill _tmp1132 from $t5 to $fp-92
	  sw $t6, -96($fp)	# spill _tmp1133 from $t6 to $fp-96
	  sw $t7, -100($fp)	# spill _tmp1134 from $t7 to $fp-100
	  sw $s0, -104($fp)	# spill _tmp1135 from $s0 to $fp-104
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1137 = Dealer
	  la $t1, Dealer	# load label
	# *(_tmp1136) = _tmp1137
	  sw $t1, 0($t0) 	# store with offset
	# _tmp1138 = 8
	  li $t2, 8		# load constant value 8 into $t2
	# _tmp1139 = this + _tmp1138
	  lw $t3, 4($fp)	# load this from $fp+4 into $t3
	  add $t4, $t3, $t2	
	# *(_tmp1139) = _tmp1136
	  sw $t0, 0($t4) 	# store with offset
	# _tmp1140 = 12
	  li $t5, 12		# load constant value 12 into $t5
	# _tmp1141 = this + _tmp1140
	  add $t6, $t3, $t5	
	# _tmp1142 = *(_tmp1141)
	  lw $t7, 0($t6) 	# load with offset
	# _tmp1143 = *(_tmp1142)
	  lw $s0, 0($t7) 	# load with offset
	# _tmp1144 = *(_tmp1143)
	  lw $s1, 0($s0) 	# load with offset
	# _tmp1145 = ACall _tmp1144
	# (save modified registers before flow of control change)
	  sw $t0, -108($fp)	# spill _tmp1136 from $t0 to $fp-108
	  sw $t1, -112($fp)	# spill _tmp1137 from $t1 to $fp-112
	  sw $t2, -116($fp)	# spill _tmp1138 from $t2 to $fp-116
	  sw $t4, -120($fp)	# spill _tmp1139 from $t4 to $fp-120
	  sw $t5, -124($fp)	# spill _tmp1140 from $t5 to $fp-124
	  sw $t6, -128($fp)	# spill _tmp1141 from $t6 to $fp-128
	  sw $t7, -132($fp)	# spill _tmp1142 from $t7 to $fp-132
	  sw $s0, -136($fp)	# spill _tmp1143 from $s0 to $fp-136
	  sw $s1, -140($fp)	# spill _tmp1144 from $s1 to $fp-140
	  jalr $s1            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1146 = _tmp1142 - _tmp1145
	  lw $t1, -132($fp)	# load _tmp1142 from $fp-132 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1147 = *(_tmp1143 + 4)
	  lw $t3, -136($fp)	# load _tmp1143 from $fp-136 into $t3
	  lw $t4, 4($t3) 	# load with offset
	# PushParam _tmp1146
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp1147
	# (save modified registers before flow of control change)
	  sw $t0, -144($fp)	# spill _tmp1145 from $t0 to $fp-144
	  sw $t2, -148($fp)	# spill _tmp1146 from $t2 to $fp-148
	  sw $t4, -152($fp)	# spill _tmp1147 from $t4 to $fp-152
	  jalr $t4            	# jump to function
	# _tmp1148 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1149 = 12
	  li $t1, 12		# load constant value 12 into $t1
	# _tmp1150 = this + _tmp1149
	  lw $t2, 4($fp)	# load this from $fp+4 into $t2
	  add $t3, $t2, $t1	
	# _tmp1151 = *(_tmp1150)
	  lw $t4, 0($t3) 	# load with offset
	# _tmp1152 = *(_tmp1151)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp1153 = *(_tmp1152)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp1154 = ACall _tmp1153
	# (save modified registers before flow of control change)
	  sw $t0, -156($fp)	# spill _tmp1148 from $t0 to $fp-156
	  sw $t1, -160($fp)	# spill _tmp1149 from $t1 to $fp-160
	  sw $t3, -164($fp)	# spill _tmp1150 from $t3 to $fp-164
	  sw $t4, -168($fp)	# spill _tmp1151 from $t4 to $fp-168
	  sw $t5, -172($fp)	# spill _tmp1152 from $t5 to $fp-172
	  sw $t6, -176($fp)	# spill _tmp1153 from $t6 to $fp-176
	  jalr $t6            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1155 = _tmp1151 - _tmp1154
	  lw $t1, -168($fp)	# load _tmp1151 from $fp-168 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1156 = *(_tmp1152 + 12)
	  lw $t3, -172($fp)	# load _tmp1152 from $fp-172 into $t3
	  lw $t4, 12($t3) 	# load with offset
	# PushParam _tmp1155
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp1156
	# (save modified registers before flow of control change)
	  sw $t0, -180($fp)	# spill _tmp1154 from $t0 to $fp-180
	  sw $t2, -184($fp)	# spill _tmp1155 from $t2 to $fp-184
	  sw $t4, -188($fp)	# spill _tmp1156 from $t4 to $fp-188
	  jalr $t4            	# jump to function
	# _tmp1157 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_House.SetupPlayers:
	# BeginFunc 328
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 328	# decrement sp to make space for locals/temps
	# _tmp1158 = "How many players do we have today? "
	  .data			# create string constant marked with label
	  _string66: .asciiz "How many players do we have today? "
	  .text
	  la $t0, _string66	# load label
	# PushParam _tmp1158
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -16($fp)	# spill _tmp1158 from $t0 to $fp-16
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1159 = LCall _ReadInteger
	  jal _ReadInteger   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# numPlayers = _tmp1159
	  move $t1, $t0		# copy value
	# _tmp1160 = 4
	  li $t2, 4		# load constant value 4 into $t2
	# _tmp1161 = this + _tmp1160
	  lw $t3, 4($fp)	# load this from $fp+4 into $t3
	  add $t4, $t3, $t2	
	# _tmp1162 = *(_tmp1161)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp1163 = 0
	  li $t6, 0		# load constant value 0 into $t6
	# _tmp1164 = 4
	  li $t7, 4		# load constant value 4 into $t7
	# _tmp1165 = _tmp1163 < numPlayers
	  slt $s0, $t6, $t1	
	# IfZ _tmp1165 Goto _L83
	# (save modified registers before flow of control change)
	  sw $t0, -20($fp)	# spill _tmp1159 from $t0 to $fp-20
	  sw $t1, -12($fp)	# spill numPlayers from $t1 to $fp-12
	  sw $t2, -24($fp)	# spill _tmp1160 from $t2 to $fp-24
	  sw $t4, -28($fp)	# spill _tmp1161 from $t4 to $fp-28
	  sw $t5, -32($fp)	# spill _tmp1162 from $t5 to $fp-32
	  sw $t6, -36($fp)	# spill _tmp1163 from $t6 to $fp-36
	  sw $t7, -40($fp)	# spill _tmp1164 from $t7 to $fp-40
	  sw $s0, -44($fp)	# spill _tmp1165 from $s0 to $fp-44
	  beqz $s0, _L83	# branch if _tmp1165 is zero 
	# Goto _L84
	  b _L84		# unconditional branch
  _L83:
	# _tmp1166 = "Decaf runtime error: Array size is <= 0\n"
	  .data			# create string constant marked with label
	  _string67: .asciiz "Decaf runtime error: Array size is <= 0\n"
	  .text
	  la $t0, _string67	# load label
	# PushParam _tmp1166
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -48($fp)	# spill _tmp1166 from $t0 to $fp-48
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L84:
	# _tmp1167 = numPlayers * _tmp1164
	  lw $t0, -12($fp)	# load numPlayers from $fp-12 into $t0
	  lw $t1, -40($fp)	# load _tmp1164 from $fp-40 into $t1
	  mul $t2, $t0, $t1	
	# _tmp1168 = _tmp1167 + _tmp1164
	  add $t3, $t2, $t1	
	# PushParam _tmp1168
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t3, 4($sp)	# copy param value to stack
	# _tmp1169 = LCall _Alloc
	# (save modified registers before flow of control change)
	  sw $t2, -52($fp)	# spill _tmp1167 from $t2 to $fp-52
	  sw $t3, -56($fp)	# spill _tmp1168 from $t3 to $fp-56
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# *(_tmp1169) = numPlayers
	  lw $t1, -12($fp)	# load numPlayers from $fp-12 into $t1
	  sw $t1, 0($t0) 	# store with offset
	# _tmp1170 = 4
	  li $t2, 4		# load constant value 4 into $t2
	# _tmp1171 = this + _tmp1170
	  lw $t3, 4($fp)	# load this from $fp+4 into $t3
	  add $t4, $t3, $t2	
	# *(_tmp1171) = _tmp1169
	  sw $t0, 0($t4) 	# store with offset
	# _tmp1172 = 0
	  li $t5, 0		# load constant value 0 into $t5
	# i = _tmp1172
	  move $t6, $t5		# copy value
	# (save modified registers before flow of control change)
	  sw $t0, -60($fp)	# spill _tmp1169 from $t0 to $fp-60
	  sw $t2, -64($fp)	# spill _tmp1170 from $t2 to $fp-64
	  sw $t4, -68($fp)	# spill _tmp1171 from $t4 to $fp-68
	  sw $t5, -72($fp)	# spill _tmp1172 from $t5 to $fp-72
	  sw $t6, -8($fp)	# spill i from $t6 to $fp-8
  _L85:
	# _tmp1173 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp1174 = this + _tmp1173
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1175 = *(_tmp1174)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1176 = *(_tmp1175)
	  lw $t4, 0($t3) 	# load with offset
	# _tmp1177 = i < _tmp1176
	  lw $t5, -8($fp)	# load i from $fp-8 into $t5
	  slt $t6, $t5, $t4	
	# IfZ _tmp1177 Goto _L86
	# (save modified registers before flow of control change)
	  sw $t0, -76($fp)	# spill _tmp1173 from $t0 to $fp-76
	  sw $t2, -80($fp)	# spill _tmp1174 from $t2 to $fp-80
	  sw $t3, -84($fp)	# spill _tmp1175 from $t3 to $fp-84
	  sw $t4, -88($fp)	# spill _tmp1176 from $t4 to $fp-88
	  sw $t6, -92($fp)	# spill _tmp1177 from $t6 to $fp-92
	  beqz $t6, _L86	# branch if _tmp1177 is zero 
	# _tmp1178 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp1179 = this + _tmp1178
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1180 = *(_tmp1179)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1181 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp1182 = 4
	  li $t5, 4		# load constant value 4 into $t5
	# _tmp1183 = *(_tmp1180)
	  lw $t6, 0($t3) 	# load with offset
	# _tmp1184 = _tmp1183 == i
	  lw $t7, -8($fp)	# load i from $fp-8 into $t7
	  seq $s0, $t6, $t7	
	# _tmp1185 = _tmp1183 < i
	  slt $s1, $t6, $t7	
	# _tmp1186 = _tmp1185 || _tmp1184
	  or $s2, $s1, $s0	
	# _tmp1187 = i < _tmp1181
	  slt $s3, $t7, $t4	
	# _tmp1188 = _tmp1187 || _tmp1186
	  or $s4, $s3, $s2	
	# IfZ _tmp1188 Goto _L87
	# (save modified registers before flow of control change)
	  sw $t0, -96($fp)	# spill _tmp1178 from $t0 to $fp-96
	  sw $t2, -100($fp)	# spill _tmp1179 from $t2 to $fp-100
	  sw $t3, -104($fp)	# spill _tmp1180 from $t3 to $fp-104
	  sw $t4, -108($fp)	# spill _tmp1181 from $t4 to $fp-108
	  sw $t5, -112($fp)	# spill _tmp1182 from $t5 to $fp-112
	  sw $t6, -116($fp)	# spill _tmp1183 from $t6 to $fp-116
	  sw $s0, -120($fp)	# spill _tmp1184 from $s0 to $fp-120
	  sw $s1, -124($fp)	# spill _tmp1185 from $s1 to $fp-124
	  sw $s2, -128($fp)	# spill _tmp1186 from $s2 to $fp-128
	  sw $s3, -132($fp)	# spill _tmp1187 from $s3 to $fp-132
	  sw $s4, -136($fp)	# spill _tmp1188 from $s4 to $fp-136
	  beqz $s4, _L87	# branch if _tmp1188 is zero 
	# _tmp1189 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string68: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string68	# load label
	# PushParam _tmp1189
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -140($fp)	# spill _tmp1189 from $t0 to $fp-140
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L87:
	# _tmp1190 = i * _tmp1182
	  lw $t0, -8($fp)	# load i from $fp-8 into $t0
	  lw $t1, -112($fp)	# load _tmp1182 from $fp-112 into $t1
	  mul $t2, $t0, $t1	
	# _tmp1191 = _tmp1190 + _tmp1182
	  add $t3, $t2, $t1	
	# _tmp1192 = _tmp1180 + _tmp1191
	  lw $t4, -104($fp)	# load _tmp1180 from $fp-104 into $t4
	  add $t5, $t4, $t3	
	# _tmp1193 = *(_tmp1192)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp1194 = 28
	  li $t7, 28		# load constant value 28 into $t7
	# PushParam _tmp1194
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t7, 4($sp)	# copy param value to stack
	# _tmp1195 = LCall _Alloc
	# (save modified registers before flow of control change)
	  sw $t2, -144($fp)	# spill _tmp1190 from $t2 to $fp-144
	  sw $t3, -148($fp)	# spill _tmp1191 from $t3 to $fp-148
	  sw $t5, -152($fp)	# spill _tmp1192 from $t5 to $fp-152
	  sw $t6, -156($fp)	# spill _tmp1193 from $t6 to $fp-156
	  sw $t7, -160($fp)	# spill _tmp1194 from $t7 to $fp-160
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1196 = Player
	  la $t1, Player	# load label
	# *(_tmp1195) = _tmp1196
	  sw $t1, 0($t0) 	# store with offset
	# _tmp1197 = 4
	  li $t2, 4		# load constant value 4 into $t2
	# _tmp1198 = this + _tmp1197
	  lw $t3, 4($fp)	# load this from $fp+4 into $t3
	  add $t4, $t3, $t2	
	# _tmp1199 = *(_tmp1198)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp1200 = 0
	  li $t6, 0		# load constant value 0 into $t6
	# _tmp1201 = 4
	  li $t7, 4		# load constant value 4 into $t7
	# _tmp1202 = *(_tmp1199)
	  lw $s0, 0($t5) 	# load with offset
	# _tmp1203 = _tmp1202 == i
	  lw $s1, -8($fp)	# load i from $fp-8 into $s1
	  seq $s2, $s0, $s1	
	# _tmp1204 = _tmp1202 < i
	  slt $s3, $s0, $s1	
	# _tmp1205 = _tmp1204 || _tmp1203
	  or $s4, $s3, $s2	
	# _tmp1206 = i < _tmp1200
	  slt $s5, $s1, $t6	
	# _tmp1207 = _tmp1206 || _tmp1205
	  or $s6, $s5, $s4	
	# IfZ _tmp1207 Goto _L88
	# (save modified registers before flow of control change)
	  sw $t0, -164($fp)	# spill _tmp1195 from $t0 to $fp-164
	  sw $t1, -168($fp)	# spill _tmp1196 from $t1 to $fp-168
	  sw $t2, -172($fp)	# spill _tmp1197 from $t2 to $fp-172
	  sw $t4, -176($fp)	# spill _tmp1198 from $t4 to $fp-176
	  sw $t5, -180($fp)	# spill _tmp1199 from $t5 to $fp-180
	  sw $t6, -184($fp)	# spill _tmp1200 from $t6 to $fp-184
	  sw $t7, -188($fp)	# spill _tmp1201 from $t7 to $fp-188
	  sw $s0, -192($fp)	# spill _tmp1202 from $s0 to $fp-192
	  sw $s2, -196($fp)	# spill _tmp1203 from $s2 to $fp-196
	  sw $s3, -200($fp)	# spill _tmp1204 from $s3 to $fp-200
	  sw $s4, -204($fp)	# spill _tmp1205 from $s4 to $fp-204
	  sw $s5, -208($fp)	# spill _tmp1206 from $s5 to $fp-208
	  sw $s6, -212($fp)	# spill _tmp1207 from $s6 to $fp-212
	  beqz $s6, _L88	# branch if _tmp1207 is zero 
	# _tmp1208 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string69: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string69	# load label
	# PushParam _tmp1208
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -216($fp)	# spill _tmp1208 from $t0 to $fp-216
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L88:
	# _tmp1209 = i * _tmp1201
	  lw $t0, -8($fp)	# load i from $fp-8 into $t0
	  lw $t1, -188($fp)	# load _tmp1201 from $fp-188 into $t1
	  mul $t2, $t0, $t1	
	# _tmp1210 = _tmp1209 + _tmp1201
	  add $t3, $t2, $t1	
	# _tmp1211 = _tmp1199 + _tmp1210
	  lw $t4, -180($fp)	# load _tmp1199 from $fp-180 into $t4
	  add $t5, $t4, $t3	
	# *(_tmp1211) = _tmp1195
	  lw $t6, -164($fp)	# load _tmp1195 from $fp-164 into $t6
	  sw $t6, 0($t5) 	# store with offset
	# _tmp1212 = 4
	  li $t7, 4		# load constant value 4 into $t7
	# _tmp1213 = this + _tmp1212
	  lw $s0, 4($fp)	# load this from $fp+4 into $s0
	  add $s1, $s0, $t7	
	# _tmp1214 = *(_tmp1213)
	  lw $s2, 0($s1) 	# load with offset
	# _tmp1215 = 0
	  li $s3, 0		# load constant value 0 into $s3
	# _tmp1216 = 4
	  li $s4, 4		# load constant value 4 into $s4
	# _tmp1217 = *(_tmp1214)
	  lw $s5, 0($s2) 	# load with offset
	# _tmp1218 = _tmp1217 == i
	  seq $s6, $s5, $t0	
	# _tmp1219 = _tmp1217 < i
	  slt $s7, $s5, $t0	
	# _tmp1220 = _tmp1219 || _tmp1218
	  or $t8, $s7, $s6	
	# _tmp1221 = i < _tmp1215
	  slt $t9, $t0, $s3	
	# _tmp1222 = _tmp1221 || _tmp1220
	  or $t0, $t9, $t8	
	# IfZ _tmp1222 Goto _L89
	# (save modified registers before flow of control change)
	  sw $t0, -272($fp)	# spill _tmp1222 from $t0 to $fp-272
	  sw $t2, -220($fp)	# spill _tmp1209 from $t2 to $fp-220
	  sw $t3, -224($fp)	# spill _tmp1210 from $t3 to $fp-224
	  sw $t5, -228($fp)	# spill _tmp1211 from $t5 to $fp-228
	  sw $t7, -232($fp)	# spill _tmp1212 from $t7 to $fp-232
	  sw $s1, -236($fp)	# spill _tmp1213 from $s1 to $fp-236
	  sw $s2, -240($fp)	# spill _tmp1214 from $s2 to $fp-240
	  sw $s3, -244($fp)	# spill _tmp1215 from $s3 to $fp-244
	  sw $s4, -248($fp)	# spill _tmp1216 from $s4 to $fp-248
	  sw $s5, -252($fp)	# spill _tmp1217 from $s5 to $fp-252
	  sw $s6, -256($fp)	# spill _tmp1218 from $s6 to $fp-256
	  sw $s7, -260($fp)	# spill _tmp1219 from $s7 to $fp-260
	  sw $t8, -264($fp)	# spill _tmp1220 from $t8 to $fp-264
	  sw $t9, -268($fp)	# spill _tmp1221 from $t9 to $fp-268
	  beqz $t0, _L89	# branch if _tmp1222 is zero 
	# _tmp1223 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string70: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string70	# load label
	# PushParam _tmp1223
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -276($fp)	# spill _tmp1223 from $t0 to $fp-276
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L89:
	# _tmp1224 = i * _tmp1216
	  lw $t0, -8($fp)	# load i from $fp-8 into $t0
	  lw $t1, -248($fp)	# load _tmp1216 from $fp-248 into $t1
	  mul $t2, $t0, $t1	
	# _tmp1225 = _tmp1224 + _tmp1216
	  add $t3, $t2, $t1	
	# _tmp1226 = _tmp1214 + _tmp1225
	  lw $t4, -240($fp)	# load _tmp1214 from $fp-240 into $t4
	  add $t5, $t4, $t3	
	# _tmp1227 = *(_tmp1226)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp1228 = 1
	  li $t7, 1		# load constant value 1 into $t7
	# _tmp1229 = i + _tmp1228
	  add $s0, $t0, $t7	
	# PushParam _tmp1229
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s0, 4($sp)	# copy param value to stack
	# _tmp1230 = *(_tmp1227)
	  lw $s1, 0($t6) 	# load with offset
	# _tmp1231 = *(_tmp1230)
	  lw $s2, 0($s1) 	# load with offset
	# _tmp1232 = ACall _tmp1231
	# (save modified registers before flow of control change)
	  sw $t2, -280($fp)	# spill _tmp1224 from $t2 to $fp-280
	  sw $t3, -284($fp)	# spill _tmp1225 from $t3 to $fp-284
	  sw $t5, -288($fp)	# spill _tmp1226 from $t5 to $fp-288
	  sw $t6, -292($fp)	# spill _tmp1227 from $t6 to $fp-292
	  sw $t7, -296($fp)	# spill _tmp1228 from $t7 to $fp-296
	  sw $s0, -300($fp)	# spill _tmp1229 from $s0 to $fp-300
	  sw $s1, -304($fp)	# spill _tmp1230 from $s1 to $fp-304
	  sw $s2, -308($fp)	# spill _tmp1231 from $s2 to $fp-308
	  jalr $s2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1233 = _tmp1227 - _tmp1232
	  lw $t1, -292($fp)	# load _tmp1227 from $fp-292 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1234 = *(_tmp1230 + 4)
	  lw $t3, -304($fp)	# load _tmp1230 from $fp-304 into $t3
	  lw $t4, 4($t3) 	# load with offset
	# PushParam _tmp1233
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp1234
	# (save modified registers before flow of control change)
	  sw $t0, -312($fp)	# spill _tmp1232 from $t0 to $fp-312
	  sw $t2, -316($fp)	# spill _tmp1233 from $t2 to $fp-316
	  sw $t4, -320($fp)	# spill _tmp1234 from $t4 to $fp-320
	  jalr $t4            	# jump to function
	# _tmp1235 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1236 = 1
	  li $t1, 1		# load constant value 1 into $t1
	# _tmp1237 = i + _tmp1236
	  lw $t2, -8($fp)	# load i from $fp-8 into $t2
	  add $t3, $t2, $t1	
	# i = _tmp1237
	  move $t2, $t3		# copy value
	# Goto _L85
	# (save modified registers before flow of control change)
	  sw $t0, -324($fp)	# spill _tmp1235 from $t0 to $fp-324
	  sw $t1, -328($fp)	# spill _tmp1236 from $t1 to $fp-328
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	  sw $t3, -332($fp)	# spill _tmp1237 from $t3 to $fp-332
	  b _L85		# unconditional branch
  _L86:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_House.TakeAllBets:
	# BeginFunc 216
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 216	# decrement sp to make space for locals/temps
	# _tmp1238 = "\nFirst, let's take bets.\n"
	  .data			# create string constant marked with label
	  _string71: .asciiz "\nFirst, let's take bets.\n"
	  .text
	  la $t0, _string71	# load label
	# PushParam _tmp1238
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -12($fp)	# spill _tmp1238 from $t0 to $fp-12
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1239 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp1239
	  move $t1, $t0		# copy value
	# (save modified registers before flow of control change)
	  sw $t0, -16($fp)	# spill _tmp1239 from $t0 to $fp-16
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
  _L90:
	# _tmp1240 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp1241 = this + _tmp1240
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1242 = *(_tmp1241)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1243 = *(_tmp1242)
	  lw $t4, 0($t3) 	# load with offset
	# _tmp1244 = i < _tmp1243
	  lw $t5, -8($fp)	# load i from $fp-8 into $t5
	  slt $t6, $t5, $t4	
	# IfZ _tmp1244 Goto _L91
	# (save modified registers before flow of control change)
	  sw $t0, -20($fp)	# spill _tmp1240 from $t0 to $fp-20
	  sw $t2, -24($fp)	# spill _tmp1241 from $t2 to $fp-24
	  sw $t3, -28($fp)	# spill _tmp1242 from $t3 to $fp-28
	  sw $t4, -32($fp)	# spill _tmp1243 from $t4 to $fp-32
	  sw $t6, -36($fp)	# spill _tmp1244 from $t6 to $fp-36
	  beqz $t6, _L91	# branch if _tmp1244 is zero 
	# _tmp1245 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp1246 = this + _tmp1245
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1247 = *(_tmp1246)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1248 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp1249 = 4
	  li $t5, 4		# load constant value 4 into $t5
	# _tmp1250 = *(_tmp1247)
	  lw $t6, 0($t3) 	# load with offset
	# _tmp1251 = _tmp1250 == i
	  lw $t7, -8($fp)	# load i from $fp-8 into $t7
	  seq $s0, $t6, $t7	
	# _tmp1252 = _tmp1250 < i
	  slt $s1, $t6, $t7	
	# _tmp1253 = _tmp1252 || _tmp1251
	  or $s2, $s1, $s0	
	# _tmp1254 = i < _tmp1248
	  slt $s3, $t7, $t4	
	# _tmp1255 = _tmp1254 || _tmp1253
	  or $s4, $s3, $s2	
	# IfZ _tmp1255 Goto _L92
	# (save modified registers before flow of control change)
	  sw $t0, -40($fp)	# spill _tmp1245 from $t0 to $fp-40
	  sw $t2, -44($fp)	# spill _tmp1246 from $t2 to $fp-44
	  sw $t3, -48($fp)	# spill _tmp1247 from $t3 to $fp-48
	  sw $t4, -52($fp)	# spill _tmp1248 from $t4 to $fp-52
	  sw $t5, -56($fp)	# spill _tmp1249 from $t5 to $fp-56
	  sw $t6, -60($fp)	# spill _tmp1250 from $t6 to $fp-60
	  sw $s0, -64($fp)	# spill _tmp1251 from $s0 to $fp-64
	  sw $s1, -68($fp)	# spill _tmp1252 from $s1 to $fp-68
	  sw $s2, -72($fp)	# spill _tmp1253 from $s2 to $fp-72
	  sw $s3, -76($fp)	# spill _tmp1254 from $s3 to $fp-76
	  sw $s4, -80($fp)	# spill _tmp1255 from $s4 to $fp-80
	  beqz $s4, _L92	# branch if _tmp1255 is zero 
	# _tmp1256 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string72: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string72	# load label
	# PushParam _tmp1256
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -84($fp)	# spill _tmp1256 from $t0 to $fp-84
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L92:
	# _tmp1257 = i * _tmp1249
	  lw $t0, -8($fp)	# load i from $fp-8 into $t0
	  lw $t1, -56($fp)	# load _tmp1249 from $fp-56 into $t1
	  mul $t2, $t0, $t1	
	# _tmp1258 = _tmp1257 + _tmp1249
	  add $t3, $t2, $t1	
	# _tmp1259 = _tmp1247 + _tmp1258
	  lw $t4, -48($fp)	# load _tmp1247 from $fp-48 into $t4
	  add $t5, $t4, $t3	
	# _tmp1260 = *(_tmp1259)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp1261 = *(_tmp1260)
	  lw $t7, 0($t6) 	# load with offset
	# _tmp1262 = *(_tmp1261)
	  lw $s0, 0($t7) 	# load with offset
	# _tmp1263 = ACall _tmp1262
	# (save modified registers before flow of control change)
	  sw $t2, -88($fp)	# spill _tmp1257 from $t2 to $fp-88
	  sw $t3, -92($fp)	# spill _tmp1258 from $t3 to $fp-92
	  sw $t5, -96($fp)	# spill _tmp1259 from $t5 to $fp-96
	  sw $t6, -100($fp)	# spill _tmp1260 from $t6 to $fp-100
	  sw $t7, -104($fp)	# spill _tmp1261 from $t7 to $fp-104
	  sw $s0, -108($fp)	# spill _tmp1262 from $s0 to $fp-108
	  jalr $s0            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1264 = _tmp1260 - _tmp1263
	  lw $t1, -100($fp)	# load _tmp1260 from $fp-100 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1265 = *(_tmp1261 + 20)
	  lw $t3, -104($fp)	# load _tmp1261 from $fp-104 into $t3
	  lw $t4, 20($t3) 	# load with offset
	# PushParam _tmp1264
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp1266 = ACall _tmp1265
	# (save modified registers before flow of control change)
	  sw $t0, -112($fp)	# spill _tmp1263 from $t0 to $fp-112
	  sw $t2, -116($fp)	# spill _tmp1264 from $t2 to $fp-116
	  sw $t4, -120($fp)	# spill _tmp1265 from $t4 to $fp-120
	  jalr $t4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp1266 Goto _L93
	# (save modified registers before flow of control change)
	  sw $t0, -124($fp)	# spill _tmp1266 from $t0 to $fp-124
	  beqz $t0, _L93	# branch if _tmp1266 is zero 
	# _tmp1267 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp1268 = this + _tmp1267
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1269 = *(_tmp1268)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1270 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp1271 = 4
	  li $t5, 4		# load constant value 4 into $t5
	# _tmp1272 = *(_tmp1269)
	  lw $t6, 0($t3) 	# load with offset
	# _tmp1273 = _tmp1272 == i
	  lw $t7, -8($fp)	# load i from $fp-8 into $t7
	  seq $s0, $t6, $t7	
	# _tmp1274 = _tmp1272 < i
	  slt $s1, $t6, $t7	
	# _tmp1275 = _tmp1274 || _tmp1273
	  or $s2, $s1, $s0	
	# _tmp1276 = i < _tmp1270
	  slt $s3, $t7, $t4	
	# _tmp1277 = _tmp1276 || _tmp1275
	  or $s4, $s3, $s2	
	# IfZ _tmp1277 Goto _L94
	# (save modified registers before flow of control change)
	  sw $t0, -128($fp)	# spill _tmp1267 from $t0 to $fp-128
	  sw $t2, -132($fp)	# spill _tmp1268 from $t2 to $fp-132
	  sw $t3, -136($fp)	# spill _tmp1269 from $t3 to $fp-136
	  sw $t4, -140($fp)	# spill _tmp1270 from $t4 to $fp-140
	  sw $t5, -144($fp)	# spill _tmp1271 from $t5 to $fp-144
	  sw $t6, -148($fp)	# spill _tmp1272 from $t6 to $fp-148
	  sw $s0, -152($fp)	# spill _tmp1273 from $s0 to $fp-152
	  sw $s1, -156($fp)	# spill _tmp1274 from $s1 to $fp-156
	  sw $s2, -160($fp)	# spill _tmp1275 from $s2 to $fp-160
	  sw $s3, -164($fp)	# spill _tmp1276 from $s3 to $fp-164
	  sw $s4, -168($fp)	# spill _tmp1277 from $s4 to $fp-168
	  beqz $s4, _L94	# branch if _tmp1277 is zero 
	# _tmp1278 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string73: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string73	# load label
	# PushParam _tmp1278
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -172($fp)	# spill _tmp1278 from $t0 to $fp-172
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L94:
	# _tmp1279 = i * _tmp1271
	  lw $t0, -8($fp)	# load i from $fp-8 into $t0
	  lw $t1, -144($fp)	# load _tmp1271 from $fp-144 into $t1
	  mul $t2, $t0, $t1	
	# _tmp1280 = _tmp1279 + _tmp1271
	  add $t3, $t2, $t1	
	# _tmp1281 = _tmp1269 + _tmp1280
	  lw $t4, -136($fp)	# load _tmp1269 from $fp-136 into $t4
	  add $t5, $t4, $t3	
	# _tmp1282 = *(_tmp1281)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp1283 = *(_tmp1282)
	  lw $t7, 0($t6) 	# load with offset
	# _tmp1284 = *(_tmp1283)
	  lw $s0, 0($t7) 	# load with offset
	# _tmp1285 = ACall _tmp1284
	# (save modified registers before flow of control change)
	  sw $t2, -176($fp)	# spill _tmp1279 from $t2 to $fp-176
	  sw $t3, -180($fp)	# spill _tmp1280 from $t3 to $fp-180
	  sw $t5, -184($fp)	# spill _tmp1281 from $t5 to $fp-184
	  sw $t6, -188($fp)	# spill _tmp1282 from $t6 to $fp-188
	  sw $t7, -192($fp)	# spill _tmp1283 from $t7 to $fp-192
	  sw $s0, -196($fp)	# spill _tmp1284 from $s0 to $fp-196
	  jalr $s0            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1286 = _tmp1282 - _tmp1285
	  lw $t1, -188($fp)	# load _tmp1282 from $fp-188 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1287 = *(_tmp1283 + 28)
	  lw $t3, -192($fp)	# load _tmp1283 from $fp-192 into $t3
	  lw $t4, 28($t3) 	# load with offset
	# PushParam _tmp1286
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp1287
	# (save modified registers before flow of control change)
	  sw $t0, -200($fp)	# spill _tmp1285 from $t0 to $fp-200
	  sw $t2, -204($fp)	# spill _tmp1286 from $t2 to $fp-204
	  sw $t4, -208($fp)	# spill _tmp1287 from $t4 to $fp-208
	  jalr $t4            	# jump to function
	# _tmp1288 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# (save modified registers before flow of control change)
	  sw $t0, -212($fp)	# spill _tmp1288 from $t0 to $fp-212
  _L93:
	# _tmp1289 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp1290 = i + _tmp1289
	  lw $t1, -8($fp)	# load i from $fp-8 into $t1
	  add $t2, $t1, $t0	
	# i = _tmp1290
	  move $t1, $t2		# copy value
	# Goto _L90
	# (save modified registers before flow of control change)
	  sw $t0, -216($fp)	# spill _tmp1289 from $t0 to $fp-216
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
	  sw $t2, -220($fp)	# spill _tmp1290 from $t2 to $fp-220
	  b _L90		# unconditional branch
  _L91:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_House.TakeAllTurns:
	# BeginFunc 224
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 224	# decrement sp to make space for locals/temps
	# _tmp1291 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp1291
	  move $t1, $t0		# copy value
	# (save modified registers before flow of control change)
	  sw $t0, -12($fp)	# spill _tmp1291 from $t0 to $fp-12
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
  _L95:
	# _tmp1292 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp1293 = this + _tmp1292
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1294 = *(_tmp1293)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1295 = *(_tmp1294)
	  lw $t4, 0($t3) 	# load with offset
	# _tmp1296 = i < _tmp1295
	  lw $t5, -8($fp)	# load i from $fp-8 into $t5
	  slt $t6, $t5, $t4	
	# IfZ _tmp1296 Goto _L96
	# (save modified registers before flow of control change)
	  sw $t0, -16($fp)	# spill _tmp1292 from $t0 to $fp-16
	  sw $t2, -20($fp)	# spill _tmp1293 from $t2 to $fp-20
	  sw $t3, -24($fp)	# spill _tmp1294 from $t3 to $fp-24
	  sw $t4, -28($fp)	# spill _tmp1295 from $t4 to $fp-28
	  sw $t6, -32($fp)	# spill _tmp1296 from $t6 to $fp-32
	  beqz $t6, _L96	# branch if _tmp1296 is zero 
	# _tmp1297 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp1298 = this + _tmp1297
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1299 = *(_tmp1298)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1300 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp1301 = 4
	  li $t5, 4		# load constant value 4 into $t5
	# _tmp1302 = *(_tmp1299)
	  lw $t6, 0($t3) 	# load with offset
	# _tmp1303 = _tmp1302 == i
	  lw $t7, -8($fp)	# load i from $fp-8 into $t7
	  seq $s0, $t6, $t7	
	# _tmp1304 = _tmp1302 < i
	  slt $s1, $t6, $t7	
	# _tmp1305 = _tmp1304 || _tmp1303
	  or $s2, $s1, $s0	
	# _tmp1306 = i < _tmp1300
	  slt $s3, $t7, $t4	
	# _tmp1307 = _tmp1306 || _tmp1305
	  or $s4, $s3, $s2	
	# IfZ _tmp1307 Goto _L97
	# (save modified registers before flow of control change)
	  sw $t0, -36($fp)	# spill _tmp1297 from $t0 to $fp-36
	  sw $t2, -40($fp)	# spill _tmp1298 from $t2 to $fp-40
	  sw $t3, -44($fp)	# spill _tmp1299 from $t3 to $fp-44
	  sw $t4, -48($fp)	# spill _tmp1300 from $t4 to $fp-48
	  sw $t5, -52($fp)	# spill _tmp1301 from $t5 to $fp-52
	  sw $t6, -56($fp)	# spill _tmp1302 from $t6 to $fp-56
	  sw $s0, -60($fp)	# spill _tmp1303 from $s0 to $fp-60
	  sw $s1, -64($fp)	# spill _tmp1304 from $s1 to $fp-64
	  sw $s2, -68($fp)	# spill _tmp1305 from $s2 to $fp-68
	  sw $s3, -72($fp)	# spill _tmp1306 from $s3 to $fp-72
	  sw $s4, -76($fp)	# spill _tmp1307 from $s4 to $fp-76
	  beqz $s4, _L97	# branch if _tmp1307 is zero 
	# _tmp1308 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string74: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string74	# load label
	# PushParam _tmp1308
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -80($fp)	# spill _tmp1308 from $t0 to $fp-80
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L97:
	# _tmp1309 = i * _tmp1301
	  lw $t0, -8($fp)	# load i from $fp-8 into $t0
	  lw $t1, -52($fp)	# load _tmp1301 from $fp-52 into $t1
	  mul $t2, $t0, $t1	
	# _tmp1310 = _tmp1309 + _tmp1301
	  add $t3, $t2, $t1	
	# _tmp1311 = _tmp1299 + _tmp1310
	  lw $t4, -44($fp)	# load _tmp1299 from $fp-44 into $t4
	  add $t5, $t4, $t3	
	# _tmp1312 = *(_tmp1311)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp1313 = *(_tmp1312)
	  lw $t7, 0($t6) 	# load with offset
	# _tmp1314 = *(_tmp1313)
	  lw $s0, 0($t7) 	# load with offset
	# _tmp1315 = ACall _tmp1314
	# (save modified registers before flow of control change)
	  sw $t2, -84($fp)	# spill _tmp1309 from $t2 to $fp-84
	  sw $t3, -88($fp)	# spill _tmp1310 from $t3 to $fp-88
	  sw $t5, -92($fp)	# spill _tmp1311 from $t5 to $fp-92
	  sw $t6, -96($fp)	# spill _tmp1312 from $t6 to $fp-96
	  sw $t7, -100($fp)	# spill _tmp1313 from $t7 to $fp-100
	  sw $s0, -104($fp)	# spill _tmp1314 from $s0 to $fp-104
	  jalr $s0            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1316 = _tmp1312 - _tmp1315
	  lw $t1, -96($fp)	# load _tmp1312 from $fp-96 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1317 = *(_tmp1313 + 20)
	  lw $t3, -100($fp)	# load _tmp1313 from $fp-100 into $t3
	  lw $t4, 20($t3) 	# load with offset
	# PushParam _tmp1316
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp1318 = ACall _tmp1317
	# (save modified registers before flow of control change)
	  sw $t0, -108($fp)	# spill _tmp1315 from $t0 to $fp-108
	  sw $t2, -112($fp)	# spill _tmp1316 from $t2 to $fp-112
	  sw $t4, -116($fp)	# spill _tmp1317 from $t4 to $fp-116
	  jalr $t4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp1318 Goto _L98
	# (save modified registers before flow of control change)
	  sw $t0, -120($fp)	# spill _tmp1318 from $t0 to $fp-120
	  beqz $t0, _L98	# branch if _tmp1318 is zero 
	# _tmp1319 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp1320 = this + _tmp1319
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1321 = *(_tmp1320)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1322 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp1323 = 4
	  li $t5, 4		# load constant value 4 into $t5
	# _tmp1324 = *(_tmp1321)
	  lw $t6, 0($t3) 	# load with offset
	# _tmp1325 = _tmp1324 == i
	  lw $t7, -8($fp)	# load i from $fp-8 into $t7
	  seq $s0, $t6, $t7	
	# _tmp1326 = _tmp1324 < i
	  slt $s1, $t6, $t7	
	# _tmp1327 = _tmp1326 || _tmp1325
	  or $s2, $s1, $s0	
	# _tmp1328 = i < _tmp1322
	  slt $s3, $t7, $t4	
	# _tmp1329 = _tmp1328 || _tmp1327
	  or $s4, $s3, $s2	
	# IfZ _tmp1329 Goto _L99
	# (save modified registers before flow of control change)
	  sw $t0, -124($fp)	# spill _tmp1319 from $t0 to $fp-124
	  sw $t2, -128($fp)	# spill _tmp1320 from $t2 to $fp-128
	  sw $t3, -132($fp)	# spill _tmp1321 from $t3 to $fp-132
	  sw $t4, -136($fp)	# spill _tmp1322 from $t4 to $fp-136
	  sw $t5, -140($fp)	# spill _tmp1323 from $t5 to $fp-140
	  sw $t6, -144($fp)	# spill _tmp1324 from $t6 to $fp-144
	  sw $s0, -148($fp)	# spill _tmp1325 from $s0 to $fp-148
	  sw $s1, -152($fp)	# spill _tmp1326 from $s1 to $fp-152
	  sw $s2, -156($fp)	# spill _tmp1327 from $s2 to $fp-156
	  sw $s3, -160($fp)	# spill _tmp1328 from $s3 to $fp-160
	  sw $s4, -164($fp)	# spill _tmp1329 from $s4 to $fp-164
	  beqz $s4, _L99	# branch if _tmp1329 is zero 
	# _tmp1330 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string75: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string75	# load label
	# PushParam _tmp1330
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -168($fp)	# spill _tmp1330 from $t0 to $fp-168
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L99:
	# _tmp1331 = i * _tmp1323
	  lw $t0, -8($fp)	# load i from $fp-8 into $t0
	  lw $t1, -140($fp)	# load _tmp1323 from $fp-140 into $t1
	  mul $t2, $t0, $t1	
	# _tmp1332 = _tmp1331 + _tmp1323
	  add $t3, $t2, $t1	
	# _tmp1333 = _tmp1321 + _tmp1332
	  lw $t4, -132($fp)	# load _tmp1321 from $fp-132 into $t4
	  add $t5, $t4, $t3	
	# _tmp1334 = *(_tmp1333)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp1335 = 12
	  li $t7, 12		# load constant value 12 into $t7
	# _tmp1336 = this + _tmp1335
	  lw $s0, 4($fp)	# load this from $fp+4 into $s0
	  add $s1, $s0, $t7	
	# _tmp1337 = *(_tmp1336)
	  lw $s2, 0($s1) 	# load with offset
	# PushParam _tmp1337
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $s2, 4($sp)	# copy param value to stack
	# _tmp1338 = *(_tmp1334)
	  lw $s3, 0($t6) 	# load with offset
	# _tmp1339 = *(_tmp1338)
	  lw $s4, 0($s3) 	# load with offset
	# _tmp1340 = ACall _tmp1339
	# (save modified registers before flow of control change)
	  sw $t2, -172($fp)	# spill _tmp1331 from $t2 to $fp-172
	  sw $t3, -176($fp)	# spill _tmp1332 from $t3 to $fp-176
	  sw $t5, -180($fp)	# spill _tmp1333 from $t5 to $fp-180
	  sw $t6, -184($fp)	# spill _tmp1334 from $t6 to $fp-184
	  sw $t7, -188($fp)	# spill _tmp1335 from $t7 to $fp-188
	  sw $s1, -192($fp)	# spill _tmp1336 from $s1 to $fp-192
	  sw $s2, -196($fp)	# spill _tmp1337 from $s2 to $fp-196
	  sw $s3, -200($fp)	# spill _tmp1338 from $s3 to $fp-200
	  sw $s4, -204($fp)	# spill _tmp1339 from $s4 to $fp-204
	  jalr $s4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1341 = _tmp1334 - _tmp1340
	  lw $t1, -184($fp)	# load _tmp1334 from $fp-184 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1342 = *(_tmp1338 + 16)
	  lw $t3, -200($fp)	# load _tmp1338 from $fp-200 into $t3
	  lw $t4, 16($t3) 	# load with offset
	# PushParam _tmp1341
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp1342
	# (save modified registers before flow of control change)
	  sw $t0, -208($fp)	# spill _tmp1340 from $t0 to $fp-208
	  sw $t2, -212($fp)	# spill _tmp1341 from $t2 to $fp-212
	  sw $t4, -216($fp)	# spill _tmp1342 from $t4 to $fp-216
	  jalr $t4            	# jump to function
	# _tmp1343 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# (save modified registers before flow of control change)
	  sw $t0, -220($fp)	# spill _tmp1343 from $t0 to $fp-220
  _L98:
	# _tmp1344 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp1345 = i + _tmp1344
	  lw $t1, -8($fp)	# load i from $fp-8 into $t1
	  add $t2, $t1, $t0	
	# i = _tmp1345
	  move $t1, $t2		# copy value
	# Goto _L95
	# (save modified registers before flow of control change)
	  sw $t0, -224($fp)	# spill _tmp1344 from $t0 to $fp-224
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
	  sw $t2, -228($fp)	# spill _tmp1345 from $t2 to $fp-228
	  b _L95		# unconditional branch
  _L96:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_House.ResolveAllPlayers:
	# BeginFunc 252
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 252	# decrement sp to make space for locals/temps
	# _tmp1346 = "\nTime to resolve bets.\n"
	  .data			# create string constant marked with label
	  _string76: .asciiz "\nTime to resolve bets.\n"
	  .text
	  la $t0, _string76	# load label
	# PushParam _tmp1346
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -12($fp)	# spill _tmp1346 from $t0 to $fp-12
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1347 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp1347
	  move $t1, $t0		# copy value
	# (save modified registers before flow of control change)
	  sw $t0, -16($fp)	# spill _tmp1347 from $t0 to $fp-16
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
  _L100:
	# _tmp1348 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp1349 = this + _tmp1348
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1350 = *(_tmp1349)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1351 = *(_tmp1350)
	  lw $t4, 0($t3) 	# load with offset
	# _tmp1352 = i < _tmp1351
	  lw $t5, -8($fp)	# load i from $fp-8 into $t5
	  slt $t6, $t5, $t4	
	# IfZ _tmp1352 Goto _L101
	# (save modified registers before flow of control change)
	  sw $t0, -20($fp)	# spill _tmp1348 from $t0 to $fp-20
	  sw $t2, -24($fp)	# spill _tmp1349 from $t2 to $fp-24
	  sw $t3, -28($fp)	# spill _tmp1350 from $t3 to $fp-28
	  sw $t4, -32($fp)	# spill _tmp1351 from $t4 to $fp-32
	  sw $t6, -36($fp)	# spill _tmp1352 from $t6 to $fp-36
	  beqz $t6, _L101	# branch if _tmp1352 is zero 
	# _tmp1353 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp1354 = this + _tmp1353
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1355 = *(_tmp1354)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1356 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp1357 = 4
	  li $t5, 4		# load constant value 4 into $t5
	# _tmp1358 = *(_tmp1355)
	  lw $t6, 0($t3) 	# load with offset
	# _tmp1359 = _tmp1358 == i
	  lw $t7, -8($fp)	# load i from $fp-8 into $t7
	  seq $s0, $t6, $t7	
	# _tmp1360 = _tmp1358 < i
	  slt $s1, $t6, $t7	
	# _tmp1361 = _tmp1360 || _tmp1359
	  or $s2, $s1, $s0	
	# _tmp1362 = i < _tmp1356
	  slt $s3, $t7, $t4	
	# _tmp1363 = _tmp1362 || _tmp1361
	  or $s4, $s3, $s2	
	# IfZ _tmp1363 Goto _L102
	# (save modified registers before flow of control change)
	  sw $t0, -40($fp)	# spill _tmp1353 from $t0 to $fp-40
	  sw $t2, -44($fp)	# spill _tmp1354 from $t2 to $fp-44
	  sw $t3, -48($fp)	# spill _tmp1355 from $t3 to $fp-48
	  sw $t4, -52($fp)	# spill _tmp1356 from $t4 to $fp-52
	  sw $t5, -56($fp)	# spill _tmp1357 from $t5 to $fp-56
	  sw $t6, -60($fp)	# spill _tmp1358 from $t6 to $fp-60
	  sw $s0, -64($fp)	# spill _tmp1359 from $s0 to $fp-64
	  sw $s1, -68($fp)	# spill _tmp1360 from $s1 to $fp-68
	  sw $s2, -72($fp)	# spill _tmp1361 from $s2 to $fp-72
	  sw $s3, -76($fp)	# spill _tmp1362 from $s3 to $fp-76
	  sw $s4, -80($fp)	# spill _tmp1363 from $s4 to $fp-80
	  beqz $s4, _L102	# branch if _tmp1363 is zero 
	# _tmp1364 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string77: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string77	# load label
	# PushParam _tmp1364
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -84($fp)	# spill _tmp1364 from $t0 to $fp-84
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L102:
	# _tmp1365 = i * _tmp1357
	  lw $t0, -8($fp)	# load i from $fp-8 into $t0
	  lw $t1, -56($fp)	# load _tmp1357 from $fp-56 into $t1
	  mul $t2, $t0, $t1	
	# _tmp1366 = _tmp1365 + _tmp1357
	  add $t3, $t2, $t1	
	# _tmp1367 = _tmp1355 + _tmp1366
	  lw $t4, -48($fp)	# load _tmp1355 from $fp-48 into $t4
	  add $t5, $t4, $t3	
	# _tmp1368 = *(_tmp1367)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp1369 = *(_tmp1368)
	  lw $t7, 0($t6) 	# load with offset
	# _tmp1370 = *(_tmp1369)
	  lw $s0, 0($t7) 	# load with offset
	# _tmp1371 = ACall _tmp1370
	# (save modified registers before flow of control change)
	  sw $t2, -88($fp)	# spill _tmp1365 from $t2 to $fp-88
	  sw $t3, -92($fp)	# spill _tmp1366 from $t3 to $fp-92
	  sw $t5, -96($fp)	# spill _tmp1367 from $t5 to $fp-96
	  sw $t6, -100($fp)	# spill _tmp1368 from $t6 to $fp-100
	  sw $t7, -104($fp)	# spill _tmp1369 from $t7 to $fp-104
	  sw $s0, -108($fp)	# spill _tmp1370 from $s0 to $fp-108
	  jalr $s0            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1372 = _tmp1368 - _tmp1371
	  lw $t1, -100($fp)	# load _tmp1368 from $fp-100 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1373 = *(_tmp1369 + 20)
	  lw $t3, -104($fp)	# load _tmp1369 from $fp-104 into $t3
	  lw $t4, 20($t3) 	# load with offset
	# PushParam _tmp1372
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp1374 = ACall _tmp1373
	# (save modified registers before flow of control change)
	  sw $t0, -112($fp)	# spill _tmp1371 from $t0 to $fp-112
	  sw $t2, -116($fp)	# spill _tmp1372 from $t2 to $fp-116
	  sw $t4, -120($fp)	# spill _tmp1373 from $t4 to $fp-120
	  jalr $t4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# IfZ _tmp1374 Goto _L103
	# (save modified registers before flow of control change)
	  sw $t0, -124($fp)	# spill _tmp1374 from $t0 to $fp-124
	  beqz $t0, _L103	# branch if _tmp1374 is zero 
	# _tmp1375 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp1376 = this + _tmp1375
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1377 = *(_tmp1376)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1378 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp1379 = 4
	  li $t5, 4		# load constant value 4 into $t5
	# _tmp1380 = *(_tmp1377)
	  lw $t6, 0($t3) 	# load with offset
	# _tmp1381 = _tmp1380 == i
	  lw $t7, -8($fp)	# load i from $fp-8 into $t7
	  seq $s0, $t6, $t7	
	# _tmp1382 = _tmp1380 < i
	  slt $s1, $t6, $t7	
	# _tmp1383 = _tmp1382 || _tmp1381
	  or $s2, $s1, $s0	
	# _tmp1384 = i < _tmp1378
	  slt $s3, $t7, $t4	
	# _tmp1385 = _tmp1384 || _tmp1383
	  or $s4, $s3, $s2	
	# IfZ _tmp1385 Goto _L104
	# (save modified registers before flow of control change)
	  sw $t0, -128($fp)	# spill _tmp1375 from $t0 to $fp-128
	  sw $t2, -132($fp)	# spill _tmp1376 from $t2 to $fp-132
	  sw $t3, -136($fp)	# spill _tmp1377 from $t3 to $fp-136
	  sw $t4, -140($fp)	# spill _tmp1378 from $t4 to $fp-140
	  sw $t5, -144($fp)	# spill _tmp1379 from $t5 to $fp-144
	  sw $t6, -148($fp)	# spill _tmp1380 from $t6 to $fp-148
	  sw $s0, -152($fp)	# spill _tmp1381 from $s0 to $fp-152
	  sw $s1, -156($fp)	# spill _tmp1382 from $s1 to $fp-156
	  sw $s2, -160($fp)	# spill _tmp1383 from $s2 to $fp-160
	  sw $s3, -164($fp)	# spill _tmp1384 from $s3 to $fp-164
	  sw $s4, -168($fp)	# spill _tmp1385 from $s4 to $fp-168
	  beqz $s4, _L104	# branch if _tmp1385 is zero 
	# _tmp1386 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string78: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string78	# load label
	# PushParam _tmp1386
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -172($fp)	# spill _tmp1386 from $t0 to $fp-172
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L104:
	# _tmp1387 = i * _tmp1379
	  lw $t0, -8($fp)	# load i from $fp-8 into $t0
	  lw $t1, -144($fp)	# load _tmp1379 from $fp-144 into $t1
	  mul $t2, $t0, $t1	
	# _tmp1388 = _tmp1387 + _tmp1379
	  add $t3, $t2, $t1	
	# _tmp1389 = _tmp1377 + _tmp1388
	  lw $t4, -136($fp)	# load _tmp1377 from $fp-136 into $t4
	  add $t5, $t4, $t3	
	# _tmp1390 = *(_tmp1389)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp1391 = 8
	  li $t7, 8		# load constant value 8 into $t7
	# _tmp1392 = this + _tmp1391
	  lw $s0, 4($fp)	# load this from $fp+4 into $s0
	  add $s1, $s0, $t7	
	# _tmp1393 = *(_tmp1392)
	  lw $s2, 0($s1) 	# load with offset
	# _tmp1394 = *(_tmp1393)
	  lw $s3, 0($s2) 	# load with offset
	# _tmp1395 = *(_tmp1394)
	  lw $s4, 0($s3) 	# load with offset
	# _tmp1396 = ACall _tmp1395
	# (save modified registers before flow of control change)
	  sw $t2, -176($fp)	# spill _tmp1387 from $t2 to $fp-176
	  sw $t3, -180($fp)	# spill _tmp1388 from $t3 to $fp-180
	  sw $t5, -184($fp)	# spill _tmp1389 from $t5 to $fp-184
	  sw $t6, -188($fp)	# spill _tmp1390 from $t6 to $fp-188
	  sw $t7, -192($fp)	# spill _tmp1391 from $t7 to $fp-192
	  sw $s1, -196($fp)	# spill _tmp1392 from $s1 to $fp-196
	  sw $s2, -200($fp)	# spill _tmp1393 from $s2 to $fp-200
	  sw $s3, -204($fp)	# spill _tmp1394 from $s3 to $fp-204
	  sw $s4, -208($fp)	# spill _tmp1395 from $s4 to $fp-208
	  jalr $s4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1397 = _tmp1393 - _tmp1396
	  lw $t1, -200($fp)	# load _tmp1393 from $fp-200 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1398 = *(_tmp1394 + 32)
	  lw $t3, -204($fp)	# load _tmp1394 from $fp-204 into $t3
	  lw $t4, 32($t3) 	# load with offset
	# PushParam _tmp1397
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp1399 = ACall _tmp1398
	# (save modified registers before flow of control change)
	  sw $t0, -212($fp)	# spill _tmp1396 from $t0 to $fp-212
	  sw $t2, -216($fp)	# spill _tmp1397 from $t2 to $fp-216
	  sw $t4, -220($fp)	# spill _tmp1398 from $t4 to $fp-220
	  jalr $t4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# PushParam _tmp1399
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# _tmp1400 = *(_tmp1390)
	  lw $t1, -188($fp)	# load _tmp1390 from $fp-188 into $t1
	  lw $t2, 0($t1) 	# load with offset
	# _tmp1401 = *(_tmp1400)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1402 = ACall _tmp1401
	# (save modified registers before flow of control change)
	  sw $t0, -224($fp)	# spill _tmp1399 from $t0 to $fp-224
	  sw $t2, -228($fp)	# spill _tmp1400 from $t2 to $fp-228
	  sw $t3, -232($fp)	# spill _tmp1401 from $t3 to $fp-232
	  jalr $t3            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1403 = _tmp1390 - _tmp1402
	  lw $t1, -188($fp)	# load _tmp1390 from $fp-188 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1404 = *(_tmp1400 + 36)
	  lw $t3, -228($fp)	# load _tmp1400 from $fp-228 into $t3
	  lw $t4, 36($t3) 	# load with offset
	# PushParam _tmp1403
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp1404
	# (save modified registers before flow of control change)
	  sw $t0, -236($fp)	# spill _tmp1402 from $t0 to $fp-236
	  sw $t2, -240($fp)	# spill _tmp1403 from $t2 to $fp-240
	  sw $t4, -244($fp)	# spill _tmp1404 from $t4 to $fp-244
	  jalr $t4            	# jump to function
	# _tmp1405 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# (save modified registers before flow of control change)
	  sw $t0, -248($fp)	# spill _tmp1405 from $t0 to $fp-248
  _L103:
	# _tmp1406 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# _tmp1407 = i + _tmp1406
	  lw $t1, -8($fp)	# load i from $fp-8 into $t1
	  add $t2, $t1, $t0	
	# i = _tmp1407
	  move $t1, $t2		# copy value
	# Goto _L100
	# (save modified registers before flow of control change)
	  sw $t0, -252($fp)	# spill _tmp1406 from $t0 to $fp-252
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
	  sw $t2, -256($fp)	# spill _tmp1407 from $t2 to $fp-256
	  b _L100		# unconditional branch
  _L101:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_House.PrintAllMoney:
	# BeginFunc 124
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 124	# decrement sp to make space for locals/temps
	# _tmp1408 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# i = _tmp1408
	  move $t1, $t0		# copy value
	# (save modified registers before flow of control change)
	  sw $t0, -12($fp)	# spill _tmp1408 from $t0 to $fp-12
	  sw $t1, -8($fp)	# spill i from $t1 to $fp-8
  _L105:
	# _tmp1409 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp1410 = this + _tmp1409
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1411 = *(_tmp1410)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1412 = *(_tmp1411)
	  lw $t4, 0($t3) 	# load with offset
	# _tmp1413 = i < _tmp1412
	  lw $t5, -8($fp)	# load i from $fp-8 into $t5
	  slt $t6, $t5, $t4	
	# IfZ _tmp1413 Goto _L106
	# (save modified registers before flow of control change)
	  sw $t0, -16($fp)	# spill _tmp1409 from $t0 to $fp-16
	  sw $t2, -20($fp)	# spill _tmp1410 from $t2 to $fp-20
	  sw $t3, -24($fp)	# spill _tmp1411 from $t3 to $fp-24
	  sw $t4, -28($fp)	# spill _tmp1412 from $t4 to $fp-28
	  sw $t6, -32($fp)	# spill _tmp1413 from $t6 to $fp-32
	  beqz $t6, _L106	# branch if _tmp1413 is zero 
	# _tmp1414 = 4
	  li $t0, 4		# load constant value 4 into $t0
	# _tmp1415 = this + _tmp1414
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1416 = *(_tmp1415)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1417 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# _tmp1418 = 4
	  li $t5, 4		# load constant value 4 into $t5
	# _tmp1419 = *(_tmp1416)
	  lw $t6, 0($t3) 	# load with offset
	# _tmp1420 = _tmp1419 == i
	  lw $t7, -8($fp)	# load i from $fp-8 into $t7
	  seq $s0, $t6, $t7	
	# _tmp1421 = _tmp1419 < i
	  slt $s1, $t6, $t7	
	# _tmp1422 = _tmp1421 || _tmp1420
	  or $s2, $s1, $s0	
	# _tmp1423 = i < _tmp1417
	  slt $s3, $t7, $t4	
	# _tmp1424 = _tmp1423 || _tmp1422
	  or $s4, $s3, $s2	
	# IfZ _tmp1424 Goto _L107
	# (save modified registers before flow of control change)
	  sw $t0, -36($fp)	# spill _tmp1414 from $t0 to $fp-36
	  sw $t2, -40($fp)	# spill _tmp1415 from $t2 to $fp-40
	  sw $t3, -44($fp)	# spill _tmp1416 from $t3 to $fp-44
	  sw $t4, -48($fp)	# spill _tmp1417 from $t4 to $fp-48
	  sw $t5, -52($fp)	# spill _tmp1418 from $t5 to $fp-52
	  sw $t6, -56($fp)	# spill _tmp1419 from $t6 to $fp-56
	  sw $s0, -60($fp)	# spill _tmp1420 from $s0 to $fp-60
	  sw $s1, -64($fp)	# spill _tmp1421 from $s1 to $fp-64
	  sw $s2, -68($fp)	# spill _tmp1422 from $s2 to $fp-68
	  sw $s3, -72($fp)	# spill _tmp1423 from $s3 to $fp-72
	  sw $s4, -76($fp)	# spill _tmp1424 from $s4 to $fp-76
	  beqz $s4, _L107	# branch if _tmp1424 is zero 
	# _tmp1425 = "Decaf runtime error: Array subscript out of bound..."
	  .data			# create string constant marked with label
	  _string79: .asciiz "Decaf runtime error: Array subscript out of bounds\n"
	  .text
	  la $t0, _string79	# load label
	# PushParam _tmp1425
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -80($fp)	# spill _tmp1425 from $t0 to $fp-80
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# LCall _Halt
	  jal _Halt          	# jump to function
  _L107:
	# _tmp1426 = i * _tmp1418
	  lw $t0, -8($fp)	# load i from $fp-8 into $t0
	  lw $t1, -52($fp)	# load _tmp1418 from $fp-52 into $t1
	  mul $t2, $t0, $t1	
	# _tmp1427 = _tmp1426 + _tmp1418
	  add $t3, $t2, $t1	
	# _tmp1428 = _tmp1416 + _tmp1427
	  lw $t4, -44($fp)	# load _tmp1416 from $fp-44 into $t4
	  add $t5, $t4, $t3	
	# _tmp1429 = *(_tmp1428)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp1430 = *(_tmp1429)
	  lw $t7, 0($t6) 	# load with offset
	# _tmp1431 = *(_tmp1430)
	  lw $s0, 0($t7) 	# load with offset
	# _tmp1432 = ACall _tmp1431
	# (save modified registers before flow of control change)
	  sw $t2, -84($fp)	# spill _tmp1426 from $t2 to $fp-84
	  sw $t3, -88($fp)	# spill _tmp1427 from $t3 to $fp-88
	  sw $t5, -92($fp)	# spill _tmp1428 from $t5 to $fp-92
	  sw $t6, -96($fp)	# spill _tmp1429 from $t6 to $fp-96
	  sw $t7, -100($fp)	# spill _tmp1430 from $t7 to $fp-100
	  sw $s0, -104($fp)	# spill _tmp1431 from $s0 to $fp-104
	  jalr $s0            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1433 = _tmp1429 - _tmp1432
	  lw $t1, -96($fp)	# load _tmp1429 from $fp-96 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1434 = *(_tmp1430 + 24)
	  lw $t3, -100($fp)	# load _tmp1430 from $fp-100 into $t3
	  lw $t4, 24($t3) 	# load with offset
	# PushParam _tmp1433
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp1434
	# (save modified registers before flow of control change)
	  sw $t0, -108($fp)	# spill _tmp1432 from $t0 to $fp-108
	  sw $t2, -112($fp)	# spill _tmp1433 from $t2 to $fp-112
	  sw $t4, -116($fp)	# spill _tmp1434 from $t4 to $fp-116
	  jalr $t4            	# jump to function
	# _tmp1435 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1436 = 1
	  li $t1, 1		# load constant value 1 into $t1
	# _tmp1437 = i + _tmp1436
	  lw $t2, -8($fp)	# load i from $fp-8 into $t2
	  add $t3, $t2, $t1	
	# i = _tmp1437
	  move $t2, $t3		# copy value
	# Goto _L105
	# (save modified registers before flow of control change)
	  sw $t0, -120($fp)	# spill _tmp1435 from $t0 to $fp-120
	  sw $t1, -124($fp)	# spill _tmp1436 from $t1 to $fp-124
	  sw $t2, -8($fp)	# spill i from $t2 to $fp-8
	  sw $t3, -128($fp)	# spill _tmp1437 from $t3 to $fp-128
	  b _L105		# unconditional branch
  _L106:
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_House.PlayOneGame:
	# BeginFunc 292
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 292	# decrement sp to make space for locals/temps
	# _tmp1438 = 12
	  li $t0, 12		# load constant value 12 into $t0
	# _tmp1439 = this + _tmp1438
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1440 = *(_tmp1439)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1441 = *(_tmp1440)
	  lw $t4, 0($t3) 	# load with offset
	# _tmp1442 = *(_tmp1441)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp1443 = ACall _tmp1442
	# (save modified registers before flow of control change)
	  sw $t0, -8($fp)	# spill _tmp1438 from $t0 to $fp-8
	  sw $t2, -12($fp)	# spill _tmp1439 from $t2 to $fp-12
	  sw $t3, -16($fp)	# spill _tmp1440 from $t3 to $fp-16
	  sw $t4, -20($fp)	# spill _tmp1441 from $t4 to $fp-20
	  sw $t5, -24($fp)	# spill _tmp1442 from $t5 to $fp-24
	  jalr $t5            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1444 = _tmp1440 - _tmp1443
	  lw $t1, -16($fp)	# load _tmp1440 from $fp-16 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1445 = *(_tmp1441 + 16)
	  lw $t3, -20($fp)	# load _tmp1441 from $fp-20 into $t3
	  lw $t4, 16($t3) 	# load with offset
	# PushParam _tmp1444
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp1446 = ACall _tmp1445
	# (save modified registers before flow of control change)
	  sw $t0, -28($fp)	# spill _tmp1443 from $t0 to $fp-28
	  sw $t2, -32($fp)	# spill _tmp1444 from $t2 to $fp-32
	  sw $t4, -36($fp)	# spill _tmp1445 from $t4 to $fp-36
	  jalr $t4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1447 = 26
	  li $t1, 26		# load constant value 26 into $t1
	# _tmp1448 = _tmp1446 < _tmp1447
	  slt $t2, $t0, $t1	
	# IfZ _tmp1448 Goto _L108
	# (save modified registers before flow of control change)
	  sw $t0, -40($fp)	# spill _tmp1446 from $t0 to $fp-40
	  sw $t1, -44($fp)	# spill _tmp1447 from $t1 to $fp-44
	  sw $t2, -48($fp)	# spill _tmp1448 from $t2 to $fp-48
	  beqz $t2, _L108	# branch if _tmp1448 is zero 
	# _tmp1449 = 12
	  li $t0, 12		# load constant value 12 into $t0
	# _tmp1450 = this + _tmp1449
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1451 = *(_tmp1450)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1452 = *(_tmp1451)
	  lw $t4, 0($t3) 	# load with offset
	# _tmp1453 = *(_tmp1452)
	  lw $t5, 0($t4) 	# load with offset
	# _tmp1454 = ACall _tmp1453
	# (save modified registers before flow of control change)
	  sw $t0, -52($fp)	# spill _tmp1449 from $t0 to $fp-52
	  sw $t2, -56($fp)	# spill _tmp1450 from $t2 to $fp-56
	  sw $t3, -60($fp)	# spill _tmp1451 from $t3 to $fp-60
	  sw $t4, -64($fp)	# spill _tmp1452 from $t4 to $fp-64
	  sw $t5, -68($fp)	# spill _tmp1453 from $t5 to $fp-68
	  jalr $t5            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1455 = _tmp1451 - _tmp1454
	  lw $t1, -60($fp)	# load _tmp1451 from $fp-60 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1456 = *(_tmp1452 + 12)
	  lw $t3, -64($fp)	# load _tmp1452 from $fp-64 into $t3
	  lw $t4, 12($t3) 	# load with offset
	# PushParam _tmp1455
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp1456
	# (save modified registers before flow of control change)
	  sw $t0, -72($fp)	# spill _tmp1454 from $t0 to $fp-72
	  sw $t2, -76($fp)	# spill _tmp1455 from $t2 to $fp-76
	  sw $t4, -80($fp)	# spill _tmp1456 from $t4 to $fp-80
	  jalr $t4            	# jump to function
	# _tmp1457 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# (save modified registers before flow of control change)
	  sw $t0, -84($fp)	# spill _tmp1457 from $t0 to $fp-84
  _L108:
	# _tmp1458 = *(this)
	  lw $t0, 4($fp)	# load this from $fp+4 into $t0
	  lw $t1, 0($t0) 	# load with offset
	# _tmp1459 = *(_tmp1458)
	  lw $t2, 0($t1) 	# load with offset
	# _tmp1460 = ACall _tmp1459
	# (save modified registers before flow of control change)
	  sw $t1, -88($fp)	# spill _tmp1458 from $t1 to $fp-88
	  sw $t2, -92($fp)	# spill _tmp1459 from $t2 to $fp-92
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1461 = this - _tmp1460
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1462 = *(_tmp1458 + 12)
	  lw $t3, -88($fp)	# load _tmp1458 from $fp-88 into $t3
	  lw $t4, 12($t3) 	# load with offset
	# PushParam _tmp1461
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp1462
	# (save modified registers before flow of control change)
	  sw $t0, -96($fp)	# spill _tmp1460 from $t0 to $fp-96
	  sw $t2, -100($fp)	# spill _tmp1461 from $t2 to $fp-100
	  sw $t4, -104($fp)	# spill _tmp1462 from $t4 to $fp-104
	  jalr $t4            	# jump to function
	# _tmp1463 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1464 = "\nDealer starts. "
	  .data			# create string constant marked with label
	  _string80: .asciiz "\nDealer starts. "
	  .text
	  la $t1, _string80	# load label
	# PushParam _tmp1464
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -108($fp)	# spill _tmp1463 from $t0 to $fp-108
	  sw $t1, -112($fp)	# spill _tmp1464 from $t1 to $fp-112
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1465 = 8
	  li $t0, 8		# load constant value 8 into $t0
	# _tmp1466 = this + _tmp1465
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  add $t2, $t1, $t0	
	# _tmp1467 = *(_tmp1466)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1468 = 0
	  li $t4, 0		# load constant value 0 into $t4
	# PushParam _tmp1468
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t4, 4($sp)	# copy param value to stack
	# _tmp1469 = *(_tmp1467)
	  lw $t5, 0($t3) 	# load with offset
	# _tmp1470 = *(_tmp1469)
	  lw $t6, 0($t5) 	# load with offset
	# _tmp1471 = ACall _tmp1470
	# (save modified registers before flow of control change)
	  sw $t0, -116($fp)	# spill _tmp1465 from $t0 to $fp-116
	  sw $t2, -120($fp)	# spill _tmp1466 from $t2 to $fp-120
	  sw $t3, -124($fp)	# spill _tmp1467 from $t3 to $fp-124
	  sw $t4, -128($fp)	# spill _tmp1468 from $t4 to $fp-128
	  sw $t5, -132($fp)	# spill _tmp1469 from $t5 to $fp-132
	  sw $t6, -136($fp)	# spill _tmp1470 from $t6 to $fp-136
	  jalr $t6            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1472 = _tmp1467 - _tmp1471
	  lw $t1, -124($fp)	# load _tmp1467 from $fp-124 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1473 = *(_tmp1469 + 4)
	  lw $t3, -132($fp)	# load _tmp1469 from $fp-132 into $t3
	  lw $t4, 4($t3) 	# load with offset
	# PushParam _tmp1472
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp1473
	# (save modified registers before flow of control change)
	  sw $t0, -140($fp)	# spill _tmp1471 from $t0 to $fp-140
	  sw $t2, -144($fp)	# spill _tmp1472 from $t2 to $fp-144
	  sw $t4, -148($fp)	# spill _tmp1473 from $t4 to $fp-148
	  jalr $t4            	# jump to function
	# _tmp1474 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1475 = 8
	  li $t1, 8		# load constant value 8 into $t1
	# _tmp1476 = this + _tmp1475
	  lw $t2, 4($fp)	# load this from $fp+4 into $t2
	  add $t3, $t2, $t1	
	# _tmp1477 = *(_tmp1476)
	  lw $t4, 0($t3) 	# load with offset
	# _tmp1478 = 12
	  li $t5, 12		# load constant value 12 into $t5
	# _tmp1479 = this + _tmp1478
	  add $t6, $t2, $t5	
	# _tmp1480 = *(_tmp1479)
	  lw $t7, 0($t6) 	# load with offset
	# PushParam _tmp1480
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t7, 4($sp)	# copy param value to stack
	# _tmp1481 = *(_tmp1477)
	  lw $s0, 0($t4) 	# load with offset
	# _tmp1482 = *(_tmp1481)
	  lw $s1, 0($s0) 	# load with offset
	# _tmp1483 = ACall _tmp1482
	# (save modified registers before flow of control change)
	  sw $t0, -152($fp)	# spill _tmp1474 from $t0 to $fp-152
	  sw $t1, -156($fp)	# spill _tmp1475 from $t1 to $fp-156
	  sw $t3, -160($fp)	# spill _tmp1476 from $t3 to $fp-160
	  sw $t4, -164($fp)	# spill _tmp1477 from $t4 to $fp-164
	  sw $t5, -168($fp)	# spill _tmp1478 from $t5 to $fp-168
	  sw $t6, -172($fp)	# spill _tmp1479 from $t6 to $fp-172
	  sw $t7, -176($fp)	# spill _tmp1480 from $t7 to $fp-176
	  sw $s0, -180($fp)	# spill _tmp1481 from $s0 to $fp-180
	  sw $s1, -184($fp)	# spill _tmp1482 from $s1 to $fp-184
	  jalr $s1            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1484 = _tmp1477 - _tmp1483
	  lw $t1, -164($fp)	# load _tmp1477 from $fp-164 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1485 = *(_tmp1481 + 8)
	  lw $t3, -180($fp)	# load _tmp1481 from $fp-180 into $t3
	  lw $t4, 8($t3) 	# load with offset
	# PushParam _tmp1484
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp1485
	# (save modified registers before flow of control change)
	  sw $t0, -188($fp)	# spill _tmp1483 from $t0 to $fp-188
	  sw $t2, -192($fp)	# spill _tmp1484 from $t2 to $fp-192
	  sw $t4, -196($fp)	# spill _tmp1485 from $t4 to $fp-196
	  jalr $t4            	# jump to function
	# _tmp1486 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1487 = *(this)
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  lw $t2, 0($t1) 	# load with offset
	# _tmp1488 = *(_tmp1487)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1489 = ACall _tmp1488
	# (save modified registers before flow of control change)
	  sw $t0, -200($fp)	# spill _tmp1486 from $t0 to $fp-200
	  sw $t2, -204($fp)	# spill _tmp1487 from $t2 to $fp-204
	  sw $t3, -208($fp)	# spill _tmp1488 from $t3 to $fp-208
	  jalr $t3            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1490 = this - _tmp1489
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1491 = *(_tmp1487 + 16)
	  lw $t3, -204($fp)	# load _tmp1487 from $fp-204 into $t3
	  lw $t4, 16($t3) 	# load with offset
	# PushParam _tmp1490
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp1491
	# (save modified registers before flow of control change)
	  sw $t0, -212($fp)	# spill _tmp1489 from $t0 to $fp-212
	  sw $t2, -216($fp)	# spill _tmp1490 from $t2 to $fp-216
	  sw $t4, -220($fp)	# spill _tmp1491 from $t4 to $fp-220
	  jalr $t4            	# jump to function
	# _tmp1492 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1493 = 8
	  li $t1, 8		# load constant value 8 into $t1
	# _tmp1494 = this + _tmp1493
	  lw $t2, 4($fp)	# load this from $fp+4 into $t2
	  add $t3, $t2, $t1	
	# _tmp1495 = *(_tmp1494)
	  lw $t4, 0($t3) 	# load with offset
	# _tmp1496 = 12
	  li $t5, 12		# load constant value 12 into $t5
	# _tmp1497 = this + _tmp1496
	  add $t6, $t2, $t5	
	# _tmp1498 = *(_tmp1497)
	  lw $t7, 0($t6) 	# load with offset
	# PushParam _tmp1498
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t7, 4($sp)	# copy param value to stack
	# _tmp1499 = *(_tmp1495)
	  lw $s0, 0($t4) 	# load with offset
	# _tmp1500 = *(_tmp1499)
	  lw $s1, 0($s0) 	# load with offset
	# _tmp1501 = ACall _tmp1500
	# (save modified registers before flow of control change)
	  sw $t0, -224($fp)	# spill _tmp1492 from $t0 to $fp-224
	  sw $t1, -228($fp)	# spill _tmp1493 from $t1 to $fp-228
	  sw $t3, -232($fp)	# spill _tmp1494 from $t3 to $fp-232
	  sw $t4, -236($fp)	# spill _tmp1495 from $t4 to $fp-236
	  sw $t5, -240($fp)	# spill _tmp1496 from $t5 to $fp-240
	  sw $t6, -244($fp)	# spill _tmp1497 from $t6 to $fp-244
	  sw $t7, -248($fp)	# spill _tmp1498 from $t7 to $fp-248
	  sw $s0, -252($fp)	# spill _tmp1499 from $s0 to $fp-252
	  sw $s1, -256($fp)	# spill _tmp1500 from $s1 to $fp-256
	  jalr $s1            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1502 = _tmp1495 - _tmp1501
	  lw $t1, -236($fp)	# load _tmp1495 from $fp-236 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1503 = *(_tmp1499 + 16)
	  lw $t3, -252($fp)	# load _tmp1499 from $fp-252 into $t3
	  lw $t4, 16($t3) 	# load with offset
	# PushParam _tmp1502
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp1503
	# (save modified registers before flow of control change)
	  sw $t0, -260($fp)	# spill _tmp1501 from $t0 to $fp-260
	  sw $t2, -264($fp)	# spill _tmp1502 from $t2 to $fp-264
	  sw $t4, -268($fp)	# spill _tmp1503 from $t4 to $fp-268
	  jalr $t4            	# jump to function
	# _tmp1504 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1505 = *(this)
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  lw $t2, 0($t1) 	# load with offset
	# _tmp1506 = *(_tmp1505)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1507 = ACall _tmp1506
	# (save modified registers before flow of control change)
	  sw $t0, -272($fp)	# spill _tmp1504 from $t0 to $fp-272
	  sw $t2, -276($fp)	# spill _tmp1505 from $t2 to $fp-276
	  sw $t3, -280($fp)	# spill _tmp1506 from $t3 to $fp-280
	  jalr $t3            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1508 = this - _tmp1507
	  lw $t1, 4($fp)	# load this from $fp+4 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1509 = *(_tmp1505 + 20)
	  lw $t3, -276($fp)	# load _tmp1505 from $fp-276 into $t3
	  lw $t4, 20($t3) 	# load with offset
	# PushParam _tmp1508
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp1509
	# (save modified registers before flow of control change)
	  sw $t0, -284($fp)	# spill _tmp1507 from $t0 to $fp-284
	  sw $t2, -288($fp)	# spill _tmp1508 from $t2 to $fp-288
	  sw $t4, -292($fp)	# spill _tmp1509 from $t4 to $fp-292
	  jalr $t4            	# jump to function
	# _tmp1510 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_GetYesOrNo:
	# BeginFunc 32
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 32	# decrement sp to make space for locals/temps
	# PushParam prompt
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t0, 4($fp)	# load prompt from $fp+4 into $t0
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1511 = " (y/n) "
	  .data			# create string constant marked with label
	  _string81: .asciiz " (y/n) "
	  .text
	  la $t0, _string81	# load label
	# PushParam _tmp1511
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -12($fp)	# spill _tmp1511 from $t0 to $fp-12
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1512 = LCall _ReadLine
	  jal _ReadLine      	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# answer = _tmp1512
	  move $t1, $t0		# copy value
	# _tmp1513 = "y"
	  .data			# create string constant marked with label
	  _string82: .asciiz "y"
	  .text
	  la $t2, _string82	# load label
	# PushParam _tmp1513
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# PushParam answer
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp1514 = LCall _StringEqual
	# (save modified registers before flow of control change)
	  sw $t0, -16($fp)	# spill _tmp1512 from $t0 to $fp-16
	  sw $t1, -8($fp)	# spill answer from $t1 to $fp-8
	  sw $t2, -20($fp)	# spill _tmp1513 from $t2 to $fp-20
	  jal _StringEqual   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1515 = "Y"
	  .data			# create string constant marked with label
	  _string83: .asciiz "Y"
	  .text
	  la $t1, _string83	# load label
	# PushParam _tmp1515
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# PushParam answer
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  lw $t2, -8($fp)	# load answer from $fp-8 into $t2
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp1516 = LCall _StringEqual
	# (save modified registers before flow of control change)
	  sw $t0, -24($fp)	# spill _tmp1514 from $t0 to $fp-24
	  sw $t1, -28($fp)	# spill _tmp1515 from $t1 to $fp-28
	  jal _StringEqual   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 8
	  add $sp, $sp, 8	# pop params off stack
	# _tmp1517 = _tmp1514 || _tmp1516
	  lw $t1, -24($fp)	# load _tmp1514 from $fp-24 into $t1
	  or $t2, $t1, $t0	
	# Return _tmp1517
	  move $v0, $t2		# assign return value into $v0
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
  f_main:
  main:
	# BeginFunc 140
	  subu $sp, $sp, 8	# decrement sp to make space to save ra, fp
	  sw $fp, 8($sp)	# save fp
	  sw $ra, 4($sp)	# save ra
	  addiu $fp, $sp, 8	# set up new fp
	  subu $sp, $sp, 140	# decrement sp to make space for locals/temps
	# _tmp1518 = 1
	  li $t0, 1		# load constant value 1 into $t0
	# keepPlaying = _tmp1518
	  move $t1, $t0		# copy value
	# _tmp1519 = 16
	  li $t2, 16		# load constant value 16 into $t2
	# PushParam _tmp1519
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# _tmp1520 = LCall _Alloc
	# (save modified registers before flow of control change)
	  sw $t0, -16($fp)	# spill _tmp1518 from $t0 to $fp-16
	  sw $t1, -8($fp)	# spill keepPlaying from $t1 to $fp-8
	  sw $t2, -20($fp)	# spill _tmp1519 from $t2 to $fp-20
	  jal _Alloc         	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1521 = House
	  la $t1, House	# load label
	# *(_tmp1520) = _tmp1521
	  sw $t1, 0($t0) 	# store with offset
	# house = _tmp1520
	  move $t2, $t0		# copy value
	# _tmp1522 = *(house)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1523 = *(_tmp1522)
	  lw $t4, 0($t3) 	# load with offset
	# _tmp1524 = ACall _tmp1523
	# (save modified registers before flow of control change)
	  sw $t0, -24($fp)	# spill _tmp1520 from $t0 to $fp-24
	  sw $t1, -28($fp)	# spill _tmp1521 from $t1 to $fp-28
	  sw $t2, -12($fp)	# spill house from $t2 to $fp-12
	  sw $t3, -32($fp)	# spill _tmp1522 from $t3 to $fp-32
	  sw $t4, -36($fp)	# spill _tmp1523 from $t4 to $fp-36
	  jalr $t4            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1525 = house - _tmp1524
	  lw $t1, -12($fp)	# load house from $fp-12 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1526 = *(_tmp1522 + 4)
	  lw $t3, -32($fp)	# load _tmp1522 from $fp-32 into $t3
	  lw $t4, 4($t3) 	# load with offset
	# PushParam _tmp1525
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp1526
	# (save modified registers before flow of control change)
	  sw $t0, -40($fp)	# spill _tmp1524 from $t0 to $fp-40
	  sw $t2, -44($fp)	# spill _tmp1525 from $t2 to $fp-44
	  sw $t4, -48($fp)	# spill _tmp1526 from $t4 to $fp-48
	  jalr $t4            	# jump to function
	# _tmp1527 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1528 = *(house)
	  lw $t1, -12($fp)	# load house from $fp-12 into $t1
	  lw $t2, 0($t1) 	# load with offset
	# _tmp1529 = *(_tmp1528)
	  lw $t3, 0($t2) 	# load with offset
	# _tmp1530 = ACall _tmp1529
	# (save modified registers before flow of control change)
	  sw $t0, -52($fp)	# spill _tmp1527 from $t0 to $fp-52
	  sw $t2, -56($fp)	# spill _tmp1528 from $t2 to $fp-56
	  sw $t3, -60($fp)	# spill _tmp1529 from $t3 to $fp-60
	  jalr $t3            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1531 = house - _tmp1530
	  lw $t1, -12($fp)	# load house from $fp-12 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1532 = *(_tmp1528 + 8)
	  lw $t3, -56($fp)	# load _tmp1528 from $fp-56 into $t3
	  lw $t4, 8($t3) 	# load with offset
	# PushParam _tmp1531
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp1532
	# (save modified registers before flow of control change)
	  sw $t0, -64($fp)	# spill _tmp1530 from $t0 to $fp-64
	  sw $t2, -68($fp)	# spill _tmp1531 from $t2 to $fp-68
	  sw $t4, -72($fp)	# spill _tmp1532 from $t4 to $fp-72
	  jalr $t4            	# jump to function
	# _tmp1533 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# (save modified registers before flow of control change)
	  sw $t0, -76($fp)	# spill _tmp1533 from $t0 to $fp-76
  _L109:
	# IfZ keepPlaying Goto _L110
	  lw $t0, -8($fp)	# load keepPlaying from $fp-8 into $t0
	  beqz $t0, _L110	# branch if keepPlaying is zero 
	# _tmp1534 = *(house)
	  lw $t0, -12($fp)	# load house from $fp-12 into $t0
	  lw $t1, 0($t0) 	# load with offset
	# _tmp1535 = *(_tmp1534)
	  lw $t2, 0($t1) 	# load with offset
	# _tmp1536 = ACall _tmp1535
	# (save modified registers before flow of control change)
	  sw $t1, -80($fp)	# spill _tmp1534 from $t1 to $fp-80
	  sw $t2, -84($fp)	# spill _tmp1535 from $t2 to $fp-84
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1537 = house - _tmp1536
	  lw $t1, -12($fp)	# load house from $fp-12 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1538 = *(_tmp1534 + 28)
	  lw $t3, -80($fp)	# load _tmp1534 from $fp-80 into $t3
	  lw $t4, 28($t3) 	# load with offset
	# PushParam _tmp1537
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp1538
	# (save modified registers before flow of control change)
	  sw $t0, -88($fp)	# spill _tmp1536 from $t0 to $fp-88
	  sw $t2, -92($fp)	# spill _tmp1537 from $t2 to $fp-92
	  sw $t4, -96($fp)	# spill _tmp1538 from $t4 to $fp-96
	  jalr $t4            	# jump to function
	# _tmp1539 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1540 = "\nDo you want to play another hand?"
	  .data			# create string constant marked with label
	  _string84: .asciiz "\nDo you want to play another hand?"
	  .text
	  la $t1, _string84	# load label
	# PushParam _tmp1540
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# _tmp1541 = LCall f_GetYesOrNo
	# (save modified registers before flow of control change)
	  sw $t0, -100($fp)	# spill _tmp1539 from $t0 to $fp-100
	  sw $t1, -104($fp)	# spill _tmp1540 from $t1 to $fp-104
	  jal f_GetYesOrNo   	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# keepPlaying = _tmp1541
	  move $t1, $t0		# copy value
	# Goto _L109
	# (save modified registers before flow of control change)
	  sw $t0, -108($fp)	# spill _tmp1541 from $t0 to $fp-108
	  sw $t1, -8($fp)	# spill keepPlaying from $t1 to $fp-8
	  b _L109		# unconditional branch
  _L110:
	# _tmp1542 = *(house)
	  lw $t0, -12($fp)	# load house from $fp-12 into $t0
	  lw $t1, 0($t0) 	# load with offset
	# _tmp1543 = *(_tmp1542)
	  lw $t2, 0($t1) 	# load with offset
	# _tmp1544 = ACall _tmp1543
	# (save modified registers before flow of control change)
	  sw $t1, -112($fp)	# spill _tmp1542 from $t1 to $fp-112
	  sw $t2, -116($fp)	# spill _tmp1543 from $t2 to $fp-116
	  jalr $t2            	# jump to function
	  move $t0, $v0		# copy function return value from $v0
	# _tmp1545 = house - _tmp1544
	  lw $t1, -12($fp)	# load house from $fp-12 into $t1
	  sub $t2, $t1, $t0	
	# _tmp1546 = *(_tmp1542 + 24)
	  lw $t3, -112($fp)	# load _tmp1542 from $fp-112 into $t3
	  lw $t4, 24($t3) 	# load with offset
	# PushParam _tmp1545
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t2, 4($sp)	# copy param value to stack
	# ACall _tmp1546
	# (save modified registers before flow of control change)
	  sw $t0, -120($fp)	# spill _tmp1544 from $t0 to $fp-120
	  sw $t2, -124($fp)	# spill _tmp1545 from $t2 to $fp-124
	  sw $t4, -128($fp)	# spill _tmp1546 from $t4 to $fp-128
	  jalr $t4            	# jump to function
	# _tmp1547 = 0
	  li $t0, 0		# load constant value 0 into $t0
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1548 = "Thank you for playing...come again soon.\n"
	  .data			# create string constant marked with label
	  _string85: .asciiz "Thank you for playing...come again soon.\n"
	  .text
	  la $t1, _string85	# load label
	# PushParam _tmp1548
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t1, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -132($fp)	# spill _tmp1547 from $t0 to $fp-132
	  sw $t1, -136($fp)	# spill _tmp1548 from $t1 to $fp-136
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1549 = "\nCS143 BlackJack Copyright (c) 1999 by Peter Mor..."
	  .data			# create string constant marked with label
	  _string86: .asciiz "\nCS143 BlackJack Copyright (c) 1999 by Peter Mork.\n"
	  .text
	  la $t0, _string86	# load label
	# PushParam _tmp1549
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -140($fp)	# spill _tmp1549 from $t0 to $fp-140
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# _tmp1550 = "(2001 mods by jdz)\n"
	  .data			# create string constant marked with label
	  _string87: .asciiz "(2001 mods by jdz)\n"
	  .text
	  la $t0, _string87	# load label
	# PushParam _tmp1550
	  subu $sp, $sp, 4	# decrement sp to make space for param
	  sw $t0, 4($sp)	# copy param value to stack
	# LCall _PrintString
	# (save modified registers before flow of control change)
	  sw $t0, -144($fp)	# spill _tmp1550 from $t0 to $fp-144
	  jal _PrintString   	# jump to function
	# PopParams 4
	  add $sp, $sp, 4	# pop params off stack
	# EndFunc
	# (below handles reaching end of fn body with no explicit return)
	  move $sp, $fp		# pop callee frame off stack
	  lw $ra, -4($fp)	# restore saved ra
	  lw $fp, 0($fp)	# restore saved fp
	  jr $ra		# return from function
