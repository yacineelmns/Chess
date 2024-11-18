Class {
	#name : 'MyEmptyPieceTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyEmptyPieceTest >> testIsEmpty [ 
"on creer notre instance"
    | emptyPiece |
    emptyPiece := MyEmptyPiece new.
    self assert: emptyPiece isEmpty."doit return true"


]

{ #category : 'tests' }
MyEmptyPieceTest >> testTargetSquaresLegal [ 
    | emptyPiece |
    emptyPiece := MyEmptyPiece new.
    self assert: (emptyPiece targetSquaresLegal: true) isEmpty. "verifie que ca retourne bien une collection vide"

]
