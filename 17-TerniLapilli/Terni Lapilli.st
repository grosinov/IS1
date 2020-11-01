!classDefinition: #TerniLapilliTest category: 'Terni Lapilli'!
TestCase subclass: #TerniLapilliTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/31/2020 17:14:51'!
test01GameStartsWithXTurn

	| juego |

	juego := TerniLapilli new.
	
	self assert: (juego isPlaying: juego playerX).
	self assert: juego isEmpty.! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/31/2020 17:16:03'!
test02AfterXPlaysIsOTurn

	| juego |
	
	juego := TerniLapilli new.
	
	juego putXAt: (0@0).
	
	self assert: (juego isPlaying: juego playerO).
	self deny: (juego isPlaying: juego playerX).
	self assert: (juego isOccupied: (0@0))! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/31/2020 17:23:48'!
test03AfterOPlaysIsXTurn

	| juego |
	
	juego := TerniLapilli new.
	
	juego putXAt: (0@0).
	juego putOAt: (0@1).
	
	self assert: (juego isPlaying: juego playerX).
	self deny: (juego isPlaying: juego playerO).
	self assert: (juego isOccupied: (0@1))! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/29/2020 19:31:09'!
test04XCanNotPlayInOTurn

	| juego |
	
	juego := TerniLapilli new.
	
	juego putXAt: (0@0).
	
	self 
		should: [ juego putXAt: (0@1). ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: (TerniLapilli canNotPlayInOthersTurn = anError messageText)
			]! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/29/2020 19:30:42'!
test05OCanNotPlayInXTurn

	| juego |
	
	juego := TerniLapilli new.
	
	self 
		should: [ juego putOAt: (1@1) ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: (TerniLapilli canNotPlayInOthersTurn = anError messageText)
			]! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/29/2020 19:29:04'!
test06XCanNotPlacePieceOutsideTheBoard

	| juego |
	
	juego := TerniLapilli new.
		
	self 
		should: [ juego putXAt: (4@0) ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: (TerniLapilli canNotPlacePieceInInvalidPosition = anError messageText)
			]! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/29/2020 19:28:42'!
test07OCanNotPlacePieceOutsideTheBoard

	| juego |
	
	juego := TerniLapilli new.
	
	juego putXAt: (0@0).
	
	self 
		should: [ juego putOAt: (4@0) ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: (TerniLapilli canNotPlacePieceInInvalidPosition = anError messageText)
			]! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/29/2020 20:09:51'!
test08CanNotPlacePieceOnOccupiedPosition

	| juego |
	
	juego := TerniLapilli new.
	
	juego putXAt: (0@0).
	juego putOAt: (0@1).
	
	self 
		should: [ juego putXAt: (0@0) ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: (TerniLapilli canNotPlacePieceInInvalidPosition = anError messageText)
			]! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/29/2020 20:12:27'!
test09EachPlayerCanNotPlaceMoreThanThreePieces

	| juego |
	
	juego := TerniLapilli new.
	
	juego putXAt: (0@0).
	juego putOAt: (0@1).
	juego putXAt: (0@-1).
	juego putOAt: (1@1).
	juego putXAt: (-1@1).
	juego putOAt: (1@0).
	
	self 
		should: [ juego putXAt: (1@-1) ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: (TerniLapilli canNotPlaceMoreThanThreePieces = anError messageText)
			]! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/31/2020 17:24:29'!
