.data

dizi: .space 40
sayi:.asciiz "Bir Sayı Giriniz:"
ortalama: .asciiz "Harmonik Ortalama:"
aralik: .asciiz "\n"
bir:  .float 1.0

uzunluk:.float 10.0

.text
 .globl main

 main: 
        addi $s0, $0, 1
        addi $t2,$0,0
      
              lwc1 $f2, bir   
              
       
         loop:  
         
               
               li $v0,4
               la $a0,sayi
               syscall
                  
            
               li $v0,6
               syscall
                sll $zero $zero 0
                sll $zero $zero 0
                sll $zero $zero 0
               div.s $f12,$f2,$f0  #1 e böl
                sll $zero $zero 0
                sll $zero $zero 0
                sll $zero $zero 0
               add.s $f16,$f16,$f12  #topla
               sll $zero $zero 0
               sll $zero $zero 0
               sll $zero $zero 0
            
            
               s.s  $f0, dizi($t2)	
               addi $t2, $t2, 4

        
             addi $s0,$s0,1
             slti $t0,$s0,11   
             bne $t0, $0,loop	

       
        lwc1 $f14,uzunluk #10
   
        li $v0,4
        la $a0,ortalama   
        syscall

      

       li $v0,2
       div.s $f18,$f14,$f16 #10 a böl      
       syscall

       li $v0,10
       syscall
    
