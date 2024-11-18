Class {
	#name : 'MyEmptyPiece',
	#superclass : 'MyPiece',
	#category : 'Myg-Chess-Core',
	#package : 'Myg-Chess-Core'
}

{ #category : 'testing' }
MyEmptyPiece >> isEmpty [
	^ true 
]

{ #category : 'rendering' }
MyEmptyPiece >> targetSquaresLegal: aBoolean [

	^ OrderedCollection new "mettre une collection vide car une piece vide na pas de mvt "
]
