.data
dizi: .space 40
sayi:.asciiz "Bir Sayı Giriniz:"
ort: .asciiz "Harmonik Ortalama:"
bosluk: .asciiz "\n"
bir: .float 1.0
uzunluk: .float 10.0



.text
.globl main

main:
        addi $s0, $0, 1   #i=1
        addi $t2,$0,0     #dizi indisi
      
              lwc1 $f2, bir     #1 değerini f2 de tutuyorum
              lwc1 $f6,uzunluk  #10 değerini f6 da tutuyorum
       
         loop:  #döngü ile kullanıcıdan 10 adet sayı girmesini istiyorum
         
               
               li $v0,4
               la $a0,sayi
               syscall
                  
            
               li $v0,6  #girilen sayılar -->f0 da
               syscall
            
              div.s $f4,$f2,$f0   # 1/kulanıcınn girdiği sayılar
                sll $zero $zero 0
                sll $zero $zero 0   #boş komut ekliyorum
                sll $zero $zero 0
              add.s $f8,$f8,$f4   # bölümleri topluyorum ve f8 de  tutuyorum
              
                sll $zero $zero 0
                sll $zero $zero 0     #boş komut ekliyorum
                sll $zero $zero 0

              div.s $f12,$f6,$f8   #10/toplamlar ile ortalamayı buluyorum
              
             s.s  $f0, dizi($t2)	 #girilen sayıları diziye ekliyorum
             addi $t2, $t2, 4      
             addi $s0,$s0,1   #i+1
             sll $zero $zero 0
             sll $zero $zero 0
             sll $zero $zero 0
             slti $t0,$s0,11   # döngüyü 11 olana kadar kontrol ediyorum  
             bne $t0, $0,loop
       
      li $v0,4
      la $a0,ort
      syscall
                                   
      li $v0,2                 #ortalamayı yazdırıyorum
      mov.s $f14,$f12
      syscall

      li $v0,10  #çıkış
      syscall