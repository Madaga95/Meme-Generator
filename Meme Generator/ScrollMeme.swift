//
//  ScrollMeme.swift
//  Meme Generator
//
//  Created by Madaga on 05/12/2024.
//

import SwiftUI

struct ScrollMeme: View {
    
    @Binding var selectedImage: String
    
    let images = ["chill guy-1","bizzar", "kevin hart", "mouai", "Unknown-2", "Unknown","joconde"]
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(images, id: \.self) { imageName in
                            ZStack(alignment: .topTrailing){
                                Image(imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 90)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                    .onTapGesture {
                                        selectedImage = imageName
                                    }
                                // Affiche le checkmark uniquement sur l'image sélectionnée
                                if selectedImage == imageName {
                                    Image(systemName: "checkmark.circle.fill"
                                    )
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16))
                                    .background(Circle().fill(Color.black))
                                    .padding(8)
                                    .shadow(radius: 5)
                                }
                            }
                            
                            
                        }
                    }
                    .padding()
        }
    }
}

struct ScrollMeme_Previews: PreviewProvider {
    static var previews: some View {
        ScrollMeme(selectedImage: .constant("chill guy-1"))
            .padding()
    }
}
