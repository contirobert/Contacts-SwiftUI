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
            List(contacts.identified(by: \.lastName)) { contact in
                NavigationButton(destination: ContactDetail(contact: contact)) {
                    ContactRow(contact: contact)
                }
            }.navigationBarTitle(Text("Contacts"))
        }
    }
}

struct ContactRow : View {
    
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
            
            Spacer()
            
            if contact.isFavorite {
                Image(systemName: "star.fill")
                    .font(.headline)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct ContactDetail : View {
    
    let contact: Contact
    
    var body: some View {
        VStack {
            Image(contact.imageName)
                .resizable()
                .clipShape(Circle())
                .frame(width: 200, height: 200)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
            
            Text("\(contact.firstName) \(contact.lastName)")
                .font(.largeTitle)
                .padding()
            
            HStack {
                Text("Phone")
                Spacer()
                Text(contact.phone).color(.gray)
            }.padding(.bottom, 5)
            
            HStack {
                Text("Email")
                Spacer()
                Text(contact.email).color(.gray)
            }.padding(.bottom, 5)
            
            HStack {
                Text("Address")
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(contact.street).color(.gray)
                    Text("\(contact.city), \(contact.state) \(contact.zip)").color(.gray)
                }
            }.padding(.bottom, 5)
            
            HStack {
                Text("Favorite")
                Spacer()
                
                //Toggle()
            }
            
            Spacer()
        }.padding(40)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
