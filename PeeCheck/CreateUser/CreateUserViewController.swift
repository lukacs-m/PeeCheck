//
//  CreateUserViewController.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 01/05/2018.
//  Copyright (c) 2018 Martin Lukacs. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CreateUserDisplayLogic: class {
    func displayUserToEdit(viewModel: CreateUser.EditUser.ViewModel)
    func displayUserAge(viewModel: CreateUser.UserAge.ViewModel)
    func displayCreateUser(viewModel: CreateUser.CreateUser.ViewModel)
    func displayUpdateUser(viewModel: CreateUser.UpdateUser.ViewModel)
    func activateSaveUserButton(viewModel: CreateUser.ActivateSaveButton.ViewModel)
}

class CreateUserViewController: UIViewController, CreateUserDisplayLogic {
    var interactor: CreateUserBusinessLogic?
    var router: (NSObjectProtocol & CreateUserRoutingLogic & CreateUserDataPassing)?
    
    // MARK: - Outlet
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAgeTitle: UILabel!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var lblGenderTitle: UILabel!
    @IBOutlet weak var txtGender: UITextField!
    @IBOutlet weak var btnCreateUser: RoundedCornerButton!
    private var genderMethodPicker = UIPickerView()
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = CreateUserInteractor()
        let presenter = CreateUserPresenter()
        let router = CreateUserRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private func setUpUI() {
        genderMethodPicker.dataSource = self
        genderMethodPicker.delegate = self
        btnCreateUser.setTitle("save_user_information".localized(), for: .normal)
        btnCreateUser.setUpMainButtonUI()
        txtAge.layer.borderColor = Style.Color.MainBlue.cgColor
        txtAge.layer.borderWidth = 1.0
        lblTitle.text = "save_user_information".localized()
        lblAgeTitle.text = "age_label".localized()
        lblGenderTitle.text = "gender_label".localized()

        txtGender.delegate = self
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePicker()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpUI()
        showUserToEdit()
    }
}

// MARK: Check if should edit existing user

extension CreateUserViewController {
    func showUserToEdit() {
        let request = CreateUser.EditUser.Request()
        interactor?.showUserToEdit(request: request)
    }
    
    func displayUserToEdit(viewModel: CreateUser.EditUser.ViewModel) {
        txtAge.text = "\(viewModel.userFields.age)"
        txtGender.text = viewModel.userFields.gender.localized()
        lblTitle.text = "edit_user_information".localized()
        genderMethodPicker.selectRow(viewModel.pickerRow, inComponent: 0, animated: true)
    }
}

// MARK: Check if age entered is valide

extension CreateUserViewController {
    
    @IBAction func checkAgeAction(_ sender: Any) {
        let age = txtAge.text
        let request = CreateUser.UserAge.Request(age: age)
        interactor?.checkUserAge(request: request)
    }
    
    func displayUserAge(viewModel: CreateUser.UserAge.ViewModel) {
        txtAge.layer.borderColor = viewModel.valide == true ? Style.Color.MainGreen.cgColor : UIColor.red.cgColor
        if let age = viewModel.age {
            txtAge.text = "\(age)"
        }
        checkFormFields()
    }
}

// MARK: - Check if valide form to activate button
extension CreateUserViewController {
    func checkFormFields() {
        let request = CreateUser.ActivateSaveButton.Request(ageField: txtAge.text, genderField: txtGender.text)
        interactor?.checkFormFields(request: request)
    }
    
    func activateSaveUserButton(viewModel: CreateUser.ActivateSaveButton.ViewModel) {
        btnCreateUser.isUserInteractionEnabled = viewModel.valide
    }
}
// MARK: Create User

extension CreateUserViewController {
    
    @IBAction func saveUser(_ sender: Any) {
        let age = txtAge.text != nil ? Int(txtAge.text!) : 0
        let gender = txtGender.text == "men" ? Gender.men : Gender.woman
        
        if interactor?.userToEdit != nil {
            let request = CreateUser.UpdateUser.Request(age: age ?? 0, gender: gender)
            interactor?.updateUser(request: request)
        } else {
            let request = CreateUser.CreateUser.Request(userFormFields: CreateUser.UserFields(age: age ?? 0, gender: gender))
            interactor?.createUser(request: request)
        }
    }
    
    func displayCreateUser(viewModel: CreateUser.CreateUser.ViewModel) {
        guard viewModel.error == nil else {
            DispatchQueue.main.async {
                self.showAlert("create_user_error_title".localized(), message: "create_user_error_message".localized())
            }
            return
        }
        if viewModel.user != nil {
            router?.routeToAccount()
        } else {
            self.showAlert("create_user_error_title".localized(), message: "create_user_error_message".localized())
        }
    }
    
    func displayUpdateUser(viewModel: CreateUser.UpdateUser.ViewModel) {
        guard viewModel.error == nil else {
            DispatchQueue.main.async {
                self.showAlert("create_user_error_title".localized(), message: "create_user_error_message".localized())
            }
            return
        }
        if viewModel.user != nil {
            router?.routeToAccount()
        } else {
            self.showAlert("create_user_error_title".localized(), message: "create_user_error_message".localized())
        }
    }
}

extension CreateUserViewController: UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    // MARK: - Gender types
    
    func configurePicker() {
        txtGender.inputView = genderMethodPicker
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return interactor?.genderTypes.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return interactor?.genderTypes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtGender.text = interactor?.genderTypes[row]
        checkFormFields()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == txtGender, textField.text == "" {
            textField.text = interactor?.genderTypes[0]
            checkFormFields()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}