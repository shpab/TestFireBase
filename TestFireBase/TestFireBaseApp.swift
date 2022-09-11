//
//  TestFireBaseApp.swift
//  TestFireBase
//
//  Created by 橋本周三 on 9/10/22.
//

import SwiftUI
import Firebase

@main
struct TestFireBaseApp: App {
    
    init(){
        FirebaseApp.configure()
    }


    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
