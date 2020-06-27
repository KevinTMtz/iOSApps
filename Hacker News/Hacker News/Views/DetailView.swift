//
//  DetailView.swift
//  Hacker News
//
//  Created by Kevin Torres on 27/06/20.
//  Copyright © 2020 Kevin Torres Martínez. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(url: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://hn.algolia.com")
    }
}
