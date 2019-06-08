//
//  ContentView.swift
//  Contacts-SwiftUI
//
//  Created by Bobby Conti on 6/6/19.
//  Copyright © 2019 Bobby Conti. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    let contacts: [Contact] = ContactsSource.contacts.sorted(by: { $0.firstName < $1.firstName })
    
    var body: some View {
        NavigationView {
            List {
                ForEach(contacts.identified(by: \.lastName)) { contact in
                    ContactView(contact: contact)
                }
            }.navigationBarTitle(Text("Contacts"))
        }
    }
}

struct ContactView : View {
    
    let contact: Contact
    
    var body: some View {
        HStack {
            Image(contact.imageName)
                .resizable()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
                .clipped()
            VStack(alignment: .leading) {
                Text("\(contact.firstName) \(contact.lastName)").font(.headline)
                Text(contact.city).font(.subheadline)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
