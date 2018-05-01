//
//  AccountViewController.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 30/04/2018.
//  Copyright (c) 2018 Martin Lukacs. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol AccountDisplayLogic: class {
    func displayUserInformation(viewModel: Account.FetchUser.ViewModel)
    func displayDeletedUserInformation(viewModel: Account.DeleteUser.ViewModel)
}

class AccountViewController: UIViewController, AccountDisplayLogic {
    var interactor: AccountBusinessLogic?
    var router: (NSObjectProtocol & AccountRoutingLogic & AccountDataPassing)?
    
    // MARK: Outlets
    
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblAgeTitle: UILabel!
    @IBOutlet weak var lblAgeData: UILabel!
    @IBOutlet private weak var lblGenderTitle: UILabel!
    @IBOutlet weak var lblGenderData: UILabel!
    @IBOutlet private weak var btnEdit: UIButton!
    @IBOutlet private weak var btnDeleteData: UIButton!
    
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
        let interactor = AccountInteractor()
        let presenter = AccountPresenter()
        let router = AccountRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private func setUpUI() {
        self.title = "account_navbar_title".localized()
        lblTitle.text = "account_title".localized()
        lblAgeTitle.text = "account_lbl_age_title".localized()
        lblAgeData.text = "account_lbl_user_data_missing".localized()
        lblGenderTitle.text = "account_lbl_gender_title".localized()
        lblGenderData.text = "account_lbl_user_data_missing".localized()
        btnEdit.setTitle("account_btn_edit".localized(), for: .normal)
        btnEdit.backgroundColor = Style.Color.MainBlue
        btnEdit.contentEdgeInsets =  Style.Size.ButtonInsets
        btnEdit.setTitleColor(.white, for: .normal)
        btnDeleteData.setTitle("account_btn_delete".localized(), for: .normal)
        btnDeleteData.backgroundColor = Style.Color.MainBlue
        btnDeleteData.contentEdgeInsets = Style.Size.ButtonInsets
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpUI()
    }
}

// MARK: Fetch User information

extension AccountViewController {
    /// Gets user information
    func fetchUser() {
        let request = Account.FetchUser.Request()
        interactor?.fetchUser(request: request)
    }
    
    /// Displays user information if found
    ///
    /// - Parameter viewModel: viewModel containing information to display
    func displayUserInformation(viewModel: Account.FetchUser.ViewModel) {
        guard let user = viewModel.user else {
            DispatchQueue.main.async {
                self.lblGenderData.text = "account_lbl_user_data_missing".localized()
                self.lblAgeData.text = "account_lbl_user_data_missing".localized()
            }
            return
        }
        lblGenderData.text = user.gender != nil ? user.gender?.localized() ?? "account_lbl_user_data_missing".localized() : "account_lbl_user_data_missing".localized()
        lblAgeData.text = user.age != nil ? "\(user.age ?? 0)" : "account_lbl_user_data_missing".localized()
    }
}

// MARK: Delete User information

extension AccountViewController {
    
    @IBAction func deleteUserInformationAction(_ sender: Any) {
        let request = Account.DeleteUser.Request()
        interactor?.deleteUser(request: request)
    }
    
    /// Display generic missing information text
    ///
    /// - Parameter viewModel: viewModel containing nil of information was deleted or error otherwise
    func displayDeletedUserInformation(viewModel: Account.DeleteUser.ViewModel) {
        lblGenderData.text = "account_lbl_user_data_missing".localized()
        lblAgeData.text = "account_lbl_user_data_missing".localized()
    }
}

// MARK: Go to edit user information page

extension AccountViewController {
    
    @IBAction func goToEditAction(_ sender: Any) {
    }
}
