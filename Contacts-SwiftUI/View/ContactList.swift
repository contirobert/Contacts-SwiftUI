//
//  ContactList.swift
//  Contacts-SwiftUI
//
//  Created by Bobby Conti on 6/6/19.
//  Copyright © 2019 Bobby Conti. All rights reserved.
//

import SwiftUI

struct ContactList : View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            List(userData.contacts) { contact in
                NavigationLink(destination: ContactDetail(contact: contact)) {
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
            .environmentObject(UserData())
    }
}
#endif
