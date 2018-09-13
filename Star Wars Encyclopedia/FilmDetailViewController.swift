//
//  FilmDetailViewController.swift
//  Star Wars Encyclopedia
//
//  Created by Tiange Wang on 9/13/18.
//  Copyright © 2018 Tiange Wang. All rights reserved.
//

import UIKit

class FilmDetailViewController: UIViewController {

    var titlel: String = ""
    var releasedate: String = ""
    var director: String = ""
    var openingcrawl: String = ""
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var openingCrawlLabel: UILabel!
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titlel
        releaseDateLabel.text = releasedate
        directorLabel.text = director
        openingCrawlLabel.text = openingcrawl
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}
