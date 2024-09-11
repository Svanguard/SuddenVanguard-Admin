//
//  HapticFeedbackManager.swift
//  SuddenVanguard-Admin
//
//  Created by 최동호 on 9/10/24.
//

import UIKit

public final class HapticFeedbackManager {
    
    public static let shared = HapticFeedbackManager()

    public let generator = UIImpactFeedbackGenerator(style: .medium)
    
    public init() {
        generator.prepare()
    }
    
    public func triggerHapticFeedback() {
        generator.impactOccurred()
    }
}
