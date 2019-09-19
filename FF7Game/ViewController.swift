//
//  ViewController.swift
//  FF7Game
//
//  Created by Partida,Adan on 9/18/19.
//  Copyright © 2019 Partida,Adan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //creating label outlets
    @IBOutlet weak var SephHPChange: UILabel!
    @IBOutlet weak var CloudHPChange: UILabel!
    @IBOutlet weak var TurnDescription: UILabel!
    @IBOutlet weak var SephTurnLabel: UILabel!
    @IBOutlet weak var CloudTurnLabel: UILabel!
    @IBOutlet weak var SephHPLabel: UILabel!
    @IBOutlet weak var CloudHPLabel: UILabel!
    
    //Cloud attributes
    var cloudHealth = 100
    let cloudCure = 25
    let crossSlash = 10
    let braver = 15
    let omniSlash = 25
    
    //Sephiroth attributes
    var sephHealth = 250
    let sephTremblingEarth = 15
    let sephZanshin = 5
    let sephScintilla = 25
    
    //keeps track of whose turn it is
    var isPlayersTurn = true
    
    //allowed actions per turn. max is 1 and 0 means no action has
    //been taken
    var actionCounter = 0
    var omniSlashCooldown = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //make cloud and seph hp change hidden on open
        SephHPChange.isHidden = true
        CloudHPChange.isHidden = true
        TurnDescription.isHidden = true
    }
    
    
    //Sephiroth AI logic
    
    
    /*Subtracts crossSlash from sephhealth
     displays -crossSlash on SephHPChange label
     displays Cloud used Cross Slash in TurnDescription label
     unhides sephHPChange and turnDescription
     */
    @IBAction func CrossSlashButton(_ sender: Any) {
        sephHealth -= crossSlash
        SephHPChange.text = "-10 HP"
        SephHPLabel.text = String(sephHealth)
        TurnDescription.text = "Cloud used Cross Slash"
        SephHPChange.isHidden = false
        TurnDescription.isHidden = false
        isPlayersTurn = false
    }
    
    /*Subtracts cloudOmnislash from sephhealth
     displays -cloudOmniSlash on SephHPChange label
     displays Cloud used OmniSlash in TurnDescription label
     unhides sephHPChange and TurnDescription
     */
    @IBAction func OmnislashButton(_ sender: Any) {
        sephHealth -= omniSlash
        SephHPChange.text = "-25 HP"
        SephHPLabel.text = String(sephHealth)
        TurnDescription.text = "Cloud used Omnislash"
        SephHPChange.isHidden = false
        TurnDescription.isHidden = false
        isPlayersTurn = false
    }
    
    /*Subtracts braver from sephhealth
     displays -braver on SephHPChange label
     displays Cloud used Braver in TurnDescription label
     unhides sephHPChange and TurnDescription
     */
    @IBAction func BraverButton(_ sender: Any) {
        sephHealth -= braver
        SephHPChange.text = "-15 HP"
        SephHPLabel.text = String(sephHealth)
        TurnDescription.text = "Cloud used Braver"
        SephHPChange.isHidden = false
        TurnDescription.isHidden = false
        isPlayersTurn = false
    }
    
    /*Adds cloudCure to cloudHealth
     displays +cloudCure on CloudHPChange label
     displays Cloud used Cure in TurnDescription label
     can only heal up to cloudHealth
     unhides CloudHPChange and TurnDescription
     */
    @IBAction func Curebutton(_ sender: Any) {
        
        //if cloudHealth would go over 100, then heal to max HP
        if cloudHealth <= 75 {
            cloudHealth += cloudCure
        } else if cloudHealth > 75 {
            cloudHealth = 100
        }
        
        CloudHPChange.text = "+25 HP"
        CloudHPLabel.text = String(cloudHealth)
        TurnDescription.text = "Cloud used Cure"
        CloudHPChange.isHidden = false
        TurnDescription.isHidden = false
        isPlayersTurn = false
    }
    
}

