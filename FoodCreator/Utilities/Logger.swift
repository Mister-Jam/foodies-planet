//
//  Logger.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//
import Foundation
import os.log

public class Logger {

    /// `default`
    /// `info`
    /// `debug`
    /// `error`
    /// `fault`
    
    public static func info(_ message: String) {
        os_log("%{public}@", type: .info, message)
    }
    
    public static func error(_ message: String) {
        os_log("%{private}@", type: .error, message)
    }
    
    public static func `default`(_ message: String) {
        os_log("%{public}@", type: .default, message)
    }
    
    public static func debug(_ message: String) {
        os_log("%{public}@", type: .debug, message)
    }
    
    public static func fault(_ message: String) {
        os_log("%{public}@", type: .fault, message)
    }
}
