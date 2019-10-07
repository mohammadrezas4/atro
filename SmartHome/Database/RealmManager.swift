import Foundation
import RealmSwift
import Realm

class RealmManager {
    let realm = try! Realm()
    
    // delete table
    func deleteDatabase(){
        try! realm.write {
            realm.deleteAll()
        }
    }
    // delete particular object
    func deleteObject(objc : Object){
        try! realm.write {
            realm.delete(objc)
        }
    }
    // add particular object
    func addObject(objc : Object){
        try! realm.write {
            realm.add(objc)
        }
    }
    // add array of objects to database
    func addArrayObjects(objs : Object){
        try! realm.write {
            realm.add(objs)
        }
    }
    // edit particular object
    func editObject(objc : Object){
        try! realm.write {
            realm.add(objc)
        }
    }
    // edit array of objects
    func editArrayObjects(objs : Object){
        try! realm.write {
            realm.add(objs)
        }
    }
    // return an array as results
    func getObjects(type: Object.Type) -> Results<Object>?{
        return realm.objects(type)
    }

}
