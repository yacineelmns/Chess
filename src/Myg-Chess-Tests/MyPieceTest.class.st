Class {
	#name : 'MyPieceTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPieceTest >> testCollectSquaresIncludeObstacleWhenNotLegal [ 
    | board piece squares obstacle |
    board := MyChessBoard empty.
    piece := MyRook white.
    obstacle := MyPawn black.
    board at: 'e4' put: piece.
    board at: 'g4' put: obstacle.

    "on collecte des case à droite avec un obstacle"
    squares := piece collectSquares: [ :square | square right ] legal: false.

    "on convertit les noms des cases collectées en un tableau pour comparer"
    self assert: (squares collect: #name) asArray equals: #('f4' 'g4' 'h4')


]

{ #category : 'tests' }
MyPieceTest >> testCollectSquaresNoObstacle [ 
    | board piece squares |
    board := MyChessBoard empty.
    piece := MyRook white.
    board at: 'e4' put: piece.

    "on collecte des cases à droite sans obstacle"
    squares := piece collectSquares: [ :square | square right ] legal: true.

    "on verifie que toutes les cases sont collectées jusqu à la fin"
    self assert: (squares collect: #name) asArray equals: #('f4' 'g4' 'h4') 


]

{ #category : 'tests' }
MyPieceTest >> testCollectSquaresStopOnInvalidSquare [
    | board piece squares |
    board := MyChessBoard empty.
    piece := MyRook white.
    board at: 'h8' put: piece.

    "on collecte des cases à droite en dehors du plateau"
    squares := piece collectSquares: [ :square | square right ] legal: true.

    "on verifie qu'aucune case n'est collectée, car la 1er case est inexistante"
    self assert: squares isEmpty
]

{ #category : 'tests' }
MyPieceTest >> testCollectSquaresStopOnObstacleWhenLegal [ 
    | board piece squares obstacle |
    board := MyChessBoard empty.
    piece := MyRook white.
    obstacle := MyPawn black.
    board at: 'e4' put: piece.
    board at: 'g4' put: obstacle.

    "on collecte des cases à droite avec un obstacle"
    squares := piece collectSquares: [ :square | square right ] legal: true.

    "on verifie que la collecte prend en compte l'obstacle, mais s’arrete là"
    self assert: (squares collect: #name) asArray equals: #('f4' 'g4')
]

{ #category : 'tests' }
MyPieceTest >> testCollectSquaresWhileAllValidSquares [ 
    | board piece squares |
    board := MyChessBoard empty.
    piece := MyRook white.
    board at: 'e4' put: piece.

    "on collecte toutes les cases valides à droite jusqu'à la fin"
    squares := piece collectSquares: [ :square | square right ] while: [ :square | square isOutOfBounds not ].

    self assert: (squares collect: #name) asArray equals: #('f4' 'g4' 'h4')
]

{ #category : 'tests' }
MyPieceTest >> testCollectSquaresWhileStopOnObstacle [ 
    | board piece squares obstacle |
    board := MyChessBoard empty.
    piece := MyRook white.
    obstacle := MyPawn black.
    board at: 'e4' put: piece.
    board at: 'g4' put: obstacle.

    "on collecte jusqu à la case contenant l'obstacle"
    squares := piece collectSquares: [ :square | square right ] while: [ :square |
        square hasPiece not ] .

    self assert: (squares collect: #name) asArray equals: #('f4' 'g4')

]

{ #category : 'tests' }
MyPieceTest >> testDownLeftDiagonalLegalAllValid [ 
    | board piece squares |
    board := MyChessBoard empty.
    piece := MyBishop white.
    board at: 'e4' put: piece.

    "on collecte toutes les cases valides vers le bas à gauche"
    squares := piece downLeftDiagonalLegal: true.

    self assert: (squares collect: #name) asArray equals: #('d3' 'c2' 'b1') 

]

{ #category : 'tests' }
MyPieceTest >> testDownLeftDiagonalLegalStopOnInvalidSquare [ 
    | board piece squares |
    board := MyChessBoard empty.
    piece := MyBishop white.
    board at: 'a1' put: piece.

    "a 'a1', aucune case valide vers le bas à gauche"
    squares := piece downLeftDiagonalLegal: true.

    self assert: squares isEmpty
]

{ #category : 'tests' }
MyPieceTest >> testDownLeftDiagonalLegalStopOnObstacle [ 
    | board piece squares obstacle |
    board := MyChessBoard empty.
    piece := MyBishop white.
    obstacle := MyPawn black.
    board at: 'e4' put: piece.
    board at: 'c2' put: obstacle.

    "la diagonale s'arrête à la case qui contient l'obstacle"
    squares := piece downLeftDiagonalLegal: true.

    self assert: (squares collect: #name) asArray equals: #('d3' 'c2')
]

{ #category : 'tests' }
MyPieceTest >> testDownLeftDiagonalWithNonExistentSquare [
    | board square result |
    board := MyChessBoard empty.
    square := board at: 'a1'. " case valide dans le coin en bas à gauche"
    result := square down left.  

    self assert: (result respondsTo: #isOutOfBounds)
]

{ #category : 'tests' }
MyPieceTest >> testDownRightDiagonalLegalAllValid [ 
    | board piece squares |
    board := MyChessBoard empty.
    piece := MyBishop white.
    board at: 'e4' put: piece.

    "on collecte toutes les cases valides dans le bas à droite"
    squares := piece downRightDiagonalLegal: true.

    self assert: (squares collect: #name) asArray equals: #('f3' 'g2' 'h1')
]

{ #category : 'tests' }
MyPieceTest >> testDownRightDiagonalLegalStopOnInvalidSquare [ 
    | board piece squares |
    board := MyChessBoard empty.
    piece := MyBishop white.
    board at: 'h1' put: piece.

    "depuis h1, on a aucune case valide en bas à droite"
    squares := piece downRightDiagonalLegal: true.

    self assert: squares isEmpty
]

{ #category : 'tests' }
MyPieceTest >> testDownRightDiagonalLegalStopOnObstacle [ 
    | board piece squares obstacle |
    board := MyChessBoard empty.
    piece := MyBishop white.
    obstacle := MyPawn black.
    board at: 'e4' put: piece.
    board at: 'g2' put: obstacle.

    "La diagonale s'arrête à la case contenant l'obstacle"
    squares := piece downRightDiagonalLegal: true.

    self assert: (squares collect: #name) asArray equals: #('f3' 'g2')

]

{ #category : 'tests' }
MyPieceTest >> testUpLeftDiagonalLegalAllValid [ 
    | board piece squares |
    board := MyChessBoard empty.
    piece := MyBishop white.
    board at: 'e4' put: piece.

    "on collecte toutes les cases valides en haut à gauche"
    squares := piece upLeftDiagonalLegal: true.

    self assert: (squares collect: #name) asArray equals: #('d5' 'c6' 'b7' 'a8')

]

{ #category : 'tests' }
MyPieceTest >> testUpLeftDiagonalLegalStopOnInvalidSquare [ 
    | board piece squares |
    board := MyChessBoard empty.
    piece := MyBishop white.
    board at: 'a8' put: piece.

    "a partir de a8 aucune case valide vers le haut à gauche"
    squares := piece upLeftDiagonalLegal: true.

    self assert: squares isEmpty

]

{ #category : 'tests' }
MyPieceTest >> testUpLeftDiagonalLegalStopOnObstacle [ 
    | board piece squares obstacle |
    board := MyChessBoard empty.
    piece := MyBishop white.
    obstacle := MyPawn black.
    board at: 'e4' put: piece.
    board at: 'c6' put: obstacle.

    "la diagonale s'arrete à la case qui continent l'obstacle"
    squares := piece upLeftDiagonalLegal: true.

    self assert: (squares collect: #name) asArray equals: #('d5' 'c6')

]

{ #category : 'tests' }
MyPieceTest >> testUpRightDiagonalLegalAllValid [ 
    | board piece squares |
    board := MyChessBoard empty.
    piece := MyBishop white.
    board at: 'e4' put: piece.

    "on collecte toutes les cases valides en haut à droite"
    squares := piece upRightDiagonalLegal: true.

    self assert: (squares collect: #name) asArray equals: #('f5' 'g6' 'h7')

]

{ #category : 'tests' }
MyPieceTest >> testUpRightDiagonalLegalStopOnInvalidSquare [ 
    | board piece squares |
    board := MyChessBoard empty.
    piece := MyBishop white.
    board at: 'h8' put: piece.

    "a partir de h8 on a aucune case valide vers le haut à droite"
    squares := piece upRightDiagonalLegal: true.

    self assert: squares isEmpty

]

{ #category : 'tests' }
MyPieceTest >> testUpRightDiagonalLegalStopOnObstacle [ 
    | board piece squares obstacle |
    board := MyChessBoard empty.
    piece := MyBishop white.
    obstacle := MyPawn black.
    board at: 'e4' put: piece.
    board at: 'g6' put: obstacle.

    "la diagonale s'arrête à la case contenant l'obstacle"
    squares := piece upRightDiagonalLegal: true.

    self assert: (squares collect: #name) asArray equals: #('f5' 'g6')
]
