//
//  BottomNavBarView.swift
//  PyreFox
//
//  Created by Sharif Uzzell on 4/21/21.
//

import SwiftUI

struct BottomNavBarView: View {
    @Binding var goBack: Bool
    @Binding var goForward: Bool
    
    var body: some View {
        HStack {
            Spacer()
            ZStack {
                HStack {
                    Button(action:{
                        print("LEFT:")
                        goBack = true
                    }) {
                        Image(systemName: "arrow.backward")
                            .font(.system(size:30))
                            .foregroundColor(Color.accentColor)
                            .padding(5)
                        
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal, 15)
                    
                    Button(action:{
                        print("RIGHT:")
                        goForward = true
                    }) {
                        Image(systemName: "arrow.forward")
                            .font(.system(size:30))
                            .foregroundColor(Color.accentColor)
                            .padding(5)
                    }
                    .padding(5)
                    Spacer()
                }
                Button(action:{
                    print("PLUS:")
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 35))
                        .foregroundColor(Color.accentColor)
                        .padding(5)
                }
            }
            Spacer()
        }
    }
}

struct BottomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        let goBack: Binding = .constant(false)
        let goForward: Binding = .constant(false)
        
        BottomNavBarView(goBack: goBack, goForward: goForward)
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro"))
        BottomNavBarView(goBack: goBack, goForward: goForward)
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro")) 
            .preferredColorScheme(.dark)
        
    }
}
