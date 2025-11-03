//
//  version.swift
//  JIN App
//
//  Created by Jintaro Nishihata on 2025/03/03.
//

import SwiftUI
import Foundation

struct Version: Codable{
    var version: String
    var features: String
}

struct VersionGroup: Codable{
    var group: String
    var info: [Version]
}

struct VersionInfo: Codable{
    var versions: [VersionGroup]
}

func loadVersionInfo() -> VersionInfo?{
    guard let url = Bundle.main.url(forResource: "version_info", withExtension: "json") else{
        print("File not found")
        return nil
    }
    do{
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let versionInfo = try decoder.decode(VersionInfo.self, from: data)
        return versionInfo
    }catch {
        print("Error decoding JSON: \(error)")
        return nil
    }
}

struct version: View {
    @State private var versionInfo: VersionInfo? = loadVersionInfo()
    var body: some View {
        NavigationStack{
            if let versionInfo = versionInfo{
                List{
                    ForEach(versionInfo.versions, id: \.group){ versionGroup in
                        Section(header: Text(versionGroup.group)){
                            ForEach(versionGroup.info, id: \.version){ version in
                                    Text("\(version.version)")
                                        .bold()
                                    Text(version.features)
                            }
                        }
                    }
                }.navigationTitle("Version Information")
            }else{
                Text("Failed to load file")
                    .padding()
            }
        }
    }
}

struct version_Previews: PreviewProvider {
    static var previews: some View {
        version()
    }
}
