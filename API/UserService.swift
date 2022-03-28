//
//  UserService.swift
//  TwitterClone
//
//  Created by Yaz Burrell on 2/1/22.
//

import Firebase

struct UserService {
    static let shared = UserService()
    
    func fetchUser(uid: String, completion: @escaping(User) -> Void) {
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
          
            let user = User(uid: uid, dictionary: dictionary)
            completion(user)

        }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void) {
        REF_USERS.observe(.childAdded) { snapshot in
            var users = [User]()
            let uid = snapshot.key
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            let user = User(uid: uid, dictionary: dictionary)
            users.append(user)
            completion(users)
        }
    }
    
    func followUser(uid: String, completion: @escaping(Database, Error?) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        print("DEBUG: Current uid is \(currentUid) started following \(uid)")
        print("DEBUG: Uid \(uid) gained \(currentUid) as a follower")
        
        //REF_USER_FOLLOWING.child(currentUid).updateChildValues(<#T##values: [AnyHashable : Any]##[AnyHashable : Any]#>)
    }
}
