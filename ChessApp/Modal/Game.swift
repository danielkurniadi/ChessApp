//
//  ChessGame.swift
//  ChessApp
//
//  Created by Student 3 on 5/4/18.
//  Copyright © 2018 Student 3. All rights reserved.
//

import UIKit


/**
 The IconSet structure. Creates and holds each icon for each chess piece.
 */
struct IconSet {
    var whitePawn: UIImage!
    var whiteRook: UIImage!
    var whiteKnight: UIImage!
    var whiteBishop: UIImage!
    var whiteQueen: UIImage!
    var whiteKing: UIImage!
    
    var blackPawn: UIImage!
    var blackRook: UIImage!
    var blackKnight: UIImage!
    var blackBishop: UIImage!
    var blackQueen: UIImage!
    var blackKing: UIImage!
    
    init(iconSetName: String){
        whitePawn = UIImage(named: iconSetName + "_white_pawn")
        whiteRook = UIImage(named: iconSetName + "_white_rook")
        whiteKnight = UIImage(named: iconSetName + "_white_knight")
        whiteBishop = UIImage(named: iconSetName + "_white_bishop")
        whiteQueen = UIImage(named: iconSetName + "_white_queen")
        whiteKing = UIImage(named: iconSetName + "_white_king")
        
        blackPawn = UIImage(named: iconSetName + "_black_pawn")
        blackRook = UIImage(named: iconSetName + "_black_rook")
        blackKnight = UIImage(named: iconSetName + "_black_knight")
        blackBishop = UIImage(named: iconSetName + "_black_bishop")
        blackQueen = UIImage(named: iconSetName + "_black_queen")
        blackKing = UIImage(named: iconSetName + "_black_king")
    }
}

class ChessGame{
    
    var whitePlayer : String!
    var blackPlayer : String!
    var iconSet : IconSet!
    
    var playerTurn = PieceColor.white
    
    var chessBoard : Board?{
        didSet{
            guard let unwrappedBoard = chessBoard else{return}
            unwrappedBoard.chessGame = self
            unwrappedBoard.initializeBoard()
        }
    }
    
    init(whitePlayerName: String, blackPlayerName: String, iconSetName: String){
    
        self.whitePlayer = whitePlayerName
        self.blackPlayer = blackPlayerName
        self.iconSet = IconSet(iconSetName: iconSetName)
    
    }
}




