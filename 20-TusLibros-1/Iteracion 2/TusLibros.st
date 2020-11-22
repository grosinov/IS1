!classDefinition: #CajeroTest category: 'TusLibros'!
TestCase subclass: #CajeroTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CajeroTest methodsFor: 'tests' stamp: 'GR 11/22/2020 16:53:37'!
test01CantCheckOutAnEmptyCart

	| cashier cart catalog creditCard |
	
	catalog := Catalogo with: (Dictionary with: #Libro1->10).
	
	cashier := Cajero new.
	
	cart := Carrito withCatalog: catalog.
	
	creditCard := TarjetaDeCredito number: 4659540000978462 withExpiration: August, 2021 withOwner: 'Matias Morales'.
	
	self
		should: [ cashier checkOutCart: cart withCreditCard: creditCard ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Cajero emptyCartError.! !

!CajeroTest methodsFor: 'tests' stamp: 'GR 11/22/2020 17:05:47'!
test02CanCheckOutCartWithOneElement

	| cashier cart catalog creditCard |
	
	catalog := Catalogo with: (Dictionary with: #Libro1->10).
	
	cashier := Cajero new.
	
	cart := Carrito withCatalog: catalog.
	
	cart addToCart: #Libro1 withAmount: 1.
	
	creditCard := TarjetaDeCredito number: 4659540000978462 withExpiration: August, 2021 withOwner: 'Matias Morales'.
	
	self assert: 10 equals: (cashier checkOutCart: cart withCreditCard: creditCard)! !

!CajeroTest methodsFor: 'tests' stamp: 'GR 11/22/2020 17:06:12'!
test03CanCheckOutCartWithMoreThanOneElement

	| cashier cart catalog creditCard |
	
	catalog := Catalogo with: (Dictionary with: #Libro1->10).
	
	cashier := Cajero new.
	
	cart := Carrito withCatalog: catalog.
	
	cart addToCart: #Libro1 withAmount: 3.
	
	creditCard := TarjetaDeCredito number: 4659540000978462 withExpiration: August, 2021 withOwner: 'Matias Morales'.
	
	self assert: 30 equals: (cashier checkOutCart: cart withCreditCard: creditCard)! !

!CajeroTest methodsFor: 'tests' stamp: 'GR 11/22/2020 17:38:00'!
test04CanNotCheckOutWithCardNumberThatHasNot16Digits

	| cashier cart catalog creditCard |
	
	catalog := Catalogo with: (Dictionary with: #Libro1->10).
	
	cashier := Cajero new.
	
	cart := Carrito withCatalog: catalog.
	
	cart addToCart: #Libro1 withAmount: 3.
	
	creditCard := TarjetaDeCredito number: 4 withExpiration: August, 2021 withOwner: 'Matias Morales'.
	
	self 
		should: [ cashier checkOutCart: cart withCreditCard: creditCard ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Cajero invalidCreditCard.
	
	
	
	! !

!CajeroTest methodsFor: 'tests' stamp: 'GR 11/22/2020 17:39:02'!
test05CanNotCheckOutWithNegativeCardNumber
	| cashier cart catalog creditCard |
	
	catalog := Catalogo with: (Dictionary with: #Libro1->10).
	
	cashier := Cajero new.
	
	cart := Carrito withCatalog: catalog.
	
	cart addToCart: #Libro1 withAmount: 3.
	
	creditCard := TarjetaDeCredito number: -4659540000978462 withExpiration: August, 2021 withOwner: 'Matias Morales'.
	
	self 
		should: [ cashier checkOutCart: cart withCreditCard: creditCard ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Cajero invalidCreditCard.
	
	
	
	! !

!CajeroTest methodsFor: 'tests' stamp: 'GR 11/22/2020 18:04:18'!
test06CanNotCheckOutWithExpiredCreditCard
	| cashier cart catalog creditCard |
	
	catalog := Catalogo with: (Dictionary with: #Libro1->10).
	
	cashier := Cajero new.
	
	cart := Carrito withCatalog: catalog.
	
	cart addToCart: #Libro1 withAmount: 3.
	
	creditCard := TarjetaDeCredito number: 4659540000978462 withExpiration: August, 2012 withOwner: 'Matias Morales'.
	
	self 
		should: [ cashier checkOutCart: cart withCreditCard: creditCard ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Cajero invalidCreditCard.
	
	
	
	! !

!CajeroTest methodsFor: 'tests' stamp: 'GR 11/22/2020 17:39:21'!
test08CanNotCheckOutACreditCardWithNoOwner
	| cashier cart catalog creditCard |
	
	catalog := Catalogo with: (Dictionary with: #Libro1->10).
	
	cashier := Cajero new.
	
	cart := Carrito withCatalog: catalog.
	
	cart addToCart: #Libro1 withAmount: 3.
	
	creditCard := TarjetaDeCredito number: 4659540000978462 withExpiration: August, 2021 withOwner: ''.
	
	self 
		should: [ cashier checkOutCart: cart withCreditCard: creditCard ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Cajero invalidCreditCard.
	
	
	
	! !

!CajeroTest methodsFor: 'tests' stamp: 'GR 11/22/2020 18:24:54'!
test09CheckoutPaymentHasNoMoreThanTwoDecimals
	| cashier cart catalog creditCard |
	
	catalog := Catalogo with: (Dictionary with: #Libro1->10.563).
	
	cashier := Cajero new.
	
	cart := Carrito withCatalog: catalog.
	
	cart addToCart: #Libro1 withAmount: 1.
	
	creditCard := TarjetaDeCredito number: 4659540000978462 withExpiration: August, 2021 withOwner: 'Matias Morales'.
	
	self assert: 10.56 equals: (cashier checkOutCart: cart withCreditCard: creditCard)
	
	
	
	! !

!CajeroTest methodsFor: 'tests' stamp: 'GR 11/22/2020 18:34:33'!
test10CanNotBuyForAPriceOfMoreThan15Digits
	| cashier cart catalog creditCard |
	
	catalog := Catalogo with: (Dictionary with: #Libro1->100000).
	
	cashier := Cajero new.
	
	cart := Carrito withCatalog: catalog.
	
	cart addToCart: #Libro1 withAmount: 100000000000.
	
	creditCard := TarjetaDeCredito number: 4659540000978462 withExpiration: August, 2021 withOwner: 'Matias Morales'.
	
	self
		should: [ cashier checkOutCart: cart withCreditCard: creditCard ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Cajero priceOutOfBound
	
	
	
	! !


!classDefinition: #CarritoTest category: 'TusLibros'!
TestCase subclass: #CarritoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CarritoTest methodsFor: 'tests' stamp: 'GR 11/18/2020 14:42:36'!
test01CanCreateNewCartWithNoProducts

	| carrito |
	
	carrito := Carrito withCatalog: (OrderedCollection with: #Libro1).
	
	self assert: 0 equals: carrito productAmount.! !

!CarritoTest methodsFor: 'tests' stamp: 'GR 11/18/2020 14:42:31'!
test02CanAddAProductToCart

	| carrito |
	
	carrito := Carrito withCatalog: (OrderedCollection with: #Libro1).
	
	carrito addToCart: #Libro1 withAmount: 1.
	
	self assert: 1 equals: carrito productAmount.
	self assert: (carrito products includes: #Libro1)! !

!CarritoTest methodsFor: 'tests' stamp: 'GR 11/18/2020 14:42:28'!
test03CanAddAProductToCartMultipleTimes

	| carrito |
	
	carrito := Carrito withCatalog: (OrderedCollection with: #Libro1).
	
	carrito addToCart: #Libro1 withAmount: 3.
	
	self assert: 3 equals: carrito productAmount.
	self assert: 3 equals: (carrito products occurrencesOf: #Libro1)! !

!CarritoTest methodsFor: 'tests' stamp: 'GR 11/18/2020 14:42:24'!
test04AddAProductThatIsAlreadyInTheCart

	| carrito |
	
	carrito := Carrito withCatalog: (OrderedCollection with: #Libro1).
	
	carrito addToCart: #Libro1 withAmount: 3.
	carrito addToCart: #Libro1 withAmount: 1.
	
	self assert: 4 equals: carrito productAmount.
	self assert: 4 equals: (carrito products occurrencesOf: #Libro1)! !

!CarritoTest methodsFor: 'tests' stamp: 'GR 11/18/2020 14:39:36'!
test05CanNotAddABookThatIsNotInTheCatalog

	| carrito |
	
	carrito := Carrito withCatalog: (OrderedCollection with: #Libro1).
	
	carrito addToCart: #Libro1 withAmount: 3.
	
	self
		should: [ carrito addToCart: #Libro2 withAmount: 1. ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Carrito productNotInTheCatalog = anError messageText.
			self assert: 3 equals: carrito productAmount.
			self assert: 0 equals: (carrito products occurrencesOf: #Libro2) ].
	
	
	! !

!CarritoTest methodsFor: 'tests' stamp: 'GR 11/18/2020 15:38:52'!
test06EmptyCartListsNoItems

	| carrito |
	
	carrito := Carrito withCatalog: (OrderedCollection with: #Libro1).
	
	self assert: Dictionary new equals: carrito listCart
	
	
	! !

!CarritoTest methodsFor: 'tests' stamp: 'GR 11/18/2020 15:52:57'!
test07CartCanListEveryProductInIt

	| carrito list |
	
	carrito := Carrito withCatalog: (OrderedCollection with: #Libro1).
	
	carrito addToCart: #Libro1 withAmount: 3.
	
	list := Dictionary with: #Libro1->3.
	
	self assert: list equals: carrito listCart
	
	
	! !

!CarritoTest methodsFor: 'tests' stamp: 'GR 11/19/2020 17:10:20'!
test08CanNotAddNegativeAmountOfProducts

	| carrito |
	
	carrito := Carrito withCatalog: (OrderedCollection with: #Libro1).
	
	self 
		should: [ carrito addToCart: #Libro1 withAmount: -2. ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Carrito invalidAmountOfProductsError 
	
	
	! !

!CarritoTest methodsFor: 'tests' stamp: 'GR 11/19/2020 17:13:33'!
test09CanNotAddCeroAmountOfProducts

	| carrito |
	
	carrito := Carrito withCatalog: (OrderedCollection with: #Libro1).
	
	self 
		should: [ carrito addToCart: #Libro1 withAmount: 0. ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Carrito invalidAmountOfProductsError.
	
	
	! !

!CarritoTest methodsFor: 'tests' stamp: 'GR 11/19/2020 19:04:39'!
test10CanNotAddNonIntegerAmountOfProducts

	| carrito |
	
	carrito := Carrito withCatalog: (OrderedCollection with: #Libro1).
	
	self 
		should: [ carrito addToCart: #Libro1 withAmount: 1.5. ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Carrito invalidAmountOfProductsError.! !


!classDefinition: #CatalogoTest category: 'TusLibros'!
TestCase subclass: #CatalogoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CatalogoTest methodsFor: 'tests' stamp: 'GR 11/19/2020 20:25:03'!
test01CanNotCreateACatalogWithInvalidPriceOfAnyProduct

	self 
		should: [ Catalogo with: (Dictionary with: #Libro1->-1) ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Catalogo invalidProductPrice
	! !


!classDefinition: #Cajero category: 'TusLibros'!
Object subclass: #Cajero
	instanceVariableNames: 'catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cajero methodsFor: 'operations' stamp: 'GR 11/22/2020 18:37:17'!
checkOutCart: aCarrito withCreditCard: aCreditCard  
	
	| totalPayment |
	
	self validateCart: aCarrito.
	
	self validateCreditCard: aCreditCard.
	
	totalPayment := 
		aCarrito listCart keys 
			inject: 0 
			into: [ :total :aProduct | 
				total + (self valueOf: aProduct in: aCarrito) ].
	
	(totalPayment < 1000000000000000) ifFalse: [ self error: self class priceOutOfBound ].
	
	^ self twoDecimalsTrimed: totalPayment.! !

!Cajero methodsFor: 'operations' stamp: 'GR 11/22/2020 17:19:11'!
validateCart: aCarrito

	^ (aCarrito isEmpty) ifTrue: [ self error: self class emptyCartError ]! !

!Cajero methodsFor: 'operations' stamp: 'GR 11/22/2020 17:47:43'!
validateCreditCard: aCreditCard

	((aCreditCard number numberOfDigitsInBase: 10) = 16 and: aCreditCard number >= 0) ifFalse: [ self error: self class invalidCreditCard ].
	
	(aCreditCard expirationDate < FixedGregorianDate today monthOfYear ) ifTrue: [ self error: self class invalidCreditCard ].
	
	(aCreditCard owner = '' ) ifTrue: [ self error: self class invalidCreditCard ]! !


!Cajero methodsFor: 'private -- operations' stamp: 'GR 11/22/2020 18:28:15'!
twoDecimalsTrimed: aTotalPayment
	
	^ (aTotalPayment *100) truncated /100 asFloat! !

!Cajero methodsFor: 'private -- operations' stamp: 'GR 11/19/2020 20:37:12'!
valueOf: aProduct in: aCarrito

	^ (aCarrito catalog priceOf: aProduct)* aCarrito listCart at: aProduct! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cajero class' category: 'TusLibros'!
Cajero class
	instanceVariableNames: ''!

!Cajero class methodsFor: 'error handling' stamp: 'GR 11/19/2020 19:19:43'!
emptyCartError
	
	^ 'You can not checkout an empty cart'! !

!Cajero class methodsFor: 'error handling' stamp: 'GR 11/22/2020 17:09:49'!
invalidCreditCard
	
	^ 'Your credit card is invalid'! !

!Cajero class methodsFor: 'error handling' stamp: 'GR 11/22/2020 18:35:36'!
priceOutOfBound
	
	^ 'You can not buy for that amount!!'! !


!classDefinition: #Carrito category: 'TusLibros'!
Object subclass: #Carrito
	instanceVariableNames: 'products catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Carrito methodsFor: 'accessing' stamp: 'GR 11/19/2020 19:41:59'!
catalog
	
	^catalog! !

!Carrito methodsFor: 'accessing' stamp: 'GR 11/18/2020 16:07:04'!
listCart
	
	^ products contents! !

!Carrito methodsFor: 'accessing' stamp: 'GR 11/16/2020 19:43:44'!
productAmount
	
	^ products size.! !

!Carrito methodsFor: 'accessing' stamp: 'GR 11/16/2020 19:08:32'!
products
	
	^products! !


!Carrito methodsFor: 'initialization' stamp: 'GR 11/18/2020 14:40:31'!
initializeWithCatalog: aCatalog 
	
	products := Bag new.
	catalog := aCatalog.! !


!Carrito methodsFor: 'operations' stamp: 'GR 11/19/2020 19:05:58'!
addToCart: aProduct withAmount: aProductAmount 
	
	self validateAmount: aProductAmount.
	
	self validateProduct: aProduct.
	
	products add: aProduct withOccurrences: aProductAmount.
	
	! !


!Carrito methodsFor: 'testing' stamp: 'GR 11/19/2020 19:23:00'!
isEmpty
	
	^ products isEmpty.! !

!Carrito methodsFor: 'testing' stamp: 'GR 11/19/2020 19:05:32'!
validateAmount: aProductAmount

	(aProductAmount <= 0) ifTrue: [ self error: self class invalidAmountOfProductsError ].
	
	(aProductAmount isInteger ) ifFalse: [ self error: self class invalidAmountOfProductsError ]! !

!Carrito methodsFor: 'testing' stamp: 'GR 11/19/2020 20:07:15'!
validateProduct: aProduct

	^ (catalog includes: aProduct) ifFalse: [self error: self class productNotInTheCatalog ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Carrito class' category: 'TusLibros'!
Carrito class
	instanceVariableNames: ''!

!Carrito class methodsFor: 'instance creation' stamp: 'GR 11/18/2020 14:40:01'!
withCatalog: aCatalog 
	
	^self new initializeWithCatalog: aCatalog ! !


!Carrito class methodsFor: 'error handling' stamp: 'GR 11/19/2020 17:14:17'!
invalidAmountOfProductsError
	
	^ 'You are adding an invalid amount of products to the cart'! !

!Carrito class methodsFor: 'error handling' stamp: 'GR 11/18/2020 14:41:59'!
productNotInTheCatalog
	
	^ 'The book is not in the catalog'! !


!classDefinition: #Catalogo category: 'TusLibros'!
Object subclass: #Catalogo
	instanceVariableNames: 'items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Catalogo methodsFor: 'initialization' stamp: 'GR 11/19/2020 20:08:28'!
initializeWith: aDictionary 
	
	items := aDictionary.! !


!Catalogo methodsFor: 'accessing' stamp: 'GR 11/19/2020 20:08:00'!
includes: aProduct

	^ items includesKey: aProduct 
	! !

!Catalogo methodsFor: 'accessing' stamp: 'GR 11/19/2020 20:10:55'!
priceOf: aProduct

	^ items at: aProduct.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Catalogo class' category: 'TusLibros'!
Catalogo class
	instanceVariableNames: ''!

!Catalogo class methodsFor: 'instance creation' stamp: 'GR 11/19/2020 20:05:38'!
with: aDictionary 
	
	aDictionary do: [ :aValue | (aValue <= 0) ifTrue: [ self error: self invalidProductPrice ] ].
	
	^self new initializeWith: aDictionary ! !


!Catalogo class methodsFor: 'error handling' stamp: 'GR 11/19/2020 20:25:49'!
invalidProductPrice
	
	^ 'You are adding products with invalid prices'! !


!classDefinition: #TarjetaDeCredito category: 'TusLibros'!
Object subclass: #TarjetaDeCredito
	instanceVariableNames: 'number expiration owner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TarjetaDeCredito methodsFor: 'initialization' stamp: 'GR 11/22/2020 16:53:06'!
initializeNumber: aCreditCardNumber withExpiration: anExpirationDate withOwner: aName 
	
	number := aCreditCardNumber.
	expiration := anExpirationDate.
	owner := aName.! !


!TarjetaDeCredito methodsFor: 'accessing' stamp: 'GR 11/22/2020 17:15:10'!
expirationDate
	
	^ expiration ! !

!TarjetaDeCredito methodsFor: 'accessing' stamp: 'GR 11/22/2020 17:13:10'!
number
	
	^number! !

!TarjetaDeCredito methodsFor: 'accessing' stamp: 'GR 11/22/2020 17:18:19'!
owner
	
	^owner! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TarjetaDeCredito class' category: 'TusLibros'!
TarjetaDeCredito class
	instanceVariableNames: ''!

!TarjetaDeCredito class methodsFor: 'instance creation' stamp: 'GR 11/22/2020 16:51:35'!
number: aSmallInteger withExpiration: aPoint withOwner: aString 
	
	^self new initializeNumber: aSmallInteger withExpiration: aPoint withOwner: aString ! !
