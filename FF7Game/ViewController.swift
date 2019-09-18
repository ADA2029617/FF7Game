//
//  ViewController.swift
//  FF7Game
//
//  Created by Partida,Adan on 9/18/19.
//  Copyright © 2019 Partida,Adan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var SephHPChange: UILabel!
    @IBOutlet weak var CloudHPChange: UILabel!
    
    //Cloud attributes
    var cloudHealth = 100
    let cloudCure = 25
    let crossSlash = 10
    let omniSlash = 25
    
    //Sephiroth attributes
    var sephHealth = 250
    let sephMeteor = 15
    //var heartlessAngel = cloudHealth - (cloudHealth - 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //make cloud and seph hp change hidden on open
        SephHPChange.isHidden = true
        CloudHPChange.isHidden = true
    }


}

