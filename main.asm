#
#lui s0, 0x10010 acceder a direcciones de memoria
#
#
.data


.text
main:
	#crear torres de Hanoi
	#Torre a = 0(0x10010)
	#Torre b = 4(0x10010)
	#Torre c = 8(0x10010)
	lui s1, 0x10010 #Valor más alto de nuestra torre A
	addi s2, s1, 0x4 #Valor más alto de nuestra torre B
	addi s3, s2, 0x4 #Valor más alto de nuestra torre C

	addi s0, zero, 3 #Cantidad de discos totales de torres int n = 2;
	addi t0, zero, 32 #Cambio por fila
	mul t0, s0, t0 #valor para llegar a Ultima fila a colocar el disco más grande de la torre

	add s1, s1, t0 #Ultima fila de torre A
	add s2, s2, t0 #Ultima fila torre B
	add s3, s3, t0 #Ultima fila torre C

	add t1, zero, s0 #Iterador
#Creacion Torre de origen Hanoi
doWhile:
	addi s1, s1, -32 #Regresamos nuestra direccion en memoria 32 bits
	sw t1, 0(s1) #Guardamos nuestro iterador en la direccion a memoria
	addi t1, t1, -1 #Disminuimos nuestro iterador
	bgt t1, zero, doWhile

#creamos parametros para nuestra función de hanoi
add a0, zero, s1
add a1, zero, s2
add a2, zero, s3
add a3, zero, s0

addi t0, zero, 1

hanoi:
#	addi sp, sp, -4
#	sw a3, 0(sp)
	addi sp, sp, -4
	sw ra, 0(sp)

	beq a3, t0, break
	
	lw t2, 0(a0)
	sw zero, 0(a0)
	addi a0, a0, -32
	sw t2, 0(a2)
	addi a2, a2, 32
	
	addi a3, a3, -1
	add t1, zero, a1
	add a1, zero, a2
	add a2, zero, t1
	jal hanoi
	
	add t1, zero, a0
	add a0, zero, a2
	add a2, zero, t1
	add t1, zero, a1
	add a1, zero, a2
	add a2, zero, t1
	jal hanoi
	
	jal end
#	jal ra

break:
	lw t3, 0(a0)
	sw zero, 0(a0)
	addi a0, a0, 32
	sw t3, 0(a2)
	addi a2, a2, -32
	
	lw ra, 0(sp)
	addi sp, sp, 4
	
	jalr ra
	
end:
nop
	



	