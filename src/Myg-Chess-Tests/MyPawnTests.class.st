Class {
	#name : 'MyPawnTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTests >> testDiagonalCaptureFailsOnSameColorPiece [ 
	| game pawn targetSquare capturedPiece|
	game := MyChessGame freshGame.

	"Trouver un pion blanc sur e2 et d2"
	pawn := game pieces detect: [ :p | p isPawn and: [ p square name = 'e2' ] ].
	capturedPiece := game pieces detect: [ :p | p isPawn and: [ p square name = 'd2' ] ].
	
	"Placer une pièce alliée sur une case diagonale (d3)"
	game move: capturedPiece to: capturedPiece square up.
	targetSquare := capturedPiece square.

	"Essayer de capturer une pièce alliée"
	game move: pawn to: targetSquare. "Le mouvement doit échouer"
	self assert: pawn square name equals: 'e2'. "Le pion doit rester sur sa case initiale"
	self assert: targetSquare contents equals: capturedPiece. "La case cible doit toujours contenir la pièce alliée"

]

{ #category : 'tests' }
MyPawnTests >> testEnPassantCapture [ 
	| game whitePawn blackPawn captureSquare originalSquare |
	game := MyChessGame freshGame.

	whitePawn := game pieces detect: [ :p | p isPawn and: [ p square name = 'e2' ] ].
	blackPawn := game pieces detect: [ :p | p isPawn and: [ p square name = 'd7' ] ].

	"Faire avancer le pion blanc de e2 à e5"
	game move: whitePawn to: whitePawn square up up .
	game move: whitePawn to: whitePawn square up .
	originalSquare := whitePawn square.
	"Faire avancer le pion noir de deux cases (d7 à d5)"
	game move: blackPawn to: blackPawn square down down .

	"Essayer de capturer en passant (e5 prend d6)"
	captureSquare := blackPawn square up.
	game move: whitePawn to: captureSquare.
	self assert: whitePawn square equals: captureSquare. "Le pion blanc doit être sur d6"
	self deny: originalSquare hasPiece . "e5 doit etre maintenant vide"	
	self deny: blackPawn square hasPiece . "Le pion noir doit être capturé"

]

{ #category : 'tests' }
MyPawnTests >> testFirstMove [ 
	| game pawn startSquare targetSquare1 targetSquare2 |
	game := MyChessGame freshGame.
	pawn := game pieces detect: [ :p | p isPawn and: [ p square name = 'e2' ] ].

	"Mouvement initial d'une case"
	startSquare := pawn square.
	targetSquare1 := startSquare up.
	game move: pawn to: targetSquare1.
	self assert: pawn square equals: targetSquare1.
	self deny: startSquare hasPiece.

	"Réinitialiser pour tester mouvement initial de deux cases"
	game := MyChessGame freshGame.
	pawn := game pieces detect: [ :p | p isPawn and: [ p square name = 'e2' ] ].

	"Mouvement initial de deux cases"
	startSquare := pawn square.
	targetSquare2 := startSquare up up.
	game move: pawn to: targetSquare2.
	self assert: pawn square equals: targetSquare2.
	self deny: startSquare hasPiece.
]

{ #category : 'tests' }
MyPawnTests >> testLeftDiagonalCapture [ 
	| game pawn targetSquare capturedPiece startSquare|
	game := MyChessGame freshGame.

	"Trouver un pion blanc sur e2"
	pawn := game pieces detect: [ :p | p isPawn and: [ p square name = 'e2' ] ].
	startSquare := pawn square.
	capturedPiece := game pieces detect: [ :p | p isPawn and: [ p square name = 'd7' ] ].

	"Placer une pièce adverse sur une case diagonale (d3)"
	game move: capturedPiece to: capturedPiece square down down .
	game move: capturedPiece to: capturedPiece square down .
	game move: capturedPiece to: capturedPiece square down.
	targetSquare := capturedPiece square.

	"Essayer de capturer la pièce adverse"
	game move: pawn to: targetSquare.
	self assert: targetSquare hasPiece. "La case cible doit être occupée"
	self assert: pawn square equals: targetSquare. "Le pion doit maintenant être sur d3"
	self deny: startSquare hasPiece. "Le case de depart doit etre vide"
]

{ #category : 'tests' }
MyPawnTests >> testMovesWithObstacle [
	| game pawn obstacle startSquare targetSquare |
	game := MyChessGame freshGame.

	"Trouver un pion et placer un obstacle devant"
	pawn := game pieces detect: [ :p | p isPawn and: [ p square name = 'e2' ] ].
	obstacle := game pieces detect: [ :p | p isPawn and: [ p square name = 'e7' ] ].
	startSquare := pawn square.
	targetSquare := startSquare up.

	"Placer une pièce bloquant le chemin du pion"
	game move: obstacle to: obstacle square down down .
	game move: obstacle to: obstacle square down .
	game move: obstacle to: obstacle square down.

	"Essayer d'avancer d'une case"
	game move: pawn to: targetSquare.
	self assert: pawn square equals: startSquare. "Le pion ne doit pas bouger"
	self assert: targetSquare hasPiece. "La case cible doit toujours contenir l'obstacle"

	"Essayer un mouvement initial de deux cases"
	targetSquare := startSquare up up.
	game move: pawn to: targetSquare.
	self assert: pawn square equals: startSquare. "Le pion ne doit pas bouger"




]

{ #category : 'tests' }
MyPawnTests >> testPostFirstMove [ 
	| game pawn startSquare targetSquare |
	game := MyChessGame freshGame.
	pawn := game pieces detect: [ :p | p isPawn and: [ p square name = 'e2' ] ].

	"Effectuer un mouvement initial"
	startSquare := pawn square.
	targetSquare := startSquare up up.
	game move: pawn to: targetSquare.
	self assert: pawn square equals: targetSquare.
	self deny: startSquare hasPiece.

	"Essayer un mouvement de deux cases après le mouvement initial"
	startSquare := pawn square.
	targetSquare := startSquare up up.
	game move: pawn to: targetSquare.
	self deny: pawn square equals: targetSquare.
	self assert: pawn square equals: startSquare.  "La pièce n'a pas bougé"

	"Tester un mouvement valide d'une case après le mouvement initial"
	targetSquare := startSquare up.
	game move: pawn to: targetSquare.
	self assert: pawn square equals: targetSquare.
	self deny: startSquare hasPiece.
]

{ #category : 'tests' }
MyPawnTests >> testRightDiagonalCapture [ 
	| game pawn targetSquare capturedPiece startSquare|
	game := MyChessGame freshGame.

	"Trouver un pion blanc sur e2"
	pawn := game pieces detect: [ :p | p isPawn and: [ p square name = 'e2' ] ].
	startSquare := pawn square.
	capturedPiece := game pieces detect: [ :p | p isPawn and: [ p square name = 'f7' ] ].

	"Placer une pièce adverse sur une case diagonale (d3)"
	game move: capturedPiece to: capturedPiece square down down .
	game move: capturedPiece to: capturedPiece square down .
	game move: capturedPiece to: capturedPiece square down.
	targetSquare := capturedPiece square.

	"Essayer de capturer la pièce adverse"
	game move: pawn to: targetSquare.
	self assert: targetSquare hasPiece. "La case cible doit être occupée"
	self assert: pawn square equals: targetSquare. "Le pion doit maintenant être sur d3"
	self deny: startSquare hasPiece. "Le case de depart doit etre vide"
]
