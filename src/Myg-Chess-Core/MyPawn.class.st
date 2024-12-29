Class {
	#name : 'MyPawn',
	#superclass : 'MyPiece',
	#instVars : [
		'enPassantTarget'
	],
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
MyPawn >> enPassantTargetSquares [
	| enPassantMoves lastMove enemySquare targetSquare |
    enPassantTarget ifNotNil: [ ^ OrderedCollection with: enPassantTarget ].

    enPassantMoves := OrderedCollection new.
    lastMove := square board game lastMove.

    lastMove ifNotNil: [
        (lastMove piece isPawn
            and: ([ (lastMove startSquare file asInteger - lastMove endSquare file asInteger) abs = 2 ]))
					ifTrue: [
						self isInTheGoodLineForEnPassant 
						ifTrue: [  
                enemySquare := lastMove endSquare.
                (self square columnDifference: enemySquare) abs = 1
                    ifTrue: [
                        targetSquare := (self isWhite
                            ifTrue: [ enemySquare up ]
                            ifFalse: [ enemySquare down ]).
                        enPassantTarget := targetSquare. "Stocker la case pour un accès ultérieur"
                        enPassantMoves add: targetSquare.
                    ].
					].
            ].
    ].
    ^ enPassantMoves
]

{ #category : 'as yet unclassified' }
MyPawn >> forwardSquares [ 
^ (self isWhite
		   ifTrue: [ { square up. (self isFirstMove and: [ square up notNil and: [ square up hasPiece not ] ]) 
				ifTrue: [(square up) up] } ]
		   ifFalse: [ { square down. (self isFirstMove and: [ square down notNil and: [ square down hasPiece not ] ]) 
				ifTrue: [(square down) down] } ]) 
		select: [ :s | s notNil and: [s hasPiece not ] ]
]

{ #category : 'accessing' }
MyPawn >> id [

	^ 'P'
]

{ #category : 'initialization' }
MyPawn >> initialize [ 
	super initialize.
   enPassantTarget := nil. "Nouvel attribut pour stocker la case"
]

{ #category : 'testing' }
MyPawn >> isFirstMove [
	^ #('a2' 'b2' 'c2' 'd2' 'e2' 'f2' 'g2' 'h2' 'a7' 'b7' 'c7' 'd7' 'e7' 'f7' 'g7' 'h7') includes: self square name
]

{ #category : 'testing' }
MyPawn >> isInTheGoodLineForEnPassant [ 
	^ self isWhite 
		ifTrue: [ square file = $5 ] 
		ifFalse: [ square file = $4 ] 
]

{ #category : 'testing' }
MyPawn >> isPawn [
	^ true
]

{ #category : 'path commands' }
MyPawn >> moveTo: aSquare [
	| enPassantTargetSquare |
	enPassantTargetSquare := (self enPassantTargetSquares includes: aSquare)
		ifTrue: [ self isWhite 
						ifTrue: aSquare down 
						ifFalse: aSquare up ].
	enPassantTargetSquare ifNotNil: [ enPassantTargetSquare emptyContents ].

	super moveTo: aSquare.
	enPassantTarget := nil. "Réinitialise après le déplacement"
]

{ #category : 'rendering' }
MyPawn >> renderPieceOn: aSquare [ 
	
	^ aSquare renderPawn: self
]

{ #category : 'rendering' }
MyPawn >> targetSquaresLegal: aBoolean [
	| forward capture enPassant |
    forward := self forwardSquares.
    capture := self captureSquares.
    enPassant ifNil: [ enPassant := self enPassantTargetSquares ].
    ^ forward, capture, enPassant
]
