//
//  ViewModes.swift
//  TestFireBase
//
//  Created by 橋本周三 on 9/10/22.
//

import Foundation
import SwiftUI


class ViewModel : ObservableObject{
    @Published var model: Model  = Model()
    @Published var images : [String : UIImage] = [:]//ファイル名：画像の並び
    
    init(){
        Firebase.get_firestore(completion: {(documentID, dict)  in
            self.model.documentID = documentID
            self.model.documents = dict as! Dictionary<String, String>
            
            for (key, value) in dict {
                
                Firebase.download_file(fileName: value as! String, completion: {im in self.images[value as! String] = im})   //firebaseから初期データを取ってくる valueデータを使用？
                //   Firebase.download_file(fileName: value as! String, completion: {im in self.images[key] = im})   //firebaseから初期データを取ってくる　keyデータを使用？
                
            }
        })
    }
    
    func getImage(flag:Int) -> UIImage {
        if model.documents[String(flag)] == nil { //
            print("画像まだ取れてないよ")
            return UIImage()
        } else {
            let number = model.documents[String(flag)]!
            
            return images[number]  == nil ? UIImage():images[number] as! UIImage
        }
    }
}

