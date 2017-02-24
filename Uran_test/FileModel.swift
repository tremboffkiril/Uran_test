//
//  FileModel.swift
//  Uran_test
//
//  Created by Kiril Trembovetskiy on 2/24/17.
//  Copyright © 2017 Kiril Trembovetskiy. All rights reserved.
//

import Foundation

class FileModel {
    var filename : String!
    var isFolder : String!
    var modDate : Date!
    var isOrange : Bool!
    var isBlue : Bool!
    var file : NSData!
    var typeImage : String!
    
    init() {
      filename = ""
      isFolder = ""
      modDate = Date()
      isOrange = false
      isBlue = false
      file = NSData()
      typeImage = ""
    }
}
