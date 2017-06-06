//
//  ViewController.swift
//  War
//
//  Created by Ruben Pena on 3/12/17.
//  Copyright © 2017 BravoTech. All rights reserved.
//

import UIKit;

import AVFoundation;

class ViewController: UIViewController {
    //testtttt
    @IBOutlet weak var rightImageView: UIImageView!;
    @IBOutlet weak var leftImageView: UIImageView!;
    @IBOutlet weak var leftScoreLabel: UILabel!;
    @IBOutlet weak var rightScoreLabel: UILabel!;
    var rightScore = 0;
    var leftScore = 0;
    var player:AVAudioPlayer = AVAudioPlayer();
    
    
    
    let cardName = ["card2","card3","card4","card5","card6","card7","card8","card9","card10","jack","queen","king","ace"];
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        
        do{
            let audioPath = Bundle.main.path(forResource: "shots", ofType: "mp3");
            try player = AVAudioPlayer(contentsOf: NSURL (fileURLWithPath: audioPath!) as URL);
        }catch {
        //SOME ERROR HERE
        }
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }


    @IBAction func dealTapped(sender:UIButton){
        
        //print("deal tapped");
        
        player.play();
        
        //randomize cards
        let leftNumber = Int(arc4random_uniform(13));
        let rightNumber = Int(arc4random_uniform(13));
        
        leftImageView.image = UIImage(named: cardName[leftNumber]);
        rightImageView.image = UIImage(named: cardName[rightNumber]);
        
        
        
        if leftNumber > rightNumber {
            leftScore += 1;
            leftScoreLabel.text = String(leftScore);
        }else if leftNumber == rightNumber {
            // do nothing
        }else {
            rightScore += 1;
            rightScoreLabel.text = String(rightScore);
        }
        
    }
}