test10PlayerCanNotMoveMoreThanOnePosition
	
	| juego |
	
	juego := TerniLapilli new.
	
	juego putXAt: (0@0).
	juego putOAt: (-1@-1).
	juego putXAt: (0@-1).
	juego putOAt: (1@1).
	juego putXAt: (-1@1).
	juego putOAt: (1@0).
	
	self 
		should: [ juego playerXMovesFrom: (0@-1) to: (0@1). ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: (TerniLapilli canNotDoAnInvalidMove = anError messageText)
			]
	
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/31/2020 17:24:36'!
test11PlayerCanNotMoveAPieceOutsideTheBoard
	
	| juego |
	
	juego := TerniLapilli new.
	
	juego putXAt: (0@0).
	juego putOAt: (0@1).
	juego putXAt: (0@-1).
	juego putOAt: (1@1).
	juego putXAt: (-1@1).
	juego putOAt: (1@0).
	
	self 
		should: [ juego playerXMovesFrom: (0@0) to: (0@4). ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: (TerniLapilli canNotDoAnInvalidMove = anError messageText)
			]
	
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/31/2020 17:24:42'!
test12PlayerCanNotMoveAPieceThatIsNotOnTheBoard
	
	| juego |
	
	juego := TerniLapilli new.
	
	juego putXAt: (0@0).
	juego putOAt: (0@1).
	juego putXAt: (0@-1).
	juego putOAt: (1@1).
	juego putXAt: (-1@1).
	juego putOAt: (1@0).
	
	self 
		should: [ juego playerXMovesFrom: (-1@0) to: (-1@-1). ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: (TerniLapilli canNotDoAnInvalidMove = anError messageText)
			]
	
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/31/2020 17:24:46'!
test13PlayerCanNotMoveAPieceToAnOccupiedPosition
	
	| juego |
	
	juego := TerniLapilli new.
	
	juego putXAt: (0@0).
	juego putOAt: (0@1).
	juego putXAt: (0@-1).
	juego putOAt: (1@1).
	juego putXAt: (-1@1).
	juego putOAt: (1@0).
	
	self 
		should: [ juego playerXMovesFrom: (0@0) to: (0@-1). ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: (TerniLapilli canNotDoAnInvalidMove = anError messageText)
			]
	
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/31/2020 17:24:55'!
test14PlayerCanNotDoADiagonalMoveIfItIsNotFromCenterOrCorner
	
	| juego |
	
	juego := TerniLapilli new.
	
	juego putXAt: (0@0).
	juego putOAt: (0@-1).
	juego putXAt: (0@1).
	juego putOAt: (1@1).
	juego putXAt: (-1@1).
	juego putOAt: (-1@-1).
	
	self 
		should: [ juego playerXMovesFrom: (0@1) to: (-1@0). ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: (TerniLapilli canNotDoAnInvalidMove = anError messageText)
			]
	
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/31/2020 17:29:12'!
test15PlayerCanMoveFromCenterToAnyEmptyPosition
	
	| juego |
	
	juego := TerniLapilli new.
	
	juego putXAt: (0@0).
	juego putOAt: (0@-1).
	juego putXAt: (0@1).
	juego putOAt: (1@1).
	juego putXAt: (-1@1).
	juego putOAt: (-1@-1).
	
	juego playerXMovesFrom: (0@0) to: (-1@0).
	
	self assert: (juego isOccupied: (-1@0)).
	self assert: (juego isPlaying: juego playerO)
	
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/31/2020 17:35:33'!
test16PlayerCanMoveFromAnywhereToAdjacentPosition
	
	| juego |
	
	juego := TerniLapilli new.
	
	juego putXAt: (0@0).
	juego putOAt: (0@-1).
	juego putXAt: (0@1).
	juego putOAt: (1@1).
	juego putXAt: (-1@1).
	juego putOAt: (-1@-1).
	
	juego playerXMovesFrom: (0@0) to: (-1@0).
	juego playerOMovesFrom: (1@1) to: (1@0).
	
	self assert: (juego isOccupied: (1@0)).
	self assert: (juego isPlaying: juego playerX)
	
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/31/2020 18:13:15'!
test17PlayerXWinsVertically
	
	| juego |
	
	juego := TerniLapilli new.
	
	juego putXAt: (0@0).
	juego putOAt: (1@-1).
	juego putXAt: (0@1).
	juego putOAt: (1@1).
	juego putXAt: (0@-1).
	
	self assert: (juego hasPlayerXWon).
	self assert: (juego isOver)
	
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/31/2020 18:16:05'!
test18PlayerOWinsVertically
	
	| juego |
	
	juego := TerniLapilli new.
	
	juego putXAt: (1@-1).
	juego putOAt: (0@0).
	juego putXAt: (1@1).
	juego putOAt: (0@1).
	juego putXAt: (-1@-1).
	juego putOAt: (0@-1).
	
	self assert: (juego hasPlayerOWon).
	self assert: (juego isOver)
	
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/31/2020 18:29:17'!
test19PlayerXWinsHorizontally
	
	| juego |
	
	juego := TerniLapilli new.
	
	juego putXAt: (0@0).
	juego putOAt: (1@-1).
	juego putXAt: (1@0).
	juego putOAt: (1@1).
	juego putXAt: (-1@0).
	
	self assert: (juego hasPlayerXWon).
	self assert: (juego isOver)
	
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/31/2020 18:48:22'!
test20PlayerWinsDiagonally
	
	| juego |
	
	juego := TerniLapilli new.
	
	juego putXAt: (0@0).
	juego putOAt: (1@-1).
	juego putXAt: (-1@-1).
	juego putOAt: (1@0).
	juego putXAt: (1@1).
	
	self assert: (juego hasPlayerXWon).
	self assert: (juego isOver)
	
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/31/2020 19:28:11'!
test21PlayerCanWinWithAMovement
	
	| juego |
	
	juego := TerniLapilli new.
	
	juego putXAt: (0@0).
	juego putOAt: (1@0).
	juego putXAt: (0@1).
	juego putOAt: (-1@1).
	juego putXAt: (1@-1).
	juego putOAt: (-1@-1).
	
	juego playerXMovesFrom: (1@-1) to: (0@-1).
	
	self assert: (juego hasPlayerXWon).
	self assert: (juego isOver)
	
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/31/2020 20:15:20'!
test22PlayerCanNotPlaceAPieceIfGameIsOver
	
	| juego |
	
	juego := TerniLapilli new.
	
	juego putXAt: (0@0).
	juego putOAt: (1@-1).
	juego putXAt: (0@1).
	juego putOAt: (1@1).
	juego putXAt: (0@-1).
	
	self assert: (juego hasPlayerXWon).
	self assert: (juego isOver).
	self
		should: [ juego putOAt: (1@0) ]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: TerniLapilli canNotPlayIfGameIsOver = anError messageText ]
	
	! !

