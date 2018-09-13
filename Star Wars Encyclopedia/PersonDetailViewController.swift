//
//  PersonDetailViewController.swift
//  Star Wars Encyclopedia
//
//  Created by Tiange Wang on 9/13/18.
//  Copyright © 2018 Tiange Wang. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {

    var name: String = ""
    var gender: String = ""
    var birthyear: String = ""
    var mass: String = ""
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        genderLabel.text = gender
        birthYearLabel.text = birthyear
        massLabel.text = mass
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
