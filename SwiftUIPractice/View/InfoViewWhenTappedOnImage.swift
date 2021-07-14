//
//  NavigationBar.swift
//  SwiftUIPractice
//
//  Created by Elina Mansurova on 2021-07-14.
//

import SwiftUI

struct InfoViewWhenTappedOnImage: View {
    
    @Binding var selected: Item
    @Binding var show: Bool
    @State var loadContent = false
    var animation: Namespace.ID
   
    
    var body: some View {
        
        ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : .init(), content: {
            VStack {
                HStack(spacing: 25) {
                    Button(action: {
                        withAnimation(.spring()) {
                            show.toggle()
                        }
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    Button(action: {}) {
                        Image(systemName: "bag")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                VStack {
                    Image(selected.image)
                        .resizable()
                        .cornerRadius(15)
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "image\(selected.id)", in: animation)
                        .padding()
                    Text(selected.title)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    Text(selected.subtitle)
                        .foregroundColor(.gray)
                        .padding(.top, 4)
                    HStack {
                        Text(selected.rating)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .matchedGeometryEffect(id: "rating\(selected.id)", in: animation)
                        Spacer()
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Image(systemName: "suit.heart")
                                .font(.title3)
                                .foregroundColor(.black)
                        }
                        .matchedGeometryEffect(id: "heart\(selected.id)", in: animation)
                  
                    }
                    .padding()
                    .background(
                        Color(selected.image)
                            .matchedGeometryEffect(id: "color\(selected.id)", in: animation))
                    .cornerRadius(15)
                
                    //Delay Loading the content for smooth animation:
                    
                    VStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Special Offer:")
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                            Text("15% off with first in-app order")
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical)
                        .padding(.horizontal, 20)
                        .frame(width: UIScreen.main.bounds.width - 30, alignment: .leading)
                        .background(Color(red: 255/255, green: 210/255, blue: 176/255))
                        .cornerRadius(15)
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Add to Cart")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 100)
                                .background(Color.black)
                                .cornerRadius(15)
                        })
                        .padding(.vertical)
                    }
                    .padding([.horizontal, .bottom])
                    .frame(height: loadContent ? nil : 0)
                    .opacity(loadContent ? 1 : 0)
                }
                Spacer(minLength: 0)
            }
        })
     
        .onAppear() {
            withAnimation(.spring().delay(0.45)) {
                loadContent.toggle()
            }
        }
    }
}
