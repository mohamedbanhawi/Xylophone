//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!;

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playKey(keyString: String){
        
        if let audioURL = Bundle.main.url(forResource: "\(keyString)", withExtension: "wav") {
            
            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)

                try audioPlayer = AVAudioPlayer(contentsOf: audioURL, fileTypeHint: AVFileType.wav.rawValue)
                
                audioPlayer?.prepareToPlay()
                audioPlayer?.play()
                
            } catch let error as NSError {
                print(error.description)
            }
        
        }
        else {
            
            print("\(keyString).wav file not found\n")
            
        }
        
    }

    @IBAction func cButtonPressed(_ sender: UIButton) {
        
        
        // titlelable and test are option Strings that's why we need to add !
        playKey(keyString: sender.titleLabel!.text!)
        
        let currentAlpha:CGFloat = sender.alpha;
        
        sender.alpha = currentAlpha*0.5;
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            sender.alpha = currentAlpha;
        })
        
    }
        
}

