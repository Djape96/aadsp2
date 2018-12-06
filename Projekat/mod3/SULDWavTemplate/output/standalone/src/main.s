	.public _enable_processing
	.public _expander
	.public _input_gain
	.public _mode
	.public _mode_o
	.public _ratio
	.public _sampleBuffer
	.public _tap_gain_3db
	.public _tap_gain_5db
	.public _tap_gain_minus16db
	.public _tap_gain_minus1db
	.public _tap_gain_minus6db
	.public _tmp_channel0
	.public _tmp_channel1
	.public _treshold
	.extern _audio_expander_init
	.extern _cl_wavread_bits_per_sample
	.extern _cl_wavread_close
	.extern _cl_wavread_frame_rate
	.extern _cl_wavread_getnchannels
	.extern _cl_wavread_number_of_frames
	.extern _cl_wavread_open
	.extern _cl_wavread_recvsample
	.extern _cl_wavwrite_close
	.extern _cl_wavwrite_open
	.extern _cl_wavwrite_sendsample
	.extern _gst_audio_dynamic_transform_expander_double
	.public _main
	.extern _printf
	.public _processing
	.extern _strcpy
	.extern __div
	.xdata_ovly
__extractedConst_0_0
	.dw  (0x7f5c28f6)
	.xdata_ovly
__extractedConst_1_0
	.dw  (0x3333333)
	.xdata_ovly
__extractedConst_2_0
	.dw  (0x651eb852)
	.xdata_ovly
_enable_processing
	.dw  (0x1)
	.xdata_ovly
_expander
	.bss (0x2)
	.ydata_ovly
_input_gain
	.dw  (0x20000000)
	.xdata_ovly
_mode
	.dw  (0x1)
	.xdata_ovly
_mode_o
	.dw  (0x0)
	.ydata_ovly
_ratio
	.dw  (0x7fffffff)
	.xdata_ovly
_sampleBuffer
	.bss (0x80)
	.xdata_ovly
_string_const_0
	.dw  (0x45)
	.dw  (0x72)
	.dw  (0x72)
	.dw  (0x6f)
	.dw  (0x72)
	.dw  (0x3a)
	.dw  (0x20)
	.dw  (0x43)
	.dw  (0x6f)
	.dw  (0x75)
	.dw  (0x6c)
	.dw  (0x64)
	.dw  (0x20)
	.dw  (0x6e)
	.dw  (0x6f)
	.dw  (0x74)
	.dw  (0x20)
	.dw  (0x6f)
	.dw  (0x70)
	.dw  (0x65)
	.dw  (0x6e)
	.dw  (0x20)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
	.dw  (0x65)
	.dw  (0x66)
	.dw  (0x69)
	.dw  (0x6c)
	.dw  (0x65)
	.dw  (0x2e)
	.dw  (0xa)
	.dw  (0x0)
	.xdata_ovly
_string_const_1
	.dw  (0x45)
	.dw  (0x72)
	.dw  (0x72)
	.dw  (0x6f)
	.dw  (0x72)
	.dw  (0x3a)
	.dw  (0x20)
	.dw  (0x43)
	.dw  (0x6f)
	.dw  (0x75)
	.dw  (0x6c)
	.dw  (0x64)
	.dw  (0x20)
	.dw  (0x6e)
	.dw  (0x6f)
	.dw  (0x74)
	.dw  (0x20)
	.dw  (0x6f)
	.dw  (0x70)
	.dw  (0x65)
	.dw  (0x6e)
	.dw  (0x20)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
	.dw  (0x65)
	.dw  (0x66)
	.dw  (0x69)
	.dw  (0x6c)
	.dw  (0x65)
	.dw  (0x2e)
	.dw  (0xa)
	.dw  (0x0)
	.ydata_ovly
_tap_gain_3db
	.dw  (0x7f5c28f6)
	.ydata_ovly
_tap_gain_5db
	.dw  (0x651eb852)
	.ydata_ovly
_tap_gain_minus16db
	.dw  (0x3333333)
	.ydata_ovly
_tap_gain_minus1db
	.dw  (0xffffffff)
	.ydata_ovly
_tap_gain_minus6db
	.dw  (0x20000000)
	.xdata_ovly
_tmp_channel0
	.bss (0x1)
	.xdata_ovly
_tmp_channel1
	.bss (0x1)
	.ydata_ovly
_treshold
	.dw  (0x0)
	.code_ovly



	# This construction should ensure linking of crt0 in case when target is a standalone program without the OS
	.if defined(_OVLY_)
		.if .strcmp('standalone',_OVLY_)=0
		.if .strcmp('crystal32',_TARGET_FAMILY_)=0
			.extern __start         # dummy use of __start to force linkage of crt0
dummy		.equ(__start)
		.else
			.extern __intvec         # dummy use of __intvec to force linkage of intvec
