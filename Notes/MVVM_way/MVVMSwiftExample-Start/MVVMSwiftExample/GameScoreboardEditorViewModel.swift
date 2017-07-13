//
//  File.swift
//  MVVMSwiftExample
//
//  Created by Sergey Biloshkurskyi on 7/11/17.
//  Copyright © 2017 Toptal. All rights reserved.
//

import Foundation

protocol GameScoreboardEditorViewModel {
    var homeTeam: String { get }
    var awayTeam: String { get }
    var time: Dynamic<String> { get }
    var score: Dynamic<String> { get }
    var isFinished: Dynamic<Bool> { get }
    
    var isPaused: Dynamic<Bool> { get }
    
    var homePlayers: [PlayerScoreboardMoveEditorViewModel] { get }
    var awayPlayers: [PlayerScoreboardMoveEditorViewModel] { get }
    
    func togglePause();
}
