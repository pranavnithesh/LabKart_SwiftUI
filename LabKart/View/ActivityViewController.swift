//
//  ActivityViewController.swift
//  LabKart
//
//  Created by M1089943 on 24/06/22.
//

import UIKit
import SwiftUI

struct ActivityViewController: UIViewControllerRepresentable {
    // MARK: - Properties
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil
    
    // MARK: - Functions
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}
}
