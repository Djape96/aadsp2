	.public _audio_expander_init
	.public _gst_audio_dynamic_transform_expander_double
	.extern __div_sat_laccum
	.ydata_ovly
_c_one
	.dw  (0x7fffffff)
	.ydata_ovly
_c_zero
	.dw  (0x0)
	.ydata_ovly
_curr_data
	.bss (0x1)
	.xdata_ovly
_ratio
	.bss (0x1)
	.ydata_ovly
_threshold
	.bss (0x1)
	.xdata_ovly
_value
	.bss (0x3)
	.xdata_ovly
_zero
	.bss (0x3)
	.code_ovly



_audio_expander_init:			/* LN: 22 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 22 | 
	i7 += 1			# LN: 22 | 
	i7 = i7 + (0x3)			# LN: 22 | 
	i1 = i7 - (0x1)			# LN: 22 | 
	xmem[i1] = i0			# LN: 22 | 
	i0 = i7 - (0x2)			# LN: 22 | 
	xmem[i0] = a0h			# LN: 22 | 
	i0 = i7 - (0x3)			# LN: 22 | 
	xmem[i0] = a1h			# LN: 22 | 
cline_22_0:			/* LN: 23 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 23 | 
	i0 = xmem[i0]			# LN: 23 | 
	i1 = i7 - (0x2)			# LN: 23 | 
	i0 += 1			# LN: 23 | 
	a0 = xmem[i1]			# LN: 23 | 
	ymem[i0] = a0h			# LN: 23 | 
cline_23_0:			/* LN: 24 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 24 | 
	a0 = xmem[i0]			# LN: 24 | 
	AnyReg(i0, a0h)			# LN: 24 | 
	i1 = i7 - (0x3)			# LN: 24 | 
	a0 = xmem[i1]			# LN: 24 | 
	ymem[i0] = a0h			# LN: 24 | 
cline_24_0:			/* LN: 25 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_104)			# LN: 25 | 
__epilogue_104:			/* LN: 25 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x3)			# LN: 25 | 
	i7 -= 1			# LN: 25 | 
	ret			# LN: 25 | 



_gst_audio_dynamic_transform_expander_double:			/* LN: 27 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 27 | 
	i7 += 1			# LN: 27 | 
	i7 = i7 + (0x3)			# LN: 27 | 
	i4 = i7 - (0x1)			# LN: 27 | 
	xmem[i4] = i0			# LN: 27 | 
	i0 = i7 - (0x2)			# LN: 27 | 
	xmem[i0] = i1			# LN: 27 | 
cline_27_0:			/* LN: 31 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 31 | 
	a0 = xmem[i0]			# LN: 31 | 
	AnyReg(i0, a0h)			# LN: 31 | 
	nop #empty cycle
	a0 = ymem[i0]			# LN: 31 | 
	ymem[_threshold + 0] = a0h			# LN: 31 | 
cline_31_0:			/* LN: 32 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 32 | 
	i0 = xmem[i0]			# LN: 32 | 
	nop #empty cycle
	i0 += 1			# LN: 32 | 
	a0 = ymem[i0]			# LN: 32 | 
	xmem[_ratio + 0] = a0h			# LN: 32 | 
cline_32_0:			/* LN: 36 | CYCLE: 0 | RULES: () */ 
	a0 = ymem[_threshold + 0]			# LN: 36 | 
	a1 = ymem[_c_zero + 0]			# LN: 36 | 
	a0 - a1			# LN: 36 | 
	if (a == 0) jmp (cline_36_0)			# LN: 36 | 
	a0 = xmem[_ratio + 0]			# LN: 36 | 
	a1 = ymem[_c_one + 0]			# LN: 36 | 
	a0 - a1			# LN: 36 | 
	if (a != 0) jmp (else_0)			# LN: 36 | 
cline_36_0:			/* LN: 37 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_106)			# LN: 37 | 
cline_37_0:			/* LN: 40 | CYCLE: 0 | RULES: () */ 
endif_0:			/* LN: 36 | CYCLE: 0 | RULES: () */ 
else_0:			/* LN: 36 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_ratio + 0]			# LN: 40 | 
	a1 = ymem[_c_zero + 0]			# LN: 40 | 
	a0 - a1			# LN: 40 | 
	if (a == 0) jmp (else_1)			# LN: 40 | 
cline_40_0:			/* LN: 41 | CYCLE: 0 | RULES: () */ 
	a0 = ymem[_threshold + 0]			# LN: 41 | 
	a1 = xmem[_ratio + 0]			# LN: 41 | 
	call (__div_sat_laccum)			# LN: 41 | 
	a0 = a0			# LN: 41 | 
	a1 = ymem[_threshold + 0]			# LN: 41 | 
	a0 = a1 - a0			# LN: 41 | 
	xmem[_zero + 0] = a0g			# LN: 41 | 
	xmem[_zero + 1] = a0h			# LN: 41 | 
	xmem[_zero + 2] = a0l			# LN: 41 | 
	jmp (endif_1)			# LN: 41 | 
