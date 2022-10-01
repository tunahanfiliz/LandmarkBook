//
//  detailsVC.swift
//  TableViewKentSimgeleri
//
//  Created by Ios Developer on 1.10.2022.
//

import UIKit

class detailsVC: UIViewController {
    @IBOutlet weak var landmarkLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var secilenİsim = ""
    var secilenResim = UIImage()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        landmarkLabel.text = secilenİsim
        imageView.image = secilenResim
       
    }
    

    

}
