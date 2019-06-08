//
//  Contact.swift
//  Contacts
//
//  Created by Bobby Conti on 4/26/19.
//  Copyright © 2019 Bobby Conti. All rights reserved.
//

import Foundation

// Contact Data Model
struct Contact: Hashable {
    let firstName: String
    let lastName: String
    let phone: String
    let email: String
    let street: String
    let city: String
    let state: String
    let zip: String
    let imageName: String
    var isFavorite: Bool
}

// Extends Contact to build dictionary of contact info from plist
extension Contact {
    
    struct Key {
        static let firstName = "firstName"
        static let lastName = "lastName"
        static let phone = "phoneNumber"
        static let email = "email"
        static let street = "streetAddress"
        static let city = "city"
        static let state = "state"
        static let zip = "zip"
        static let imageName = "avatarName"
    }
    
    init?(dictionary: [String: String]) {
        guard let firstNameString = dictionary[Key.firstName],
            let lastNameString = dictionary[Key.lastName],
            let phoneString = dictionary[Key.phone],
            let emailString = dictionary[Key.email],
            let streetString = dictionary[Key.street],
            let cityString = dictionary[Key.city],
            let stateString = dictionary[Key.state],
            let zipString = dictionary[Key.zip] else { return nil }
        
        self.firstName = firstNameString
        self.lastName = lastNameString
        self.phone = phoneString
        self.email = emailString
        self.street = streetString
        self.city = cityString
        self.state = stateString
        self.zip = zipString
        
        if let imageName = dictionary[Key.imageName] {
            self.imageName = imageName
        } else {
            self.imageName = "Default"
        }
        
        isFavorite = false
    }
}

// Extends Contact to return first letter of first name to sort list of contacts
extension Contact {
    var firstLetterForSort: String {
        return String(firstName.first!).uppercased()
    }
}
