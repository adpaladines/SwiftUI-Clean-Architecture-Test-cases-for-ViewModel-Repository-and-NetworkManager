//
//  MVVMAPICallSwiftUIApp.swift
//  MVVMAPICallSwiftUI
//
//  Created by Andres D. Paladines on 7/18/23.
//

import SwiftUI

@main
struct MVVMAPICallSwiftUIApp: App {

    var body: some Scene {
        WindowGroup {
            MainPageView()
                .environmentObject(Coordinator())
        }
    }

}
