Class {
	#name : 'MyChessSquareTest',
	#superclass : 'TestCase',
	#category : 'Myg-Chess-Tests',
	#package : 'Myg-Chess-Tests'
}

{ #category : 'tests' }
MyChessSquareTest >> testAddAndRemovePieceFromSquare [ 
	| board square piece |
	"on instancie notre board notre carre et la piece "
	board := MyChessBoard empty.
	square := board at: 'f7'.
	piece := MyPawn black.

	square contents: piece. "on ajt la piece sur la case"
	self assert: square hasPiece. "doit return vrai"
	self assert: square contents equals: piece."la case contient bien la piece"

	square emptyContents. "on vide le caarre donc plus de pièce"
	self deny: square hasPiece. "doit return faux plus de piece sur la case "
	self assert: square contents isEmpty "la case ne contient plus rien"
]

{ #category : 'tests' }
MyChessSquareTest >> testAssignPieceToSpecificSqaretwo [
	| square piece board |
	board := MyChessBoard empty. "cree lequiquier vide toutes les cases sont init"
	square := board at: 'b3'. 
	piece := MyPawn white.
	
	square contents: piece. "on met notre piece sur b3"
	
	self assert: square contents equals: piece "on verifie si elle est bien la"

]

{ #category : 'tests' }
MyChessSquareTest >> testClearSquareContents [ 
	| square piece board |
	board := MyChessBoard empty.
	square := board at: 'b1'.
	piece := MyPawn black.
	
	square contents: piece.
	square emptyContents. "on supp toute la piece "
	
	self assert: square contents isEmpty "on confirme que la case a ete vider"

]

{ #category : 'tests' }
MyChessSquareTest >> testReassignPieceToSquare [ 
	| square piece1 piece2 board |
	board := MyChessBoard empty.
	square := board at: 'a1'.  
	piece1 := MyKnight white.
	piece2 := MyRook black.

	square contents: piece1."on place la piece 1 sur la case"
	self assert: square contents equals: piece1. "on verifie quelle est bien la "

	square contents: piece2."on place la piece 2 sur la case"
	self assert: square contents equals: piece2 "on verifie que cest maintenant la piece `2 qui est presente"
]

{ #category : 'tests' }
MyChessSquareTest >> testSquareContentsAfterAssignment [ 
	| board square piece |
	board := MyChessBoard empty.
	square := board at: 'c3'.
	piece := MyKnight white.

	square contents: piece. "on ajt la piece a c3"

	self assert: square contents equals: piece "cest bien ajt on verifie"

]

{ #category : 'tests' }
MyChessSquareTest >> testSquareContentsIsNil [ "apres modification de code jai juste remplacer isNil dans les tests par isEmpty"
	| board square |
	board := MyChessBoard empty.
	square := board at: 'g6'. "g6 vide au départ"

	self assert: square contents isEmpty."si ca return nil cest que cest bien vide"

]

{ #category : 'tests' }
MyChessSquareTest >> testSquareHasNoPiece [
	| board square |
	board := MyChessBoard empty.
	square := board at: 'b5'. "Case vide"

	self assert: square hasPiece equals: false "b5 na pas de piece"

]

{ #category : 'tests' }
MyChessSquareTest >> testSquareHasPiece [ 
"test de haspiece"
	| board square piece |
	board := MyChessBoard empty.
	square := board at: 'h1'.
	piece := MyRook black.

	square contents: piece. "on place la piece sur h1"

	self assert: square hasPiece "on verifie quelle est bien là"

]

{ #category : 'tests' }
MyChessSquareTest >> testSquareInitiallyEmpty [ 
        | square |
"on creer une instance de myChessSquare sans instancier board "
        square := MyChessSquare basicNew color: Color white; initialize; yourself.
        
        self assert: square contents isEmpty "on verifie que la case est bien vide"
]
