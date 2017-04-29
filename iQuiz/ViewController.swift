//
//  ViewController.swift
//  iQuiz
//
//  Created by Muhaamed Drammeh on 4/28/17.
//  Copyright © 2017 Muhaamed Drammeh. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    
    @IBAction func settingButton(_ sender: UIBarButtonItem) {
        let view = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        view.addAction(defaultAction)
        self.present(view, animated: true, completion: nil)
    }
    
    let subjects = ["Mathematics","Marvel Super Heroes","Science"]
    let desc = ["adding and stuff like that","superman and stuff","nerdy stuff"]
    let iconsNames = ["Math.png","Marvel.png","Science.png"]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        cell.imageView?.image = UIImage(named: iconsNames[indexPath.row])
        cell.textLabel?.text = subjects[indexPath.row]
        cell.detailTextLabel?.text = desc[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