!TerniLapilliTest methodsFor: 'testing' stamp: 'GR 10/31/2020 20:45:29'!
test23PlayerCanNotMoveAPieceIfGameIsOver
	
	| juego |
	
	juego := TerniLapilli new.
	
	juego putXAt: (-1@1).
	juego putOAt: (0@0).
	juego putXAt: (1@1).
	juego putOAt: (0@1).
	juego putXAt: (1@-1).
	juego putOAt: (0@-1).
	
	self
		should: [ juego playerXMovesFrom: (-1@1) to: (-1@0) ]
		raise: Error
		withExceptionDo: [:anError | 
			self assert: TerniLapilli canNotPlayIfGameIsOver = anError messageText ]
	
	! !


!classDefinition: #Player category: 'Terni Lapilli'!
Object subclass: #Player
	instanceVariableNames: 'terniLapilli'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!Player methodsFor: 'initialization' stamp: 'GR 10/31/2020 19:07:45'!
initializeNewIn: aTerniLapilli
	
	terniLapilli := aTerniLapilli.! !



!Player methodsFor: 'actions' stamp: 'GR 10/31/2020 19:06:32'!
movesThePieceIn: aPosition to: anotherPosition

	self subclassResponsibility.! !

!Player methodsFor: 'actions' stamp: 'GR 10/31/2020 17:01:34'!
placesAPieceIn: aPosition
	
	self subclassResponsibility.! !



"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Player class' category: 'Terni Lapilli'!
Player class
	instanceVariableNames: ''!

