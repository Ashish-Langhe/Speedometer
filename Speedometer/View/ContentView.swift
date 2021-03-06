//
//  ContentView.swift
//  Speedometer
//
//  Created by Ashish Langhe on 12/13/21.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        Home()
    }
}

struct Home:View {
    //MARK: - PROPERTIES
    @State var progress: CGFloat = 0
    
    let colors = [Color("color1"), Color("color2")]
    
    var body: some View {
        
        VStack {
            Meter(progress: self.$progress)
            
            HStack(spacing: 25) {
                Button(action: {
                    if self.progress != 100 {
                        withAnimation(Animation.default.speed(0.55)) {
                            self.progress += 10
                    }
                }
                }) {
                    Text("Update")
                        .padding(.vertical)
                        .frame(width: (UIScreen.main
                                        .bounds.width)/2.5)
                }
                .background(Capsule().stroke(LinearGradient(gradient: .init(colors: self.colors), startPoint: .leading, endPoint: .trailing), lineWidth: 2))
                .padding()
                
                Button(action: {
                    withAnimation(Animation.default.speed(0.55)) {
                        self.progress = 0
                    }
                }) {
                    Text("Reset")
                        .padding(.vertical)
                        .frame(width: (UIScreen.main
                                        .bounds.width)/2.5)
                }
                .background(Capsule().stroke(LinearGradient(gradient: .init(colors: self.colors), startPoint: .leading, endPoint: .trailing), lineWidth: 2))
                .padding()
                
            }
        }
    }
}

struct Meter: View {
    
    //MARK: - PROPERTIES
    @Binding var progress: CGFloat
    let colors = [Color("color1"), Color("color2")]
    
    //MARK: - BODY
    var body: some View {
        
        ZStack {
            ZStack {
                
                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(Color.black.opacity(0.2), lineWidth: 55)
                    .frame(width: 280, height: 280)
                
                Circle()
                    .trim(from: 0, to: self.setProgress())
                    .stroke(AngularGradient(gradient: .init(colors: self.colors), center: .center, angle: .init(degrees: 180)), lineWidth: 55)
                    .frame(width: 280, height: 280)
            }
            .rotationEffect(.init(degrees: 180))
            
            ZStack (alignment: .bottom) {
                self.colors[0]
                    .frame(width: 2, height: 95)
                
                Circle()
                    .fill(self.colors[1])
                    .frame(width: 15, height: 15)
            }
            .offset(y: -35)
            .rotationEffect(.init(degrees: -90))
            .rotationEffect(.init(degrees: self.setArrow()))
        }
        .padding()
        .padding(.bottom, -140)
    }
    
    func setProgress() -> CGFloat {
        let temp = self.progress / 2
        
        return (temp * 0.01)
    }
    
    func setArrow() -> Double {
        let temp = self.progress/100
        return (temp * 180)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
