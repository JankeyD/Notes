//
//  ServiceResult.swift
//  Notes
//
//  Created by Roman Lazan on 12.01.19.
//  Copyright © 2019 Roman Lazan. All rights reserved.
//


/// Used as a return type for services.
///
/// - success: Will be used if the request was successful. Might contain data as associated value.
/// - failure: Will be used it the request failed. Will contain the error why it failed.
public enum ServiceResult<ResponseType: JSONConvertible> {
    case success(ResponseType?)
    case failure(Error, ResponseType?)
}
