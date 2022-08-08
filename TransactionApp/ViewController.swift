//
//  ViewController.swift
//  TransactionApp
//
//  Created by Владислав Квинто on 16/04/2022.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func logoutAction(_ sender: Any) {
        do {
            try Auth.auth().signOut()
        } catch  {
            print(error)
        }
        
        
    }
}

