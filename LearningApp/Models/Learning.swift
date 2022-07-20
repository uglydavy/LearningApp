//
//  Learning.swift
//  LearningApp
//
//  Created by 𝔲𝔤𝔩𝔶 ♡ on 7/17/22.
//

import Foundation

class Learning: Identifiable, Decodable {
    
    var id: Int,
        category: String,
        content: Content,
        test: Test
    
}

struct Content: Identifiable, Decodable {
    
    var id: Int,
        image: String,
        time: String,
        description: String,
        lessons: [Lessons]
    
}

struct Lessons: Identifiable, Decodable {
    
    var id: Int,
        title: String,
        video: String,
        duration: String,
        explanation: String
    
    
}

struct Test: Identifiable, Decodable {
    
    var id: Int,
        image: String,
        time: String,
        description: String,
        questions: [Questions]
    
}

struct Questions: Identifiable, Decodable {
    
    var id: Int,
        content: String,
        correctIndex: Int,
        answers: [String]
    
    
}