dummy		.equ(__intvec)
		.endif
		.endif
	.endif

_main:			/* LN: 101 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 101 | 
	i7 += 1			# LN: 101 | 
	i7 = i7 + (0x20d)			# LN: 101 | 
	i1 = i7 - (0x1)			# LN: 101 | 
	xmem[i1] = a0h			# LN: 101 | 
	i1 = i7 - (0x2)			# LN: 101 | 
	xmem[i1] = i0			# LN: 101 | 
cline_101_0:			/* LN: 120 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 120 | 
	i0 = xmem[i0]			# LN: 120 | 
	i1 = i7 - (258 - 0)			# LN: 120 | 
	i4 = xmem[i0]			# LN: 120 | 
	i0 = i1			# LN: 120 | 
	i1 = i4			# LN: 120 | 
	call (_strcpy)			# LN: 120 | 
cline_120_0:			/* LN: 121 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (258 - 0)			# LN: 121 | 
	call (_cl_wavread_open)			# LN: 121 | 
	AnyReg(i0, a0h)			# LN: 121 | 
	i1 = i7 - (0x103)			# LN: 121 | 
	xmem[i1] = i0			# LN: 121 | 
cline_121_0:			/* LN: 122 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x103)			# LN: 122 | 
	a0 = xmem[i0]			# LN: 122 | 
	a0 & a0			# LN: 122 | 
	if (a != 0) jmp (else_1)			# LN: 122 | 
cline_122_0:			/* LN: 124 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_0)			# LN: 124 | 
	call (_printf)			# LN: 124 | 
cline_124_0:			/* LN: 125 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 125 | 
	jmp (__epilogue_242)			# LN: 125 | 
cline_125_0:			/* LN: 131 | CYCLE: 0 | RULES: () */ 
endif_1:			/* LN: 122 | CYCLE: 0 | RULES: () */ 
else_1:			/* LN: 122 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x103)			# LN: 131 | 
	i0 = xmem[i0]			# LN: 131 | 
	call (_cl_wavread_getnchannels)			# LN: 131 | 
	i0 = i7 - (0x104)			# LN: 131 | 
	xmem[i0] = a0h			# LN: 131 | 
cline_131_0:			/* LN: 132 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x105)			# LN: 132 | 
	uhalfword(a0) = (0x5)			# LN: 132 | 
	xmem[i0] = a0h			# LN: 132 | 
cline_132_0:			/* LN: 133 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x103)			# LN: 133 | 
	i0 = xmem[i0]			# LN: 133 | 
	call (_cl_wavread_bits_per_sample)			# LN: 133 | 
	i0 = i7 - (0x106)			# LN: 133 | 
	xmem[i0] = a0h			# LN: 133 | 
cline_133_0:			/* LN: 134 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x103)			# LN: 134 | 
	i0 = xmem[i0]			# LN: 134 | 
	call (_cl_wavread_frame_rate)			# LN: 134 | 
	i0 = i7 - (0x107)			# LN: 134 | 
	xmem[i0] = a0h			# LN: 134 | 
cline_134_0:			/* LN: 135 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x103)			# LN: 135 | 
	i0 = xmem[i0]			# LN: 135 | 
	call (_cl_wavread_number_of_frames)			# LN: 135 | 
	i0 = i7 - (0x108)			# LN: 135 | 
	xmem[i0] = a0h			# LN: 135 | 
cline_135_0:			/* LN: 140 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 140 | 
	i0 = xmem[i0]			# LN: 140 | 
	i1 = i7 - (520 - 0)			# LN: 140 | 
	i0 += 1			# LN: 140 | 
	i4 = xmem[i0]			# LN: 140 | 
	i0 = i1			# LN: 140 | 
	i1 = i4			# LN: 140 | 
	call (_strcpy)			# LN: 140 | 
cline_140_0:			/* LN: 141 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (520 - 0)			# LN: 141 | 
	i1 = i7 - (0x106)			# LN: 141 | 
	a0 = xmem[i1]			# LN: 141 | 
	i1 = i7 - (0x105)			# LN: 141 | 
	a1 = xmem[i1]			# LN: 141 | 
	i1 = i7 - (0x107)			# LN: 141 | 
	b0 = xmem[i1]			# LN: 141 | 
	call (_cl_wavwrite_open)			# LN: 141 | 
	AnyReg(i0, a0h)			# LN: 141 | 
	i1 = i7 - (0x209)			# LN: 141 | 
	xmem[i1] = i0			# LN: 141 | 
cline_141_0:			/* LN: 142 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x209)			# LN: 142 | 
	a0 = xmem[i0]			# LN: 142 | 
	a0 & a0			# LN: 142 | 
	if (a != 0) jmp (else_2)			# LN: 142 | 
cline_142_0:			/* LN: 144 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_1)			# LN: 144 | 
	call (_printf)			# LN: 144 | 
cline_144_0:			/* LN: 145 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 145 | 
	jmp (__epilogue_242)			# LN: 145 | 
cline_145_0:			/* LN: 149 | CYCLE: 0 | RULES: () */ 
endif_2:			/* LN: 142 | CYCLE: 0 | RULES: () */ 
else_2:			/* LN: 142 | CYCLE: 0 | RULES: () */ 
	a0 = ymem[_ratio + 0]			# LN: 149 | 
	a1 = ymem[_treshold + 0]			# LN: 149 | 
	i0 = (0) + (_expander)			# LN: 149 | 
	call (_audio_expander_init)			# LN: 149 | 
