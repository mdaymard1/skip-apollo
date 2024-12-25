import Foundation

#if SKIP
import com.apollographql.apollo3.ApolloClient
//import com.apollographql.apollo3.MemoryCacheFactory
import com.apollographql.apollo3.ApolloStore

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

public class DefaultInterceptorProvider {
    var client: URLSessionClient
    var store: ApolloStore
    
    init(client: URLSessionClient, store: ApolloStore) {
        self.client = client
        self.store = store
    }
    
    func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation {
        
    }
}

public class ApolloInterceptor {
    
    func interceptAsync<Operation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) where Operation : GraphQLOperation {
    }
}

#endif
