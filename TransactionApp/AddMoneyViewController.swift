//
//  AddMoneyViewController.swift
//  TransactionApp
//
//  Created by Владислав Квинто on 18/05/2022.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
class AddMoneyViewController: UIViewController {


    @IBOutlet weak var refillButton: UIButton!
    @IBOutlet weak var addMoneyTextField: UITextField!
    var money = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: false)
        refillButton.layer.cornerRadius = 10
    }
    


    
   
   
    @IBAction func buttonPressed(_ sender: Any) {
       // let text = addMoneyTextField.text
        
//        money = text ?? ""
//        Database.database().reference().child("Money").setValue(money)
//        print(money)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let startViewController = storyboard.instantiateViewController(withIdentifier: "StartViewController")
        navigationController?.pushViewController(startViewController, animated: true)
    }
    
}