cline_149_0:			/* LN: 160 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 160 | 
	a0 = 0			# LN: 160 | 
	xmem[i0] = a0h			# LN: 160 | 
for_5:			/* LN: 160 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x108)			# LN: 160 | 
	a0 = xmem[i0]			# LN: 160 | 
	uhalfword(a1) = (0x10)			# LN: 160 | 
	call (__div)			# LN: 160 | 
	i0 = i7 - (0x20a)			# LN: 160 | 
	a1 = xmem[i0]			# LN: 160 | 
	a1 - a0			# LN: 160 | 
	if (a >= 0) jmp (for_end_5)			# LN: 160 | 
cline_160_0:			/* LN: 162 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 162 | 
	a0 = 0			# LN: 162 | 
	xmem[i0] = a0h			# LN: 162 | 
	do (0x10), label_end_97			# LN: 162 | 
cline_162_0:			/* LN: 164 | CYCLE: 0 | RULES: () */ 
label_begin_97:			/* LN: 162 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 164 | 
	a0 = 0			# LN: 164 | 
	xmem[i0] = a0h			# LN: 164 | 
for_7:			/* LN: 164 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 164 | 
	a0 = xmem[i0]			# LN: 164 | 
	i0 = i7 - (0x104)			# LN: 164 | 
	a1 = xmem[i0]			# LN: 164 | 
	a0 - a1			# LN: 164 | 
	if (a >= 0) jmp (for_end_7)			# LN: 164 | 
cline_164_0:			/* LN: 166 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x103)			# LN: 166 | 
	i0 = xmem[i0]			# LN: 166 | 
	call (_cl_wavread_recvsample)			# LN: 166 | 
	i0 = i7 - (0x20d)			# LN: 166 | 
	xmem[i0] = a0h			# LN: 166 | 
cline_166_0:			/* LN: 167 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 167 | 
	a0 = xmem[i0]			# LN: 167 | 
	a0 = a0 << 4			# LN: 167 | 
	i0 = a0			# LN: 167 | 
	i1 = i7 - (0x20b)			# LN: 167 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 167 | 
	a0 = xmem[i1]			# LN: 167 | 
	a1 = i0			# LN: 167 | 
	a0 = a1 + a0			# LN: 167 | 
	AnyReg(i0, a0h)			# LN: 167 | 
	i1 = i7 - (0x20d)			# LN: 167 | 
	a0 = xmem[i1]			# LN: 167 | 
	xmem[i0] = a0h			# LN: 167 | 
cline_167_0:			/* LN: 164 | CYCLE: 0 | RULES: () */ 
init_latch_label_5:			/* LN: 168 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 164 | 
	a0 = xmem[i0]			# LN: 164 | 
	uhalfword(a1) = (0x1)			# LN: 164 | 
	a0 = a0 + a1			# LN: 164 | 
	i0 = i7 - (0x20c)			# LN: 164 | 
	xmem[i0] = a0h			# LN: 164 | 
	jmp (for_7)			# LN: 164 | 
cline_164_1:			/* LN: 162 | CYCLE: 0 | RULES: () */ 
init_latch_label_6:			/* LN: 169 | CYCLE: 0 | RULES: () */ 
for_end_7:			/* LN: 164 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 162 | 
	a0 = xmem[i0]			# LN: 162 | 
	uhalfword(a1) = (0x1)			# LN: 162 | 
	a0 = a0 + a1			# LN: 162 | 
	i0 = i7 - (0x20b)			# LN: 162 | 
label_end_97:			# LN: 162 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 162 | 
cline_162_1:			/* LN: 171 | CYCLE: 0 | RULES: () */ 
for_end_6:			/* LN: 162 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_enable_processing + 0]			# LN: 171 | 
	a0 & a0			# LN: 171 | 
	if (a == 0) jmp (else_3)			# LN: 171 | 
cline_171_0:			/* LN: 172 | CYCLE: 0 | RULES: () */ 
	call (_processing)			# LN: 172 | 
	jmp (endif_3)			# LN: 172 | 
