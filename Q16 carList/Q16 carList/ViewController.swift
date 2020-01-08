//
//  ViewController.swift
//  Q16 carList
//
//  Created by Maryna Veksler on 1/2/20.
//  Copyright © 2020 Maryna Veksler. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    var arrCar = [Car]()
    var sectionData : [Int :[Car]] = [:]
    
    var originalData : [Int : [Car]] = [:]
    
    var countries : [String] = ["United States", "Germany", "Great Britain"]
    
    @IBOutlet weak var searchBar: UISearchBar!
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionData.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (sectionData[section]?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CellTableViewCell
        
        cell?.carModel.text = sectionData[indexPath.section]![indexPath.row].model
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController{
            vc.Name = sectionData[indexPath.section]![indexPath.row].model
            vc.Country = sectionData[indexPath.section]![indexPath.row].country
            vc.Year = sectionData[indexPath.section]![indexPath.row].year
            vc.Logo = sectionData[indexPath.section]![indexPath.row].imgName
            present(vc, animated: true)
        }
      
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view  = UIView()
        view.backgroundColor = .yellow
        
        var imgName : String = ""
        
        switch countries[section] {
        case "Germany":
            imgName = "germany"
        case "Great Britain":
            imgName = "britain"
        case "United States":
            imgName = "us"
        default:
            print("no image for this country")
        }
        
        let imgView = UIImageView(image: UIImage(named: imgName))
        imgView.frame = CGRect(x: 5, y: 5, width: 35, height: 35)
        view.addSubview(imgView)
        
        let label = UILabel()
        label.text = countries[section]
        label.frame = CGRect(x: 45, y: 5, width: 200, height: 35)
        view.addSubview(label)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
        
    func presentDeletionFailsafe(indexPath: IndexPath) {
        let alert = UIAlertController(title: nil, message: "Are you sure you'd like to delete this cell", preferredStyle: .alert)

        // yes action
        let yesAction = UIAlertAction(title: "Yes", style: .default) { _ in
            // replace data variable with your own data array
            self.sectionData[indexPath.section]!.remove(at: indexPath.row)
            self.tblView.deleteRows(at: [indexPath], with: .fade)
        }

        alert.addAction(yesAction)

        // cancel action
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        present(alert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presentDeletionFailsafe(indexPath: indexPath)
        }
    }
    
    @IBOutlet weak var tblView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.delegate = self
        tblView.dataSource = self
        
        searchBar.delegate = self
        
        let car1 = Car(model: "BMW", year: "2010", country:  "Germany", imgName: "bmw")
        let car2 = Car(model: "Audi", year: "2015", country:  "Germany", imgName: "audi")
        let car3 = Car(model: "Mercedes-Benz", year: "2018", country:  "Germany", imgName: "mercedes")
        let car4 = Car(model: "Porshe", year: "2017", country:  "Germany", imgName: "porshe")
        let car5 = Car(model: "GMC", year: "2016", country: "US", imgName: "gmc")
        let car6 = Car(model: "Ford", year: "2015", country: "US", imgName: "ford")
        let car7 = Car(model: "Bentley", year: "2020", country: "Great Britain", imgName: "bentley")
        
        arrCar.append(car1)
        arrCar.append(car2)
        arrCar.append(car3)
        arrCar.append(car4)
        
        arrCar.append(car5)
        arrCar.append(car6)
        arrCar.append(car7)
        
        var germany : [Car] = []
        var britain : [Car] = []
        var us : [Car] = []
        
        for item in arrCar {
            if item.country == "Germany"{
                germany.append(item)
            }
            else if item.country == "Great Britain"{
                britain.append(item)
            }
            else if item.country == "US"{
                us.append(item)
            }
        }

        originalData = [0: us, 1: germany, 2: britain]
        sectionData = originalData
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
               sectionData = originalData
        }
        else {
            for (index, array) in originalData{
                var newArray : [Car] = []
                for car in array {
                    if car.model.contains(searchText) == true {
                        newArray.append(car)
                    }
                    if newArray.isEmpty{
                        sectionData.removeValue(forKey: index)
                    }else{
                    sectionData[index] = newArray
                    }
                }
            }
        }
        tblView.reloadData()
    }

}

class Car {
    var model : String
    var year : String
    var country : String
    var imgName : String
    
    init(model : String, year : String, country : String, imgName : String) {
        self.model = model
        self.year = year
        self.country = country
        self.imgName = imgName
    }
}
