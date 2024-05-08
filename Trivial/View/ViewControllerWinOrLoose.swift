//
//  ViewControllerWinOrLoose.swift
//  Trivial
//
//  Created by Mañanas on 8/5/24.
//

import UIKit

class ViewControllerWinOrLoose: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    var win: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        if win {
            
            titleLabel.text = "You Win"
            
        } else{
            
            titleLabel.text = "You Lose"
        }
    }
    

}
