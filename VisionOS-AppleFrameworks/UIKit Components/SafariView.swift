//
//  SafariView.swift
//  VisionOS-AppleFrameworks
//
//  Created by Rafat on 08/02/24.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    
    let url: URL
    
    // Corrected the syntax for the context parameter
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }
    
    // Corrected the syntax for the context parameter
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        // Implementation here, if needed to update the view controller.
        // Often, for a simple SFSafariViewController usage, this can be left empty.
    }
}

