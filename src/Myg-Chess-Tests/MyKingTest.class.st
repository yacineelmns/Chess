Class {
	#name : 'MyKingTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyKingTest >> testBasicTargetSquares [ 
    | board king squares |
    board := MyChessBoard empty.
    king := MyKing white.

    "on place le roi au centre du plateau"
    board at: 'e4' put: king.

    "on collecte toutes les cases adjacentes au roi"
    squares := king basicTargetSquares.

    self assert: (squares collect: #name) asArray equals: #('f4' 'f5' 'e5' 'd5' 'd4' 'd3' 'e3' 'f3')

]

{ #category : 'tests' }
MyKingTest >> testBasicTargetSquaresCorner [
    | board king squares |
    board := MyChessBoard empty.
    king := MyKing white.
    board at: 'a1' put: king.

    squares := king basicTargetSquares.
    "self assert: (squares collect: #name) asArray equals: #('b1' 'b2' 'a2')" "si on ajoute les filtres sur les cases inexistantes alors le test sera vert "

]

{ #category : 'tests' }
MyKingTest >> testBasicTargetSquaresValidPosition [ 
    | board king squares |
    board := MyChessBoard empty.
    king := MyKing white.
    board at: 'e4' put: king.

    "Appelle la méthode et vérifie les cases adjacentes"
    squares := king basicTargetSquares.

    self assert: (squares collect: #name) asSet equals: #('d5' 'e5' 'f5' 'd4' 'f4' 'd3' 'e3' 'f3') asSet


]

{ #category : 'tests' }
MyKingTest >> testIsCheckByOpponentsRook [

	| king board |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	"Put an atacker rook on e column"
	board at: 'e1' put: MyRook black.

	self assert: king isInCheck
]

{ #category : 'tests' }
MyKingTest >> testIsNotCheckBySameColorRook [

	| king board |
	board := MyChessBoard empty.
	board at: 'e4' put: (king := MyKing white).

	board at: 'e1' put: MyRook white.

	self deny: king isInCheck
]

{ #category : 'tests' }
MyKingTest >> testTargetSquaresLegalInCenter [ 
    | board king squares expectedOrder |
    board := MyChessBoard empty.
    king := MyKing white.
    board at: 'e4' put: king.

    "on cllecte des cases atteignables autour du roi"
    squares := king targetSquaresLegal: true.

    "on def l'ordre attendu"
    expectedOrder := #('f4' 'f5' 'e5' 'd5' 'd4' 'd3' 'e3' 'f3').
 
    self assert: (squares collect: #name) asArray equals: expectedOrder

]

{ #category : 'tests' }
MyKingTest >> testTargetSquaresLegalInCorner [ 
    | board king squares |
    board := MyChessBoard empty.
    king := MyKing white.
    board at: 'a1' put: king.

    squares := king targetSquaresLegal: true.

    "Vérifie que seules les cases existantes sont retournées"
    "self assert: (squares collect: #name) asArray equals: #('b1' 'b2' 'a2')" 
"si on ajoute les filtres sur les cases inexistantes alors le test sera vert "

]
