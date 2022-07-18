//
//  ContentView.swift
//  LearningApp
//
//  Created by 𝔲𝔤𝔩𝔶 ♡ on 7/17/22.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        NavigationView {
            
            VStack (alignment: .leading) {
                
                Text("What would you like to do today ?")
                    .font(.headline)
                    .bold()
                    .padding(.leading)
                    
                ScrollView {
                    
                    LazyVStack {
                        
                        ForEach (model.modules) { module in
                            
                            VStack (spacing: 20) {
                                
                                NavigationLink (
                                    destination: ContentView()
                                        .onAppear( perform: { model.beginModule(module.id) } ),
                                    label: {
                                        
                                        HomeViewRow(image: module.content.image, title: "Learning \(module.category)", description: module.content.description, count: " \(module.content.lessons.count) lessons", time: module.content.time)
                                    
                                })
                                
                                HomeViewRow(image: module.test.image, title: "\(module.category) Test", description: module.test.description, count: " \(module.test.questions.count) lessons", time: module.test.time)
                                
                            }
                            
                        }
                        
                    }
                        .padding()
                        .accentColor(.black)
                    
                }
                
            }
                .navigationTitle("Get Started")
            
        }
            .navigationViewStyle(.stack)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeView()
            .environmentObject( ContentModel() )
        
    }
}
