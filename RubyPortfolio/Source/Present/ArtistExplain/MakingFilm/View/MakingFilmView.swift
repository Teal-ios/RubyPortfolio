//
//  MakingFilmView.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/10/11.
//

import SwiftUI
import AVKit

struct MakingFilmView: View {
    var body: some View {
        VideoPlayer(player: AVPlayer(url: Bundle.main.url(forResource: "MakingFilm",withExtension: "MP4")!))
    }
}

struct MakingFilmView_Previews: PreviewProvider {
    static var previews: some View {
        MakingFilmView()
    }
}
