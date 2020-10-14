//
//  CatBreedsDetail.swift
//  FannyCatsSwiftUI
//
//  Created by Oleksandr Solokha on 08.10.2020.
//

import SwiftUI

struct CatBreedsDetail: View {
    //create link with to get url of info about breed
    let link: String
    
    var body: some View {
        //view WebView with load info about breed
        WebView(link: link)
    }
}
