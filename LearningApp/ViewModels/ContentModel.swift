//
//  ContentModel.swift
//  LearningApp
//
//  Created by 𝔲𝔤𝔩𝔶 ♡ on 7/17/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Learning]()
    @Published var currentModule: Learning?
    @Published var currLesson: Lessons?
    @Published var lessonDesc = NSAttributedString()
    
    var currModuleIndex = 0
    var currLessonIndex = 0
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
    
    func beginModule (_ moduleID: Int) {
        
        for idx in 0 ..< modules.count {
            
            if modules[idx].id == moduleID {
                
                currModuleIndex = idx
                break
                
            }
            
        }
        
        currentModule = modules[currModuleIndex]
        
    }
    
    func beginLesson (_ lessonIndex: Int) {
        
        if lessonIndex < currentModule!.content.lessons.count { currLessonIndex = lessonIndex }
        else { currLessonIndex = 0 }
        
        currLesson = currentModule!.content.lessons[currLessonIndex]
        lessonDesc = addStyling(currLesson!.explanation)
        
    }
    
    func hasNextLesson () -> Bool { return currLessonIndex + 1 < currentModule!.content.lessons.count }
    
    func nextLesson () {
        
        currLessonIndex += 1
        
        if currLessonIndex < currentModule!.content.lessons.count {
            
            currLesson = currentModule!.content.lessons[currLessonIndex]
            lessonDesc = addStyling(currLesson!.explanation)
            
        }
        
        else {
            
            currLessonIndex = 0
            currLesson = nil
            
        }
        
    }
    
    private func addStyling (_ HTMLString: String) -> NSAttributedString {
        
        var resultString = NSAttributedString()
        var data = Data()
        
        if styleData != nil { data.append(styleData!) }
        
        data.append( Data(HTMLString.utf8) )
        
        if let attributeString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            
            resultString = attributeString
            
        }
        
        return resultString
        
    }
    
}
