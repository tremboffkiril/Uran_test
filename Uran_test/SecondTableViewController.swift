//
//  SecondTableViewController.swift
//  Uran_test
//
//  Created by Kiril Trembovetskiy on 2/24/17.
//  Copyright © 2017 Kiril Trembovetskiy. All rights reserved.
//

import UIKit

class SecondTableViewController: UITableViewController {

    var filesName = ["first", "Second", "third"]
    var typesOfFiles = ["pdf", "pdf", "pdf"]
    var boolFolfer : [Bool] = [false, false, false]
    var files : [FileModel] = []
    var index = 0
    var navItemTitle : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = navItemTitle
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont(name: "Helvetica Neue", size: 18)!]

        setData()
    }

    //MARK: - Set data
    func setData(){
        let date = Date()
        for fileName in filesName{
            let file  = FileModel()
            file.modDate = date
            let filePath = Bundle.main.path(forResource: fileName, ofType:typesOfFiles[index])
            let data     = NSData(contentsOfFile:filePath!)
            file.filename = "\(fileName).\(typesOfFiles[index])"
            file.typeImage = "iconFile.png"
            file.file = data
            file.isBlue = true
            file.isOrange = true
            file.isFolder = "No"
            files.append(file)
            index += 1
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filesName.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath) as! SecondCell
        let calendar = NSCalendar.current
        let day = calendar.component(.day, from: files[indexPath.row].modDate as Date)
        let month = calendar.component(.month, from: files[indexPath.row].modDate as Date)
        let year = calendar.component(.year, from: files[indexPath.row].modDate as Date)
        
        cell.imType.image = UIImage(named: files[indexPath.row].typeImage)
        cell.lFileName.text = files[indexPath.row].filename
        cell.lDateMod.text = "modified \(month) \(day), \(year)"
        cell.vOrange.backgroundColor = UIColor(netHex: 0xFF8825)
        cell.vBlue.backgroundColor = UIColor(netHex: 0x22B1FF)
        return cell
    }
 
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let more = UITableViewRowAction(style: .normal, title: "More") { action, index in
            print("more button tapped")
        }
        //more.backgroundColor = UIColor(patternImage: UIImage(named: "buy.jpg")!)
        more.backgroundColor = UIColor.orange
        
        let favorite = UITableViewRowAction(style: .normal, title: "Favorite") { action, index in
            print("favorite button tapped")
        }
        //favorite.backgroundColor = UIColor(patternImage: UIImage(named: "call.jpg")!)
        favorite.backgroundColor = UIColor.lightGray
        
        let share = UITableViewRowAction(style: .normal, title: "Share") { action, index in
            print("share button tapped")
        }
        //share.backgroundColor = UIColor(patternImage: UIImage(named: "calc.jpg")!)
        share.backgroundColor = UIColor.blue
        return [share, favorite, more]
    }
}
