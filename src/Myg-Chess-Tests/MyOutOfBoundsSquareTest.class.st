Class {
	#name : 'MyOutOfBoundsSquareTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyOutOfBoundsSquareTest >> testFileReturnsInvalidValue [ 
	| square |
	square := MyOutOfBoundsSquare new.
	self assert: square file equals: 0 
]

{ #category : 'tests' }
MyOutOfBoundsSquareTest >> testHasNoPiece [ 
	| square |
	square := MyOutOfBoundsSquare new.
	self assert: square hasPiece equals: false "on verif que la case nonexistente na pas de piece "

]

{ #category : 'tests' }
MyOutOfBoundsSquareTest >> testIsOutOfBounds [ 
	| square |
	square := MyOutOfBoundsSquare new.
	self assert: square isOutOfBounds "on verif que la case est bien nonexistente"

]

{ #category : 'tests' }
MyOutOfBoundsSquareTest >> testNameIsOutOfBounds [ 
	| square |
	square := MyOutOfBoundsSquare new.
	self assert: square name equals: ' case inexistante;' 

]

{ #category : 'tests' }
MyOutOfBoundsSquareTest >> testNavigationReturnsSelf [ 
	| square |
	square := MyOutOfBoundsSquare new.
	self assert: (square up) equals: square.
	self assert: (square down) equals: square.
	self assert: (square left) equals: square.
	self assert: (square right) equals: square

]
