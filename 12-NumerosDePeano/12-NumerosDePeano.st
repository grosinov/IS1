!classDefinition: #I category: #'Numeros De Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Numeros De Peano'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'operaciones' stamp: 'GR 9/16/2020 14:43:39'!
* aNumber
 
	^aNumber.! !

!I class methodsFor: 'operaciones' stamp: 'GR 9/16/2020 16:29:37'!
+ unNumeroDePeano 
	
	^unNumeroDePeano next.! !

!I class methodsFor: 'operaciones' stamp: 'GR 9/16/2020 16:40:37'!
- aNumber

	"Si sustraendo >= minuendo devuelve error.
	 Si no, realiza la resta recursiva.
	 No encontramos manera de hacerlo recursivo"

	^aNumber name size >= self name size ifTrue: [ self error: self descripcionDeErrorDeNumerosNegativosNoSoportados ] 
								      ifFalse: [ aNumber = I ifTrue: [ self previous ] ifFalse: [ self previous - aNumber previous ] ]! !

!I class methodsFor: 'operaciones' stamp: 'GR 9/16/2020 16:38:36'!
/ aNumber

	"1/1 = 1. 1/cualquier otro numero da error"

	^aNumber = I ifTrue: [ I ] ifFalse: [ self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].! !

!I class methodsFor: 'operaciones' stamp: 'GR 9/16/2020 16:29:21'!
next
	
	"El numero que recibe este mensaje devuelve el objeto hijo en caso de que existe. Caso contrario lo crea "
	
	^self createChildNamed: self name, 'I'.! !


!I class methodsFor: 'errores' stamp: 'GR 9/16/2020 16:11:01'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	
	^'No se puede dividir un numero menor por uno mayor'! !

!I class methodsFor: 'errores' stamp: 'GR 9/16/2020 16:02:40'!
descripcionDeErrorDeNumerosNegativosNoSoportados

	^'No se puede restar un numero menor por uno mayor'! !


!classDefinition: #II category: #'Numeros De Peano'!
I subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Numeros De Peano'!
II class
	instanceVariableNames: ''!

!II class methodsFor: 'operaciones' stamp: 'GR 9/16/2020 16:27:10'!
* aNumber

	"Multiplicacion recursiva mediante la definicion de multiplicacion:
		a*b = a+a+a+... b veces"

	^aNumber + (self previous * aNumber)! !

!II class methodsFor: 'operaciones' stamp: 'GR 9/16/2020 16:26:24'!
+ unNumeroDePeano

	"Suma recursiva"
	
	^self previous + unNumeroDePeano next.! !

!II class methodsFor: 'operaciones' stamp: 'GR 9/16/2020 16:41:24'!
/ aNumber
	
	"Si dividendo < divisor --> error.
	 Si dividendo = divisor --> I.
	 Si dividendo > divisor --> realiza la division recursiva.
	 No encontramos manera de hacerlo recursivo."
	
	^aNumber name size > self name size ifTrue: [ self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ] ifFalse: [
		self = aNumber ifTrue: [ I ] ifFalse: [ 
			(self - aNumber) name size < aNumber name size ifTrue: [ I ] ifFalse: [ I + ((self - aNumber) / aNumber) ].
		]
	]! !

!II class methodsFor: 'operaciones' stamp: 'GR 9/16/2020 16:28:14'!
previous
	
	"Se devuelve el prototipo al que referencia el numero que recibe el mensaje (El padre de cada numero es el anterior)"
	
	^self parent! !


!classDefinition: #III category: #'Numeros De Peano'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!


!classDefinition: #IIII category: #'Numeros De Peano'!
III subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!


!classDefinition: #IIIII category: #'Numeros De Peano'!
IIII subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!


!classDefinition: #IIIIII category: #'Numeros De Peano'!
IIIII subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!


!classDefinition: #IIIIIII category: #'Numeros De Peano'!
IIIIII subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!


!classDefinition: #IIIIIIII category: #'Numeros De Peano'!
IIIIIII subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!


!classDefinition: #IIIIIIIII category: #'Numeros De Peano'!
IIIIIIII subclass: #IIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!


!classDefinition: #IIIIIIIIII category: #'Numeros De Peano'!
IIIIIIIII subclass: #IIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!


!classDefinition: #IIIIIIIIIII category: #'Numeros De Peano'!
IIIIIIIIII subclass: #IIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!


