!classDefinition: #Bill category: #'Actividad 2'!
DenotativeObject subclass: #Bill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actividad 2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Bill class' category: #'Actividad 2'!
Bill class
	instanceVariableNames: 'diasDeVida'!

!Bill class methodsFor: 'as yet unclassified' stamp: 'GR 8/31/2020 21:53:37'!
caminar: unaCantidadDeKilometros
	"Bill camina"

	diasDeVida  := diasDeVida - 3 - unaCantidadDeKilometros.
	^diasDeVida ! !

!Bill class methodsFor: 'as yet unclassified' stamp: 'GR 8/31/2020 21:58:28'!
comer: unaCantidadDeKilosDeCerebro
	"Bill come cerebro"
	diasDeVida := unaCantidadDeKilosDeCerebro * 4 + diasDeVida .
	^diasDeVida! !

!Bill class methodsFor: 'as yet unclassified' stamp: 'GR 8/31/2020 21:59:13'!
energia
	"cantidad de vida restante"
	
	^diasDeVida! !

!Bill class methodsFor: 'as yet unclassified' stamp: 'GR 8/31/2020 22:03:58'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	diasDeVida := 36.! !

!Bill class methodsFor: 'as yet unclassified' stamp: 'GR 8/31/2020 21:48:28'!
newBill
	"nuevo Bill"
	diasDeVida := 28.
	^diasDeVida! !

Bill initializeAfterFileIn!