cline_172_0:			/* LN: 174 | CYCLE: 0 | RULES: () */ 
endif_3:			/* LN: 171 | CYCLE: 0 | RULES: () */ 
else_3:			/* LN: 171 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 174 | 
	a0 = 0			# LN: 174 | 
	xmem[i0] = a0h			# LN: 174 | 
	do (0x10), label_end_98			# LN: 174 | 
cline_174_0:			/* LN: 176 | CYCLE: 0 | RULES: () */ 
label_begin_98:			/* LN: 174 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 176 | 
	a0 = 0			# LN: 176 | 
	xmem[i0] = a0h			# LN: 176 | 
for_9:			/* LN: 176 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 176 | 
	a0 = xmem[i0]			# LN: 176 | 
	i0 = i7 - (0x105)			# LN: 176 | 
	a1 = xmem[i0]			# LN: 176 | 
	a0 - a1			# LN: 176 | 
	if (a >= 0) jmp (for_end_9)			# LN: 176 | 
cline_176_0:			/* LN: 178 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 178 | 
	a0 = xmem[i0]			# LN: 178 | 
	a0 = a0 << 4			# LN: 178 | 
	i0 = a0			# LN: 178 | 
	i1 = i7 - (0x20b)			# LN: 178 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 178 | 
	a0 = xmem[i1]			# LN: 178 | 
	a1 = i0			# LN: 178 | 
	a0 = a1 + a0			# LN: 178 | 
	AnyReg(i0, a0h)			# LN: 178 | 
	i1 = i7 - (0x20d)			# LN: 178 | 
	a0 = xmem[i0]			# LN: 178 | 
	xmem[i1] = a0h			# LN: 178 | 
cline_178_0:			/* LN: 180 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_mode_o + 0]			# LN: 180 | 
	a0 & a0			# LN: 180 | 
	if (a != 0) jmp (else_4)			# LN: 180 | 
	a0 = 0			# LN: 180 | 
	i0 = i7 - (0x20c)			# LN: 180 | 
	a1 = xmem[i0]			# LN: 180 | 
	a1 - a0			# LN: 180 | 
	uhalfword(a0) = (0x1)			# LN: 180 | 
	if (a != 0) jmp (comparation_0)			# LN: 180 | 
	uhalfword(a0) = (0x0)			# LN: 180 | 
comparation_0:			/* LN: 180 | CYCLE: 0 | RULES: (CComparisonIntIntRule) */ 
	a0 & a0			# LN: 180 | 
	if (a == 0) jmp (land_1)			# LN: 180 | 
	i0 = i7 - (0x20c)			# LN: 180 | 
	a0 = xmem[i0]			# LN: 180 | 
	uhalfword(a1) = (0x3)			# LN: 180 | 
	a0 - a1			# LN: 180 | 
	uhalfword(a0) = (0x1)			# LN: 180 | 
	if (a != 0) jmp (comparation_1)			# LN: 180 | 
	uhalfword(a0) = (0x0)			# LN: 180 | 
land_1:			/* LN: 180 | CYCLE: 0 | RULES: () */ 
comparation_1:			/* LN: 180 | CYCLE: 0 | RULES: (CComparisonIntIntRule) */ 
	a0 & a0			# LN: 180 | 
	if (a == 0) jmp (else_4)			# LN: 180 | 
