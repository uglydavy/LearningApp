//
//  CodeTextView.swift
//  LearningApp
//
//  Created by 𝔲𝔤𝔩𝔶 ♡ on 7/20/22.
//

import SwiftUI

struct CodeTextView: UIViewRepresentable {
    
    @EnvironmentObject var model: ContentModel
    
    func makeUIView (context: Context) -> UITextView {
        
        let textView = UITextView()
        textView.isEditable = false
        return textView
        
    }
    
    func updateUIView (_ textView: UITextView, context: Context) {
        
        textView.attributedText = model.lessonDesc
        textView.scrollRectToVisible( CGRect(x: 0, y: 0, width: 1, height: 1) , animated: false )
        
    }
    
}

struct CodeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextView()
    }
}
