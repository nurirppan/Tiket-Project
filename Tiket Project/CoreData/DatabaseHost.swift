//
//  DatabaseHost.swift
//  Tiket Project
//
//  Created by Nur Irfan Pangestu on 20/11/20.
//

import Foundation
import CoreData

class DatabaseHost {
    static let shared = DatabaseHost()
    private init() { }
    
    final lazy var host: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Activity_Management_System")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}

class DatabaseKit<T: NSManagedObject> {
    
    final var context: NSManagedObjectContext {
        return DatabaseHost.shared.host.viewContext
    }
}
