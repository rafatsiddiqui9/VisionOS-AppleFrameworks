//
//  FrameworkGridViewModel.swift
//  VisionOS-AppleFrameworks
//
//  Created by Rafat on 08/02/24.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true}
    }
    @Published var isShowingDetailView = false
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
}
