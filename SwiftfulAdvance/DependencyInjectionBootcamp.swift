//
//  DependencyInjectionBootcamp.swift
//  SwiftfulAdvance
//
//  Created by Uri on 31/10/23.
//

import SwiftUI
import Combine

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

// class that fetches data from repository
class ProductionDataService {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    func getData() -> AnyPublisher<[PostModel], Error> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map({ $0.data })
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

class DependencyInjectionViewModel: ObservableObject {
    
    @Published var dataArray: [PostModel] = []
    var cancellables = Set<AnyCancellable>()
    let dataService: ProductionDataService
    
    init(dataService: ProductionDataService) {
        self.dataService = dataService
        loadPosts()
    }
    
    private func loadPosts() {
        dataService.getData()
            .sink { _ in

            } receiveValue: { [weak self] returnedPosts in
                guard let self = self else { return }
                self.dataArray = returnedPosts
            }
            .store(in: &cancellables)
    }
}

struct DependencyInjectionBootcamp: View {
    
    @StateObject private var vm: DependencyInjectionViewModel
    
    init(dataService: ProductionDataService) {
        _vm = StateObject(wrappedValue: DependencyInjectionViewModel(dataService: dataService))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(vm.dataArray) { post in
                    Text(post.title)
                }
            }
        }
    }
}

struct DependencyInjectionBootcamp_Previews: PreviewProvider {
    
    static let dataService = ProductionDataService()
    
    static var previews: some View {
        DependencyInjectionBootcamp(dataService: dataService)
    }
}
