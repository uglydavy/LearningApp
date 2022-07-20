//
//  ContentDetailsView.swift
//  LearningApp
//
//  Created by 𝔲𝔤𝔩𝔶 ♡ on 7/19/22.
//

import SwiftUI
import AVKit

struct ContentDetailsView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        let lesson = model.currLesson,
            url = URL( string: Constants.videoHostURL + (lesson?.video ?? "") )
        
        VStack {
            
            if url != nil {
                
                VideoPlayer( player: AVPlayer(url: url!) )
                    .cornerRadius(10)
                
            }
            
            CodeTextView()
            
            if model.hasNextLesson() {
                
                Button(
                    action: {  model.nextLesson() },
                    
                    label: {
                        
                        ZStack {
                            
                            Rectangle()
                                .foregroundColor(.green)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .frame(height: 45)
                            
                            Text("Next Lesson: \( model.currentModule!.content.lessons[model.currLessonIndex + 1].title) ")
                                .foregroundColor(.white)
                                .font( Font.custom("Avenir", size: 16) )
                                .bold()
                            
                        }
                })
                
            }
            
        }
            .padding()
            .navigationBarTitle(lesson?.title ?? "")
        
    }
    
}

struct ContentDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentDetailsView()
        
    }
}