!Player class methodsFor: 'as yet unclassified' stamp: 'GR 10/31/2020 16:28:06'!
newIn: aTerniLapilli

	^self new initializeNewIn: aTerniLapilli! !


!classDefinition: #PlayerO category: 'Terni Lapilli'!
Player subclass: #PlayerO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!PlayerO methodsFor: 'actions' stamp: 'GR 10/31/2020 19:05:07'!
movesThePieceIn: aPosition to: anotherPosition
	
	terniLapilli playerOmovesThePieceIn: aPosition to: anotherPosition.! !

!PlayerO methodsFor: 'actions' stamp: 'GR 10/31/2020 19:05:37'!
placesAPieceIn: aPosition

	terniLapilli playerOPlacesAPieceIn: aPosition.! !


!classDefinition: #PlayerX category: 'Terni Lapilli'!
Player subclass: #PlayerX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!PlayerX methodsFor: 'actions' stamp: 'GR 10/31/2020 19:06:17'!
movesThePieceIn: aPosition to: anotherPosition
	
	terniLapilli playerXmovesThePieceIn: aPosition to: anotherPosition! !

!PlayerX methodsFor: 'actions' stamp: 'GR 10/31/2020 19:00:45'!
placesAPieceIn: aPosition

	terniLapilli playerXPlacesAPieceIn: aPosition.! !


!classDefinition: #TerniLapilli category: 'Terni Lapilli'!
Object subclass: #TerniLapilli
	instanceVariableNames: 'turn playerX playerO occupiedXPositions occupiedOPositions isOver'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Terni Lapilli'!

!TerniLapilli methodsFor: 'initialization' stamp: 'GR 10/31/2020 19:45:02'!
initialize

	playerX  := PlayerX newIn: self.
	playerO  := PlayerO newIn: self.
	occupiedXPositions  := Set new.
	occupiedOPositions  := Set new.
	isOver := false.
	turn := playerX.! !


!TerniLapilli methodsFor: 'operations' stamp: 'GR 10/31/2020 18:59:33'!
playerOMovesFrom: aPosition to: anotherPosition
	
	playerO movesThePieceIn: aPosition to: anotherPosition.! !

!TerniLapilli methodsFor: 'operations' stamp: 'GR 10/31/2020 18:58:25'!
playerXMovesFrom: aPosition to: anotherPosition
	
	playerX movesThePieceIn: aPosition to: anotherPosition.! !

!TerniLapilli methodsFor: 'operations' stamp: 'GR 10/31/2020 18:59:53'!
putOAt: aPosition
	
	playerO placesAPieceIn: aPosition! !

!TerniLapilli methodsFor: 'operations' stamp: 'GR 10/31/2020 19:00:06'!
putXAt: aPosition
	
	playerX placesAPieceIn: aPosition.! !


!TerniLapilli methodsFor: 'testing' stamp: 'GR 10/31/2020 20:40:09'!
hasPlayerOWon
	
	| anOccupiedPosition |
	
	(occupiedOPositions size < 3) ifTrue: [ ^false ].
	
	anOccupiedPosition := occupiedOPositions detect: [ :aPosition | true].
	
	^ (occupiedOPositions allSatisfy: [ :aPosition | (anOccupiedPosition x = aPosition x)])  or:
		(occupiedOPositions allSatisfy: [ :aPosition | (anOccupiedPosition y = aPosition y)]) or:
		(self winsDiagonally: occupiedOPositions)! !

!TerniLapilli methodsFor: 'testing' stamp: 'GR 10/31/2020 20:40:40'!
hasPlayerXWon
	
	| anOccupiedPosition |
	
	(occupiedXPositions size < 3) ifTrue: [ ^false ].
	
	anOccupiedPosition := occupiedXPositions detect: [ :aPosition | true].
	
	^ (occupiedXPositions allSatisfy: [ :aPosition | (anOccupiedPosition x = aPosition x)])  or:
		(occupiedXPositions allSatisfy: [ :aPosition | (anOccupiedPosition y = aPosition y)]) or:
		(self winsDiagonally: occupiedXPositions).! !

