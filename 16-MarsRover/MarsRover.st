!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'marsRoverNorth marsRoverEast marsRoverSouth marsRoverWest'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'testing' stamp: 'GR 10/24/2020 19:04:56'!
test01ForwardNorthMovesRoverOnePositionToNorth

	self assertMarsRover: marsRoverNorth endsInPosition: (1@2) withDirection: North whenSendingCommandSet: 'f'.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'GR 10/24/2020 19:06:49'!
test02BackwardNorthMovesRoverOnePositionToSouth

	self assertMarsRover: marsRoverNorth endsInPosition: (1@0) withDirection: North whenSendingCommandSet: 'b'.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'GR 10/24/2020 19:06:53'!
test03LeftNorthChangesRoverDirectionToWest

	self assertMarsRover: marsRoverNorth endsInPosition: (1@1) withDirection: West whenSendingCommandSet: 'l'.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'GR 10/24/2020 19:06:57'!
test04RightNorthChangesRoverDirectionToEast

	self assertMarsRover: marsRoverNorth endsInPosition: (1@1) withDirection: East whenSendingCommandSet: 'r'.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'GR 10/24/2020 19:07:08'!
test05ForwardEastMovesRoverOnePositionToEast

	self assertMarsRover: marsRoverEast endsInPosition: (2@1) withDirection: East whenSendingCommandSet: 'f'.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'GR 10/24/2020 19:07:24'!
test06RoverCanHandleACommandString

	self assertMarsRover: marsRoverEast endsInPosition: (2@0) withDirection: West whenSendingCommandSet: 'flbl'.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'GR 10/24/2020 18:58:43'!
test07RoverCanNotHandleCommandStringWithInvalidCommand

	self 
		should: [ marsRover sendCommandSet: 'fabi'. ]	 
		raise: Error
		description: MarsRover commandNotUnderstood.! !


!MarsRoverTest methodsFor: 'setUp' stamp: 'GR 10/24/2020 19:03:51'!
setUp

	marsRoverNorth := MarsRover newInPosition: (1@1) andDirection: North new.
	
	marsRoverEast := MarsRover newInPosition: (1@1) andDirection: East new.
	
	marsRoverSouth := MarsRover newInPosition: (1@1) andDirection: South new.
	
	marsRoverWest := MarsRover newInPosition: (1@1) andDirection: West new.
	
	! !


!MarsRoverTest methodsFor: 'private' stamp: 'GR 10/24/2020 19:08:14'!
assertMarsRover: aMarsRover endsInPosition: aPosition withDirection: aDirection whenSendingCommandSet: aCommandSet

	aMarsRover sendCommandSet: aCommandSet.
	
	self assert: aPosition equals: aMarsRover position.
	self assert: aDirection equals: aMarsRover direction.! !


!classDefinition: #Direction category: 'MarsRover'!
Object subclass: #Direction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Direction methodsFor: 'actions' stamp: 'GR 10/24/2020 17:46:00'!
moveBackward: aMarsRover

	self subclassResponsibility.! !

!Direction methodsFor: 'actions' stamp: 'GR 10/24/2020 17:45:42'!
moveForward: aMarsRover

	self subclassResponsibility.! !


!Direction methodsFor: 'rotations' stamp: 'GR 10/24/2020 18:01:47'!
leftCardinalPoint
	
	self subclassResponsibility .! !

!Direction methodsFor: 'rotations' stamp: 'GR 10/24/2020 17:57:37'!
rightCardinalPoint
	
	self subclassResponsibility.! !


!classDefinition: #East category: 'MarsRover'!
Direction subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!East methodsFor: 'actions' stamp: 'GR 10/24/2020 18:03:08'!
moveBackward: aMarsRover
	
	aMarsRover moveForwardTowardsWest.! !

!East methodsFor: 'actions' stamp: 'GR 10/24/2020 17:46:43'!
moveForward: aMarsRover
	
	aMarsRover moveForwardTowardsEast.! !


!East methodsFor: 'rotations' stamp: 'GR 10/24/2020 18:19:23'!
leftCardinalPoint

	^North new.! !

!East methodsFor: 'rotations' stamp: 'GR 10/24/2020 18:19:34'!
rightCardinalPoint

	^South new.! !


!classDefinition: #North category: 'MarsRover'!
Direction subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'actions' stamp: 'GR 10/24/2020 17:53:10'!
moveBackward: aMarsRover 
	
	aMarsRover moveForwardTowardsSouth.! !

