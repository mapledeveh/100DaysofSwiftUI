//
//  AddPersonView-ViewModel.swift
//  Namemory
//
//  Created by Alex Nguyen on 2023-08-03.
//

import SwiftUI
import PhotosUI

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

extension AddPersonView {
    @MainActor class ViewModel: ObservableObject {
        @Published var photoItem: PhotosPickerItem?
        @Published var photoImage: Image?
        @Published var name: String
        
        init() {
            self.name = ""
        }
        
        func loadImage() async {
            if let data = try? await photoItem?.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
//                    if let jpegData = uiImage.jpegData(compressionQuality: 0.8) {
//                        try? jpegData.write(to: FileManager.documentsDirectory.appendingPathComponent("ProfilePicture"), options: [.atomic, .completeFileProtection])
//                    }
                    photoImage = Image(uiImage: uiImage)
                    return
                }
            }
            
//            print("Failed")
        }
        
        func savePhoto() async {
            if let data = try? await photoItem?.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    if let jpegData = uiImage.jpegData(compressionQuality: 0.8) {
                        try? jpegData.write(to: FileManager.documentsDirectory.appendingPathComponent("ProfilePicture"), options: [.atomic, .completeFileProtection])
                    }
                }
            }
        }
    }
}