cline_180_0:			/* LN: 181 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 181 | 
	a0 = 0			# LN: 181 | 
	xmem[i0] = a0h			# LN: 181 | 
	jmp (endif_4)			# LN: 181 | 
cline_181_0:			/* LN: 183 | CYCLE: 0 | RULES: () */ 
endif_4:			/* LN: 180 | CYCLE: 0 | RULES: () */ 
else_4:			/* LN: 180 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x209)			# LN: 183 | 
	i1 = i7 - (0x20d)			# LN: 183 | 
	a0 = xmem[i1]			# LN: 183 | 
	i0 = xmem[i0]			# LN: 183 | 
	call (_cl_wavwrite_sendsample)			# LN: 183 | 
cline_183_0:			/* LN: 176 | CYCLE: 0 | RULES: () */ 
init_latch_label_7:			/* LN: 184 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 176 | 
	a0 = xmem[i0]			# LN: 176 | 
	uhalfword(a1) = (0x1)			# LN: 176 | 
	a0 = a0 + a1			# LN: 176 | 
	i0 = i7 - (0x20c)			# LN: 176 | 
	xmem[i0] = a0h			# LN: 176 | 
	jmp (for_9)			# LN: 176 | 
cline_176_1:			/* LN: 174 | CYCLE: 0 | RULES: () */ 
init_latch_label_8:			/* LN: 185 | CYCLE: 0 | RULES: () */ 
for_end_9:			/* LN: 176 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 174 | 
	a0 = xmem[i0]			# LN: 174 | 
	uhalfword(a1) = (0x1)			# LN: 174 | 
	a0 = a0 + a1			# LN: 174 | 
	i0 = i7 - (0x20b)			# LN: 174 | 
label_end_98:			# LN: 174 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 174 | 
cline_174_1:			/* LN: 160 | CYCLE: 0 | RULES: () */ 
init_latch_label_9:			/* LN: 186 | CYCLE: 0 | RULES: () */ 
for_end_8:			/* LN: 174 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20a)			# LN: 160 | 
	a0 = xmem[i0]			# LN: 160 | 
	uhalfword(a1) = (0x1)			# LN: 160 | 
	a0 = a0 + a1			# LN: 160 | 
	i0 = i7 - (0x20a)			# LN: 160 | 
	xmem[i0] = a0h			# LN: 160 | 
	jmp (for_5)			# LN: 160 | 
cline_160_1:			/* LN: 191 | CYCLE: 0 | RULES: () */ 
for_end_5:			/* LN: 160 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x103)			# LN: 191 | 
	i0 = xmem[i0]			# LN: 191 | 
	call (_cl_wavread_close)			# LN: 191 | 
cline_191_0:			/* LN: 192 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x209)			# LN: 192 | 
	i0 = xmem[i0]			# LN: 192 | 
	call (_cl_wavwrite_close)			# LN: 192 | 
cline_192_0:			/* LN: 195 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 195 | 
	jmp (__epilogue_242)			# LN: 195 | 
cline_195_0:			/* LN: 196 | CYCLE: 0 | RULES: () */ 
__epilogue_242:			/* LN: 196 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x20d)			# LN: 196 | 
	i7 -= 1			# LN: 196 | 
	ret			# LN: 196 | 



_processing:			/* LN: 28 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 28 | 
	i7 += 1			# LN: 28 | 
	i7 = i7 + (0x8)			# LN: 28 | 
cline_28_0:			/* LN: 31 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 31 | 
	uhalfword(a0) = (_sampleBuffer + 0)			# LN: 31 | 
	xmem[i0] = a0			# LN: 31 | 
cline_31_0:			/* LN: 32 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 32 | 
	uhalfword(a0) = (_sampleBuffer + 16)			# LN: 32 | 
	xmem[i0] = a0			# LN: 32 | 
cline_32_0:			/* LN: 33 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 33 | 
	uhalfword(a0) = (_sampleBuffer + 32)			# LN: 33 | 
	xmem[i0] = a0			# LN: 33 | 
cline_33_0:			/* LN: 34 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 34 | 
	uhalfword(a0) = (_sampleBuffer + 48)			# LN: 34 | 
	xmem[i0] = a0			# LN: 34 | 
cline_34_0:			/* LN: 35 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 35 | 
	uhalfword(a0) = (_sampleBuffer + 64)			# LN: 35 | 
	xmem[i0] = a0			# LN: 35 | 
cline_35_0:			/* LN: 37 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 37 | 
	uhalfword(a0) = (_sampleBuffer + 0)			# LN: 37 | 
	xmem[i0] = a0			# LN: 37 | 
cline_37_0:			/* LN: 38 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 38 | 
	uhalfword(a0) = (_sampleBuffer + 16)			# LN: 38 | 
	xmem[i0] = a0			# LN: 38 | 
cline_38_0:			/* LN: 40 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 40 | 
	a0 = 0			# LN: 40 | 
	xmem[i0] = a0h			# LN: 40 | 
	do (0x10), label_end_92			# LN: 40 | 
cline_40_0:			/* LN: 42 | CYCLE: 0 | RULES: () */ 
label_begin_92:			/* LN: 40 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 42 | 
	i0 = xmem[i0]			# LN: 42 | 
	x0 = ymem[_input_gain + 0]			# LN: 42 | 
	x1 = xmem[i0]			# LN: 42 | 
	i0 = i7 - (0x6)			# LN: 42 | 
	i0 = xmem[i0]			# LN: 42 | 
	a0 = x1 * x0			# LN: 42 | 
	xmem[i0] = a0			# LN: 42 | 
cline_42_0:			/* LN: 43 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 43 | 
	i0 = xmem[i0]			# LN: 43 | 
	x0 = ymem[_input_gain + 0]			# LN: 43 | 
	x1 = xmem[i0]			# LN: 43 | 
	i0 = i7 - (0x7)			# LN: 43 | 
	i0 = xmem[i0]			# LN: 43 | 
	a0 = x1 * x0			# LN: 43 | 
	xmem[i0] = a0			# LN: 43 | 
cline_43_0:			/* LN: 44 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 44 | 
	i0 = xmem[i0]			# LN: 44 | 
	i1 = i7 - (0x6)			# LN: 44 | 
	i0 += 1			# LN: 44 | 
	xmem[i1] = i0			# LN: 44 | 
cline_44_0:			/* LN: 45 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 45 | 
	i0 = xmem[i0]			# LN: 45 | 
	i1 = i7 - (0x7)			# LN: 45 | 
	i0 += 1			# LN: 45 | 
	xmem[i1] = i0			# LN: 45 | 
cline_45_0:			/* LN: 40 | CYCLE: 0 | RULES: () */ 
init_latch_label_0:			/* LN: 46 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 40 | 
	a0 = xmem[i0]			# LN: 40 | 
	uhalfword(a1) = (0x1)			# LN: 40 | 
	a0 = a0 + a1			# LN: 40 | 
	i0 = i7 - (0x8)			# LN: 40 | 
label_end_92:			# LN: 40 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 40 | 
cline_40_1:			/* LN: 48 | CYCLE: 0 | RULES: () */ 
for_end_0:			/* LN: 40 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 48 | 
	i0 = xmem[i0]			# LN: 48 | 
	i1 = i7 - (0x6)			# LN: 48 | 
	i0 = i0 - (0x10)			# LN: 48 | 
	xmem[i1] = i0			# LN: 48 | 
cline_48_0:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 49 | 
	i0 = xmem[i0]			# LN: 49 | 
	i1 = i7 - (0x7)			# LN: 49 | 
	i0 = i0 - (0x10)			# LN: 49 | 
	xmem[i1] = i0			# LN: 49 | 
cline_49_0:			/* LN: 51 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 51 | 
	a0 = 0			# LN: 51 | 
	xmem[i0] = a0h			# LN: 51 | 
	do (0x10), label_end_93			# LN: 51 | 
cline_51_0:			/* LN: 53 | CYCLE: 0 | RULES: () */ 
label_begin_93:			/* LN: 51 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 53 | 
	i0 = xmem[i0]			# LN: 53 | 
	halfword(x0) = (0xffff)			# LN: 53 | 
	x1 = xmem[i0]			# LN: 53 | 
	a0 = x0 * x1			# LN: 53 | 
	a0 = a0 >> 1			# LN: 53 | 
	AnyReg(a0h, a0l)			# LN: 53 | 
	i0 = i7 - (0x4)			# LN: 53 | 
	i0 = xmem[i0]			# LN: 53 | 
	a0l = (0x0)			# LN: 53 | 
	xmem[i0] = a0h			# LN: 53 | 
cline_53_0:			/* LN: 54 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 54 | 
	i0 = xmem[i0]			# LN: 54 | 
	i1 = i7 - (0x4)			# LN: 54 | 
	i0 += 1			# LN: 54 | 
	xmem[i1] = i0			# LN: 54 | 
cline_54_0:			/* LN: 55 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 55 | 
	i0 = xmem[i0]			# LN: 55 | 
	i1 = i7 - (0x7)			# LN: 55 | 
	i0 += 1			# LN: 55 | 
	xmem[i1] = i0			# LN: 55 | 
cline_55_0:			/* LN: 51 | CYCLE: 0 | RULES: () */ 
init_latch_label_1:			/* LN: 56 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 51 | 
	a0 = xmem[i0]			# LN: 51 | 
	uhalfword(a1) = (0x1)			# LN: 51 | 
	a0 = a0 + a1			# LN: 51 | 
	i0 = i7 - (0x8)			# LN: 51 | 
label_end_93:			# LN: 51 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 51 | 
cline_51_1:			/* LN: 58 | CYCLE: 0 | RULES: () */ 
for_end_1:			/* LN: 51 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 58 | 
	i0 = xmem[i0]			# LN: 58 | 
	i1 = i7 - (0x7)			# LN: 58 | 
	i0 = i0 - (0x10)			# LN: 58 | 
	xmem[i1] = i0			# LN: 58 | 
cline_58_0:			/* LN: 60 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_mode + 0]			# LN: 60 | 
	uhalfword(a1) = (0x1)			# LN: 60 | 
	a0 - a1			# LN: 60 | 
	if (a != 0) jmp (else_0)			# LN: 60 | 
cline_60_0:			/* LN: 62 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 62 | 
	a0 = 0			# LN: 62 | 
	xmem[i0] = a0h			# LN: 62 | 
	do (0x10), label_end_94			# LN: 62 | 
cline_62_0:			/* LN: 64 | CYCLE: 0 | RULES: () */ 
label_begin_94:			/* LN: 62 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 64 | 
	i0 = xmem[i0]			# LN: 64 | 
	x0 = (0x2000)			# LN: 64 | 
	x1 = xmem[i0]			# LN: 64 | 
	i0 = i7 - (0x1)			# LN: 64 | 
	i0 = xmem[i0]			# LN: 64 | 
	a0 = x1 * x0			# LN: 64 | 
	xmem[i0] = a0			# LN: 64 | 
cline_64_0:			/* LN: 65 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 65 | 
	i0 = xmem[i0]			# LN: 65 | 
	x0 = xmem[__extractedConst_0_0 + 0]			# LN: 65 | 
	x1 = xmem[i0]			# LN: 65 | 
	i0 = i7 - (0x3)			# LN: 65 | 
	i0 = xmem[i0]			# LN: 65 | 
	a0 = x1 * x0			# LN: 65 | 
	xmem[i0] = a0			# LN: 65 | 
cline_65_0:			/* LN: 66 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 66 | 
	i0 = xmem[i0]			# LN: 66 | 
	i1 = i7 - (0x3)			# LN: 66 | 
	a0 = xmem[i0]			# LN: 66 | 
	i0 = xmem[i1]			# LN: 66 | 
	a0 = a0 << 1			# LN: 66 | 
	xmem[i0] = a0h			# LN: 66 | 
cline_66_0:			/* LN: 67 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 67 | 
	i0 = xmem[i0]			# LN: 67 | 
	i1 = i7 - (0x1)			# LN: 67 | 
	i0 += 1			# LN: 67 | 
	xmem[i1] = i0			# LN: 67 | 
cline_67_0:			/* LN: 68 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 68 | 
	i0 = xmem[i0]			# LN: 68 | 
	i1 = i7 - (0x3)			# LN: 68 | 
	i0 += 1			# LN: 68 | 
	xmem[i1] = i0			# LN: 68 | 
cline_68_0:			/* LN: 69 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 69 | 
	i0 = xmem[i0]			# LN: 69 | 
	i1 = i7 - (0x6)			# LN: 69 | 
	i0 += 1			# LN: 69 | 
	xmem[i1] = i0			# LN: 69 | 
cline_69_0:			/* LN: 62 | CYCLE: 0 | RULES: () */ 
init_latch_label_2:			/* LN: 70 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 62 | 
	a0 = xmem[i0]			# LN: 62 | 
	uhalfword(a1) = (0x1)			# LN: 62 | 
	a0 = a0 + a1			# LN: 62 | 
	i0 = i7 - (0x8)			# LN: 62 | 
label_end_94:			# LN: 62 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 62 | 
for_end_2:			/* LN: 62 | CYCLE: 0 | RULES: () */ 
	jmp (endif_0)			# LN: 62 | 
