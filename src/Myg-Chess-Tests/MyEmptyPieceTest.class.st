Class {
	#name : 'MyEmptyPieceTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyEmptyPieceTest >> testEmptyPieceDoesNotThreaten [
	| emptyPiece |
	emptyPiece := MyEmptyPiece new.

	self assert: emptyPiece attackingSquares isEmpty. "on ne doit pas attaquer les autres"

]

{ #category : 'tests' }
MyEmptyPieceTest >> testHasPiece [
	| emptyPiece |
	emptyPiece := MyEmptyPiece new.

	self assert: emptyPiece hasPiece not.  

]

{ #category : 'tests' }
MyEmptyPieceTest >> testMoveToAnotherSquare [
	| emptyPiece newSquare |
	"on verifie qu'elle ne doit pas pouvoir se deplacer"
	emptyPiece := MyEmptyPiece new.
	newSquare := MyChessSquare basicNew color: Color white; initialize; yourself.

	self should: [ emptyPiece moveTo: newSquare ] raise: Error.  
]

{ #category : 'tests' }
MyEmptyPieceTest >> testRenderPieceOnSquare [
	| emptyPiece square |
	emptyPiece := MyEmptyPiece new.
	square := MyChessSquare basicNew color: Color white; initialize; yourself.

	self assert: (emptyPiece renderPieceOn: square) isNil

]

{ #category : 'tests' }
MyEmptyPieceTest >> testTargetSquaresLegal [ 
    | emptyPiece |
    emptyPiece := MyEmptyPiece new.
    self assert: (emptyPiece targetSquaresLegal: true) isEmpty. "verifie que ca retourne bien une collection vide"

]