cline_41_0:			/* LN: 44 | CYCLE: 0 | RULES: () */ 
else_1:			/* LN: 40 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 44 | 
	xmem[_zero + 0] = a0g			# LN: 44 | 
	xmem[_zero + 1] = a0h			# LN: 44 | 
	xmem[_zero + 2] = a0l			# LN: 44 | 
cline_44_0:			/* LN: 47 | CYCLE: 0 | RULES: () */ 
endif_1:			/* LN: 40 | CYCLE: 0 | RULES: () */ 
	a0g = xmem[_zero + 0]			# LN: 47 | 
	a0h = xmem[_zero + 1]			# LN: 47 | 
	a0l = xmem[_zero + 2]			# LN: 47 | 
	a0 & a0			# LN: 47 | 
	if (a >= 0) jmp (else_2)			# LN: 47 | 
cline_47_0:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 49 | 
	xmem[_zero + 0] = a0g			# LN: 49 | 
	xmem[_zero + 1] = a0h			# LN: 49 | 
	xmem[_zero + 2] = a0l			# LN: 49 | 
	jmp (endif_2)			# LN: 49 | 
cline_49_0:			/* LN: 51 | CYCLE: 0 | RULES: () */ 
endif_2:			/* LN: 47 | CYCLE: 0 | RULES: () */ 
else_2:			/* LN: 47 | CYCLE: 0 | RULES: () */ 
	a0g = xmem[_zero + 0]			# LN: 51 | 
	a0h = xmem[_zero + 1]			# LN: 51 | 
	a0l = xmem[_zero + 2]			# LN: 51 | 
	do (0x3), label_end_5_0			# LN: 51 | 
label_begin_5_0:			/* LN: 51 | CYCLE: 0 | RULES: (CBitwiseFixPointShiftConstNonstandardValue) */ 
label_end_5_0:			# LN: 51 | CYCLE: 0 | RULES: (CBitwiseFixPointShiftConstNonstandardValue)
	a0 = a0 << 1			# LN: 51 | 
	xmem[_zero + 0] = a0g			# LN: 51 | 
	xmem[_zero + 1] = a0h			# LN: 51 | 
	xmem[_zero + 2] = a0l			# LN: 51 | 
cline_51_0:			/* LN: 52 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 52 | 
	a0 = 0			# LN: 52 | 
	xmem[i0] = a0h			# LN: 52 | 
	do (0x10), label_end_92			# LN: 52 | 
cline_52_0:			/* LN: 53 | CYCLE: 0 | RULES: () */ 
label_begin_92:			/* LN: 52 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 53 | 
	i0 = xmem[i0]			# LN: 53 | 
	nop #empty cycle
	a0 = xmem[i0]			# LN: 53 | 
	ymem[_curr_data + 0] = a0h			# LN: 53 | 
cline_53_0:			/* LN: 56 | CYCLE: 0 | RULES: () */ 
	a0 = ymem[_curr_data + 0]			# LN: 56 | 
	a1 = ymem[_threshold + 0]			# LN: 56 | 
	a0 = a0 - a1			# LN: 56 | 
	a1 = ymem[_c_zero + 0]			# LN: 56 | 
	a0 - a1			# LN: 56 | 
	if (a >= 0) jmp (else_3)			# LN: 56 | 
	a0 = ymem[_curr_data + 0]			# LN: 56 | 
	a1g = xmem[_zero + 0]			# LN: 56 | 
	a1h = xmem[_zero + 1]			# LN: 56 | 
	a1l = xmem[_zero + 2]			# LN: 56 | 
	b0 =+ a0			# LN: 56 | 
	b0 = b0 - a1			# LN: 56 | 
	b0 = b0 >> 1			# LN: 56 | 
	a0 = ymem[_c_zero + 0]			# LN: 56 | 
	a0 = a0 >> 1			# LN: 56 | 
	b0 - a0			# LN: 56 | 
	if (b <= 0) jmp (else_3)			# LN: 56 | 
cline_56_0:			/* LN: 57 | CYCLE: 0 | RULES: () */ 
	x0 = xmem[_ratio + 0]			# LN: 57 | 
	x1 = ymem[_curr_data + 0]			# LN: 57 | 
	a0 = x0 * x1			# LN: 57 | 
	xmem[_value + 0] = a0g			# LN: 57 | 
	xmem[_value + 1] = a0h			# LN: 57 | 
	xmem[_value + 2] = a0l			# LN: 57 | 
