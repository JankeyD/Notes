//
//  ServiceResult.swift
//  Notes
//
//  Created by Roman Lazan on 12.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//


enum ServiceResult<ResponseType: JSONConvertible> {
    case success(ResponseType?)
    case failure(Error, ResponseType?)
}
