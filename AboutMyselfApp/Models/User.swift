//
//  User.swift
//  AboutMyselfApp
//
//  Created by Abilkaiyr Nurzhan on 11/10/20.
//
import  UIKit

struct User {
    let userName: String
    let password: String
    let fullName: String
    let biography: String
    let friends: Int
    let publications: Int
    let followers: Int
    let city: String
    let country: String
    
}

extension User {
    static func getUser() -> User {
        return
            User(
                userName: "user1",
                password: "123",
                fullName: "Abilkaiyr Nurzhan Zhumagululy",
                biography: "Hi, My name is Nurzhan. I am 21 years old. I have graduated the Kazakh British Technology University in 2020. Now, I am learning IOS mobile development. I am being cool IOSer and sifnificant man in our society. I have some dreams. One day, I will reach them. ",
                friends: 24,
                publications: 12,
                followers: 142,
                city: "Almaty",
                country: "Kazkahstan"
                
            )
        
    }
}