cline_57_0:			/* LN: 58 | CYCLE: 0 | RULES: () */ 
	a0 = ymem[_c_one + 0]			# LN: 58 | 
	a1 = xmem[_ratio + 0]			# LN: 58 | 
	a0 = a0 - a1			# LN: 58 | 
	x0 = a0h			# LN: 58 | 
	x1 = ymem[_threshold + 0]			# LN: 58 | 
	a0g = xmem[_value + 0]			# LN: 58 | 
	a0h = xmem[_value + 1]			# LN: 58 | 
	a0l = xmem[_value + 2]			# LN: 58 | 
	a0 += x1 * x0			# LN: 58 | 
	xmem[_value + 0] = a0g			# LN: 58 | 
	xmem[_value + 1] = a0h			# LN: 58 | 
	xmem[_value + 2] = a0l			# LN: 58 | 
	jmp (endif_3)			# LN: 58 | 
cline_58_0:			/* LN: 61 | CYCLE: 0 | RULES: () */ 
else_3:			/* LN: 56 | CYCLE: 0 | RULES: () */ 
	a0 = ymem[_curr_data + 0]			# LN: 61 | 
	a1g = xmem[_zero + 0]			# LN: 61 | 
	a1h = xmem[_zero + 1]			# LN: 61 | 
	a1l = xmem[_zero + 2]			# LN: 61 | 
	b0 =+ a0			# LN: 61 | 
	b0 = b0 - a1			# LN: 61 | 
	b0 = b0 >> 1			# LN: 61 | 
	a0 = ymem[_c_zero + 0]			# LN: 61 | 
	a0 = a0 >> 1			# LN: 61 | 
	b0 - a0			# LN: 61 | 
	if (b > 0) jmp (land_1_0)			# LN: 61 | 
	a0 = ymem[_curr_data + 0]			# LN: 61 | 
	a1 = ymem[_c_zero + 0]			# LN: 61 | 
	a0 - a1			# LN: 61 | 
	if (a > 0) jmp (cline_61_0)			# LN: 61 | 
land_1_0:			/* LN: 61 | CYCLE: 0 | RULES: () */ 
	a0 = ymem[_curr_data + 0]			# LN: 61 | 
	a1g = xmem[_zero + 0]			# LN: 61 | 
	a1h = xmem[_zero + 1]			# LN: 61 | 
	a1l = xmem[_zero + 2]			# LN: 61 | 
	b0 =+ a0			# LN: 61 | 
	b0 = b0 + a1			# LN: 61 | 
	b0 = b0 >> 1			# LN: 61 | 
	a0 = ymem[_c_zero + 0]			# LN: 61 | 
	a0 = a0 >> 1			# LN: 61 | 
	b0 - a0			# LN: 61 | 
	uhalfword(a0) = (0x1)			# LN: 61 | 
	if (b <= 0) jmp (comparation_0)			# LN: 61 | 
	uhalfword(a0) = (0x0)			# LN: 61 | 
comparation_0:			/* LN: 61 | CYCLE: 0 | RULES: (CComparisonSignedAccumFixedPointRule) */ 
	a0 & a0			# LN: 61 | 
	if (a == 0) jmp (land_2)			# LN: 61 | 
	a0 = ymem[_curr_data + 0]			# LN: 61 | 
	a1 = ymem[_c_zero + 0]			# LN: 61 | 
	a0 - a1			# LN: 61 | 
	uhalfword(a0) = (0x1)			# LN: 61 | 
	if (a < 0) jmp (comparation_1)			# LN: 61 | 
	uhalfword(a0) = (0x0)			# LN: 61 | 
land_2:			/* LN: 61 | CYCLE: 0 | RULES: () */ 
comparation_1:			/* LN: 61 | CYCLE: 0 | RULES: (CComparisonFixedPointRule) */ 
	a0 & a0			# LN: 61 | 
	if (a == 0) jmp (else_4)			# LN: 61 | 
cline_61_0:			/* LN: 62 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 62 | 
	xmem[_value + 0] = a0g			# LN: 62 | 
	xmem[_value + 1] = a0h			# LN: 62 | 
	xmem[_value + 2] = a0l			# LN: 62 | 
	jmp (endif_4)			# LN: 62 | 
cline_62_0:			/* LN: 65 | CYCLE: 0 | RULES: () */ 
else_4:			/* LN: 61 | CYCLE: 0 | RULES: () */ 
	a0 = ymem[_curr_data + 0]			# LN: 65 | 
	a1 = ymem[_threshold + 0]			# LN: 65 | 
	a0 = a0 + a1			# LN: 65 | 
	a1 = ymem[_c_zero + 0]			# LN: 65 | 
	a0 - a1			# LN: 65 | 
	if (a <= 0) jmp (else_5)			# LN: 65 | 
	a0 = ymem[_curr_data + 0]			# LN: 65 | 
	a1g = xmem[_zero + 0]			# LN: 65 | 
	a1h = xmem[_zero + 1]			# LN: 65 | 
	a1l = xmem[_zero + 2]			# LN: 65 | 
	b0 =+ a0			# LN: 65 | 
	b0 = b0 + a1			# LN: 65 | 
	b0 = b0 >> 1			# LN: 65 | 
	a0 = ymem[_c_zero + 0]			# LN: 65 | 
	a0 = a0 >> 1			# LN: 65 | 
	b0 - a0			# LN: 65 | 
	if (b >= 0) jmp (else_5)			# LN: 65 | 
