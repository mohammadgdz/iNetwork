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
        ScrollView {
            VStack(alignment: .leading) {
                if let info = viewModel.info {
                    ForEach(info.asKeyValuePairs, id: \.key) { pair in
                        HStack {
                            Text(pair.key)
                                .fontWeight(.bold)
                            Spacer()
                            Text(pair.value)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                    }

                    if let coordinate = info.coordinate {
                        MapView(coordinate: coordinate)
                            .frame(height: 250)
                            .shadow(color: .white, radius: 5, x: 0, y: 0)
                    }

                } else {
                    ProgressView("Loading...")
                }
            }
        }

        .task {
            await viewModel.getInfo()
        }

        .alert(item: $viewModel.appError) { error in
            Alert(
                title: Text("Something went wrong"),
                message: Text("\(error.localizedDescription)"),
                primaryButton: .default(Text("Retry"), action: {
                    Task {
                        await viewModel.getInfo()
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