!TerniLapilli methodsFor: 'testing' stamp: 'GR 10/31/2020 16:24:26'!
isAValidPosition: aPosition

	^(self isInTheBoard: aPosition) and: (self isOccupied: aPosition) not! !

!TerniLapilli methodsFor: 'testing' stamp: 'GR 10/31/2020 19:16:06'!
isEmpty
	
	^ occupiedXPositions isEmpty.! !

!TerniLapilli methodsFor: 'testing' stamp: 'GR 10/31/2020 19:16:33'!
isOccupied: aPosition 
	
	^(occupiedXPositions includes: aPosition) or: (occupiedOPositions includes: aPosition)! !

!TerniLapilli methodsFor: 'testing' stamp: 'GR 10/31/2020 19:44:33'!
isOver
	
	^ isOver! !

!TerniLapilli methodsFor: 'testing' stamp: 'GR 10/29/2020 19:58:25'!
isPlaying: aPlayer

	^ turn = aPlayer
	
	! !

!TerniLapilli methodsFor: 'testing' stamp: 'GR 10/31/2020 16:00:15'!
isValidMoveFrom: aPosition to: anotherPosition
	
	(self isAValidPosition: anotherPosition) ifFalse: [ ^false ].
	
	(self isOccupied: aPosition) ifFalse: [ ^false ].
	
	(aPosition = (0@0)) ifTrue: [ ^ true ].
	
	(self distanceIsGreaterThanOnePositionGoingFrom: aPosition to: anotherPosition) ifTrue: [ ^false ].
	
	(self doesADiagonalMoveGoingFrom: anotherPosition to: aPosition) ifTrue: [ ^false ].
	
	^true
	
	
	
	! !

!TerniLapilli methodsFor: 'testing' stamp: 'GR 10/31/2020 16:43:47'!
thePlayer: aPlayer canPlaceAPieceIn: aPosition

	(self totalPiecesPlayed = 6) ifTrue: [self error: TerniLapilli canNotPlaceMoreThanThreePieces].
	
	(self isPlaying: aPlayer) ifFalse: [ self error: TerniLapilli canNotPlayInOthersTurn ].
	
	(self isAValidPosition: aPosition) ifFalse: [ self error: TerniLapilli canNotPlacePieceInInvalidPosition ].! !

!TerniLapilli methodsFor: 'testing' stamp: 'GR 10/31/2020 19:17:52'!
totalPiecesPlayed
	
	^ occupiedXPositions size + occupiedOPositions size.! !


!TerniLapilli methodsFor: 'private' stamp: 'GR 10/31/2020 15:18:48'!
distanceIsGreaterThanOnePositionGoingFrom: aPosition to: anotherPosition

	^((aPosition - anotherPosition) abs <= (1@1)) not! !

!TerniLapilli methodsFor: 'private' stamp: 'GR 10/31/2020 16:08:36'!
doesADiagonalMoveGoingFrom: aPosition to: anotherPosition

	^ aPosition x ~= anotherPosition x and: (aPosition y ~= anotherPosition y)! !

!TerniLapilli methodsFor: 'private' stamp: 'GR 10/31/2020 16:24:54'!
isInTheBoard: aPosition

	^ ((0@0) eightNeighbors includes: aPosition) or: aPosition = (0@0)! !

!TerniLapilli methodsFor: 'private' stamp: 'GR 10/31/2020 20:43:45'!
playerOPlacesAPieceIn: aPosition 
	
	(self isOver) ifTrue: [ self error: TerniLapilli canNotPlayIfGameIsOver ].
	
	self thePlayer: playerO canPlaceAPieceIn: aPosition.
	
	occupiedOPositions add: aPosition.
	
	turn := playerX.
	
	self seeIfPlayerOhasAWinningCondition .! !