cline_65_0:			/* LN: 66 | CYCLE: 0 | RULES: () */ 
	x0 = xmem[_ratio + 0]			# LN: 66 | 
	x1 = ymem[_curr_data + 0]			# LN: 66 | 
	a0 = x0 * x1			# LN: 66 | 
	xmem[_value + 0] = a0g			# LN: 66 | 
	xmem[_value + 1] = a0h			# LN: 66 | 
	xmem[_value + 2] = a0l			# LN: 66 | 
cline_66_0:			/* LN: 67 | CYCLE: 0 | RULES: () */ 
	a0 = ymem[_c_one + 0]			# LN: 67 | 
	a1 = xmem[_ratio + 0]			# LN: 67 | 
	a0 = a0 - a1			# LN: 67 | 
	x0 = a0h			# LN: 67 | 
	x1 = ymem[_threshold + 0]			# LN: 67 | 
	a0g = xmem[_value + 0]			# LN: 67 | 
	a0h = xmem[_value + 1]			# LN: 67 | 
	a0l = xmem[_value + 2]			# LN: 67 | 
	a0 -= x1 * x0			# LN: 67 | 
	xmem[_value + 0] = a0g			# LN: 67 | 
	xmem[_value + 1] = a0h			# LN: 67 | 
	xmem[_value + 2] = a0l			# LN: 67 | 
	jmp (endif_5)			# LN: 67 | 
cline_67_0:			/* LN: 69 | CYCLE: 0 | RULES: () */ 
endif_3:			/* LN: 56 | CYCLE: 0 | RULES: () */ 
endif_4:			/* LN: 61 | CYCLE: 0 | RULES: () */ 
endif_5:			/* LN: 65 | CYCLE: 0 | RULES: () */ 
else_5:			/* LN: 65 | CYCLE: 0 | RULES: () */ 
	a0g = xmem[_value + 0]			# LN: 69 | 
	a0h = xmem[_value + 1]			# LN: 69 | 
	a0l = xmem[_value + 2]			# LN: 69 | 
	do (0x3), label_end_5_1			# LN: 69 | 
label_begin_5_1:			/* LN: 69 | CYCLE: 0 | RULES: (CBitwiseFixPointShiftConstNonstandardValue) */ 
label_end_5_1:			# LN: 69 | CYCLE: 0 | RULES: (CBitwiseFixPointShiftConstNonstandardValue)
	a0 = a0 << 1			# LN: 69 | 
	xmem[_value + 0] = a0g			# LN: 69 | 
	xmem[_value + 1] = a0h			# LN: 69 | 
	xmem[_value + 2] = a0l			# LN: 69 | 
cline_69_0:			/* LN: 70 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 70 | 
	i0 = xmem[i0]			# LN: 70 | 
	a0g = xmem[_value + 0]			# LN: 70 | 
	a0h = xmem[_value + 1]			# LN: 70 | 
	a0l = xmem[_value + 2]			# LN: 70 | 
	xmem[i0] = a0			# LN: 70 | 
	i0 = i7 - (0x2)			# LN: 70 | 
	i0 = xmem[i0]			# LN: 70 | 
	i1 = i7 - (0x2)			# LN: 70 | 
	i0 += 1			# LN: 70 | 
	xmem[i1] = i0			# LN: 70 | 
cline_70_0:			/* LN: 52 | CYCLE: 0 | RULES: () */ 
init_latch_label_0:			/* LN: 71 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 52 | 
	a0 = xmem[i0]			# LN: 52 | 
	uhalfword(a1) = (0x1)			# LN: 52 | 
	a0 = a0 + a1			# LN: 52 | 
	i0 = i7 - (0x3)			# LN: 52 | 
label_end_92:			# LN: 52 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 52 | 
cline_52_1:			/* LN: 72 | CYCLE: 0 | RULES: () */ 
for_end_0:			/* LN: 52 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_106)			# LN: 72 | 
__epilogue_106:			/* LN: 72 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x3)			# LN: 72 | 
	i7 -= 1			# LN: 72 | 
	ret			# LN: 72 | 
