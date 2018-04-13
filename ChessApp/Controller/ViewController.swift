//
//  ViewController.swift
//  ChessApp
//
//  Created by Student 3 on 4/4/18.
//  Copyright © 2018 Student 3. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // This is game setting ViewController
    
    @IBOutlet weak var Side1Label: UILabel!
    @IBOutlet weak var Side2Label: UILabel!
    
    @IBOutlet weak var Player1TextField: UITextField!
    @IBOutlet weak var Player2TextField: UITextField!
    

    var swapped = false
    
    @IBAction func SwapBtn(_ sender: Any) {
        if(swapped){
            Side1Label.text = "White Side"
            Side2Label.text = "Black Side"
            swapped = !swapped
        }
        else{
            Side1Label.text = "Black Side"
            Side2Label.text = "White Side"
            swapped = !swapped
        }
    }
    
    @IBAction func StartBtn(_ sender: Any) {
        guard let destinationNC = storyboard?.instantiateViewController(withIdentifier: "GameViewController")
            else {return}
        present(destinationNC, animated: true, completion: nil)
    }


}

