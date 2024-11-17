Class {
	#name : 'MyEmptyPiece',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'testing' }
MyEmptyPiece >> isEmpty [ 
"cest vide"
    ^ true
]

{ #category : 'rendering' }
MyEmptyPiece >> targetSquaresLegal: aBoolean [
"une case vide ne peut pas se deplacer"
    ^ #()
"collection vide"
]
