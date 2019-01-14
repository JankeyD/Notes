//
//  ViewController.swift
//  Notes
//
//  Created by Roman Lazan on 11.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import UIKit

class NotesViewCotroller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = NotesService()
        let _ = service.getNotes { response in
            if case .success(let noteResponse) = response {
                let notes = noteResponse?.notes
            }
            
            if case .failure(let error) = response {
                print("")
            }
        }
        
    }


}

