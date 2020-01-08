//
//  DetailViewController.swift
//  Q16 carList
//
//  Created by Maryna Veksler on 1/2/20.
//  Copyright © 2020 Maryna Veksler. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var car : Car?

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var country: UILabel!
    
    @IBOutlet weak var year: UILabel!
    
    @IBOutlet var logo: UIImageView!
    
    var Name : String = ""
    var Country : String = ""
    var Year : String = ""
    var Logo : String = ""
    
      override func viewDidLoad() {
          super.viewDidLoad()

        view.backgroundColor = .yellow
        name.text = Name
        country.text = Country
        year.text = Year
        logo.image = UIImage(named: Logo)
      }
    
}
