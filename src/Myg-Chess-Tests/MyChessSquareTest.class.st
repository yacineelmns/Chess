Class {
	#name : 'MyChessSquareTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyChessSquareTest >> testAddAndRemovePieceFromSquare [ 
	| board square piece |
	board := MyChessBoard empty.
	square := board at: 'f7'.
	piece := MyPawn black.

	square contents: piece.
	self assert: square hasPiece.
	self assert: square contents equals: piece.

	square emptyContents.
	self deny: square hasPiece.
	self assert: square contents isNil
]
