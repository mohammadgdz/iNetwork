//
//  ViewModel.swift
//  iNetwork
//
//  Created by Mohammad on 2025-06-26.
//

import Foundation

@MainActor
class IPViewModel: ObservableObject {
    @Published var myIp = "loading..."
    @Published var info: InfoModel?
    @Published var appError: AppError?
    
    func getIp() async {
        do {
            guard let url = URL(string: "https://api.ipify.org/?format=json") else {
                appError = .network
                return
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            let ipModel = try JSONDecoder().decode(IPModel.self, from: data)
            myIp = ipModel.ip
            print(myIp)
        } catch {
            appError = .unknown
        }
    }
}

    /// Combine Version
//    private var cancellables = Set<AnyCancellable>()
//    func getIp() {
//        //Cheking URL
//        guard let url = URL(string: "https://api.ipify.org/?format=json") else {
//             appError = .url
//            return
//        }
//
//        URLSession.shared.dataTaskPublisher(for: url)
//            .map(\.data)
//            .decode(type: IPModel.self, decoder: JSONDecoder())
//            .map( \.ip )
//            .receive(on: DispatchQueue.main)
//            .sink { completion in
//                if case .failure(let error) = completion {
//                    if error is DecodingError {
//                        self.appError = .decoding
//                    } else {
//                        self.appError = .network
//                    }
//                }
//
//            } receiveValue: { [weak self] ip in
//                self?.myIp = ip
//            }
//            .store(in: &cancellables)
//    }
