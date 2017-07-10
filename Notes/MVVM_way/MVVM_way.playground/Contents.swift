//MVVM should be a good paradigm. If you don't know it you are missing big pice of development cake.
//This note for beginners and way how I have learned MVVM.and

import UIKit

struct Resource {
    var index: Int
    var topic: String
    var url: String
    var comment: String? = nil
}

 var resourses = [Resource]()

resourses.append(Resource(index: 0, topic: "iOS Architecture Patterns", url: "https://medium.com/ios-os-x-development/ios-architecture-patterns-ecba4c38de52", comment: "START!"))
resourses.append(Resource(index: 1, topic: "ReactiveCocoa vs RxSwift", url: "https://www.raywenderlich.com/126522/reactivecocoa-vs-rxswift", comment: nil))
resourses.append(Resource(index: 2, topic: "Functional Programming", url: "https://www.raywenderlich.com/82599/swift-functional-programming-tutorial", comment: "Good to know by previous topic. If you dont know it, dont be upset."))
resourses.append(Resource(index: 3, topic: "MVVM Sample", url: "https://stackoverflow.com/questions/25970098/mvvm-sample-example-implementation-in-ios", comment: nil))
resourses.append(Resource(index: 4, topic: "Not toy app", url: "https://codereview.stackexchange.com/questions/62958/rewrite-code-from-objective-c-to-conform-with-swift-power-tools-and-concise-styl", comment: "Why you should use MVVM"))

resourses.append(Resource(index: 5, topic: "Bindings, Generics, Swift and MVVM", url: "http://rasic.info/bindings-generics-swift-and-mvvm/", comment: nil))

var commentsForCreation = [String]()
commentsForCreation.append("define a protocol that specifies what exactly view (controller) displays. That’ll be our view model.")
commentsForCreation.append("made the view controller independent of the model")
commentsForCreation.append(" get actual data")
commentsForCreation.append("The controller doesn’t know anything about the model ")
commentsForCreation.append("All model processing is done in view model")

resourses.append(Resource(index: 6, topic: "From MVC to MVVM in Swift", url: "http://rasic.info/from-mvc-to-mvvm-in-swift/", comment:commentsForCreation.joined(separator: ", ")))

resourses.append(Resource(index: 7, topic: "1st MVVM example", url: "https://github.com/sergVn/Tips-Tricks/tree/master/Notes/MVVM%20way/MVVM_test", comment: "Test app for understanding"))
resourses.append(Resource(index: 8, topic: "Different Take on MVVM", url: "http://rasic.info/a-different-take-on-mvvm-with-swift/", comment: nil))

resourses.append(Resource(index: 9, topic: "MVC and MVVM", url: "https://www.captechconsulting.com/blogs/ios-design-patterns-mvc-and-mvvm", comment: "The base meaning of MVVM"))
resourses.append(Resource(index: 10, topic: "Pure Swift MVVM", url: "https://www.mobiledefense.com/blog/2016/02/07/pure-swift-mvvm/", comment: nil))
resourses.append(Resource(index: 11, topic: "2nd MVVM example", url: "https://github.com/sergVn/Tips-Tricks/tree/master/Notes/MVVM%20way/MVVM_test_2", comment: "Test app 2"))


//resourses.append(Resource(index: <#T##Int#>, topic: <#T##String#>, url: "http://rasic.info/a-different-take-on-mvvm-with-swift/", comment: <#T##String?#>))
//resourses.append(Resource(index: <#T##Int#>, topic: <#T##String#>, url: <#T##String#>, comment: <#T##String?#>))


