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

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'GR 10/7/2020 15:17:36'!
setUp
	
	| finder stack |
	
	stack := OOStack new.
	stack push: 'hola amigos'.
	stack push: 'Hola amigos'.
	stack push: 'chau familia'.
	stack push: 'hola familia'.
	stack push: 'papa'.
	
	finder := SentenceFinderByPrefix newWith: stack.
	
	^finder.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'GR 10/7/2020 15:35:30'!
test01ifPrefixExistsReturnCollectionOfWords
	
	| finder matches |
	
	finder := self setUp.
	matches := OrderedCollection with: 'hola familia' with: 'hola amigos'.
	
	self assert: (finder find: 'ho') = matches.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'GR 10/7/2020 16:25:15'!
test02searchingPrefixDoesNotModifyStack
	
	| sentenceFinderPostFind sentenceFinderPreviousFind |
	
	sentenceFinderPreviousFind := self setUp.
	sentenceFinderPostFind := self setUp.
	
	sentenceFinderPostFind find: 'ho'.
	self assert: (self assertThat: sentenceFinderPostFind getStack isEqualTo: sentenceFinderPreviousFind getStack).! !

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

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'GR 10/7/2020 15:11:24'!
test05prefixIsSubStringButNotPrefixOfAnyString
	
	| finder |
	
	finder := self setUp .
	
	self assert: (finder find: 'ami') = OrderedCollection new.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'GR 10/7/2020 15:16:59'!
test06prefixDoesNotMatchAnyStringInTheStack
	
	| finder |
	
	finder := self setUp .
	
	self assert: (finder find: 'papadupoulos') = OrderedCollection new.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'GR 10/7/2020 15:38:37'!
test07findAStringInEmptyStackReturnsNothing
	
	| finder |
	
	finder := SentenceFinderByPrefix newWith: OOStack new.
	
	self assert: (finder find: 'ho') = OrderedCollection new.! !


!SentenceFinderByPrefixTest methodsFor: 'private' stamp: 'GR 10/7/2020 16:28:48'!
assertThat: aSentenceStack isEqualTo: anotherSentenceStack

	1 to: (aSentenceStack size) do: [ :index |
		(aSentenceStack pop = anotherSentenceStack pop) ifFalse: [^false] ].
	
	^true.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'GR 10/7/2020 14:47:28'!
initializeNew

	| base |
	elements := OrderedCollection new.
	base := OOStackNullElement new.
	elements add: base! !


!OOStack methodsFor: 'testing' stamp: 'GR 10/5/2020 22:04:59'!
isEmpty

	^elements size = 1! !

!OOStack methodsFor: 'testing' stamp: 'GR 10/5/2020 22:04:49'!
size

	^elements size - 1! !


!OOStack methodsFor: 'operations' stamp: 'GR 10/5/2020 21:57:28'!
pop
	
	| topElement topElementValue |
	
	topElement := elements last.
	topElementValue := topElement getValue.
	elements removeLast.
	^topElementValue.! !

!OOStack methodsFor: 'operations' stamp: 'GR 10/7/2020 14:50:22'!
push: anElement

	elements addLast: (OOStackRealElement with: anElement)! !

!OOStack methodsFor: 'operations' stamp: 'GR 10/5/2020 22:01:04'!
top
	
	| topElement |
	
	topElement := elements last.
	^topElement getValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 10/1/2020 18:08:13'!
stackEmptyErrorDescription
	
	^ 'Stack is empty!!'! !


!OOStack class methodsFor: 'instance creation' stamp: 'GR 10/7/2020 15:53:55'!
new
	
	^self basicNew initializeNew.! !


!classDefinition: #OOStackElements category: 'Stack-Exercise'!
Object subclass: #OOStackElements
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackElements methodsFor: 'operations' stamp: 'GR 10/7/2020 14:45:13'!
getValue

	^self subclassResponsibility.! !


!OOStackElements methodsFor: 'as yet unclassified' stamp: 'GR 10/5/2020 22:04:13'!
initializeWith: something

	value := something! !


!classDefinition: #OOStackNullElement category: 'Stack-Exercise'!
OOStackElements subclass: #OOStackNullElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNullElement methodsFor: 'accessing' stamp: 'GR 10/7/2020 15:53:35'!
getValue
	
	self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #OOStackRealElement category: 'Stack-Exercise'!
OOStackElements subclass: #OOStackRealElement
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackRealElement methodsFor: 'accessing' stamp: 'GR 10/7/2020 14:55:45'!
getValue

	^value.! !


!OOStackRealElement methodsFor: 'initialization' stamp: 'GR 10/7/2020 14:55:20'!
initializeWith: aValue

	value := aValue .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackRealElement class' category: 'Stack-Exercise'!
OOStackRealElement class
	instanceVariableNames: ''!

!OOStackRealElement class methodsFor: 'instance creation' stamp: 'GR 10/7/2020 14:55:38'!
with: aValue

	^self new initializeWith: aValue .! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stringStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'GR 10/7/2020 16:17:51'!
initializeStack: aStack

	stringStack := aStack.! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'GR 10/7/2020 16:14:50'!
find: aPrefix
	
	self isValidPrefix: aPrefix.
	
	^self searchStringsWith: aPrefix.! !


!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'GR 10/7/2020 16:04:44'!
getStack

	^stringStack! !


!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'GR 10/7/2020 16:11:39'!
isValidPrefix: aPrefix

	aPrefix isEmpty ifTrue: [ self error: SentenceFinderByPrefix prefixCannotBeEmptyString ].
	
	(aPrefix includesSubString: ' ') ifTrue: [ self error: SentenceFinderByPrefix prefixCannotHaveSpaceChars ]! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'GR 10/7/2020 16:16:47'!
restoreStack: aStackRestorer

	1 to: (aStackRestorer size) do: [ :i |
		stringStack push: aStackRestorer pop. ]! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'GR 10/7/2020 16:16:41'!
searchStringsWith: aPrefix

	| actual stackRestorer matches|

	matches := OrderedCollection new.
	stackRestorer := OOStack new.

	1 to: (stringStack size) do: [ :index |
		actual := stringStack pop.
		(actual beginsWith: aPrefix) ifTrue: [matches add: actual]. 
		stackRestorer push: actual].

	self restoreStack: stackRestorer.
	
	^matches.
	! !

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
