//
//  UserService.swift
//  TwitterClone
//
//  Created by Yaz Burrell on 2/1/22.
//

import Firebase
import UIKit

typealias DatabaseCompletion = ((Error?, DatabaseReference) -> Void)

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
    
    func followUser(uid: String, completion: @escaping(DatabaseCompletion)) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        print("DEBUG: Current uid is \(currentUid) started following \(uid)")
        print("DEBUG: Uid \(uid) gained \(currentUid) as a follower")
        
        REF_USER_FOLLOWING.child(currentUid).updateChildValues([uid : 1]) { err, ref in
            REF_USER_FOLLOWERS.child(uid).updateChildValues([currentUid : 1], withCompletionBlock: completion)
        }
    }
    
    func unfollow(uid: String, completion:  @escaping(DatabaseCompletion)) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        REF_USER_FOLLOWING.child(currentUid).child(uid).removeValue() { (err, ref) in
            REF_USER_FOLLOWERS.child(uid).child(currentUid).removeValue(completionBlock: completion)
        }
    }
    
    func checkIfUserIsFollowed(uid: String, completion: @escaping(Bool) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        REF_USER_FOLLOWING.child(currentUid).child(uid).observeSingleEvent(of: .value) { snapshot in
            print("DEBUG: User is followed is \(snapshot.exists())")
            completion(snapshot.exists())
        }
    }
    
    func fetchUserStats(uid: String, completion: @escaping(UserRelationStats) -> Void) {
        REF_USER_FOLLOWERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            let followers = snapshot.children.allObjects.count
            
            REF_USER_FOLLOWING.child(uid).observeSingleEvent(of: .value) { snapshot in
                let following = snapshot.children.allObjects.count
                
                let stats = UserRelationStats(followers: followers, following: following)
                completion(stats)
            }
  
        }
    }
}
