//
//  ContentView.swift
//  iNetwork
//
//  Created by Mohammad on 2025-06-26.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = IPViewModel()

    var body: some View {
        Text("Your ip is \(viewModel.myIp)")
        .navigationTitle("iNetwork")
        
        .task {
           await viewModel.getIp()
        }
        
        .alert(item: $viewModel.appError) { error in
            Alert(
                title: Text("Something went wrong"),
                message: Text("\(error.localizedDescription)"),
                primaryButton: .default(Text("Retry"),action: {
                    Task {
                        await viewModel.getIp()
                    }
                }),
                secondaryButton: .default(Text("Ok"))
            )
            
        }
    }
}

#Preview {
    ContentView()
}
