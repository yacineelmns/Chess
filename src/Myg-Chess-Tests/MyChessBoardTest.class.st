Class {
	#name : 'MyChessBoardTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyChessBoardTest >> testAtWithInvalidCoordinate [ 
    | board |
    board := MyChessBoard empty.

    self assert: (board at: 'z1') isOutOfBounds

]

{ #category : 'tests' }
MyChessBoardTest >> testAtWithPieceInSquare [ 
    | board pawn |
    board := MyChessBoard empty.
    pawn := MyPawn white.

    "on ajt une piece a la case en passant par at:put:"
    board at: 'e4' put: pawn.
    
    "on verifie que le contenu de la case est bien la piece"
    self assert: ((board at: 'e4') contents) equals: pawn
]

{ #category : 'tests' }
MyChessBoardTest >> testHighLightTargetsWithMixedSquares [ 
    | board squares |
    board := MyChessBoard empty.
    squares := { (board at: 'e4'). (board at: 'd5'). (board at: 'z1') }.

    "e4 et d5 sont valides z1 nonexistant"
    board highLightTargets: squares.

    self assert: squares size equals: 3  

]

{ #category : 'tests' }
MyChessBoardTest >> testHighLightTargetsWithNonExistentSquare [ 
    | board squares |
    board := MyChessBoard empty.
    squares := { (board at: 'e4'). (board at: 'z9') }.

    "z9 est une case nonexistante"
    board highLightTargets: squares.

    self assert: squares notEmpty

]

{ #category : 'tests' }
MyChessBoardTest >> testHighLightTargetsWithValidSquares [ 
    | board squares |
    board := MyChessBoard empty.
    squares := { (board at: 'e4'). (board at: 'd5') }.

    "on ajt les pawn aux cases valides"
    squares do: [ :sq | sq contents: MyPawn white ].

    "on appelle highLightTargets: sur ces cases"
    board highLightTargets: squares.

    self assert: squares notEmpty 

]

{ #category : 'tests' }
MyChessBoardTest >> testUnhighLightTargetsWithEmptyCollection [
    | board |
    board := MyChessBoard empty.
    board unhighLightTargets: #().

    self assert: board class equals: MyChessBoard

]

{ #category : 'tests' }
MyChessBoardTest >> testUnhighLightTargetsWithNonExistentSquares [
    |board nonexistent result |
    board := MyChessBoard empty.
    nonexistent := board at: 'z9'.

    "on applique unhighlightTargets sur une case nonexistante"
    result := [ board unhighLightTargets: { nonexistent } ].

    self assert: result isBlock

]
