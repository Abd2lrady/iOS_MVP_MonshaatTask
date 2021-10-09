//
//  ViewController.swift
//  moshaatTask
//
//  Created by Ahmad Abdulrady
import Kingfisher
import MBProgressHUD
import Toast

import UIKit

class ListScreenVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        if NetworkMonitor.shared.isConnected {
            URLSession.shared.dataTask(with: EnviromentVariables.baseURl) { data, reponse, error in
                print("target get response")
                print(data?.count)
                DispatchQueue.main.async {
                    MBProgressHUD.hide(for: self.view, animated: true)
                    
                }
            }.resume()
        } else { view.makeToast("no network")
        }
        
    }
}