cline_62_1:			/* LN: 74 | CYCLE: 0 | RULES: () */ 
else_0:			/* LN: 60 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 74 | 
	a0 = 0			# LN: 74 | 
	xmem[i0] = a0h			# LN: 74 | 
	do (0x10), label_end_95			# LN: 74 | 
cline_74_0:			/* LN: 76 | CYCLE: 0 | RULES: () */ 
label_begin_95:			/* LN: 74 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 76 | 
	i0 = xmem[i0]			# LN: 76 | 
	x0 = xmem[__extractedConst_1_0 + 0]			# LN: 76 | 
	x1 = xmem[i0]			# LN: 76 | 
	i0 = i7 - (0x1)			# LN: 76 | 
	i0 = xmem[i0]			# LN: 76 | 
	a0 = x1 * x0			# LN: 76 | 
	xmem[i0] = a0			# LN: 76 | 
cline_76_0:			/* LN: 77 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 77 | 
	i0 = xmem[i0]			# LN: 77 | 
	x0 = xmem[__extractedConst_2_0 + 0]			# LN: 77 | 
	x1 = xmem[i0]			# LN: 77 | 
	i0 = i7 - (0x3)			# LN: 77 | 
	i0 = xmem[i0]			# LN: 77 | 
	a0 = x1 * x0			# LN: 77 | 
	xmem[i0] = a0			# LN: 77 | 
cline_77_0:			/* LN: 78 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 78 | 
	i0 = xmem[i0]			# LN: 78 | 
	i1 = i7 - (0x3)			# LN: 78 | 
	a0 = xmem[i0]			# LN: 78 | 
	a0 = a0 << 1			# LN: 78 | 
	i0 = xmem[i1]			# LN: 78 | 
	a0 = a0 << 1			# LN: 78 | 
	xmem[i0] = a0h			# LN: 78 | 
cline_78_0:			/* LN: 79 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 79 | 
	i0 = xmem[i0]			# LN: 79 | 
	i1 = i7 - (0x1)			# LN: 79 | 
	i0 += 1			# LN: 79 | 
	xmem[i1] = i0			# LN: 79 | 
cline_79_0:			/* LN: 80 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 80 | 
	i0 = xmem[i0]			# LN: 80 | 
	i1 = i7 - (0x3)			# LN: 80 | 
	i0 += 1			# LN: 80 | 
	xmem[i1] = i0			# LN: 80 | 
cline_80_0:			/* LN: 81 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 81 | 
	i0 = xmem[i0]			# LN: 81 | 
	i1 = i7 - (0x6)			# LN: 81 | 
	i0 += 1			# LN: 81 | 
	xmem[i1] = i0			# LN: 81 | 
cline_81_0:			/* LN: 74 | CYCLE: 0 | RULES: () */ 
init_latch_label_3:			/* LN: 82 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 74 | 
	a0 = xmem[i0]			# LN: 74 | 
	uhalfword(a1) = (0x1)			# LN: 74 | 
	a0 = a0 + a1			# LN: 74 | 
	i0 = i7 - (0x8)			# LN: 74 | 
label_end_95:			# LN: 74 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 74 | 
cline_74_1:			/* LN: 85 | CYCLE: 0 | RULES: () */ 
endif_0:			/* LN: 60 | CYCLE: 0 | RULES: () */ 
for_end_3:			/* LN: 74 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 85 | 
	i0 = xmem[i0]			# LN: 85 | 
	i1 = i7 - (0x6)			# LN: 85 | 
	i0 = i0 - (0x10)			# LN: 85 | 
	xmem[i1] = i0			# LN: 85 | 
cline_85_0:			/* LN: 87 | CYCLE: 0 | RULES: () */ 
	i1 = i7 - (0x6)			# LN: 87 | 
	i1 = xmem[i1]			# LN: 87 | 
	i0 = (0) + (_expander)			# LN: 87 | 
	call (_gst_audio_dynamic_transform_expander_double)			# LN: 87 | 
