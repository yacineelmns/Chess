Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'as yet unclassified' }
MyPawn >> captureSquares [
	|captureMoves|
    captureMoves := OrderedCollection new.
	(self isWhite ifTrue: [ square up ifNotNil: #left ] ifFalse: [ square down ifNotNil: #left ]) ifNotNil: [ :leftDiagonal |
        (leftDiagonal hasPiece and: [ leftDiagonal contents color ~= color ]) ifTrue: [
            captureMoves add: leftDiagonal
        ]
    ].
    (self isWhite ifTrue: [ square up ifNotNil: #right ] ifFalse: [ square down ifNotNil: #right ]) ifNotNil: [ :rightDiagonal |
        (rightDiagonal hasPiece and: [ rightDiagonal contents color ~= color ]) ifTrue: [
            captureMoves add: rightDiagonal
        ]
    ].
^ captureMoves 
	
]

{ #category : 'as yet unclassified' }
MyPawn >> forwardSquares [ 
^ (self isWhite
		   ifTrue: [ { square up. (self isFirstMove and: [ square up notNil and: [ square up hasPiece not ] ]) 
				ifTrue: [(square up) up] } ]
		   ifFalse: [ { square down. (self isFirstMove and: [ square down notNil and: [ square up hasPiece not ] ]) 
				ifTrue: [(square down) down] } ]) 
		select: [ :s | s notNil and: [s hasPiece not ] ]
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'testing' }
MyPawn >> isFirstMove [
	^ #('a2' 'b2' 'c2' 'd2' 'e2' 'f2' 'g2' 'h2' 'a7' 'b7' 'c7' 'd7' 'e7' 'f7' 'g7' 'h7') includes: self square name
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [

^ (self forwardSquares, self captureSquares ) select: [ :s | s notNil ]
]
