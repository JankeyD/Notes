//
//  NoteViewController.swift
//  Notes
//
//  Created by Roman Lazan on 16.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import UIKit
import RxSwift

class NoteViewController: UIViewController, StoryBoarded {
    var viewModel: NoteViewModel?
    
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNoteObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        textView.becomeFirstResponder()
    }
    
    private func setupNoteObserver() {
        viewModel?.note.asObservable()
            .subscribe(onNext: { note in
                self.textView.text = note?.title
            })
            .disposed(by: disposeBag)
    }
}
