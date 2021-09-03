//
//  Extentions.swift
//  Game Center
//
//  Created by Dicoding Reviewer on 20/08/21.
//

import Foundation

extension Data {
    func jsonToString() -> String {
        return String(data: self, encoding: .utf8) ?? "error encoding"
    }
}
