//
//  ViewController.swift
//  Project1
//
//  Created by Asa Jenkins on 10/15/16.
//  Copyright © 2016 Asa Jenkins. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Image Viewer"
        
        navigationController?.navigationBar.barStyle = UIBarStyle.blackOpaque
        navigationController?.navigationBar.tintColor = UIColor.white
        
        let fm = FileManager.default // get ready fileManager
        let path = Bundle.main.resourcePath! // get the path
        let items = try! fm.contentsOfDirectory(atPath: path) // try the path
        
        for item in items {         // search for items with prefix "ic" i.e. images
            if item.hasPrefix("ic") {
                // load this picture
                pictures.append(item)
            }
        }
        
        print(pictures)
    }
    
    // get the number of pictures in our array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // return's a "UITableViewCell"
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        // 1. try loading detailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2. success! Set selectedImage propery
            vc.selectedImage = pictures[indexPath.row]
            
            // 3. push onto nav controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

