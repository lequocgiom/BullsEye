//
//  AboutAuthorViewController.swift
//  BullsEyes
//
//  Created by Le Trung on 4/19/19.
//  Copyright © 2019 Le Trung. All rights reserved.
//

import UIKit

class AboutAuthorViewController: UIViewController {
    
    
    @IBOutlet weak var persistentImage : UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        persistentImage.image = UIImage(named: "persistent")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToTheGame() {
        dismiss(animated: true, completion: nil)
    }

}
