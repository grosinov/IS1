!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'GR 10/4/2020 15:24:33'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'GR 10/4/2020 18:04:01'!
setUp
	
	| finder stack |
	
	stack := OOStack new.
	stack push: 'hola amigos'.
	stack push: 'Hola amigos'.
	stack push: 'chau familia'.
	stack push: 'hola familia'.
	stack push: 'papa'.
	
	finder := SentenceFinderByPrefix newWith: stack.
	
	^finder! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'GR 10/4/2020 17:56:20'!
test01ifPrefixExistsReturnCollectionOfWords
	
	| finder matches |
	
	finder := self setUp.
	matches := OrderedCollection with: 'hola familia' with: 'hola amigos'.
	
	self assert: (finder find: 'ho') = matches! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'GR 10/4/2020 17:48:31'!
test02searchingPrefixDoesnotModifyStack
	
	| finder sizeBeforeFind |
	
	finder := self setUp.
	sizeBeforeFind := finder stack size.
	
	finder find: 'ho'.
	self assert: finder stack size = sizeBeforeFind ! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'GR 10/4/2020 17:48:52'!
test03prefixIsNotEmptyString
	
	| finder |
	
	finder := self setUp.
	self 
		should: [ finder find: '' ]
		raise: Error
		withExceptionDo: [:anError | anError messageText = SentenceFinderByPrefix prefixCannotBeEmptyString ].! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'GR 10/4/2020 17:49:07'!
test04prefixHasNotSpaceChars
	
	| finder |
	
	finder := self setUp .
	self 
		should: [ finder find: '' ]
		raise: Error
		withExceptionDo: [:anError | anError messageText = SentenceFinderByPrefix prefixCannotHaveSpaceChars  ].! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'GR 10/4/2020 17:49:18'!
test05prefixIsSubStringButNotprefixOfAnyString
	
	| finder |
	
	finder := self setUp .
	
	self assert: (finder find: 'ami') = OrderedCollection new.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'GR 10/4/2020 18:06:43'!
test06prefixIsNotInTheStack
	
	| finder |
	
	finder := self setUp .
	
	self assert: (finder find: 'papadupoulos') = OrderedCollection new.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'GR 10/4/2020 15:07:31'!
initializeNew

	stack := OrderedCollection new.! !


!OOStack methodsFor: 'testing' stamp: 'GR 10/4/2020 15:09:29'!
isEmpty

	^stack isEmpty! !

!OOStack methodsFor: 'testing' stamp: 'GR 10/4/2020 15:17:30'!
size

	^stack size! !


!OOStack methodsFor: 'operations' stamp: 'GR 10/4/2020 15:37:20'!
pop

	stack isEmpty 
		ifFalse: [ ^stack removeFirst] 
		ifTrue: [ self error: OOStack stackEmptyErrorDescription ]! !

!OOStack methodsFor: 'operations' stamp: 'GR 10/4/2020 15:16:01'!
push: something

	stack addFirst: something! !

!OOStack methodsFor: 'operations' stamp: 'GR 10/4/2020 17:57:41'!
top
	
	stack isEmpty 
		ifFalse: [ ^stack first ] 
		ifTrue: [ self error: OOStack stackEmptyErrorDescription ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 10/1/2020 18:08:13'!
stackEmptyErrorDescription
	
	^ 'Stack is empty!!'! !


!OOStack class methodsFor: 'initialization' stamp: 'GR 10/4/2020 15:07:56'!
new
	
	^super new initializeNew! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'GR 10/4/2020 17:37:49'!
initializeStack: aStack

	stack := aStack.! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'GR 10/4/2020 17:52:14'!
find: aPrefix
	
	| stackCopy actual matches |
	
	matches := OrderedCollection new.
	
	aPrefix isEmpty ifTrue: [ self error: SentenceFinderByPrefix prefixCannotBeEmptyString ].
	(aPrefix allSatisfy: [:a | a ~~ ' ' ]) 
		ifFalse: [ self error: SentenceFinderByPrefix prefixCannotHaveSpaceChars ].
	
	"Aca queremos hacer una copia pero no funciona deepCopy (messageNotUnderstood)"
	stackCopy := stack.
	1 to: (stack size) do: [ :i |
		actual := stackCopy pop.
		(actual beginsWith: aPrefix) ifTrue: [matches add: actual] ].
	
	^matches! !


!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'GR 10/4/2020 17:00:38'!
stack

	^stack! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'instance creation' stamp: 'GR 10/4/2020 17:39:02'!
newWith: aStack

	^super new initializeStack: aStack! !


!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'GR 10/4/2020 16:51:53'!
prefixCannotBeEmptyString

	^'Prefix cannot be empty string!!'! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'GR 10/4/2020 16:52:18'!
prefixCannotHaveSpaceChars

	^'Prefix cannot have empty spaces!!'! !
