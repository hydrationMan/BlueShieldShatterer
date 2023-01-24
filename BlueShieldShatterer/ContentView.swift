//
//  ContentView.swift
//  BlueShieldShatterer
//
//  Created by Hydrate on 6/01/23.
//
import SwiftUI
import Foundation

struct ContentView: View {
    @State private var conditionMet = false
    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink(destination: YourDeviceView()) {
                    Label("Your Device", systemImage: "ipad.and.iphone")
                        .font(.system(size: 15))
                        .padding([.top, .bottom], 15)
                }
                NavigationLink(destination: SettingsView()) {
                    Label("Settings", systemImage: "gear")
                        .font(.system(size: 15))
                        .padding([.top, .bottom], 15)
                }
                NavigationLink(destination: AboutView()) {
                    Label("About", systemImage: "questionmark.app")
                        .font(.system(size: 15))
                        .padding([.top, .bottom], 15)
                }
            }
        } detail: {
            Image(systemName: "ipad.and.iphone")
                .font(.system(size: 60))
            Text("Welcome, connect your device to begin.")
        }
        .frame(minWidth: 600, minHeight: 200)
        //.border(Color.blue, width: 5)
    }
}

struct YourDeviceView: View {
    @State private var commandOutput: String = ""
    @State private var deviceclassoutput: String = ""
    var body: some View {
        VStack {
            Button(action: {
                let task = Process()
                task.launchPath = "/usr/local/bin/ideviceinfo"
                task.arguments = ["-x"]
                
                let pipe = Pipe()
                task.standardOutput = pipe
                task.launch()
                
                let data = pipe.fileHandleForReading.readDataToEndOfFile()
                let output = String(data: data, encoding: String.Encoding.utf8)
                self.commandOutput = output ?? ""
            }) {
                Text("idevice_class test")
            }
        }
    }
}

struct SettingsView: View {
    var body: some View {
        Text("This is the Settings Menu.")
    }
}

struct AboutView: View {
    var body: some View {
        Text("This is the About Menu.")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
