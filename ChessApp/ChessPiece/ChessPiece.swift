//
//  ChessPiece.swift
//  ChessApp
//
//  Created by Student 3 on 6/4/18.
//  Copyright © 2018 Student 3. All rights reserved.
//

import UIKit

enum PieceColor{
    case black
    case white
}

class ChessPiece{
    
    var pieceImage : UIImage!
    var pieceColor : PieceColor!
    
    init(image: UIImage, color: PieceColor){
        pieceImage = image
        pieceColor = color
    }
    
    
}
