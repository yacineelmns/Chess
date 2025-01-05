Class {
	#name : 'MyOutOfBoundsSquare',
	#superclass : 'Object',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'testing' }
MyOutOfBoundsSquare >> aSquare [ 
    self

]

{ #category : 'testing' }
MyOutOfBoundsSquare >> contents [ 
    self  

]

{ #category : 'testing' }
MyOutOfBoundsSquare >> down [ 
    ^ self
]

{ #category : 'accessing' }
MyOutOfBoundsSquare >> file [ 
    ^0
]

{ #category : 'testing' }
MyOutOfBoundsSquare >> hasPiece [ 
    ^ false
]

{ #category : 'highlighting' }
MyOutOfBoundsSquare >> highlightTarget [ 
    "on ne fait car on ne peut pas surligner une case hors plateau"

]

{ #category : 'testing' }
MyOutOfBoundsSquare >> isOutOfBounds [ 
    ^ true
]

{ #category : 'testing' }
MyOutOfBoundsSquare >> left [ 
    ^ self
]

{ #category : 'accessing' }
MyOutOfBoundsSquare >> name [ 
    ^ ' case inexistante;'
]

{ #category : 'testing' }
MyOutOfBoundsSquare >> right [ 
    ^ self
]

{ #category : 'testing' }
MyOutOfBoundsSquare >> targetSquaresLegal: aBoolean [ 
    ^ #()
]

{ #category : 'highlighting' }
MyOutOfBoundsSquare >> unhighlightTarget [ 
    "on ne fait rien pour une case hors plateau"

]

{ #category : 'testing' }
MyOutOfBoundsSquare >> up [ 
    ^ self
]
