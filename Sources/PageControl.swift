//
//  PageControl.swift
//  PageView
//
//  Created by Kacper on 09/02/2020.
//

import SwiftUI

public struct PageControl: View {
    public var pageCount: Int
    public var theme: PageControlTheme
    @Binding public var selectedPage: Int
    
    public var body: some View {
        HStack {
            ForEach(0..<pageCount) { (i) in
                Circle()
                    .frame(width: self.theme.dotSize, height: self.theme.dotSize)
                    .foregroundColor(self.dotColor(index: i))
            }
        }
            .padding(theme.padding)
            .background(backgroundRect(radius: self.theme.dotSize / 2 + self.theme.padding))
    }
    
    private func dotColor(index: Int) -> Color {
        if index == selectedPage {
            return theme.dotActiveColor
        } else {
            return theme.dotInactiveColor
        }
    }
    
    public func backgroundRect(radius: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: radius)
            .foregroundColor(.black)
    }
}

#if DEBUG
struct PageControl_Previews: PreviewProvider {
    static var previews: some View {
        PageControl(pageCount: 3, theme: .default, selectedPage: .constant(0))
    }
}
#endif
