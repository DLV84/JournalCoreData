//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Daniel Villedrouin on 1/18/21.
//

import CoreData

class EntryController {
    
    // Shared Instance
    static let shared = EntryController()
    
    // Source of Truth
    var entries: [Entry] = []
    
    // Fetch Request
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry> (entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    // CRUD
    // Create
    func createEntryWith(title: String, bodyText: String) {
        Entry(title: title, bodyText: bodyText)
        CoreDataStack.saveContext()
    }
    
    // Read
    func fetchEntries() {
        let entries = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        self.entries = entries
    }
    
    // Update
    func updateEntry(entry: Entry, title: String, bodyText: String) {
        entry.title = title
        entry.bodyText = bodyText
        CoreDataStack.saveContext()
    }
    
    // Delete
    func deleteEntry(entry: Entry) {
        guard let indexToDelete = entries.firstIndex(of: entry) else { return }
        entries.remove(at: indexToDelete)
        CoreDataStack.context.delete(entry)
        CoreDataStack.saveContext()
    }
}// end of Class
