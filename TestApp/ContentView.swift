//
//  ContentView.swift
//  TestApp
//
//  Created by Akash Kamati on 21/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                shareContent()
            }) {
                Text("Share")
            }
        }
    }

    func shareContent() {
        guard let image = UIImage(named: "frame") else {
            print("Hello from here")
            return
        }
        let text = "This is the text…."
        let shareAll = [image,text] as [Any]
        
        let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
        var rootController: UIViewController? {
            var root = UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController
            while let presentedViewController = root?.presentedViewController {
                root = presentedViewController
            }
            return root
        }
        print("hello world")
        activityViewController.popoverPresentationController?.sourceView = rootController?.view
        rootController?.present(activityViewController, animated: true, completion: nil)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
