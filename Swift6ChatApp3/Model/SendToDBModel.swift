//
//  SendToDBModel.swift
//  Swift6ChatApp3
//
//  Created by 野澤英二郎 on 2021/09/22.
//

import Foundation
import FirebaseStorage

protocol SendProfileOKDelegate {
    
    func sendProfileOKDelegate(url:String)
    
}

class SendToDBModel {
    
    var sendProfileOKDelegate:SendProfileOKDelegate?
    
    
    init() {
        
    }
    
    func sendProfileImageData(data:Data){
        
        let image = UIImage(data: data)
        let profileImageData = image?.jpegData(compressionQuality: 0.1)
        
        let imageRef = Storage.storage().reference().child("profileImage").child("\(UUID().uuidString + String(Date().timeIntervalSince1970)).jpg")
        
        
        
        imageRef.putData(profileImageData!, metadata: nil) { (metaData, error) in
            
            if error != nil{
                
                print(error.debugDescription)
                return
                
            }
            
            imageRef.downloadURL { (url, error) in
                
                if error != nil{
                    
                    print(error.debugDescription)
                    return
                }
                
                UserDefaults.standard.setValue(url?.absoluteString, forKey: "userImage")
                
                self.sendProfileOKDelegate?.sendProfileOKDelegate(url: url!.absoluteString)
                
            }
            
        }
        
        
    }
    
}
