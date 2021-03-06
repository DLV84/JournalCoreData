//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by Daniel Villedrouin on 1/18/21.
//

import CoreData

extension Entry {
    @discardableResult convenience init (title: String, bodyText: String, timeStamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.timeStamp = timeStamp
    }
}
