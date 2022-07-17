//
//  ContentModel.swift
//  LearningApp
//
//  Created by 𝔲𝔤𝔩𝔶 ♡ on 7/17/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Learning]()
    var styleData: Data?
    
    init () { getData() }
    
    func getData () {
        
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            
            let jsonData = try Data(contentsOf: jsonUrl!)
            let jsonDecoder = JSONDecoder()
            
            do {
                
                let modules = try jsonDecoder.decode([Learning].self, from: jsonData)
                self.modules = modules
                
            } catch { print(error) }
            
        } catch { print(error) }
        
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            
            let styleData = try Data(contentsOf: styleUrl!)
            self.styleData = styleData
            
        } catch { print(error) }
        
    }
    
}