!classDefinition: #IIIIIIIIIIII category: #'Numeros De Peano'!
IIIIIIIIIII subclass: #IIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!


!classDefinition: #IIIIIIIIIIIII category: #'Numeros De Peano'!
IIIIIIIIIIII subclass: #IIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!


!classDefinition: #IIIIIIIIIIIIII category: #'Numeros De Peano'!
IIIIIIIIIIIII subclass: #IIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!


!classDefinition: #IIIIIIIIIIIIIII category: #'Numeros De Peano'!
IIIIIIIIIIIIII subclass: #IIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!


!classDefinition: #IIIIIIIIIIIIIIII category: #'Numeros De Peano'!
IIIIIIIIIIIIIII subclass: #IIIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!


!classDefinition: #IIIIIIIIIIIIIIIII category: #'Numeros De Peano'!
IIIIIIIIIIIIIIII subclass: #IIIIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!


!classDefinition: #IIIIIIIIIIIIIIIIII category: #'Numeros De Peano'!
IIIIIIIIIIIIIIIII subclass: #IIIIIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!


!classDefinition: #IIIIIIIIIIIIIIIIIII category: #'Numeros De Peano'!
IIIIIIIIIIIIIIIIII subclass: #IIIIIIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!


!classDefinition: #IIIIIIIIIIIIIIIIIIII category: #'Numeros De Peano'!
IIIIIIIIIIIIIIIIIII subclass: #IIIIIIIIIIIIIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!


!classDefinition: #NumerosDePeanoTest category: #'Numeros De Peano'!
DenotativeObject subclass: #NumerosDePeanoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros De Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NumerosDePeanoTest class' category: #'Numeros De Peano'!
NumerosDePeanoTest class
	instanceVariableNames: ''!

!NumerosDePeanoTest class methodsFor: 'as yet unclassified' stamp: 'GR 9/14/2020 20:49:52'!
test01SiguienteDe1Es2
	Assert that: I next isEqualTo: II.
	! !

!NumerosDePeanoTest class methodsFor: 'as yet unclassified' stamp: 'GR 9/14/2020 20:48:31'!
test02SiguienteDe2Es3
	
	Assert that: II next isEqualTo: III.! !

!NumerosDePeanoTest class methodsFor: 'as yet unclassified' stamp: 'GR 9/14/2020 20:52:58'!
test03SumaDeUnNumeroYlesElSiguiente
	
	Assert that: I+I isEqualTo: I next! !

!NumerosDePeanoTest class methodsFor: 'as yet unclassified' stamp: 'GR 9/14/2020 20:56:02'!
test04
	
	Assert that: II+III isEqualTo: IIIII.! !

!NumerosDePeanoTest class methodsFor: 'as yet unclassified' stamp: 'GR 9/16/2020 15:28:53'!
test055RestaIndefinida
	
	Assert should: [ II - IIII ] signal: Error withDescription: 'restaIndefinida'.! !

!NumerosDePeanoTest class methodsFor: 'as yet unclassified' stamp: 'GR 9/16/2020 14:39:59'!
test05Resta
	
	Assert that: II-I isEqualTo: I.! !

!NumerosDePeanoTest class methodsFor: 'as yet unclassified' stamp: 'GR 9/16/2020 15:21:44'!
test05Resta2
	
	Assert that: IIII-II isEqualTo: II.! !

!NumerosDePeanoTest class methodsFor: 'as yet unclassified' stamp: 'GR 9/16/2020 14:43:13'!
test06MultiplicacionPor1
	
	Assert that: I*IIIII isEqualTo: IIIII.! !

!NumerosDePeanoTest class methodsFor: 'as yet unclassified' stamp: 'GR 9/16/2020 14:50:49'!
test07Multiplicacion
	
	Assert that: IIII*II isEqualTo: IIIIIIII.! !

!NumerosDePeanoTest class methodsFor: 'as yet unclassified' stamp: 'GR 9/16/2020 15:56:24'!
test08DivisionEnteraRedondeando
	
	Assert that: IIIII/II isEqualTo: III.! !

!NumerosDePeanoTest class methodsFor: 'as yet unclassified' stamp: 'GR 9/16/2020 15:52:01'!
test09DivisionEntera
	
	Assert that: II/I isEqualTo: II.! !

!NumerosDePeanoTest class methodsFor: 'as yet unclassified' stamp: 'GR 9/16/2020 15:51:43'!
test10DivisionEnteraCon1Da1
	
	Assert that: I/II isEqualTo: I.! !
