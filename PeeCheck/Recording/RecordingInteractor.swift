//
//  RecordingInteractor.swift
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

protocol RecordingBusinessLogic {
    func checkTime(request: Recording.SetSwitch.Request)
    func recordMicturition(request: Recording.RecordMicturition.Request)
}

protocol RecordingDataStore {}

class RecordingInteractor: RecordingBusinessLogic, RecordingDataStore {
    var presenter: RecordingPresentationLogic?
    var worker = RecordingWorker()
    private var isRecording = true
    
    // MARK: Check local time
    
    /// Check with worker if it is night or day and passes the information to the presenter
    ///
    /// - Parameter request: The request sent to check the time of day
    func checkTime(request: Recording.SetSwitch.Request) {
        let response = Recording.SetSwitch.Response(isNight: worker.isNightTime())
        presenter?.presentSetSwitch(response: response)
    }
    
    // MARK: Record Micturition
    
    /// Start recording & saving of micturition
    ///
    /// - Parameter request: The request sent to start & stop the recording
    func recordMicturition(request: Recording.RecordMicturition.Request) {
        let response = Recording.RecordMicturition.Response(isRecording: isRecording, savedMicturition: worker.saveMicturitionTime(isRecording, isNight: request.isNight))
        presenter?.presentRecordMicturition(response: response)
        isRecording = !isRecording
    }
}
