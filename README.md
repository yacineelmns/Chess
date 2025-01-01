# Etudiants       

EL MANSOURI Yacine
DASSI Helyana    
Année 2024-2025     

# Sujet    

Le sujet de ce TP est disponible ici : https://github.com/UnivLille-Meta/Chess

# Introduction     

Dans ce README, vous trouverez ...
( mettre un lien vers un autre readme pour expliquer les katas plus en details )

# Importation du projet     

Pour importer notre projet, il faut préalablement ouvrir une image Pharo 12.0. Puis suivre les étapes suivantes :
- ouvrir un playground ( Browse > Playground )
- executer dans le playground le code suivant:
   
```
Metacello new
	repository: 'github://Yacineelmns/Chess:main';
	baseline: 'MygChess';
	onConflictUseLoaded;
	load.
```

# Execution du projet

Une fois le projet importé, vous pouvez l'executer en suivant les instructions suivantes :
- ouvrir un playground si vous n'en n'avez pas d'ouvert ( Browse > Playground )  
- executer dans le playground le code suivant :

```
board := MyChessGame freshGame.
board size: 800@600.
space := BlSpace new.
space root addChild: board.
space pulse.
space resizable: true.
space show.
```

# Katas choisis   

### Fix pawn moves!

**Goal:** Practice debugging and testing

Pawns are one of the most complicated pieces of chess to implement.
They move forward, one square at a time, except for their first movement.
However, they can move diagonally to capture other pieces.
And in addition, there is the (in)famous "En passant" move that complicates everything (see https://en.wikipedia.org/wiki/En_passant, and the FEN documentation for ideas on how to encode this information https://www.chessprogramming.org/Forsyth-Edwards_Notation#En_passant_target_square).
As any *complicated* feature, the original developer (Guille P) left this for the end, and then left the project.
But you can do it.

Questions and ideas that can help you in the process:
- Can you write tests showing the bugs?
- What kind of tools can you use to spot the bug?
- Can you approach this incrementally? This is, splitting this task in many subtasks. How would you prioritize them?

### Remove nil checks

**Goal:** Practice refactorings and patterns

In the game, each square has optionally a piece.
The absence of a piece is represented as a `nil`.
As any project done in stress during a short period of time (a couple of evenings when the son is sick), the original developer (Guille P) was not 100% following coding standards and quality recommendations.
We would like to clean up the game logic and remove `nil` checks using some polymorphism.
You can do it.

Questions and ideas that can help you in the process:
- How do we transform nil checks into polymorphism?
- What kind of API should you design?
- Can tests help you do it with less pain?
- Something similar happens when a pieces wants to move outside of the board, can you find it and fix it?
