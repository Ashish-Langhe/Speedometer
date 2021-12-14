//
//  MeterView.swift
//  Speedometer
//
//  Created by Ashish Langhe on 12/14/21.
//
import SwiftUI

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
            .rotationEffect(.init(degrees: 180))
            
            ZStack (alignment: .bottom) {
                self.colors[0]
                    .frame(width: 2, height: 15)
                
                Circle()
                    .fill(self.colors[0])
                    .frame(width: 15, height: 15)
            }
            .offset(y: -35)
            .rotationEffect(.init(degrees: -90))
        }
        .padding(.bottom, -140)

    }
}

struct MeterView_Previews: PreviewProvider {
    static var previews: some View {
        Meter()
    }
}
