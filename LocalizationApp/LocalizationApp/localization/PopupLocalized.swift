//
//  PopupLocalized.swift
//  LocalizationApp
//
//  Created by Morgan Collino on 12/9/19.
//  Copyright © 2019 Morgan Collino. All rights reserved.
//

import Foundation

private class PopupLocalized { }

public struct PopupStrings {

    static let tableName: String = "Popup"

    static func localize(_ key: String) -> String {
        return NSLocalizedString(key, tableName: tableName, bundle: Bundle(for: PopupLocalized.self), comment: "")
    }

    static func localizeParameter(key: Keys, parameter: SubKeys, value: CVarArg) -> String {
        let format: String = localize(key.withParameter(parameter))
        return String.localizedStringWithFormat(format, value)
    }

    enum Keys: String {
        case ctaDismiss = "popup.cta_dismiss"
        case title = "popup.title"
        case description = "popup.description"
        case cta = "popup.cta"

        func withParameter(_ parameter: SubKeys) -> String {
            return [rawValue, parameter.rawValue].joined(separator: ".")
        }
    }

    enum SubKeys: String {
        case userName
        case numberOfSongs
        case playlistName
    }

    static let title: String = localize(Keys.title.rawValue)
    static func description(userName: String, numberOfSongs: Int, playlistName: String) -> String {
        let format: String = localize(Keys.description.rawValue)
        let numberOfSongsResult: String = localizeParameter(key: Keys.description, parameter: SubKeys.numberOfSongs, value: numberOfSongs)
        let result: String = String.localizedStringWithFormat(format, userName, numberOfSongsResult, playlistName)
        return result
    }

    static let cta: String = localize(Keys.cta.rawValue)
    static let ctaDismiss: String = localize(Keys.ctaDismiss.rawValue)
}
