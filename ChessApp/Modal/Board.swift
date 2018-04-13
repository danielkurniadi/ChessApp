//
//  ChessBoard.swift
//  ChessApp
//
//  Created by Student 3 on 4/4/18.
//  Copyright © 2018 Student 3. All rights reserved.
//

import UIKit

class Board: UIView{
    
    //Declaration
    
    /**
     2D array to hold the game's `BoardSpace`s in a grid pattern.
     Note that the coordinates start from the bottom-left, at 0,0.
     */
    var boardSpaces = [[BoardSpace]]()
    
    /**
     Connecting the current game instance to our board
     */
    var chessGame : ChessGame?{
        didSet{
            guard let unwrappedGame = chessGame else{return}
            self.playerTurn = unwrappedGame.playerTurn
        }
    }
    
    /**
     The `BoardSpace` currently highlighted.
     */
    var highlightedSpace: BoardSpace!
    
    /**
     The normal background `NSColor` of the `BoardSpace` that is currently highlighted.
     Needed to restore the `BoardSpace`'s color back to normal after its highlight is removed.
     */
    var highlightedColor: UIColor!
    
    /**
     Should the particular tile/boardspace white or black?
     */
    var whiteFill = false
    
    /**
     Highlighting piece that is choosen. Highlight with Yellow color
     */
    func highlightPiece(_ space: BoardSpace){
        if let tile = highlightedSpace{
            tile.backgroundColor = highlightedColor
        }
        highlightedSpace = space
        highlightedColor = space.backgroundColor
        space.backgroundColor = UIColor.yellow
        
        print(space.x, space.y)
    }
    func clearHighlight(){
        if let tile = highlightedSpace{
            tile.backgroundColor = highlightedColor
            highlightedSpace = nil
            highlightedColor = nil
            
        }
    }
    
    /**
     The game instance define whose turn is it
     */
    var playerTurn: PieceColor?
    
    
    /** Constructor for the Board class. This is to handle all the View and Board Rules
     */
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.playerTurn = chessGame?.playerTurn
        
         // Everything between this line and line ___ is the definition of the tapEventHandler callback.
        
        // Through an 8x8 chess board, we make display and control the event tap handler
        for column in 0..<8{
            var columnSpace = [BoardSpace]()
            whiteFill = !whiteFill
           
            for row in 0..<8{
                let boardSpace = BoardSpace(xPixel: CGFloat(column*50), yPixel: CGFloat(row*50), fillWhite: whiteFill){
                    
                    // This is by definition the Event Tap Listener for our Chess Board Game
                    // When users tap to select, deselect, and move the chess piece(s)
                    space in
    
                    let occupant = space.occupyingPiece
                    var occupantIsAlly = false
                    
                    if occupant != nil{
                        if occupant?.pieceColor == self.playerTurn{
                            occupantIsAlly = true
                        }
                    }
                    
                    if let highlightedTile = self.highlightedSpace, let highlightedPiece = self.highlightedSpace!.occupyingPiece { // if a tile/boardspace is already higlighted -> RESELECT or MOVE most probably
                        
                        if (highlightedTile.x == space.x) && (highlightedTile.y==space.y){ //highlighted Tile tapped again
                            self.clearHighlight()
                            return
                        }
                        
                        if occupantIsAlly {
                            self.clearHighlight()
                            self.highlightPiece(space)
                            return
                        }
                    }
                        
                    else { // nothing is highlighted yet
                        if occupantIsAlly{
                            self.highlightPiece(space)
                            return
                        }
                    }
                    
                    self.clearHighlight() //just for safe, we don't want any random yellow tile appear
                }
                
                addSubview(boardSpace)
                whiteFill = !whiteFill
            
                columnSpace.append(boardSpace)
            }
        
                boardSpaces.append(columnSpace)
        }
}
    
    
    func initializeBoard(){
        let pieceIcon = IconSet(iconSetName: "maya")
        
        // Setup all pieces for White Side
        for i in 0..<8{
            boardSpaces[i][1].setPiece(chessPiece: ChessPiece(image: pieceIcon.blackPawn, color: PieceColor.black))
        }
        boardSpaces[0][0].setPiece(chessPiece: ChessPiece(image: pieceIcon.blackRook, color: PieceColor.black))
        boardSpaces[1][0].setPiece(chessPiece: ChessPiece(image: pieceIcon.blackKnight, color: PieceColor.black))
        boardSpaces[2][0].setPiece(chessPiece: ChessPiece(image: pieceIcon.blackBishop, color: PieceColor.black))
        boardSpaces[3][0].setPiece(chessPiece: ChessPiece(image: pieceIcon.blackQueen, color: PieceColor.black))
        boardSpaces[4][0].setPiece(chessPiece: ChessPiece(image: pieceIcon.blackKing, color: PieceColor.black))
        boardSpaces[5][0].setPiece(chessPiece: ChessPiece(image: pieceIcon.blackBishop, color: PieceColor.black))
        boardSpaces[6][0].setPiece(chessPiece: ChessPiece(image: pieceIcon.blackKnight, color: PieceColor.black))
        boardSpaces[7][0].setPiece(chessPiece: ChessPiece(image: pieceIcon.blackRook, color: PieceColor.black))
        
        
        // Setup all pieces for Black Side
        for i in 0..<8{
           boardSpaces[i][6].setPiece(chessPiece: ChessPiece(image: pieceIcon.whitePawn, color: PieceColor.white))
        }
        boardSpaces[0][7].setPiece(chessPiece: ChessPiece(image: pieceIcon.whiteRook, color: PieceColor.white))
        boardSpaces[1][7].setPiece(chessPiece: ChessPiece(image: pieceIcon.whiteKnight, color: PieceColor.white))
        boardSpaces[2][7].setPiece(chessPiece: ChessPiece(image: pieceIcon.whiteBishop, color: PieceColor.white))
        boardSpaces[3][7].setPiece(chessPiece: ChessPiece(image: pieceIcon.whiteQueen, color: PieceColor.white))
        boardSpaces[4][7].setPiece(chessPiece: ChessPiece(image: pieceIcon.whiteKing, color: PieceColor.white))
        boardSpaces[5][7].setPiece(chessPiece: ChessPiece(image: pieceIcon.whiteBishop, color: PieceColor.white))
        boardSpaces[6][7].setPiece(chessPiece: ChessPiece(image: pieceIcon.whiteKnight, color: PieceColor.white))
        boardSpaces[7][7].setPiece(chessPiece: ChessPiece(image: pieceIcon.whiteRook, color: PieceColor.white))
    }
}