!North methodsFor: 'actions' stamp: 'GR 10/24/2020 17:47:10'!
moveForward: aMarsRover
	
	aMarsRover moveForwardTowardsNorth.! !


!North methodsFor: 'rotations' stamp: 'GR 10/24/2020 18:05:03'!
leftCardinalPoint
	
	^West new.! !

!North methodsFor: 'rotations' stamp: 'GR 10/24/2020 17:57:59'!
rightCardinalPoint
	
	^East new.! !


!classDefinition: #South category: 'MarsRover'!
Direction subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'actions' stamp: 'GR 10/24/2020 18:05:20'!
moveBackward: aMarsRover
	
	aMarsRover moveForwardTowardsNorth.! !

!South methodsFor: 'actions' stamp: 'GR 10/24/2020 17:48:35'!
moveForward: aMarsRover
	
	aMarsRover moveForwardTowardsSouth.! !


!South methodsFor: 'rotations' stamp: 'GR 10/24/2020 18:05:49'!
leftCardinalPoint

	^East new.! !

!South methodsFor: 'rotations' stamp: 'GR 10/24/2020 18:06:12'!
rightCardinalPoint

	^West new.! !


!classDefinition: #West category: 'MarsRover'!
Direction subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'actions' stamp: 'GR 10/24/2020 18:06:37'!
moveBackward: aMarsRover
	
	aMarsRover moveForwardTowardsEast.! !

!West methodsFor: 'actions' stamp: 'GR 10/24/2020 17:48:48'!
moveForward: aMarsRover
	
	aMarsRover moveForwardTowardsWest.! !


!West methodsFor: 'rotations' stamp: 'GR 10/24/2020 18:06:56'!
leftCardinalPoint

	^South new.! !

!West methodsFor: 'rotations' stamp: 'GR 10/24/2020 18:07:07'!
rightCardinalPoint

	^North new.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position direction cardinalPoints'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'initialization' stamp: 'GR 10/24/2020 17:12:47'!
initializeNewInPosition: aCoordinate andDirection: aDirection 
	
	position := aCoordinate.
	direction := aDirection.
	cardinalPoints := OrderedCollection with: $N with: $E with: $S with: $O.! !


!MarsRover methodsFor: 'operations' stamp: 'GR 10/24/2020 18:31:00'!
executeCommand: aCommand
	
	(aCommand = $l ) ifTrue: [ ^direction := direction leftCardinalPoint. ].
	
	(aCommand = $r ) ifTrue: [ ^direction := direction rightCardinalPoint. ].	
	
	(aCommand = $f ) ifTrue: [ ^direction moveForward: self ].
	
	(aCommand = $b ) ifTrue: [ ^direction moveBackward: self ].
	
	self error: MarsRover commandNotUnderstood.! !

!MarsRover methodsFor: 'operations' stamp: 'GR 10/24/2020 18:16:55'!
sendCommandSet: aCommandSet

	aCommandSet do: [ :aCommand | self executeCommand: aCommand ].! !


!MarsRover methodsFor: 'accessing' stamp: 'GR 10/24/2020 18:00:45'!
direction
	
	^direction class! !

!MarsRover methodsFor: 'accessing' stamp: 'GR 10/24/2020 16:31:47'!
position
	
	^position! !


!MarsRover methodsFor: 'private' stamp: 'GR 10/24/2020 17:59:51'!
moveForwardTowardsEast
	
	position := position + (1@0)! !

!MarsRover methodsFor: 'private' stamp: 'GR 10/24/2020 17:49:37'!
moveForwardTowardsNorth
	
	position := position + (0@1).! !

!MarsRover methodsFor: 'private' stamp: 'GR 10/24/2020 17:53:46'!
moveForwardTowardsSouth
	
	position := position - (0@1)! !

!MarsRover methodsFor: 'private' stamp: 'GR 10/24/2020 18:08:04'!
moveForwardTowardsWest
	
	position := position - (1@0)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'GR 10/24/2020 16:21:33'!
newInPosition: aCardinalPoint andDirection: aDirection
	
	^self new initializeNewInPosition: aCardinalPoint andDirection: aDirection ! !


!MarsRover class methodsFor: 'error handling' stamp: 'GR 10/24/2020 18:22:41'!
commandNotUnderstood
	
	^'Command set is not valid'! !
