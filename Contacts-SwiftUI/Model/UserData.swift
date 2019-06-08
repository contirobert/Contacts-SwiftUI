//
//  UserData.swift
//  Contacts-SwiftUI
//
//  Created by Bobby Conti on 6/8/19.
//  Copyright © 2019 Bobby Conti. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: BindableObject {
    let didChange = PassthroughSubject<UserData, Never>()
    
    var contacts = ContactsSource.contacts.sorted(by: { $0.firstName < $1.firstName }) {
        didSet {
            didChange.send(self)
        }
    }
}
