.586
	.model flat, stdcall
	includelib libucrt.lib
	includelib kernel32.lib
	includelib D:\HPO-2024\Debug\HPO_LIB.lib

	_printS PROTO :DWORD
	_printN PROTO :DWORD
	_pow PROTO :DWORD, :DWORD
	_abs PROTO :DWORD
	_pause PROTO
	SetConsoleOutputCP PROTO STDCALL : DWORD 
	ExitProcess PROTO :DWORD

.stack 4096

.const
	L1 DWORD 0
	L2 DWORD 1
	L3 BYTE 'Hello: ', 0
	L4 BYTE 'Machine says that he loves learning', 0
	L5 BYTE 'Hello World1!!!', 0
	L6 BYTE 'ananas', 0
	L7 DWORD -555
	L8 DWORD 555
	L9 BYTE 'Test of logic Operations', 0
	L10 BYTE 'Result is correct d = 0', 0
	L11 BYTE 'Result is uncorrect d = -1', 0
	L12 DWORD -1
	L13 BYTE 'Test cycles and nesting:', 0
	L14 DWORD 10
	L15 DWORD 5
	L16 DWORD 2
	L17 BYTE 'Test func abs(b) and abs(b)=', 0
	L18 BYTE 'Test of func pow', 0
	L19 DWORD 10000
	L20 BYTE 'An attempt to call pow(10000, 5 )', 0
	L21 BYTE 'result=', 0
	L22 BYTE 'Result of pow 10: ', 0
	L23 DWORD 4
	L24 BYTE 'vernut summu ot 0 do a', 0
	L25 BYTE '-----------------------------------------', 0
	L26 BYTE 'Lets turn to machine.', 0

.data
	funcd DWORD 0
	funcbuf DWORD 0
	rafics DWORD 0
	machineres DWORD 0
	maina DWORD 0
	mainb DWORD 0
	mainc DWORD 0
	maind DWORD 0
	maine DWORD 0
	mainf DWORD 0
	mains DWORD 0
	mainpowc DWORD 0

.code
func PROC funca : DWORD
	mov eax, funca
	cmp eax, L1
	jg p0
	jl p1
	je p1
p0:
	push funca
	pop ebx
	push L2
	pop eax
	sub ebx, eax
	push ebx
	pop funcbuf
	mov eax, funcbuf
	push eax
	call func
	push eax
	pop eax
	push funca
	pop ebx
	add eax, ebx
	push eax
	pop funcd
p1:
	push funcd
	pop eax
	ret
func ENDP

rafic PROC raficd : DWORD
	push L1
	pop rafics
	push rafics
	pop eax
	ret
rafic ENDP

machine PROC 
	push offset L3
	call _printS
	push offset L4
	pop machineres
	push machineres
	pop eax
	ret
machine ENDP


main PROC
		push offset L5
	call _printS
	push offset L6
	pop mainf
	push L7
	pop maina
	push maina
	pop eax
	push L8
	pop ebx
	add eax, ebx
	push eax
	pop maina
	push L8
	pop eax
	push L7
	pop ebx
	add eax, ebx
	push eax
	pop maind
	push offset L9
	call _printS
	mov eax, maina
	cmp eax, maind
	je p2
	jg p2
	jl p3
p2:
	mov eax, maind
	cmp eax, L1
	je p3
	jl p3
	jg p4
p3:
	push offset L10
	call _printS
	mov eax, maind
	push eax
	call rafic
	push eax
	pop maind
	jmp ife0
p4:
	push offset L11
	call _printS
	push L12
	pop maind
ife0:
	push maind
	call _printN
	push offset L13
	call _printS
	push L2
	pop maina
	mov eax, maina
	cmp eax, L2
	je p5
	jg p5
	jl p6
p5:
	push maina
	pop ebx
	push L2
	pop eax
	sub ebx, eax
	push ebx
	pop maina
	push L14
	pop mainb
	mov ecx, L15
c0:
push eax
push ecx
	mov ecx, L16
c1:
push eax
push ecx
	push mainb
	pop ebx
	push L15
	pop eax
	sub ebx, eax
	push ebx
	pop mainb
	push mainb
	call _printN
pop ecx
pop eax
loop c1
pop ecx
pop eax
loop c0
p6:
	push offset L17
	call _printS
	mov eax, mainb
	push eax
	call _abs
	push eax
	pop mainb
	push mainb
	call _printN
	push offset L18
	call _printS
	push L19
	pop mainc
	push offset L20
	call _printS
	mov eax, L15
	push eax
	mov eax, mainc
	push eax
	call _pow
	push eax
	pop maind
	push offset L21
	call _printS
	push maind
	call _printN
	push offset L22
	call _printS
	mov eax, L16
	push eax
	mov eax, L14
	push eax
	call _pow
	push eax
	pop mainpowc
	push mainpowc
	call _printN
	push L23
	pop maina
	push offset L24
	call _printS
	mov eax, maina
	push eax
	call func
	push eax
	pop maina
	push maina
	call _printN
	push offset L25
	call _printS
	push offset L26
	call _printS
	call machine
	push eax
	pop mainf
	push mainf
	call _printS
	push 0
	call _pause
	call ExitProcess
main ENDP
end main