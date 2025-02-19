//
//  NetworkRequestDelegate.swift
//  FoodCreator
//
//  Created by James Tochukwu Nwankwo on 18/02/2025.
//
import Foundation

protocol NetworkRequestDelegate: AnyObject {
    func showLoader(status: Bool)
    func showErrorPopup(message: String)
}
