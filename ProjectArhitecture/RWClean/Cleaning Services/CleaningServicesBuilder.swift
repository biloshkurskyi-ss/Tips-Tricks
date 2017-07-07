//
//  CleaningServicesBuilder.swift
//  RWClean
//
//  Created by Sergey Biloshkurskyi on 7/7/17.
//  Copyright © 2017 Razeware, LLC. All rights reserved.
//

import Foundation

public class  CleaningServicesBuilder {
    public class func instantiateNavigationController() -> UINavigationController {
        let bundle = Bundle(for: type(of: self))
        let storyboard = UIStoryboard(name: "CleaningServices", bundle: bundle)
        return storyboard.instantiateInitialViewController() as! UINavigationController
    }
}
