//
//  UserData.swift
//  Contacts-SwiftUI
//
//  Created by Bobby Conti on 6/8/19.
//  Copyright © 2019 Bobby Conti. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    let didChange = PassthroughSubject<UserData, Never>()
    
    var contacts = contactData {
        didSet {
            didChange.send(self)
        }
    }
}
