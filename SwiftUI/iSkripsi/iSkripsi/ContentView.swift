//
//  ContentView.swift
//  iSkripsi
//
//  Created by Muhammad Syahril on 12/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var animate = false
    @State var endSplash = false
    
    var body: some View {
        ZStack {
            Home()
            ZStack {
                Color("bg")
                
                Image("logo")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 200, height: animate ? nil : 200)
                
                //sacling view
                    .scaleEffect(animate ? 3 : 1)
                    .frame(width: UIScreen.main.bounds.width)
            }
            .ignoresSafeArea(.all, edges: .all)
            .onAppear(perform: animateSplash)
            .opacity(endSplash ? 0 : 1)
        }
    }
    
    func animateSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
            withAnimation(Animation.easeOut(duration: 2)) {
                animate.toggle()
            }
            withAnimation(Animation.linear(duration: 0.75)) {
                endSplash.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home: View {
    var body: some View {
        VStack {
            HStack {
                Text("iSkripsi")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("bg"))
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.white)
            Spacer()
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.white).ignoresSafeArea(.all, edges: .all)
    }
}
