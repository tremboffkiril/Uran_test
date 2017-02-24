//
//  FileTableViewController.swift
//  Uran_test
//
//  Created by Kiril Trembovetskiy on 2/24/17.
//  Copyright © 2017 Kiril Trembovetskiy. All rights reserved.
//

import UIKit
import CoreData

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

class FileTableViewController: UITableViewController {
    var filesName = ["first", "Second", "third", "Kiril"]
    var typesOfFiles = ["pdf", "pdf", "pdf", "folder"]
    var boolFolfer : [Bool] = [false, false, false, true]
    var files : [FileModel] = []
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showSettings") {
            if let indexPath = tableView.indexPathForSelectedRow{
                let settingsController = segue.destination as! SecondTableViewController
                settingsController.navItemTitle = "\(files[indexPath.row].filename)"
            }
        }
    }

    
    func setData(){
        let date = Date()
        for fileName in filesName{
            let file  = FileModel()
            file.modDate = date
            if typesOfFiles[index] == "pdf"{
                let filePath = Bundle.main.path(forResource: fileName, ofType:typesOfFiles[index])
                let data     = NSData(contentsOfFile:filePath!)
                file.filename = "\(fileName).\(typesOfFiles[index])"
                file.typeImage = "iconFile.png"
                file.file = data
                file.isBlue = true
                file.isOrange = true
                file.isFolder = "No"
            
            }else if typesOfFiles[index] == "folder"{
                file.filename = "\(fileName).\(typesOfFiles[index])"
                file.typeImage = "iconFolder.png"
                file.isBlue = true
                file.isOrange = false
                file.isFolder = "Yes"
            }
          files.append(file)
          index += 1
        }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "fileCell", for: indexPath) as! FileCell
        
        let calendar = NSCalendar.current
        let day = calendar.component(.day, from: files[indexPath.row].modDate as Date)
        let month = calendar.component(.month, from: files[indexPath.row].modDate as Date)
        let year = calendar.component(.year, from: files[indexPath.row].modDate as Date)
        
        cell.imTypeFile.image = UIImage(named: files[indexPath.row].typeImage)
        cell.lFileName.text = files[indexPath.row].filename
        cell.lModDate.text = "modified \(month) \(day), \(year)"
        
        if files[indexPath.row].isOrange == true && files[indexPath.row].isBlue == true{
            cell.vOrange.backgroundColor = UIColor(netHex: 0xFF8825)
            cell.vBlue.backgroundColor = UIColor(netHex: 0x22B1FF)
        }else if files[indexPath.row].isOrange == false && files[indexPath.row].isBlue == true{
            cell.vOrange.backgroundColor = UIColor(netHex: 0x22B1FF)
            cell.vBlue.backgroundColor = UIColor(netHex: 0x22B1FF)
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if files[indexPath.row].isFolder == "Yes"{
            self.performSegue(withIdentifier: "showFolder", sender: nil)
        }else{
            print("File : \(files[indexPath.row].filename)")
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
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
