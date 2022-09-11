//
//  Firebase.swift
//  TestFireBase
//
//  Created by 橋本周三 on 9/10/22.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore
import SwiftUI



class Firebase{
    static let db = Firestore.firestore()
    
    static func download_file(fileName:String, completion: @escaping (UIImage) -> Void){
        let storage = Storage.storage()
        
        let gsReference = storage.reference(forURL: "gs://testfirebase-70671.appspot.com/\(fileName).png")
        
        gsReference.getData(maxSize: 1 * 1024 * 1024, completion: { data, error in
            if let error = error {
                print("Uh-oh, an error occurred!: \(error)")
            } else {
                // Data for "images/island.jpg" is returned
                let image = UIImage(data: data!)!
                completion(image)
            }
        })
    }
    static func get_firestore(completion: @escaping (String, Dictionary<String, Any>) -> Void){    //
        db.collection("testA").getDocuments() { (querySnapshot, err) in     //まずchacheを見に行ってなかった場合、サーバのデータを取りに行く
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    completion(document.documentID,document.data())
                    print("document" , document.documentID, document.data())
                }
            }
        }
    }
}
