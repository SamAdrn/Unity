//
//  Model.swift
//  Unity
//
//  Created by Matthew Ray Lee on 4/14/23.
//

import Foundation
import HealthKit
import CoreLocation
import MapKit

class Unity: NSObject, ObservableObject {
    // For Step Count
    private var healthStore = HKHealthStore()
    private var healthKitManager = HealthKitManager()
    @Published var userStepCount = 0
    @Published var isAuthorized = false
    @Published var isDarkMode = false
    @Published var isShowingAvatarStore = false
    @Published var isShowingAboutUs = false
    @Published var isShowingContact = false
    
    // Location
    private let locationManager = CLLocationManager()
    /// Contains details of the user's current location
    @Published var location: CLLocation?
    /// Describes a region that is centered on the user's location
    @Published var region = MKCoordinateRegion()
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        changeAuthorizationStatus()

        addItemsToUserDefaults()
        
        print(retrieveStoreItems())
        print("DONE")
    }
    
}

/// Health Features
extension Unity {
    // Authorization Prompt
    func healthRequest() {
        healthKitManager.setUpHealthRequest(healthStore: healthStore) {
            self.changeAuthorizationStatus()
            self.readStepsTakenToday()
        }
    }
    
    func changeAuthorizationStatus() {
        guard let stepQtyType = HKObjectType.quantityType(forIdentifier: .stepCount) else { return }
        let status = self.healthStore.authorizationStatus(for: stepQtyType)
        
        switch status {
        case .notDetermined:
            isAuthorized = false
        case .sharingDenied:
            isAuthorized = false
        case .sharingAuthorized:
            isAuthorized = true
        @unknown default:
            isAuthorized = false
        }
    }
    
    // Get step count
    func readStepsTakenToday() {
        if self.userStepCount == 0 {
            let s = UserDefaults.standard.integer(forKey: "userStepCount")
            if  s == 0 {
                healthKitManager.readStepCount(forToday: Date(), healthStore: healthStore) { step in
                    self.userStepCount = Int(step)
                    UserDefaults.standard.set(self.userStepCount, forKey: "userStepCount")
                }
            } else {
                self.userStepCount = s
                UserDefaults.standard.set(s, forKey: "userStepCount")
            }
        } else {
            self.userStepCount += 1
            UserDefaults.standard.set(self.userStepCount, forKey: "userStepCount")
        }
    }
}

/// Location Manager Delegate
extension Unity: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
        self.region = MKCoordinateRegion(
            center: location.coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
        )
        
        readStepsTakenToday()
    }
}

/// Store Features

public struct StoreItem: Codable, Identifiable {
    
    public var id: UUID { UUID() }
    var symbol: String
    var name: String
    var price: Int
    // Purchased is a Boolean Integer, b/c boolean does not conform to Codable
    var purchased: Int
    
}

extension Unity {
    
    private func addItemsToUserDefaults() {
        let items = [
            StoreItem(symbol: "hare.fill", name: "Bunny", price: 100, purchased: 0),
            StoreItem(symbol: "figure.run.square.stack.fill", name: "Pro Runner", price: 200, purchased: 0),
            StoreItem(symbol: "figure.run", name: "Runner", price: 100, purchased: 0),
            StoreItem(symbol: "moon.circle.fill", name: "Moon Walker", price: 100, purchased: 0),
            StoreItem(symbol: "sun.and.horizon.circle.fill", name: "Early Walker", price: 100, purchased: 0),
            StoreItem(symbol: "figure.walk", name: "Walker", price: 100, purchased: 0),
            StoreItem(symbol: "bicycle", name: "Biker", price: 100, purchased: 0),
            StoreItem(symbol: "figure.pool.swim", name: "Swimmer", price: 100, purchased: 0),
            StoreItem(symbol: "flag.checkered.2.crossed", name: "Racer", price: 100, purchased: 0),
            StoreItem(symbol: "gamecontroller.fill", name: "Gamer", price: 100, purchased: 0),
            StoreItem(symbol: "figure.flexibility", name: "Flexible", price: 100, purchased: 0)
        ]
        
        try? UserDefaults.standard.setCodable(items, forKey: "StoreItems")
    }
    
    func retrieveStoreItems() -> [StoreItem] {
        if let storeItems = UserDefaults.standard.getCodable([StoreItem].self, forKey: "StoreItems") {
            return storeItems
        }
        return []
    }
}

public extension UserDefaults {
    func setCodable<T: Codable>(_ object: T, forKey: String) throws {
        let jsonData: Data = try JSONEncoder().encode(object)
        set(jsonData, forKey: forKey)
    }
    
    func getCodable<T: Codable>(_ oriType: T.Type, forKey: String) -> T? {
        guard let result = value(forKey: forKey) as? Data else {
            return nil
        }
        return try? JSONDecoder().decode(oriType, from: result)
    }
}
