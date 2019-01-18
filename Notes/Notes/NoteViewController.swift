//
//  NoteViewController.swift
//  Notes
//
//  Created by Roman Lazan on 16.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController, StoryBoarded {
    var viewModel: NoteViewModel?
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateTextView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        viewModel?.updateNote(withText: textView.text)
    }
    
    private func updateTextView() {
        textView.text = viewModel?.note.title
        textView.becomeFirstResponder()
    }
}
