//
//  ToDoListItem+CoreDataProperties.swift
//  Project_1
//
//  Created by 김대기 on 2021/02/18.
//
//

import Foundation
import CoreData


extension ToDoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
        return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
    }

    @NSManaged public var createAt: Date?
    @NSManaged public var name: String?

}

extension ToDoListItem : Identifiable {

}