!TerniLapilli methodsFor: 'private' stamp: 'GR 10/31/2020 20:56:07'!
playerOmovesThePieceIn: aPosition to: anotherPosition

	(self isOver) ifTrue: [ self error: TerniLapilli canNotPlayIfGameIsOver ].
	
	(self isValidMoveFrom: aPosition to: anotherPosition) ifFalse: [ self error: TerniLapilli canNotDoAnInvalidMove ].
	
	occupiedOPositions remove: aPosition ifAbsent: [self error: TerniLapilli canNotDoAnInvalidMove].
	
	occupiedOPositions add: anotherPosition.
	
	turn := playerX.
	
	self seeIfPlayerOhasAWinningCondition .! !

!TerniLapilli methodsFor: 'private' stamp: 'GR 10/31/2020 20:43:56'!
playerXPlacesAPieceIn: aPosition 

	(self isOver) ifTrue: [ self error: TerniLapilli canNotPlayIfGameIsOver ].
	
	self thePlayer: playerX canPlaceAPieceIn: aPosition.
	
	occupiedXPositions add: aPosition.
	
	turn := playerO.
	
	self seeIfPlayerXhasAWinningCondition .! !

!TerniLapilli methodsFor: 'private' stamp: 'GR 10/31/2020 20:47:17'!
playerXmovesThePieceIn: aPosition to: anotherPosition
	
	( self isOver ) ifTrue: [ self error: TerniLapilli canNotPlayIfGameIsOver ].
	
	(self isValidMoveFrom: aPosition to: anotherPosition) ifFalse: [ self error: TerniLapilli canNotDoAnInvalidMove ].
	
	occupiedXPositions remove: aPosition ifAbsent: [self error: TerniLapilli canNotDoAnInvalidMove].
	
	occupiedXPositions add: anotherPosition.
	
	turn := playerO.
	
	self seeIfPlayerXhasAWinningCondition .! !


!TerniLapilli methodsFor: 'accessing' stamp: 'GR 10/31/2020 17:23:24'!
playerO
	
	^playerO! !

!TerniLapilli methodsFor: 'accessing' stamp: 'GR 10/31/2020 17:15:08'!
playerX
	
	^ playerX! !


!TerniLapilli methodsFor: 'private -- testing' stamp: 'GR 10/31/2020 20:43:28'!
seeIfPlayerOhasAWinningCondition
	
	isOver := self hasPlayerOWon.! !

!TerniLapilli methodsFor: 'private -- testing' stamp: 'GR 10/31/2020 20:43:19'!
seeIfPlayerXhasAWinningCondition
	
	isOver := self hasPlayerXWon.! !

!TerniLapilli methodsFor: 'private -- testing' stamp: 'GR 10/31/2020 20:13:55'!
winsDiagonally: aPlayerPieces

	^ (aPlayerPieces allSatisfy: [ :aPosition | aPosition x abs = aPosition y abs])  and: (aPlayerPieces includes: (0@0))! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TerniLapilli class' category: 'Terni Lapilli'!
TerniLapilli class
	instanceVariableNames: ''!

!TerniLapilli class methodsFor: 'error handling' stamp: 'GR 10/29/2020 20:30:50'!
canNotDoAnInvalidMove
	
	^ 'You can not do that move!!'! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'GR 10/29/2020 20:15:58'!
canNotPlaceMoreThanThreePieces
	
	^ 'You can not play more than three pieces!!'! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'GR 10/29/2020 19:24:32'!
canNotPlacePieceInInvalidPosition
	
	^ 'You are placing a piece in an invalid position!!'! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'GR 10/31/2020 19:41:07'!
canNotPlayIfGameIsOver

	^ 'Game is over!!'! !

!TerniLapilli class methodsFor: 'error handling' stamp: 'GR 10/29/2020 19:34:15'!
canNotPlayInOthersTurn
	
	^ 'You can not play in the other player turn!!'! !
