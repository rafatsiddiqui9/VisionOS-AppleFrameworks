//
//  ContentView.swift
//  Test
//
//  Created by Rafat on 06/02/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        ScrollView {
            LazyVGrid(columns: viewModel.columns){
                ForEach(MockData.frameworks) {framework in FrameworkTitleView(framework:framework)
                        .onTapGesture {
                            viewModel.selectedFramework = framework
                        }
                }
            }
        }
        .sheet(isPresented: $viewModel.isShowingDetailView)
        {
            FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework, isShowingDetailView: $viewModel.isShowingDetailView)
        }
//        Spacer()
        

        
            
//        VStack {
//            Model3D(named: "Scene", bundle: realityKitContentBundle)
//                .padding(.bottom, 50)
//
//            
//            Toggle("Show Immersive Space", isOn: $showImmersiveSpace)
//                .toggleStyle(.button)
//                .padding(.top, 50)
//        }
        .padding()
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    FrameworkGridView()
}

//struct FrameworkGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        FrameworkGridView()
//            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
//    }
//}


