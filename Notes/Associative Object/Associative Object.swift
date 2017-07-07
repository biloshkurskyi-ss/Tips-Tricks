//
//  Associative Object.swift
//  
//
//  Created by Sergey Biloshkurskyi on 7/7/17.
//
//

import UIKit

//MARK: - Example

extension UIImageView {
    private struct AssosiationKey {
        static let dataTask = "_dataTask"
        static let session = "_objectDowloadSession"
    }
    
    public var dataTask: URLSessionDataTask? {
        get {
            return objc_getAssociatedObject(self, &AssosiationKey.dataTask) as? URLSessionDataTask
        }
        set {
            dataTask?.cancel()
            objc_setAssociatedObject(self, ^AssosiationKey.dataTask, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    // MARK: - Instance Methods
    @discardableResult public func setImage(url: URL?) -> URLSessionDataTask? {
        guard let url = url else {
            self.dataTask = nil
            image = nil
            return nil
        }
        let dataTask = UIImageView.imageDownloader.dataTask(
            with: url, completionHandler: { [weak self] (data, response, error) in
                guard let strongSelf = self else { return }
                guard let data = data, let image = UIImage(data: data) else {
                    print("Image download failed: \(String(describing: error))")
                    strongSelf.image = nil
                    return
                }
                DispatchQueue.main.async { [weak self] in
                    guard let strongSelf = self else { return }
                    strongSelf.image = image
                }
        })
        dataTask.resume()
        self.dataTask = dataTask
        return dataTask
    }
}

//MARK: - Sources information

let first = "http://nshipster.com/associated-objects/"
let second = "https://stackoverflow.com/questions/2846218/how-do-i-use-objc-setassociatedobject-objc-getassociatedobject-inside-an-object"
