//
//  WelcomeView.swift
//  Finance_Hope
//
//  Created by Izbassar on 02.10.2023.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var router: HomeCoordinator.Router
    @ObservedObject var viewModel: WelcomeViewModel

    var body: some View {
        VStack {
            Spacer()
            Image("Account")
                .resizable()
                .frame(width: 110, height: 110)
                .padding(.top, 8)
            Text("label_hello")
                .font(.system(size: 22).bold())
                .padding(.top, 8)
            Text("label_hello2")
                .multilineTextAlignment(.center)
                .font(.system(size: 17))
                .padding(.top, 1)
                .padding(.bottom, 16)
            
            Spacer()
            
            Button {
                router.pop()
            } label: {
                HStack {
                    Spacer()
                    VStack {
                        Text("btn_startusign")
                            .font(.system(size: 17))
                            .padding(.top, 6)
                            .padding(.bottom, 6)
                    }
                    Spacer()
                }
                .padding(8)
                .foregroundStyle(.white)
                .background(RoundedRectangle(cornerRadius: 12).fill(Color("AccentColor")))
            }
            .padding()
            
            Spacer()
                .frame(height: 60)
        }.padding()
    }
}

#Preview {
    WelcomeView(viewModel: WelcomeViewModel(managersContainer: .getForPreview()))
}
