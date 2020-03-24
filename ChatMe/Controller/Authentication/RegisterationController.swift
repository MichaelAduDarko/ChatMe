//
//  RegisterController.swift
//  ChatMe
//
//  Created by MICHAEL ADU DARKO on 3/24/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit

class RegistrationController: UIViewController {
    
    //MARK:- Properties
    
    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleSelectPhoto), for: .touchUpInside)
        return button
    }()
    
    private lazy var emailContainerView: UIView = {
        return InputContainerView(image: #imageLiteral(resourceName: "email"),
                                  textField: emailTextField )
        
    }()
    
    private lazy var fullnameContainerView: UIView = {
        return InputContainerView(image: #imageLiteral(resourceName: "fullname"),
                                  textField: fullnameTextField )
        
    }()
    
    private lazy var usernameContainerView: UIView = {
        return InputContainerView(image: #imageLiteral(resourceName: "person"),
                                  textField: usernameTextField )
        
    }()
    
    private lazy var passwordContainerView: InputContainerView = {
        return InputContainerView(image: #imageLiteral(resourceName: "password"),
                                  textField: passwordTextField )
    }()
    
    private let  emailTextField = CustomTextField(placholder: "Email")
    private let fullnameTextField = CustomTextField(placholder: "Full Name")
    private let usernameTextField = CustomTextField(placholder: "User Name")
    
    private let passwordTextField: CustomTextField = {
        let tf = CustomTextField(placholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let signUPButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Sign Up", for: .normal)
           button.layer.cornerRadius = 5
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
           button.backgroundColor = .systemPink
           button.setTitleColor(.white, for: .normal)
           button.setHeight(height: 50)
           return button
       }()
    
    private let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Already have an account? ",
                                                        attributes: [ .font: UIFont.systemFont(ofSize: 18),.foregroundColor: UIColor.white])
        
        attributedTitle.append(NSAttributedString(string: "Log In",
                                                  attributes: [.font: UIFont.systemFont(ofSize: 18),.foregroundColor: UIColor.mainBlueTintColor]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowLogIn), for: .touchUpInside)
        return button
    }()
    
    //MARK:- Selectors
    @objc func handleSelectPhoto(){
        print("12346")
    }
    
    @objc func handleShowLogIn(){
        navigationController?.popViewController(animated: true)
    }
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    func configureUI(){
        view.backgroundColor = .black
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop:  32)
        plusPhotoButton.setDimensions(height: 200, width: 200)
        
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,
                                                   passwordContainerView,
                                                   fullnameContainerView,
                                                   usernameContainerView,
                                                          signUPButton])
               stack.axis = .vertical
               stack.spacing = 16
               
               view.addSubview(stack)
               stack.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor,
                            right: view.rightAnchor,
                            paddingTop: 32,
                            paddingLeft: 32,
                            paddingRight: 32)
        
        view.addSubview(alreadyHaveAccountButton)
               alreadyHaveAccountButton.anchor(left: view.leftAnchor,
                                            bottom: view.safeAreaLayoutGuide.bottomAnchor,
                                            right: view.rightAnchor,
                                            paddingLeft: 32,
                                            paddingRight: 32)
    }
}

