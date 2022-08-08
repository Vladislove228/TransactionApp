//
//  StartViewController.swift
//  TransactionApp
//
//  Created by Владислав Квинто on 17/04/2022.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var valueView: UIView!
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet weak var addMoneyButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        valueView.layer.cornerRadius = 10
        addMoneyButton.layer.cornerRadius = 10
       // welcomeLabel.text = "Welcome \(nameField.text!)"
    }
  

   
    @IBAction func addMoneyButtonPressed(_ sender: Any) {
//        let addMoneyViewController = AddMoneyViewController.instantiate()
//        addMoneyViewController.modalPresentationStyle = .fullScreen
//        present(addMoneyViewController, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let addMoneyViewController = storyboard.instantiateViewController(withIdentifier: "AddMoneyViewController")
        navigationController?.pushViewController(addMoneyViewController, animated: true)
        
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
    }
    @IBAction func transferButtonPressed(_ sender: Any) {
//        let transactionViewController = TransactionViewController.instantiate()
//        transactionViewController.modalPresentationStyle = .fullScreen
//        present(transactionViewController, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let transactionViewController = storyboard.instantiateViewController(withIdentifier: "TransactionViewController")
        navigationController?.pushViewController(transactionViewController, animated: true)
    }
    @IBAction func generateQRCodeButtonPRessed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let QRViewController = storyboard.instantiateViewController(withIdentifier: "QRViewController")
        navigationController?.pushViewController(QRViewController, animated: true)
    }
}
