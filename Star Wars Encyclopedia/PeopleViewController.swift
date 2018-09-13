//
//  ViewController.swift
//  Star Wars Encyclopedia
//
//  Created by Tiange Wang on 9/12/18.
//  Copyright © 2018 Tiange Wang. All rights reserved.
//

import UIKit

class PeopleViewController: UITableViewController {

    var people: [NSDictionary] = []
    var names: [String] = []
    
    var name: String = ""
    var gender: String = ""
    var birthyear: String = ""
    var mass: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        StarWarsModel.getAllPeople(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
            data, response, error in
            do {
                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    if let results = jsonResult["results"] as? NSArray {
                        for person in results {
                            let personDict = person as! NSDictionary
                            self.people.append(personDict)
                            self.names.append(personDict["name"]! as! String)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // if we return - sections we won't have any sections to put our rows in
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people in our data array
        return names.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a generic cell
        let cell = UITableViewCell()
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = names[indexPath.row]
        // return the cell so that it can be rendered
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        name = people[indexPath.row]["name"]! as! String
        gender = people[indexPath.row]["gender"]! as! String
        birthyear = people[indexPath.row]["birth_year"]! as! String
        mass = people[indexPath.row]["mass"]! as! String
        performSegue(withIdentifier: "PersonDetail", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PersonDetailViewController
        destination.name = name
        destination.gender = gender
        destination.birthyear = birthyear
        destination.mass = mass
    }
    
}

