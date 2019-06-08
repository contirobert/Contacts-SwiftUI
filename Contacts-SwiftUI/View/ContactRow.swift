//
//  ContactRow.swift
//  Contacts-SwiftUI
//
//  Created by Bobby Conti on 6/8/19.
//  Copyright © 2019 Bobby Conti. All rights reserved.
//

import SwiftUI

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
