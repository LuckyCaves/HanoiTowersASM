########################################################################################
##                                                                                    ##
##				Sebastian Tadeo Quiroz Tejeda 745966                                  ##
##				Kevin Emiliano Ayala Montoya 745973                                   ##
##                                                                                    ##
########################################################################################
.data


.text
main:
	#crear torres de Hanoi
	#Torre a = 0(0x10010)
	#Torre b = 4(0x10010)
	#Torre c = 8(0x10010)
	lui s1, 0x10010 #Valor m�s alto de nuestra torre A
	addi s2, s1, 0x4 #Valor m�s alto de nuestra torre B
	addi s3, s2, 0x4 #Valor m�s alto de nuestra torre C

	addi s0, zero, 3 #Cantidad de discos totales de torres int n = 2;
	addi t0, zero, 32 #Cambio por fila
	mul t0, s0, t0 #valor para llegar a Ultima fila a colocar el disco m�s grande de la torre

	add s1, s1, t0 #Ultima fila de torre A
	add s2, s2, t0 #Ultima fila torre B
	add s3, s3, t0 #Ultima fila torre C

	add t1, zero, s0 #Iterador
#Creacion Torre de origen Hanoi
doWhile:#do{
	addi s1, s1, -32 #Regresamos nuestra direccion en memoria 32 bits
	sw t1, 0(s1) #Guardamos nuestro iterador en la direccion a memoria
	#s1.push(iterador)
	addi t1, t1, -1 #Disminuimos nuestro iterador
	bgt t1, zero, doWhile #}while(iterador > 0)

#creamos parametros para nuestra funci�n de hanoi
add a0, zero, s1 #Torre 1 igual a a0
add a1, zero, s2 #Torre 2 igual a a1
add a2, zero, s3 #Torre 3 igual a a2
add a3, zero, s0 #Valor de n igual a s0

addi t0, zero, 1 #valor de comparacion
jal hanoi #Llamamos funci�n hanoi
jal end	#return 0

hanoi:
	addi sp, sp, -4
	sw ra, 0(sp) #sp.push(ra)
	addi sp, sp, -4
	sw a3, 0(sp) #sp.push(n)

	beq a3, t0, break #if(n == 1) break;
	
	addi a3, a3, -1 #n = n-1
	add t1, zero, a1
	add a1, zero, a2
	add a2, zero, t1
	jal hanoi #hanoi(n - 1, a, c, b);
	
	add t1, zero, a1
	add a1, zero, a2
	add a2, zero, t1 #Regresamos al orden original de las torres
	
	lw t2, 0(a0)
	sw zero, 0(a0)
	addi a0, a0, 32#c.push(a.top());
	addi a2, a2, -32
	sw t2, 0(a2) #a.pop();
	
	add t1, zero, a0
	add a0, zero, a1
	add a1, zero, t1
	jal hanoi #hanoi(n - 1, b, a, c);
	
	add t1, zero, a0
	add a0, zero, a1
	add a1, zero, t1 #Regresamos al orden original de las torres	
	
	lw a3, 0(sp)
	addi sp, sp, 4 #n = sp.pop()
	lw ra, 0(sp)
	addi sp, sp, 4 #ra = sp.pop()
	jalr ra #RETURN

break:
	
	lw t3, 0(a0)
	sw zero, 0(a0)
	addi a0, a0, 32#c.push(a.top());
	addi a2, a2, -32
	sw t3, 0(a2)#a.pop();
	
	lw a3, 0(sp)
	addi sp, sp, 4#n = sp.pop()
	lw ra, 0(sp)
	addi sp, sp, 4#ra = sp.pop()
	
	jalr ra #RETURN
	
end:
nop