Class {
	#name : 'MyKnightTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyKnightTest >> testTargetSquaresLegalFromCenter [ 
    | board knight squares |
    board := MyChessBoard empty.
    knight := MyKnight white.

    "on le cavalier au centre"
    board at: 'e4' put: knight.

    "on collecte les cases ou il peut se deplacer"
    squares := knight targetSquaresLegal: true.

    self assert: (squares collect: #name) asArray equals: #('g5' 'g3' 'c5' 'c3' 'd6' 'f6' 'd2' 'f2')

]
