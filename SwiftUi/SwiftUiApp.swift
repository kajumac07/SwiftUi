//
//  SwiftUiApp.swift
//  SwiftUi
//
//  Created by Atul Tiwari on 06/09/25.
//

import SwiftUI

@main
struct SwiftUiApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(imageViewModel: ImageViewModel())
        }
    }
}
