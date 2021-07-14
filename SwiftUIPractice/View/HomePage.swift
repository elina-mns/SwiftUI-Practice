//
//  HomePage.swift
//  SwiftUIPractice
//
//  Created by Elina Mansurova on 2021-07-14.
//

import SwiftUI

struct HomePage: View {
    
    @State var selected = tabs[0]
    @Namespace var animation
    @State var show = false
    @State var selectedItem: Item = items[0]
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image(systemName: "line.horizontal.3.decrease")
                            .font(.system(size: 25, weight: .heavy))
                            .foregroundColor(.black)
                    }
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image("profile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 45, height: 45)
                            .cornerRadius(15)
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                
                ScrollView {
                    VStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Awesome products")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                            }
                            .padding(.horizontal)
                            
                        }
                        HStack(spacing: 0) {
                            ForEach(tabs, id:\.self) { tab in
                                //Tab Button
                                TabButton(title: tab, selected: $selected, animation: animation)
                                
                                //Even Spacing
                                if tabs.last != tab { Spacer(minLength: 0) }
                            }
                        }
                        .padding()
                        .padding(.top, 5)
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 25) {
                            ForEach(items) { item in
                                //Card View
                                CardView(item: item, animation: animation)
                                    .onTapGesture {
                                        withAnimation(.spring()) {
                                            selectedItem = item
                                            show.toggle()
                                        }
                                    }
                            }
                        }
                        .padding()
                    }
                }
                Spacer(minLength: 0)
            }
            .opacity(show ? 0 : 1)
            
            if show {
                InfoViewWhenTappedOnImage(selected: $selectedItem, show: $show, animation: animation)
            }
        }
        
        .background(Color.white.ignoresSafeArea())
    }
}

var tabs = ["Vintage", "Coffee", "Films", "Books"]
