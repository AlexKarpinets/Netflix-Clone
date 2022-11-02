//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Karpinets Alexander on 02.11.2022.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
