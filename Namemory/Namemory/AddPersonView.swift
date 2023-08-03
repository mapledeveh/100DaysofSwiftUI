//
//  AddPersonView.swift
//  Namemory
//
//  Created by Alex Nguyen on 2023-08-03.
//

import SwiftUI
import PhotosUI

struct AddPersonView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = ViewModel()
    
    @ObservedObject var contactBook: ContactBook
    
    var body: some View {
        NavigationView {
            VStack {
                PhotosPicker(selection: $viewModel.photoItem, matching: .images) {
                    ZStack {
                        Rectangle()
                            .fill(.secondary)
                        
                        Text("Select Photo")
                            .foregroundColor(.white)
                            .font(.headline)
                        
                        if let photoImage = viewModel.photoImage {
                            photoImage
                                .resizable()
                                .scaledToFit()
//                                .frame(width: 300, height: 300)
                        }
                    }
                }
                .frame(width: 300, height: 400)
                
                Form {
                    TextField("Name", text: $viewModel.name)
                }
                .disabled(viewModel.photoImage == nil)
            }
            .padding()
            .navigationTitle("Add Person")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel", role: .cancel) {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        contactBook.people.append(Person(id: UUID(), name: viewModel.name, image: viewModel.photoImage ?? Image(systemName: "person")))
                        
                        dismiss()
                    }
                }
            }
            .onChange(of: viewModel.photoItem) { _ in
                Task {
                    await viewModel.loadImage()
                }
            }
        }
    }
}

struct AddPersonView_Previews: PreviewProvider {
    static var previews: some View {
        AddPersonView(contactBook: ContactBook.example)
    }
}
