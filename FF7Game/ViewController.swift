//
//  ViewController.swift
//  FF7Game
//
//  Created by Partida,Adan on 9/18/19.
//  Copyright © 2019 Partida,Adan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //OUTLETS

    //creating label outlets
    @IBOutlet weak var SephHPChange: UILabel!
    @IBOutlet weak var CloudHPChange: UILabel!
    @IBOutlet weak var TurnDescription: UILabel!
    @IBOutlet weak var SephTurnLabel: UILabel!
    @IBOutlet weak var CloudTurnLabel: UILabel!
    @IBOutlet weak var SephHPLabel: UILabel!
    @IBOutlet weak var CloudHPLabel: UILabel!
    
    //create button outlets
    @IBOutlet weak var CrossSlashButtonOutlet: UIButton!
    @IBOutlet weak var BraverButtonOutlet: UIButton!
    @IBOutlet weak var OmnislashButtonOutlet: UIButton!
    @IBOutlet weak var CureButtonOutlet: UIButton!
    @IBOutlet weak var RestartButtonOutlet: UIButton!
    
    //------------PROGRAM VALUES--------------//
    
    
    //Cloud attributes
    let cloudMaxHealth = 100
    var cloudHealth = 100
    let cloudCure = 25
    let crossSlash = 10
    let braver = 15
    let omniSlash = 25
    var isCloudDead = false
    
    //Sephiroth attributes
    let sephMaxhealth = 250
    var sephHealth = 250
    let sephTremblingEarth = 15
    let sephZanshin = 5
    let sephScintilla = 25
    var isSephDead = false
    
    
    //-----------MAIN VIEW FUNCTION-----------//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //make cloud and seph hp change hidden on open
        SephHPChange.isHidden = true
        CloudHPChange.isHidden = true
        
        //start of battle has no info to be displayed for turns
        TurnDescription.isHidden = true
        
        //the battle will start with cloud's turn
        SephTurnLabel.isHidden = true
        
        //display seph and cloud's starting HP
        CloudHPLabel.text = String(cloudHealth) + "/" + String(cloudMaxHealth)
        SephHPLabel.text = String(sephHealth) + "/" + String(sephMaxhealth)
    }
    
    //--------------MY FUNCTIONS-------------//
    
    //disables all of cloud's buttons
    func disableButtons() {
        CrossSlashButtonOutlet.isHidden = true
        OmnislashButtonOutlet.isHidden = true
        BraverButtonOutlet.isHidden = true
        CureButtonOutlet.isHidden = true
    }
    
    //resets all values to their defaults for another battle
    func SetGame() {
        
        //show all buttons that were hidden by battle ending
        CrossSlashButtonOutlet.isHidden = false
        OmnislashButtonOutlet.isHidden = false
        BraverButtonOutlet.isHidden = false
        CureButtonOutlet.isHidden = false
        
        //set hp values to original
        sephHealth = sephMaxhealth
        cloudHealth = cloudMaxHealth
        
        //hide hp change labels
        CloudHPChange.isHidden = true
        SephHPChange.isHidden = true
        
        //hide turn description label
        TurnDescription.isHidden = true
        
        //reset hpNumber label values
        SephHPLabel.text = String(sephMaxhealth) + "/" + String(sephMaxhealth)
        CloudHPLabel.text = String(cloudMaxHealth) + "/" + String(cloudMaxHealth)
        
        //hide restart button
        RestartButtonOutlet.isHidden = true
        
    }
    
    
    //Sephiroth AI function
    func haveSephMakeTurn() {
        let sephRandomInt = Int.random(in: 1..<4)
        
        if sephRandomInt == 1 {
            cloudHealth -= sephTremblingEarth
            CloudHPChange.text = "-" + String(sephTremblingEarth) + " HP"
            CloudHPLabel.text = String(cloudHealth) + "/" + String(cloudMaxHealth)
            TurnDescription.text = "Sephiroth used Trembling Earth"
        } else if sephRandomInt == 2 {
            cloudHealth -= sephZanshin
            CloudHPChange.text = "-" + String(sephZanshin) + " HP"
            CloudHPLabel.text = String(cloudHealth) + "/" + String(cloudMaxHealth)
            TurnDescription.text = "Sephiroth used Zanshin"
        } else if sephRandomInt == 3 {
            cloudHealth -= sephScintilla
            CloudHPChange.text = "-" + String(sephScintilla) + " HP"
            CloudHPLabel.text = String(cloudHealth) + "/" + String(cloudMaxHealth)
            TurnDescription.text = "Sephiroth used Scintilla"
        }
        
        if cloudHealth <= 0 {
            TurnDescription.text = "You died."
            CloudHPLabel.text = "0/ " + String(cloudMaxHealth)
            disableButtons()
            RestartButtonOutlet.isHidden = false
            
        } else if sephHealth <= 0 {
            TurnDescription.text = "You win."
            SephHPLabel.text = "0/ " + String(sephMaxhealth)
            disableButtons()
            RestartButtonOutlet.isHidden = false
        }
        
    }
    
    //------------ACTIONS------------------//
    
    /*Subtracts crossSlash from sephhealth
     displays -crossSlash on SephHPChange label
     displays Cloud used Cross Slash in TurnDescription label
     unhides sephHPChange and turnDescription
     */
    @IBAction func CrossSlashButton(_ sender: Any) {
        sephHealth -= crossSlash
        SephHPChange.text = "-" + String(crossSlash) + " HP"
        SephHPLabel.text = String(sephHealth) + "/" + String(sephMaxhealth)
        TurnDescription.text = "Cloud used Cross Slash"
        SephHPChange.isHidden = false
        TurnDescription.isHidden = false
        haveSephMakeTurn()
    }
    
    /*Subtracts cloudOmnislash from sephhealth
     displays -cloudOmniSlash on SephHPChange label
     displays Cloud used OmniSlash in TurnDescription label
     unhides sephHPChange and TurnDescription
     */
    @IBAction func OmnislashButton(_ sender: Any) {
        sephHealth -= omniSlash
        SephHPChange.text = "-" + String(omniSlash) + " HP"
        SephHPLabel.text = String(sephHealth) + "/" + String(sephMaxhealth)
        TurnDescription.text = "Cloud used Omnislash"
        SephHPChange.isHidden = false
        TurnDescription.isHidden = false
        haveSephMakeTurn()
    }
    
    /*Subtracts braver from sephhealth
     displays -braver on SephHPChange label
     displays Cloud used Braver in TurnDescription label
     unhides sephHPChange and TurnDescription
     */
    @IBAction func BraverButton(_ sender: Any) {
        sephHealth -= braver
        SephHPChange.text = "-" + String(braver) + " HP"
        SephHPLabel.text = String(sephHealth) + "/" + String(sephMaxhealth)
        TurnDescription.text = "Cloud used Braver"
        SephHPChange.isHidden = false
        TurnDescription.isHidden = false
        haveSephMakeTurn()
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
        
        CloudHPChange.text = "+" + String(cloudCure) + " HP"
        CloudHPLabel.text = String(cloudHealth) + "/" + String(cloudMaxHealth)
        TurnDescription.text = "Cloud used Cure"
        CloudHPChange.isHidden = false
        TurnDescription.isHidden = false
        haveSephMakeTurn()
    }
    
    //runs the setgame function to restart the battle values
    @IBAction func RestartButton(_ sender: Any) {
        SetGame()
    }
    
    
}

