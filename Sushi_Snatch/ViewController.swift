//
//  ViewController.swift
//  Sushi_Snatch
//
//  Created by Philip Song on 2018-05-07.
//  Copyright © 2018 Developers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bakgrund: UIImageView!
    
    @IBOutlet weak var sushiTextlbl: UILabel! //ishidden
    @IBOutlet weak var bakgrundStartScreen: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var snatch: UILabel!
    
    
    
    
    
    @IBAction func playButtonIsPressed(_ sender: Any) {
        bakgrundStartScreen.isHidden = true
        snatch.isHidden = true
        playButton.isHidden = true
        sushiTextlbl.isHidden = true
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

