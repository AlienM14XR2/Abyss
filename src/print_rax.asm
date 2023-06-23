section .data
codes:
	db '0123456789ABCDEF'

section .text
global _start
_start:
	; この 1122 ... という数字は 16 進表記
	mov rax, 0x1122334455667788

	mov rdi, 1
	mov rdx, 1
	mov rcx, 64
	; 4 ビットを 16 進の 1 桁として出力していくために、
	; シフト論理和（AND）によって 1 桁のデータを得る。
	; その結果は 'codes' 配列へのオフセットである。
.loop:
	push rax
	sub rcx, 4
	; cl はレジスタ（rcxの最下位バイト）
	; rax > eax > ax = (ah + al)
	; rcx > ecx > cx = (ch + cl)
	sar rax, cl
	and rax, 0xf
	
	lea rsi, [codes + rax]
	mov rax, 1
	; syscall で rcx と rll が変更される
	push rcx
	syscall
	pop rcx

	pop rax
	; test は最速の'ゼロか？'チェックに使える
	; マニュアルで'text' コマンドを参照
	test rcx, rcx
	jnz .loop

	mov rax, 60
	xor rdi, rdi
	syscall

