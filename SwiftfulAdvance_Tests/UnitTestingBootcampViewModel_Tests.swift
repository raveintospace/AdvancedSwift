//
//  UnitTestingBootcampViewModel_Tests.swift
//  SwiftfulAdvance_Tests
//  L17 - https://youtu.be/eqdvIUKsM2A?si=rRg49WK8NHrgItHG
//  Created by Uri on 1/11/23.
//

import XCTest
@testable import SwiftfulAdvance

/*
 Naming structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior -> test_movieViewModel_pagesEnded_shouldBeTrue()
 
 Naming structure: test_[struct or class]_[variable or function]_[expected result]
 
 Testing structure: Given - When - Then
 */

final class UnitTestingBootcampViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_UnitTestingBootcampViewModel_isPremium_shouldBeTrue() {
        // Given
        let userIsPremium: Bool = true
        
        // When
        let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssertTrue(vm.isPremium)
    }
    
    func test_UnitTestingBootcampViewModel_isPremium_shouldBeFalse() {
        // Given
        let userIsPremium: Bool = false
        
        // When
        let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssertFalse(vm.isPremium)
    }
    
    func test_UnitTestingBootcampViewModel_isPremium_shouldInjectedValue() {
        // Given
        let userIsPremium: Bool = Bool.random()
        
        // When
        let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
        
        // Then
        XCTAssertEqual(vm.isPremium, userIsPremium)
    }
    
    // better for random values
    func test_UnitTestingBootcampViewModel_isPremium_shouldInjectedValue_stress() {
        for _ in 0..<100 {
            // Given
            let userIsPremium: Bool = Bool.random()
            
            // When
            let vm = UnitTestingBootcampViewModel(isPremium: userIsPremium)
            
            // Then
            XCTAssertEqual(vm.isPremium, userIsPremium)
        }
    }
    
    func test_UnitTestingBootcampViewModel_dataArray_shouldBeEmpty() {
        // Given
        
        // When we initialize vm
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // Then
        XCTAssertTrue(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 0)
    }
    
    func test_UnitTestingBootcampViewModel_dataArray_shouldAddItems() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When we call the method
        //vm.addItem(item: "hello")
        let loopCount: Int = Int.random(in: 1..<100)
        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString) // creates a random string of 36 characters
        }
        
        // Then
        XCTAssertTrue(!vm.dataArray.isEmpty)
        XCTAssertFalse(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, loopCount)
        XCTAssertNotEqual(vm.dataArray.count, 0)
        XCTAssertGreaterThan(vm.dataArray.count, 0)
    }
    
    func test_UnitTestingBootcampViewModel_dataArray_shouldNotAddBlankString() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When we call the method
        vm.addItem(item: "")
        
        // Then
        XCTAssertTrue(vm.dataArray.isEmpty)
    }
    
    func test_UnitTestingBootcampViewModel_selectedItem_shouldStartAsNil() {
        // Given
        
        
        // When we initialize vm
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // Then
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_UnitTestingBootcampViewModel_selectedItem_shouldBeNilWhenSelectingInvalidItem() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When we call the method (random string is not in array)
        let newItem = UUID().uuidString
        vm.addItem(item: newItem)
        vm.selectItem(item: newItem)
        
        vm.selectItem(item: UUID().uuidString)
        
        // Then
        XCTAssertNil(vm.selectedItem)
    }
    
    func test_UnitTestingBootcampViewModel_selectedItem_shouldBeSelected() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When we call the method (random string is in array)
        let newItem = UUID().uuidString
        vm.addItem(item: newItem)
        vm.selectItem(item: newItem)
        
        // Then
        XCTAssertNotNil(vm.selectedItem)
        XCTAssertEqual(vm.selectedItem, newItem)
    }
    
    func test_UnitTestingBootcampViewModel_selectedItem_shouldBeSelected_stress() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When
        let loopCount: Int = Int.random(in: 1..<100)
        var itemsArray: [String] = []
        
        for _ in 0..<loopCount {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemsArray.append(newItem)
        }
        
        let randomItem = itemsArray.randomElement() ?? ""
        XCTAssertFalse(randomItem.isEmpty)  // to avoid having an empty randomItem
        vm.selectItem(item: randomItem)
        
        // Then
        XCTAssertNotNil(vm.selectedItem)
        XCTAssertEqual(vm.selectedItem, randomItem)
    }
    
    func test_UnitTestingBootcampViewModel_saveItem_shouldThrowError_itemNotFound() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When having several items in dataArray
        let loopCount: Int = Int.random(in: 1..<100)

        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
        
        // Then (try to save a random string not in dataArray)
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString))
        
        XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString), "Should throw Item Not Found error!") { error in
            let returnedError = error as? UnitTestingBootcampViewModel.DataError
            XCTAssertEqual(returnedError, UnitTestingBootcampViewModel.DataError.itemNotFound)
        }
    }
    
    func test_UnitTestingBootcampViewModel_saveItem_shouldThrowError_noData() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When having several items in dataArray
        let loopCount: Int = Int.random(in: 1..<100)

        for _ in 0..<loopCount {
            vm.addItem(item: UUID().uuidString)
        }
        
        // Then (try to save a blank string)
        do {
            try vm.saveItem(item: "")
        } catch let error {
            let returnedError = error as? UnitTestingBootcampViewModel.DataError
            XCTAssertEqual(returnedError, UnitTestingBootcampViewModel.DataError.noData)
        }
    }
    
    func test_UnitTestingBootcampViewModel_saveItem_shouldSaveItem() {
        // Given
        let vm = UnitTestingBootcampViewModel(isPremium: Bool.random())
        
        // When having several items in dataArray
        let loopCount: Int = Int.random(in: 1..<100)
        var itemsArray: [String] = []
        
        for _ in 0..<loopCount {
            let newItem = UUID().uuidString
            vm.addItem(item: newItem)
            itemsArray.append(newItem)
        }
        
        let randomItem = itemsArray.randomElement() ?? ""
        XCTAssertFalse(randomItem.isEmpty)
        
        // Then (try to save a random string that is already in dataArray)
        XCTAssertNoThrow(try vm.saveItem(item: randomItem))
        
        do {
            try vm.saveItem(item: randomItem)
        } catch {
            // test fails if we get here, but we shouldn't because random string is in dataArray
            XCTFail()
        }
    }

}