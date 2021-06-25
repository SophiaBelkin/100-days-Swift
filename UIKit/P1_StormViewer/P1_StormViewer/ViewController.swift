//
//  ViewController.swift
//  P1_StormViewer
//
//  Created by Sophia Lu on 6/25/21.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    //screen has loaded, and is ready for you to customize
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // bundle is a directory containing our compiled program and all our assets
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Pictures"
        let path = Bundle.main.resourcePath!
        let items = try! FileManager.default.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.starts(with: "nssl") {
                pictures.append(item)
            }
        }
    }
}

extension ViewController {
    // number of roles
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pictures.count
    }
    
    // cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            // 2: success! Set its selectedImage property
            vc.selectedImage = pictures[indexPath.row]

            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}



