Class {
	#name : 'MyMoveTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyMoveTest >> testActualizationOfLastMoveInGame [
	| game whitePawn blackPawn whiteStart blackStart whiteEnd blackEnd lastMove |
	game := MyChessGame freshGame.

	"Premier mouvement : pion blanc"
	whitePawn := game pieces detect: [ :p | p isPawn and: [ p square name = 'e2' ] ].
	whiteStart := whitePawn square.
	whiteEnd := whiteStart up.
	game move: whitePawn to: whiteEnd.

	lastMove := game lastMove.
	self assert: lastMove notNil.
	self assert: lastMove piece equals: whitePawn.
	self assert: lastMove startSquare equals: whiteStart.
	self assert: lastMove endSquare equals: whiteEnd.

	"Deuxième mouvement : pion noir"
   blackPawn := game pieces detect: [ :p | p isPawn and: [ p square name = 'd7' ] ].
	blackStart := blackPawn square. 
	blackEnd := blackStart down. 
	game move: blackPawn to: blackEnd.

	lastMove := game lastMove.
	self assert: lastMove notNil. 
	self assert: lastMove piece = blackPawn.
	self assert: lastMove startSquare = blackStart.
	self assert: lastMove endSquare = blackEnd.
]

{ #category : 'tests' }
MyMoveTest >> testInitializationOfLastMoveInGame [
	| game piece startSquare endSquare lastMove |
	game := MyChessGame freshGame.
	piece := game pieces detect: [ :p | p isPawn and: [ p square name = 'e2' ] ].
	startSquare := piece square. 
	endSquare := startSquare up. 

	game move: piece to: endSquare.

	lastMove := game lastMove.
	self assert: lastMove notNil. 
	self assert: lastMove piece = piece. 
	self assert: lastMove startSquare = startSquare. 
	self assert: lastMove endSquare = endSquare.

]
