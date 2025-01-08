//
//  MemePrincipal.swift
//  Meme Generator
//
//  Created by Madaga on 05/12/2024.
//

import SwiftUI

struct MemePrincipal: View {
    
    @State private var selectedImage = "chill guy-1"
    @State private var isCustomizationEnabled = false
    @State private var memeText = ""
    @State private var textPosition = 0.5
    @State private var textColor = Color.white
    @State private var isTextShadowEnabled = true
    @State private var textSize: CGFloat = 30
    
    let imageHeight: CGFloat = 200
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack {
                    Image(selectedImage)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .frame(height: imageHeight)
                    
                    if isCustomizationEnabled {
                        Text(memeText)
                            .font(.system(size: textSize, weight: .bold))
                            .foregroundColor(textColor)
                            .shadow(radius: isTextShadowEnabled ? 4 : 0)
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.5) // Permet au texte de se réduire automatiquement
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(maxWidth: geometry.size.width * 0.8, maxHeight: imageHeight * 0.8)
                            .lineLimit(4)
                            .offset(y: (textPosition - 0.5) * (imageHeight * 0.6))
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: imageHeight)
            }
            .frame(height: imageHeight)
            
            ScrollMeme(selectedImage: $selectedImage)
            
            ScrollView(.vertical, showsIndicators: false) {
                Toggle("Ajouter un texte", isOn: $isCustomizationEnabled)
                    .padding(.horizontal)
                
                if isCustomizationEnabled {
                    VStack(spacing: 15) {
                        TextField("Entrez votre texte", text: $memeText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        VStack(alignment: .leading) {
                            Text("Position du texte")
                            Slider(value: $textPosition)
                        }
                        VStack(alignment: .leading) {
                            Text("Taille du texte: \(Int(textSize))")
                            Slider(value: $textSize, in: 10...28) // Slider pour la taille du texte
                                                }
                        
                        ColorPicker("Couleur du texte", selection: $textColor)
                        
                        Toggle("Ombre du texte", isOn: $isTextShadowEnabled)
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}


struct MemePrincipal_Previews: PreviewProvider {
    static var previews: some View {
        MemePrincipal()
    }
}
