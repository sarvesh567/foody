//
//  DocumentDirectory.swift
//  Foody
//
//  Created by Sarvesh Patel on 12/02/21.
//

import Foundation
import UIKit
extension UIViewController{
func saveDocUrlInDocumentDirectory(filename:String) {
    // get the documents directory url
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let fileURL = documentsDirectory.appendingPathComponent(filename)
    // get your UIImage jpeg data representation and check if the destination file url already exists
    if !FileManager.default.fileExists(atPath:fileURL.path) {
        do {
            // writes the image data to disk
            var zipData: NSData! = NSData()
            do {
                zipData = try NSData(contentsOf: fileURL, options: NSData.ReadingOptions())
            }
            catch {
                // print("- error during get nsdata from zip file\(error)")
            }
            try zipData.write(to: fileURL)       // print("file saved")
        }
        catch {
            //print("error saving file:", error)
        }
    }
}
    
}

