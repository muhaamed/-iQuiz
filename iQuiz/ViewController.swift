//
//  ViewController.swift
//  iQuiz
//
//  Created by Muhaamed Drammeh on 4/28/17.
//  Copyright © 2017 Muhaamed Drammeh. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var fetchedQuiz = [Quiz]()
   
    @IBAction func settingButton(_ sender: UIBarButtonItem) {
        let view = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        view.addAction(defaultAction)
        self.present(view, animated: true, completion: nil)
    }
    
    let subjects = ["Mathematics","Marvel Super Heroes","Science"]
    let desc = ["adding and stuff like that","superman and stuff","nerdy stuff"]
    let iconsNames = ["Math.png","Marvel.png","Science.png"]
    
    //var jsonArray:[Any] = ["gggggg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getJsonFile()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.tableFooterView = UIView()
        
        
    }// end of viedDidLoad

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedQuiz.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        cell.imageView?.image = UIImage(named: iconsNames[indexPath.row])
        cell.textLabel?.text = fetchedQuiz[indexPath.row].title
        cell.detailTextLabel?.text = fetchedQuiz[indexPath.row].desc
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let cell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        QuestionViewController.cellName = (cell.textLabel?.text!)!
        QuestionViewController.fetchedQuizOnQuestionViewController = fetchedQuiz
        let viewController = storyboard?.instantiateViewController(withIdentifier: "question")
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func getJsonFile() {
        let url = URL(string: "http://tednewardsandbox.site44.com/questions.json")
        let sessionConfiq = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiq)
    
        DispatchQueue.global().async {
            let task = session.dataTask(with: url!) {(data, response, err) in
                if err != nil
                {
                    print ("ERROR")
                }else{
                    if let content = data{
                        do{
                            let myJson = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                            for eachQuizFromData in myJson {
                                let eachQuiz = eachQuizFromData as! [String : Any]
                                let title = eachQuiz["title"] as! String
                                let desc = eachQuiz["desc"] as! String
                                let questions : [Dictionary<String,Any>] = eachQuiz["questions"] as! Array
                                self.fetchedQuiz.append(Quiz(title: title, desc: desc, questions: questions))
                            }
                            self.tableView.reloadData()
                            //print (self.fetchedQuiz[0].title)
                            //self.jsonArray = myJson
                            //print(self.jsonArray[0])
                            
                        }
                        catch{

                        }
                    }
                }
                
            }
            
            task.resume()
            DispatchQueue.main.async {
                //self.jsonArray = myJson
            }

        }
        
    }


}

// DataClass
class Quiz {
    var title : String
    var desc : String
    var questions : [Dictionary<String, Any>]
    //var question
    init(title : String, desc : String, questions : [Dictionary<String, Any>]) {
        self.title = title
        self.desc = desc
        self.questions = questions
    }
}





















