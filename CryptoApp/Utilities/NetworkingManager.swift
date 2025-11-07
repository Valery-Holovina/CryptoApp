//
//  NetworkingManager.swift
//  CryptoApp
//
//  Created by Valery on 23.09.2025.
//

import Foundation
import Combine

class NetworkingManager{
    
    enum NetworkingError: LocalizedError{
        case badURlRespnse(url: URL)
        case unknown
        
        var errorDescription: String?{
            switch self {
            case .badURlRespnse(url: let url):
                return " [🔥] Bad response from url: \(url)"
            case .unknown:
                return "[⚠️] Unknown error occured"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        
        return URLSession.shared.dataTaskPublisher(for: url)
//            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleURLResponse(output: $0, url: url)})
            .retry(3) // if fails will try to download again
            .eraseToAnyPublisher() // convert to  AnyPublisher<Data, Error>
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data{
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else{
            throw NetworkingError.badURlRespnse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<any Publishers.Decode<AnyPublisher<Data, any Error>, [CoinModel], JSONDecoder>.Failure> ){
        switch completion{
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
