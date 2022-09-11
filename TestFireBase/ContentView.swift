//
//  ContentView.swift
//  TestFireBase
//
//  Created by 橋本周三 on 9/10/22.
//

import SwiftUI



struct ContentView: View {
    
@State var switchA = 1
    
@ObservedObject var images = ViewModel()
    
    
    var body: some View {
        Button(action: {
            if switchA == 1 {
                switchA = 2
            }else{
                switchA = 1
            }
        },label:{
            Image(uiImage: images.getImage(flag:switchA))
                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
                .padding()
        })
    }
}
               
               
               struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }
