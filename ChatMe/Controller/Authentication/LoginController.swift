//
//  LoginController.swift
//  ChatMe
//
//  Created by MICHAEL ADU DARKO on 3/24/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    //MARK:- Properties
    private let iconImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "bubble.right")
        iv.tintColor = .white
        return iv
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
        
    }
    
    //MARK:- Selectors
    @objc func handleShowSignUp(){
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
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
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,
                                                   passwordContainerView,
                                                   loginButton])
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor,  right: view.rightAnchor,
                     paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(left: view.leftAnchor,
                                     bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                     right: view.rightAnchor,
                                     paddingLeft: 32,
                                     paddingRight: 32)
        
    }
    
}


