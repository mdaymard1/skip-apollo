//
//  File.swift
//
//
//  Created by Mike Aymard on 12/25/24.
//

import Foundation

#if !SKIP
import Apollo
import ApolloAPI

extension ApolloClient {
    
    /// Temporaty hack until Apollo supports true async await:  https://github.com/apollographql/apollo-ios/issues/2216
    func fetchAsync<Query: GraphQLQuery>(query: Query, cachePolicy: CachePolicy = .default) async throws -> GraphQLResult<Query.Data> {
        return try await withCheckedThrowingContinuation { continuation in
            fetch(query: query, cachePolicy: .fetchIgnoringCacheData) { result in
                switch result {
                case .success(let value):
                    continuation.resume(returning: value)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    func performAsync<Mutation: GraphQLMutation>(mutation: Mutation) async throws -> GraphQLResult<Mutation.Data> {
        return try await withCheckedThrowingContinuation { continuation in
            perform(mutation: mutation) { result in
                switch result {
                case .success(let value):
                    continuation.resume(returning: value)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
        
    }
}
#endif
