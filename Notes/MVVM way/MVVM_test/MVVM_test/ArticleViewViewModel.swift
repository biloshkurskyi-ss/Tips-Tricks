//
//  ArticleViewViewModel.swift
//  MVVM_test
//
//  Created by Sergey Biloshkurskyi on 7/9/17.
//  Copyright © 2017 Sergey Biloshkurskyi. All rights reserved.
//

import Foundation
import UIKit

protocol ArticleViewViewModel {
    var title: Dynamic<String> { get }
    var body: Dynamic<String> { get }
    var date: Dynamic<String> { get }
    var thubnail: Dynamic<UIImage?> { get }
}
