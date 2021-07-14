//
//  CardView.swift
//  SwiftUIPractice
//
//  Created by Elina Mansurova on 2021-07-14.
//

import SwiftUI

struct CardView: View {
    var item: Item
    var animation: Namespace.ID
    
    var body: some View {
        VStack {
            HStack {
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                Text(item.price)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
            }
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Text(item.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            Text(item.subtitle)
                .font(.caption)
                .foregroundColor(.gray)
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "suit.heart")
                        .font(.title3)
                        .foregroundColor(.black)
                }
                Spacer(minLength: 0)
                Text(item.rating)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
            }
            .padding()
        }
        .padding(.bottom)
        .background(Color(item.image))
        .background(Color(red: 223/255, green: 243/255, blue: 242/255))
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}
