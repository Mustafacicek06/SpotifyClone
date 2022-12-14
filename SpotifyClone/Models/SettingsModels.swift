//
//  SettingsModels.swift
//  SpotifyClone
//
//  Created by Mustafa Çiçek on 28.10.2022.
//

import Foundation


struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
