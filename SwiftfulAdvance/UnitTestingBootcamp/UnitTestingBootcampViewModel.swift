//
//  UnitTestingBootcampViewModel.swift
//  SwiftfulAdvance
//
//  Created by Uri on 1/11/23.
//

import Foundation
import SwiftUI
import Combine

class UnitTestingBootcampViewModel: ObservableObject {
    
    @Published var isPremium: Bool
    @Published var dataArray: [String] = []
    @Published var selectedItem: String? = nil
    
    let dataService: NewDataServiceProtocol
    var cancellables = Set<AnyCancellable>()
    
    init(isPremium: Bool, dataService: NewDataServiceProtocol = NewMockDataService(items: nil)) {
        self.isPremium = isPremium
        self.dataService = dataService
    }
    
    func addItem(item: String) {
        guard !item.isEmpty else { return }
        self.dataArray.append(item)
    }
    
    func selectItem(item: String) {
        if let x = dataArray.first(where: { $0 == item }) {
            selectedItem = x
        // reset selectedItem if input passed is not in dataArray
        } else {
            selectedItem = nil
        }
    }
    
    func saveItem(item: String) throws {
        guard !item.isEmpty else {
            throw DataError.noData
        }
        
        // check if the item we want to save is in dataArray
        if let x = dataArray.first(where: { $0 == item }) {
            debugPrint("Save item here \(x)")
        } else {
            throw DataError.itemNotFound
        }
    }
    
    enum DataError: LocalizedError {
        case noData
        case itemNotFound
    }
    
//  MARK: - DataService
    func downloadWithEscaping() {
        dataService.downloadItemsWithEscaping { [weak self] returnedItems in
            guard let self = self else { return }
            self.dataArray = returnedItems
        }
    }
    
    func downloadWithCombine() {
        dataService.downloadItemsWithCombine()
            .sink { _ in
                
            } receiveValue: { [weak self ]returnedItems in
                guard let self = self else { return }
                self.dataArray = returnedItems
            }
            .store(in: &cancellables)

    }
}
