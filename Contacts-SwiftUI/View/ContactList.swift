//
//  ContactList.swift
//  Contacts-SwiftUI
//
//  Created by Bobby Conti on 6/6/19.
//  Copyright © 2019 Bobby Conti. All rights reserved.
//

import SwiftUI

struct ContactList : View {
    var body: some View {
        NavigationView {
            List(contactData.identified(by: \.lastName)) { contact in
                NavigationButton(destination: ContactDetail(contact: contact)) {
                    ContactRow(contact: contact)
                }
            }.navigationBarTitle(Text("Contacts"))
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContactList()
    }
}
#endif
