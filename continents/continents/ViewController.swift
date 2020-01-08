//
//  ViewController.swift
//  continents
//
//  Created by Maryna Veksler on 1/3/20.
//  Copyright © 2020 Maryna Veksler. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    let naArr = ["Canada", "United States", "Mexico", "Cuba", "bahamas"]
    let saArr = ["Brazil", "Chilie", "Argentina", "Colombia", "Peru"]
    let euArr = ["Ukraine", "France", "England", "Finland", "Italy" ]
    let asArr = ["Japan", "India", "China", "Iran", "Singapore"]
    let ausArr = ["Australia"]
    let continent = [ "North America", "South America", "Europe", "Asia", "Australia" ]
    
   var pictures: [UIImage] = [
        UIImage(named: "na")!,
        UIImage(named: "sa")!,
        UIImage(named: "eu")!,
        UIImage(named: "as")!,
        UIImage(named: "aus")!
    ]
    
    var sectionData : [Int :[String]] = [:]
    
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.delegate = self
        tblView.dataSource = self
        
        searchBar.delegate = self
        
        sectionData = [0: naArr, 1: saArr, 2: euArr, 3: asArr, 4: ausArr]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.continent.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return (sectionData[section]?.count)!
       }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view  = UIView()
        view.backgroundColor = .yellow
        
        let image = UIImageView(image: pictures[section])
        image.frame = CGRect(x: 5, y: 5, width: 35, height: 35)
        view.addSubview(image)
        
        let label = UILabel()
        label.text = continent[section]
        label.frame = CGRect(x: 45, y: 5, width: 200, height: 35)
        view.addSubview(label)
        
        return view
    }
       
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
           cell.textLabel?.text = sectionData[indexPath.section]?[indexPath.row]
           return cell
       }
    
}

extension ViewController : UISearchBarDelegate {
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}
