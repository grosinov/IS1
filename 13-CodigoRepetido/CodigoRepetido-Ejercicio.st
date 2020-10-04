!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'GR 9/21/2020 16:59:32'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self assert: (self doing: [ :aCustomerBook | aCustomerBook addCustomerNamed: 'John Lennon'. ] with: customerBook shouldNotTakeMoreThan: 50*millisecond )
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GR 9/21/2020 19:20:06'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	self assert: (self doing: [ :aCustomerBook | aCustomerBook removeCustomerNamed: paulMcCartney. ] with: customerBook shouldNotTakeMoreThan: 100*millisecond )
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GR 9/21/2020 17:44:55'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self ifDoing: [ customerBook addCustomerNamed: ''.] 
		givesTheError: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GR 9/21/2020 18:43:20'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self ifDoing: [ customerBook removeCustomerNamed: 'Paul McCartney'. ] 
		givesTheError: NotFound 
		do: (self checkIfTheOnlyCustomerIn: customerBook Is: 'John Lennon').
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GR 9/21/2020 18:09:01'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self checkIf: customerBook hasActiveCostumers: 0 SuspendedCostumers: 1 andCostumers: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GR 9/21/2020 18:09:08'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self checkIf: customerBook hasActiveCostumers: 0 SuspendedCostumers: 0 andCostumers: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GR 9/21/2020 18:41:53'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self ifDoing: [ customerBook suspendCustomerNamed: 'George Harrison'.]
		givesTheError: CantSuspend 
		do: (self checkIfTheOnlyCustomerIn: customerBook Is: 'John Lennon').! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GR 9/21/2020 18:44:54'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self ifDoing: [ customerBook suspendCustomerNamed: johnLennon.]
		givesTheError: CantSuspend 
		do: (self checkIfTheOnlyCustomerIn: customerBook Is: 'John Lennon').
! !


!CustomerBookTest methodsFor: 'private' stamp: 'GR 9/21/2020 19:15:01'!
checkIf: aCustomerBook hasActiveCostumers: activeCostumers SuspendedCostumers: suspendedCostumers andCostumers: costumers  
	
	self assert: activeCostumers equals: aCustomerBook numberOfActiveCustomers.
	self assert: suspendedCostumers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: costumers equals: aCustomerBook numberOfCustomers.

	
	
! !

!CustomerBookTest methodsFor: 'private' stamp: 'GR 9/21/2020 18:41:29'!
checkIfTheOnlyCustomerIn: aCustomerBook Is: aString 
	
	[ :anError | 
			self assert: aCustomerBook numberOfCustomers = 1.
			self assert: (aCustomerBook includesCustomerNamed: aString) ]! !

!CustomerBookTest methodsFor: 'private' stamp: 'GR 9/21/2020 14:15:00'!
currentTimeInMilliseconds
	
	^Time millisecondClockValue * millisecond.! !

!CustomerBookTest methodsFor: 'private' stamp: 'GR 9/21/2020 19:22:19'!
doing: aBlock with: anObject shouldNotTakeMoreThan: timeLimit

	"Este metodo puede evaluar el tiempo de ejecucion en milisegundos de cualquier 
	procedimiento con un unico parametro y ver si ese tiempo es acotado por timeLimit"

	| millisecondsBeforeRunning millisecondsAfterRunning runningTime |
	
	millisecondsBeforeRunning := self currentTimeInMilliseconds.
	aBlock value: anObject.
	millisecondsAfterRunning := self currentTimeInMilliseconds.
	
	runningTime := millisecondsAfterRunning-millisecondsBeforeRunning.
	
	^runningTime < timeLimit
	
! !

!CustomerBookTest methodsFor: 'private' stamp: 'GR 9/21/2020 19:15:23'!
ifDoing: aColaboration givesTheError: anError do: aTest

	[ aColaboration value
	self fail ]
		on: anError
		do: aTest! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'GR 9/21/2020 18:48:04'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'GR 9/21/2020 18:46:47'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'GR 9/21/2020 19:10:14'!
removeCustomerNamed: aName

	| activeNameFound suspendedNameFound |

	activeNameFound := self removeElement: aName from: active.

	suspendedNameFound := self removeElement: aName from: suspended.
	
	^ (activeNameFound = nil and: suspendedNameFound = nil) ifTrue: [ NotFound signal ] ifFalse: [ aName ].! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'private' stamp: 'GR 9/21/2020 18:54:49'!
removeElement: anElement from: anOrderedCollection
 
	1 to: anOrderedCollection size do: 
	[ :index |
		anElement = (anOrderedCollection at: index)
			ifTrue: [
				anOrderedCollection removeAt: index.
				^ anElement 
			] 
	].

	^ nil! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/17/2020 06:01:49'!
customerAlreadyExistsErrorMessage

	^'customer already exists!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/17/2020 06:02:05'!
customerCanNotBeEmptyErrorMessage

	^'customer name cannot be empty!!'! !
