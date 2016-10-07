//
//  ResultItem.swift
//  YardClubExercise
//
//  Created by Vincent Chau on 10/7/16.
//  Copyright © 2016 Vincent Chau. All rights reserved.
//

import Foundation

class Result
{
    
    private var _id: Int!
    private var _name: String!
    private var _description: String!
    private var _dailyRate : String!
    private var _weeklyRate : String!
    private var _monthlyRate : String!
    private var _operatedRate : String!
    
    var id: Int
    {
        return self._id
    }
    
    var name: String
    {
        return self._name
    }
    
    var description: String
    {
        return self._description
    }
    
    var dailyRate : String
    {
        return self._dailyRate
    }
    
    var weeklyRate : String
    {
        return self._weeklyRate
    }
    
    var monthlyRate : String
    {
        return self._monthlyRate
    }
    
    var operatedRate : String
    {
        return self._operatedRate
    }
    
    init(id: Int, name: String, descript: String, daily: String, weekly: String, monthly: String, operated: String)
    {
        self._id = id
        self._name = name
        self._description = descript
        self._dailyRate = daily
        self._weeklyRate = weekly
        self._monthlyRate = monthly
        self._operatedRate = operated
    }
    
    
}
