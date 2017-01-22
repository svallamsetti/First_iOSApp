//
//  ViewController.swift
//  FirstApp
//
//  Created by Lord of the Day on 1/20/17.
//  Copyright © 2017 Lord of the Day. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rightCardView: UIImageView!
    @IBOutlet weak var cpuScoreView: UILabel!
    var rightScore = 0
    @IBOutlet weak var leftCardView: UIImageView!
    @IBOutlet weak var playerScoreView: UILabel!
    var leftScore = 0
    let initialScore = 0
    
    @IBOutlet weak var dealButton: UIButton!
    @IBAction func playAgain(_ sender: UIButton) {
        reset()
    }
    
    let cardNames = ["card2","card3","card4","card5","card6","card7","card8","card9","card10","jack","king","queen","ace"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dealTapped(_ sender: UIButton) {
        
        // Randomize left card
        let leftRandomNumber:Int = Int(arc4random_uniform(13))
        
        leftCardView.image = UIImage(named: cardNames[leftRandomNumber])
        
        // Randomize right card
        let rightRandomNumber:Int = Int(arc4random_uniform(13))
        rightCardView.image = UIImage(named: cardNames[rightRandomNumber])
        
        if leftRandomNumber>rightRandomNumber{
            leftScore += 1
            playerScoreView.text = String(leftScore)
            if(winner()){
                playerScoreView.text = "!Won!"
            }
        }else if leftRandomNumber==rightRandomNumber{
            
        }else{
            rightScore += 1
            cpuScoreView.text = String(rightScore)
            if(winner()){
                cpuScoreView.text = "!Won!"
            }
        }
        if (leftScore >= 15) || (rightScore >= 15){
            dealButton.isHidden = true
        }
    }
    func winner()->Bool{
        var result = false
        if (rightScore > 0) && (rightScore == 15){
            result = true
            return result
        }
        if (leftScore > 0) && (leftScore == 15){
            result = true
            return result
        }
        return result
    }
    func reset(){
        dealButton.isHidden = false
        leftScore = 0
        rightScore = 0
        playerScoreView.text = String(initialScore)
        cpuScoreView.text = String(initialScore)
        leftCardView.image = UIImage(named:"back")
        rightCardView.image = UIImage(named:"back")

    }
}

