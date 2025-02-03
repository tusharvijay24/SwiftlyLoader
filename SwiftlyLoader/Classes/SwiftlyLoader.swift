//
//  SwiftlyLoader.swift
//  SwiftlyLoader
//
//  Created by Tushar on 03/02/25.
//

import Foundation
import UIKit

public class SwiftlyLoader {
    public static let shared = SwiftlyLoader() // Singleton instance
    
    private var loaderView: SwiftlyLoaderView?

    private init() {} // Private constructor for Singleton

    public func show(config: SwiftlyLoaderConfig = SwiftlyLoaderConfig()) {
        hide() // Ensure any previous loader is removed

        // ✅ Get the top-most key window
        guard let keyWindow = UIApplication.shared.connectedScenes
            .compactMap({ ($0 as? UIWindowScene)?.windows.first(where: { $0.isKeyWindow }) })
            .first else {
            print("❌ Error: No key window found")
            return
        }

        let loader = SwiftlyLoaderView(config: config)
        self.loaderView = loader // ✅ Store reference to prevent deallocation

        keyWindow.addSubview(loader)
        print("✅ SwiftLoader added to key window")
    }

    public func hide() {
        loaderView?.stop()
        loaderView?.removeFromSuperview()
        loaderView = nil
        print("✅ SwiftLoader removed")
    }
}
