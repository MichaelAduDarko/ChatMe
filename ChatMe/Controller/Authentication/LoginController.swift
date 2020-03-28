//
//  LoginController.swift
//  ChatMe
//
//  Created by MICHAEL ADU DARKO on 3/24/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit
import Firebase
import JGProgressHUD

protocol AuthenticationControllerProtocol {
    func checkFormStatus()
}

class LoginController: UIViewController , UITextFieldDelegate {
    
    //MARK:- Properties
    
    private var viewModel = LoginViewModel()
    
    private let iconImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "bubble.right")
        iv.tintColor = .white
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "CHAT ME"
        label.font = UIFont(name: "Optima-bold", size: 45)
        label.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        label.textAlignment = .center
        label.layer.masksToBounds = false
        return label
    }()
    
    private lazy var emailContainerView: UIView = {
        return InputContainerView(image: #imageLiteral(resourceName: "email"),
                                  textField: emailTextField )
        
    }()
    
    private lazy var passwordContainerView: InputContainerView = {
        return InputContainerView(image: #imageLiteral(resourceName: "password"),
                                  textField: passwordTextField )
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .mainBlueTintColor
        button.setTitleColor(.white, for: .normal)
        button.setHeight(height: 50)
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    private let emailTextField = CustomTextField(placholder: "Email")
    
    private let passwordTextField: CustomTextField = {
        let tf = CustomTextField(placholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account? ",
                                                        attributes: [ .font: UIFont.systemFont(ofSize: 18),.foregroundColor: UIColor.white])
        
        attributedTitle.append(NSAttributedString(string: "Sign Up",
                                                  attributes: [.font: UIFont.systemFont(ofSize: 18),.foregroundColor: UIColor.systemPink]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        emailTextField.delegate = self
        passwordTextField.delegate = self
       
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }
    //MARK:- Selectors
    
    @objc func handleLogin(){
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        
        showLoader(true, withText: "Loggin In")
        
        AuthService.shared.logUserIn(withEmail: email, password: password ) { result, error in
            if let error = error {
                print("DEBUG: Failed to log in with error \(error.localizedDescription)")
                self.showLoader(false)
                return
            }
            
            self.showLoader(false)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    @objc func handleShowSignUp(){
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func textDidChange(sender: UITextField){
        if sender == emailTextField {
            viewModel.email = sender.text
        } else {
            viewModel.password = sender.text
        }
        checkFormStatus()
    }

    //MARK:- Helpers
    
    func configureUI(){
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        view.backgroundColor = .black
        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop:  32)
        iconImage.setDimensions(height: 120, width: 120)
        
        let stack = UIStackView(arrangedSubviews: [titleLabel,emailContainerView,
                                                   passwordContainerView,
                                                   loginButton])
        stack.axis = .vertical
        stack.spacing = 16
        
        
        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 32,
                     paddingLeft: 32,
                     paddingRight: 32)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left: view.leftAnchor,
                                     bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                     right: view.rightAnchor,
                                     paddingLeft: 32,
                                     paddingRight: 32)
        
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    
}

extension LoginController: AuthenticationControllerProtocol {
    func checkFormStatus(){
        if viewModel.formIsValid {
            loginButton.isEnabled = true
            loginButton.backgroundColor = .systemBlue
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = .mainBlueTintColor
        }
    }
}
