//
//  HomeViewRow.swift
//  LearningApp
//
//  Created by 𝔲𝔤𝔩𝔶 ♡ on 7/18/22.
//

import SwiftUI

struct HomeViewRow: View {
    
    var image: String,
        title: String,
        description: String,
        count: String,
        time: String
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio( CGSize(width: 335, height: 175), contentMode: .fit )
            
            HStack {
                
                Image(image)
                    .resizable()
                    .clipShape( Circle() )
                    .frame(width: 116, height: 116)
                
                VStack (alignment: .leading, spacing: 5) {
                    
                    Text(title)
                        .font(.headline)
                    
                    Text(description)
                        .font( Font.custom("Avenir", size: 12) )
                        .padding(.bottom, 30)
                    
                    HStack {
                        
                        Image(systemName: "text.book.closed")
                        
                        Text(count)
                            .font( Font.custom("Avenir", size: 12) )
                            .bold()
                        
                        Spacer()
                        
                        Image(systemName: "clock")
                        
                        Text(time)
                            .font( Font.custom("Avenir", size: 12) )
                            .bold()
                        
                    }
                        .foregroundColor(.gray)
                    
                }
                
            }
                .padding(.horizontal, 20)
            
        }
        
    }
    
}

struct HomeViewRow_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeViewRow(image: "swift", title: "Learn Swift", description: "some description", count: "10 lessons", time: "2 Hours")
    }
}
