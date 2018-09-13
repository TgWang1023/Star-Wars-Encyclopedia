//
//  FilmsViewController.swift
//  Star Wars Encyclopedia
//
//  Created by Tiange Wang on 9/12/18.
//  Copyright © 2018 Tiange Wang. All rights reserved.
//

import UIKit

class FilmsViewController: UITableViewController {

    var films: [[String: Any]] = []
    var titles: [String] = []
    
    var titlel: String = ""
    var releasedate: String = ""
    var director: String = ""
    var openingcrawl: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StarWarsModel.getAllFilms(completionHandler: {
            // see: Swift closure expression syntax
            data, response, error in
            do {
                // try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    // Why do we need to optionally unwrap jsonResult["results"]
                    // Try it without the optional unwrapping and you'll see that the value is actually an optional
                    if let results = jsonResult["results"] {
                        // coercing the results object as an NSArray and then storing that in resultsArraycopy
                        let resultsArray = results as! NSArray
                        // now we can run NSArray methods like count and firstObject
                        for film in resultsArray {
                            let temp = film as! [String: Any]
                            self.films.append(temp)
                            let temp2 = temp["title"]! as! String
                            self.titles.append(temp2)
                        }
                        DispatchQueue.main.async { [unowned self] in
                            self.tableView.reloadData()
                        }
                    }
                }
            } catch {
                print(error)
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // if we return - sections we won't have any sections to put our rows in
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people in our data array
        return titles.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a generic cell
        let cell = UITableViewCell()
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = titles[indexPath.row]
        // return the cell so that it can be rendered
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        titlel = films[indexPath.row]["title"]! as! String
        releasedate = films[indexPath.row]["release_date"]! as! String
        director = films[indexPath.row]["director"]! as! String
        openingcrawl = films[indexPath.row]["opening_crawl"]! as! String
        performSegue(withIdentifier: "FilmDetail", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! FilmDetailViewController
        destination.titlel = titlel
        destination.releasedate = releasedate
        destination.director = director
        destination.openingcrawl = openingcrawl
    }

}
