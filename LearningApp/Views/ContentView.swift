//
//  LessonListView.swift
//  LearningApp
//
//  Created by 𝔲𝔤𝔩𝔶 ♡ on 7/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack {
                
                if model.currentModule != nil {
                    
                    ForEach (0 ..< model.currentModule!.content.lessons.count, id: \.self) { idx in
                        
                        NavigationLink (
                            
                            destination: ContentDetailsView()
                                .onAppear( perform: { model.beginLesson(idx) } ),
                            
                            label: {  ContentViewRow(idx: idx)
                                
                        })
                        
                    }
                    
                }
                
            }
                .accentColor(.black)
                .padding()
                .navigationTitle("Learn \(model.currentModule?.category ?? "")")
            
        }
        
    }
    
}
