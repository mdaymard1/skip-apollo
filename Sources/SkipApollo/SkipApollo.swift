import Foundation

#if SKIP
import com.apollographql.apollo3.ApolloClient
//import com.apollographql.apollo3.MemoryCacheFactory

import com.apollographql.apollo3.api.http.HttpRequest
import com.apollographql.apollo3.api.http.HttpResponse
import com.apollographql.apollo3.network.http.HttpInterceptor
import com.apollographql.apollo3.network.http.HttpInterceptorChain

public class SkipApolloModule {
}

public class InMemoryNormalizedCache {
//    let inMemoryCache = MemoryCacheFactory()
}

public class ApolloStore {
    var cache: InMemoryNormalizedCache
    
    init(cache: InMemoryNormalizedCache) {
        print("initializing InMemoryNormalizedCache")
        self.cache = cache
    }
//    let store = com.apollographql.apollo3.ApolloStore()
}

public protocol GraphQLOperation {

    associatedtype Data: String
}

public class DefaultInterceptorProvider {
    var store: ApolloStore
    
    init(store: ApolloStore) {
        self.store = store
    }
    
    func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation {
        
        return []
    }
}

public class RequestChainNetworkTransport {
    private var interceptorProvider: DefaultInterceptorProvider
    private var endpointURL: URL
    
    init(interceptorProvider: DefaultInterceptorProvider, endpointURL: URL) {
        self.interceptorProvider = interceptorProvider
        self.endpointURL = endpointURL
    }
}

public class ApolloClient {
    
//    var apolloClient: ApolloClient
    
    private var networkTransport: RequestChainNetworkTransport
    private var store: ApolloStore
    private var androidApolloClient: com.apollographql.apollo3.ApolloClient
    
    init(networkTransport: RequestChainNetworkTransport, store: ApolloStore) {
        self.networkTransport = networkTransport
        self.store = store
        
        androidApolloClient = ApolloClient.Builder()
        //    .serverUrl("http://10.0.0.36:4000/graphql")
            .serverUrl("https://api.magicstory.com")
//            .addHttpInterceptor(AuthorizationInterceptor())
            .build()
    }
}

public class ApolloInterceptor {
    
//    func interceptAsync<Operation>(
//        chain: RequestChain,
//        request: HTTPRequest<Operation>,
//        response: HTTPResponse<Operation>?,
//        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
//    ) where Operation : GraphQLOperation {
//    }
}

#endif
