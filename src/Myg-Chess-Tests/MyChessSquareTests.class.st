Class {
	#name : 'MyChessSquareTests',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyChessSquareTests >> testEmptyContents [ 
    | square |
    square := MyChessSquare new.
    self assert: square contents isNil


]

{ #category : 'tests' }
MyChessSquareTests >> testHasPieceForSquareWithPiece [  
    | square piece |
    piece := MyPiece new.
    square := MyChessSquare withPiece: piece.
    self assert: square hasPiece.
 

 
]

{ #category : 'tests' }
MyChessSquareTests >> testHasPieceWhenEmpty [ 
    | square |
    square := MyChessSquare new.
    self assert: square hasPiece not.


]
