//
//  SidebarSpacesView.swift
//  Mactrix
//
//  Created by Viktor Strate Kløvedal on 31/10/2025.
//

import SwiftUI

struct SpaceIcon: View {
    let selected: Bool
    
    var body: some View {
        ZStack {
            Text("A")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
            .aspectRatio(1.0, contentMode: .fit)
            .background(.red)
            .cornerRadius(6)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color(NSColor.controlAccentColor).opacity(selected ? 1 : 0), lineWidth: 3)
            )
    }
}

struct SidebarSpacesView: View {
    let spaces = ["First Space", "Second Space", "Third Space"]
    @State private var selectedSpace: String = "First Space"
    
    var body: some View {
        List(spaces, id: \.self, selection: $selectedSpace) { space in
            SpaceIcon(selected: space == selectedSpace)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
                .listRowBackground(Color(NSColor.controlBackgroundColor))
        }
        .listStyle(.plain)
        .padding(.top, 6)
        .frame(width: 56)
        .background(Color(NSColor.controlBackgroundColor))
        .overlay( Divider()
            .frame(maxWidth: 1, maxHeight: .infinity)
            .background(Color(NSColor.separatorColor)), alignment: .trailing)
    }
}

#Preview {
    SidebarSpacesView()
}
