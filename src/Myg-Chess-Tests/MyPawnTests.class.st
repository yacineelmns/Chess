Class {
	#name : 'MyPawnTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyPawnTests >> testCanMoveInDiagonalToCaptureAPiece [
	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).
	board at: 'd5' put: MyRook black.
	squares := pawn targetSquares.
	self assertCollection: squares includesAll:
			(#( d5 e5) collect: [ :name |
				 board at: name ]).
	board at: 'f5' put: MyRook black.
	self assertCollection: squares includesAll:
			(#( d5 f5 e5) collect: [ :name |
				 board at: name ]).
	




]

{ #category : 'tests' }
MyPawnTests >> testFirstMove [ 

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( e3 e4 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTests >> testIfItIsTheFirstMove [
	| pawn board |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).
	self assert: pawn isFirstMove equals: true.
	board at: 'e3' put: (pawn := MyPawn white).
	self assert: pawn isFirstMove equals: false
]

{ #category : 'tests' }
MyPawnTests >> testMoves [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'e4' put: (pawn := MyPawn white).

	squares := pawn targetSquares.
	self
		assertCollection: squares
		includesAll:
			(#( e5 ) collect: [ :name |
				 board at: name ])
]

{ #category : 'tests' }
MyPawnTests >> testMovesWithObstacle [

	| pawn squares board |
	board := MyChessBoard empty.
	board at: 'e2' put: (pawn := MyPawn white).

	"Pawns don't jump above pieces"
	"Let's put a obstacle on g4, blocking the e rank"
	board at: 'e3' put: MyRook black.

	squares := pawn targetSquares.
	self assert: squares isEmpty
		
	




]
