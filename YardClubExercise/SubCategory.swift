//
//  Subcategory.swift
//  YardClubExercise
//
//  Created by Vincent Chau on 10/7/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import Foundation

class SubCategory
{
    private var _id: Int!
    private var _displayname: String!
    private var _detail: String!
    
    var id: Int
    {
        return self._id
    }
    
    var displayname: String
    {
        return self._displayname
    }
    
    var detail: String
    {
        return self._detail
    }
    
    init(id: Int, display: String, detail: String)
    {
        self._id = id
        self._displayname = display
        self._detail = detail
    }
    
    
}
