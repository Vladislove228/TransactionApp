
import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
class AuthViewController: UIViewController {
    var signup:Bool = true {
        willSet{
            if newValue{
                titleLabel.text = "Registration"
                nameField.isHidden = false
                enterButton.setTitle("Enter", for: .normal)
            }else{
                titleLabel.text = "Enter"
                nameField.isHidden = true
                enterButton.setTitle("Registration", for: .normal)
            }
        }
    }
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        emailField.layer.cornerRadius = 10
        passwordField.layer.cornerRadius = 10
        nameField.layer.cornerRadius = 10
    }
    

    @IBAction func switchLogin(_ sender: Any) {
        signup = !signup
    }
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Fill in all the fields", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
extension AuthViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let name = nameField.text!
        let email = emailField.text!
        let password = passwordField.text!
        
        
        if(signup){
            if(!name.isEmpty && !email.isEmpty && !password.isEmpty){
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    if error == nil {
                        if let result = result{
                            print(result.user.uid)
                            
                            let ref = Database.database().reference().child("users")
                            ref.child(result.user.uid).updateChildValues(["name" : name, "email" : email])
                           
                            self.dismiss(animated: true, completion: nil)
                        }
                    }
                }
            
        }else{
            showAlert()
        }
        }else{
            
            if (!email.isEmpty && !password.isEmpty) {
                Auth.auth().signIn(withEmail: email, password: password){ (result, error) in
                    if error == nil {
                        
//                        self.dismiss(animated: true, completion: nil)
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let startViewController = storyboard.instantiateViewController(withIdentifier: "StartViewController")
                        self.navigationController?.pushViewController(startViewController, animated: true)
                    }
                }
            }else{
                showAlert()
            }
        }
            return true
    }
}
