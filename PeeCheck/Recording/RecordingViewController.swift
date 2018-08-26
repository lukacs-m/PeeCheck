//
//  RecordingViewController.swift
//  PeeCheck
//
//  Created by Martin Lukacs on 06/04/2018.
//  Copyright (c) 2018 Martin Lukacs. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Toast_Swift

protocol RecordingDisplayLogic: class {
    func displaySetSwitch(viewModel: Recording.SetSwitch.ViewModel)
    func updateRecordBtnDisplay(viewModel: Recording.RecordMicturition.ViewModel) 
}

class RecordingViewController: UIViewController, RecordingDisplayLogic {
    var interactor: RecordingBusinessLogic?
    var router: (NSObjectProtocol & RecordingRoutingLogic & RecordingDataPassing)?
    private var style = ToastStyle()
    
    // MARK: - Outlets
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblHelpDescription: UILabel!
    @IBOutlet weak var btnRecord: RoundButton!
    @IBOutlet weak var switchNightAwake: UISwitch!
    @IBOutlet private weak var lblDidAwake: UILabel!
    @IBOutlet private weak var lblDidNotAwake: UILabel!
    @IBOutlet private weak var lblAwakeTitleDescription: UILabel!
    
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
        let interactor = RecordingInteractor()
        let presenter = RecordingPresenter()
        let router = RecordingRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private func setUpUI() {
        lblTitle.text = "recording_page_title".localized()
        lblHelpDescription.text = "recording_page_help".localized()
        btnRecord.setTitle("recording_button_title_inactive".localized(), for: .normal)
        lblDidAwake.text = "did_awake_true_label".localized()
        lblDidNotAwake.text = "did_awake_false_label".localized()
        lblAwakeTitleDescription.text = "did_awake_label_title".localized()
        btnRecord.backgroundColor = Style.Color.MainBlue
        setUpToast()
    }
    
    private func setUpToast(error: Bool = false) {
        style.messageColor = .white
        style.backgroundColor = !error ? Style.Color.MainBlue : Style.Color.MainRed
        ToastManager.shared.style = style
        ToastManager.shared.isTapToDismissEnabled = true
    }
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkTime()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpUI()
    }
}

// MARK: Set switch depending on local time

extension RecordingViewController {
    
    /// Check what time of day it is
    func checkTime() {
        let request = Recording.SetSwitch.Request()
        interactor?.checkTime(request: request)
    }
    
    /// Automatically set the awake switch depending on time of day
    ///
    /// - Parameter viewModel: The ViewModel containing the time of day status
    func displaySetSwitch(viewModel: Recording.SetSwitch.ViewModel) {
        switchNightAwake.isOn = viewModel.isNight
    }
}

// MARK: Start recording micturition

extension RecordingViewController {
    @IBAction func recordingAction(_ sender: Any) {
        let request = Recording.RecordMicturition.Request()
        interactor?.recordMicturition(request: request)
    }
    
    /// Update the recording button status & display
    ///
    /// - Parameter viewModel: The ViewModel containing the recording status
    func updateRecordBtnDisplay(viewModel: Recording.RecordMicturition.ViewModel) {
        btnRecord.setTitle(viewModel.isRecording ? "recording_button_title_active".localized() : "recording_button_title_inactive".localized(), for: .normal)
        btnRecord.backgroundColor = viewModel.isRecording ? Style.Color.MainGreen : Style.Color.MainBlue
        btnRecord.blink(viewModel.isRecording)
        if !viewModel.isRecording {
            setUpToast(error: viewModel.error == nil ? false : true)
            self.view.makeToast(viewModel.error == nil ? "did_save_micturition_label".localized() : viewModel.error?.localized()) // now uses the shared style
        }
    }
}