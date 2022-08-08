//
//  TransactionViewController.swift
//  TransactionApp
//
//  Created by Владислав Квинто on 18/05/2022.
//

import UIKit

class TransactionViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var transferButton: UIButton!
    @IBOutlet weak var nameAccountTextField: UITextField!
    @IBOutlet weak var valueTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        // Do any additional setup after loading the view.
        transferButton.layer.cornerRadius = 10
    }
    

    private func showImagePickerAlert() {
        
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
            #if targetEnvironment(simulator)
            self.showErrorAlert()
            #else
            self.showImagePicker(camera: true)
            #endif
        }
        let libraryAction = UIAlertAction(title: "Gallery", style: .default) { action in
            self.showImagePicker(camera: false)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cameraAction)
        alert.addAction(libraryAction)
        alert.addAction(cancelAction)

        present(alert, animated: true)
    }
    private func showErrorAlert() {
        let alert = UIAlertController(title: "Error", message: "Simulators don't support camera", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
//        alertView.titleText = "Error"
//        alertView.descriptionText = "Simulators don't support camera"
        alertView.isHidden = false
    }
    
    private func showImagePicker(camera: Bool) {
        let picker = UIImagePickerController()
        if camera {
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        picker.delegate = self
        present(picker, animated: true)
    }
    @IBAction func homeButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let startViewController = storyboard.instantiateViewController(withIdentifier: "StartViewController")
        navigationController?.pushViewController(startViewController, animated: true)
    }
    @IBAction func skanQrPressed(_ sender: Any) {
        showImagePickerAlert()
    }
    
    @IBAction func transferMoneyButtonPresssed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let startViewController = storyboard.instantiateViewController(withIdentifier: "StartViewController")
        navigationController?.pushViewController(startViewController, animated: true)
    }
}
extension TransactionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        }
        
        picker.dismiss(animated: true)
    }
}
