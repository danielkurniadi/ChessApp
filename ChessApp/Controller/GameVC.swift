//
//  GameViewController.swift
//  ChessApp
//
//  Created by Student 3 on 6/4/18.
//  Copyright © 2018 Student 3. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    //board UIView from Main.storyboard
    @IBOutlet weak var board: Board!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let game = ChessGame(whitePlayerName: "Player 1", blackPlayerName: "Player 2", iconSetName: "Maya")
        board.chessGame = game
        game.chessBoard = board
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    

}
