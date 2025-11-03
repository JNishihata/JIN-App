//
//  JinWidgetBundle.swift
//  JinWidget
//
//  Created by Jintaro Nishihata on 2025/03/30.
//

import WidgetKit
import SwiftUI

@main
struct JinWidgetBundle: WidgetBundle {
    var body: some Widget {
        JinWidget()
        JinWidgetControl()
        JinWidgetLiveActivity()
    }
}
