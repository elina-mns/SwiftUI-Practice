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
                .cornerRadius(15)
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image\(item.id)", in: animation)
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
                .matchedGeometryEffect(id: "heart\(item.id)", in: animation)
                Spacer(minLength: 0)
                Text(item.rating)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .matchedGeometryEffect(id: "rating\(item.id)", in: animation)
            }
            .padding()
        }
        .padding(.bottom)
        .background(
            Color(item.image)
                .matchedGeometryEffect(id: "color\(item.id)", in: animation))
        .background(Color(red: 223/255, green: 243/255, blue: 242/255))
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}