cline_87_0:			/* LN: 88 | CYCLE: 0 | RULES: () */ 
	i1 = i7 - (0x7)			# LN: 88 | 
	i1 = xmem[i1]			# LN: 88 | 
	i0 = (0) + (_expander)			# LN: 88 | 
	call (_gst_audio_dynamic_transform_expander_double)			# LN: 88 | 
cline_88_0:			/* LN: 90 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 90 | 
	a0 = 0			# LN: 90 | 
	xmem[i0] = a0h			# LN: 90 | 
	do (0x10), label_end_96			# LN: 90 | 
cline_90_0:			/* LN: 92 | CYCLE: 0 | RULES: () */ 
label_begin_96:			/* LN: 90 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 92 | 
	i0 = xmem[i0]			# LN: 92 | 
	i1 = i7 - (0x2)			# LN: 92 | 
	i1 = xmem[i1]			# LN: 92 | 
	a0 = xmem[i0]			# LN: 92 | 
	xmem[i1] = a0h			# LN: 92 | 
cline_92_0:			/* LN: 93 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 93 | 
	i0 = xmem[i0]			# LN: 93 | 
	i1 = i7 - (0x5)			# LN: 93 | 
	i1 = xmem[i1]			# LN: 93 | 
	a0 = xmem[i0]			# LN: 93 | 
	xmem[i1] = a0h			# LN: 93 | 
cline_93_0:			/* LN: 94 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 94 | 
	i0 = xmem[i0]			# LN: 94 | 
	i1 = i7 - (0x2)			# LN: 94 | 
	i0 += 1			# LN: 94 | 
	xmem[i1] = i0			# LN: 94 | 
cline_94_0:			/* LN: 95 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 95 | 
	i0 = xmem[i0]			# LN: 95 | 
	i1 = i7 - (0x5)			# LN: 95 | 
	i0 += 1			# LN: 95 | 
	xmem[i1] = i0			# LN: 95 | 
cline_95_0:			/* LN: 96 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 96 | 
	i0 = xmem[i0]			# LN: 96 | 
	i1 = i7 - (0x6)			# LN: 96 | 
	i0 += 1			# LN: 96 | 
	xmem[i1] = i0			# LN: 96 | 
cline_96_0:			/* LN: 97 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 97 | 
	i0 = xmem[i0]			# LN: 97 | 
	i1 = i7 - (0x7)			# LN: 97 | 
	i0 += 1			# LN: 97 | 
	xmem[i1] = i0			# LN: 97 | 
cline_97_0:			/* LN: 90 | CYCLE: 0 | RULES: () */ 
init_latch_label_4:			/* LN: 98 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x8)			# LN: 90 | 
	a0 = xmem[i0]			# LN: 90 | 
	uhalfword(a1) = (0x1)			# LN: 90 | 
	a0 = a0 + a1			# LN: 90 | 
	i0 = i7 - (0x8)			# LN: 90 | 
label_end_96:			# LN: 90 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 90 | 
cline_90_1:			/* LN: 99 | CYCLE: 0 | RULES: () */ 
for_end_4:			/* LN: 90 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_240)			# LN: 99 | 
__epilogue_240:			/* LN: 99 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x8)			# LN: 99 | 
	i7 -= 1			# LN: 99 | 
	ret			# LN: 99 | 
