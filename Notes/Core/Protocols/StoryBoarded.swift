//
//  StoryBoarded.swift
//  Notes
//
//  Created by Roman Lazan on 16.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//

import UIKit

/// Used to provide an instance from Storyboard base on ID
public protocol StoryBoarded {
    static func instantiate() -> Self
}

// MARK: - Default Implementation

extension StoryBoarded where Self: UIViewController {
    public static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        
        let className = fullName.components(separatedBy: ".")[1]
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
