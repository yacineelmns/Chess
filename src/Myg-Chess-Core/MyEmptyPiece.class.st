Class {
	#name : 'MyEmptyPiece',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'testing' }
MyEmptyPiece >> hasPiece [ 
    ^ false
]

{ #category : 'accessing' }
MyEmptyPiece >> id [ 
    ^ 'empty'
]

{ #category : 'path commands' }
MyEmptyPiece >> moveTo: aSquare [ 
    "Une case vide ne peut pas bouger par elle-même."
    self error: 'An empty piece cannot move'

]

{ #category : 'rendering' }
MyEmptyPiece >> renderPieceOn: aSquare [ 
    "Aucune pièce à afficher pour une case vide."
    ^ (aSquare color isBlack ifTrue: [ 'x' ] ifFalse: [ 'z' ])   
]

{ #category : 'rendering' }
MyEmptyPiece >> targetSquaresLegal: aBoolean [ 
    ^ #() "je mets une collection vide car une piece vide na pas de mvt "
]
