//
//  ContentView.swift
//  Speedometer
//
//  Created by user208584 on 12/13/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Meter()
    }
}

struct Meter: View {
    
    //MARK: - PROPERTIES
    let colors = [Color("color1"), Color("color2")]
    
    //MARK: - BODY
    var body: some View {
        
        ZStack {
            ZStack {
                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(AngularGradient(gradient: .init(colors: self.colors), center: .center, angle: .init(degrees: 180)), lineWidth: 55)
                    .frame(width: 280, height: 280)
            }
        }
        
    }
}
