//
//  CheckPermission.swift
//  Swift6ChatApp3
//
//  Created by 野澤英二郎 on 2021/09/20.
//

import Foundation
import Photos

class CheckPermission {
    
    func showCheckPermission(){
        PHPhotoLibrary.requestAuthorization { (status) in
            
            switch(status){
                
            case .authorized:
                print("許可されてますよ")

            case .denied:
                    print("拒否")

            case .notDetermined:
                        print("notDetermined")
                
            case .restricted:
                        print("restricted")
                
            case .limited:
                print("limited")
            @unknown default: break
                
            }
            
        }
    }

}
