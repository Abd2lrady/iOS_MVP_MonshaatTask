//
//  ViewController.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady 

import UIKit

class ListScreenVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        URLSession.shared.dataTask(with: EnviromentVariables.baseURl) { data, reponse, error in
            print("target get response")
            print(data?.count)
        }.resume()
    }
    
}
