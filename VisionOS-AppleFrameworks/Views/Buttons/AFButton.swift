//
//  AFButton.swift
//  VisionOS-AppleFrameworks
//
//  Created by Rafat on 07/02/24.
//

import Foundation
import SwiftUI

struct AFButton : View {
    var title: String
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(10)
    }
}

struct AFButton_Previews: PreviewProvider {
    static var previews: some View {
        AFButton(title: " Test Title")
    }
}
