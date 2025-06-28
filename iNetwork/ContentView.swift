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
        Text("Your ip \(viewModel.myIp)")
            
        

        .navigationTitle("iNetwork")
        .task {
         await viewModel.getIp()
        }
        .alert(item: $viewModel.appError) { error in
            Alert(title: Text("Error"), message: Text("\(error.localizedDescription)"))
        }
    }
}

#Preview {
    ContentView()
}
