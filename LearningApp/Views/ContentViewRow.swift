//
//  ContentViewRow.swift
//  LearningApp
//
//  Created by 𝔲𝔤𝔩𝔶 ♡ on 7/19/22.
//

import SwiftUI

struct ContentViewRow: View {
    
    @EnvironmentObject var model: ContentModel
    var idx: Int
    
    var body: some View {
        
        let lesson = model.currentModule!.content.lessons[idx]
        
        ZStack (alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            
            HStack (spacing: 30) {
                
                Text( String(idx + 1) )
                    .bold()
                
                VStack (alignment: .leading) {
                    
                    Text(lesson.title)
                        .font( Font.custom("Avenir", size: 14) )
                        .bold()
                    
                    
                    Text(lesson.duration)
                        .font( Font.custom("Avenir", size: 12) )
                    
                }
                
            }
                .padding()
            
        }
            .padding(.bottom, 5)
        
    }
    
}
