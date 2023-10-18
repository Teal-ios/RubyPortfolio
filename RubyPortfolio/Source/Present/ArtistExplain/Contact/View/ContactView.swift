//
//  ContactView.swift
//  RubyPortfolio
//
//  Created by 이병현 on 2023/10/18.
//

import SwiftUI

struct ContactView: View {
    
    @Environment(\.openURL) var openURL
    @State private var mailData = ComposeMailData(subject: "제목을 입력하세요.",
                                                  recipients: ["gusghk1118@naver.com"],
                                                  message: "작가에게 보낼 메세지를 입력하세요.", attachments: nil
                                                 )
   @State private var showMailView = false
    
    var body: some View {
        ZStack {
            Image("backgroundCut")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                Spacer(minLength: 80)
                
                Image("0. 프로필")
                    .resizable()
                    .frame(width: UIScreen.screenWidth / 2, height: UIScreen.screenWidth / 2)
                    .cornerRadius(UIScreen.screenWidth / 2)
                    .position(x: UIScreen.screenWidth / 2, y: UIScreen.screenHeight / 8)
                
                VStack {
                    Link(destination: URL(string: "https://instagram.com/ruby__studio_?igshid=NTc4MTIwNjQ2YQ==")!) {
                        HStack {
                            Image("Insta_icon")
                                .resizable()
                                .frame(width: 24, height: 24)
                            Text("ruby_studio")
                                .foregroundColor(.rubyWhite)
                        }
                    }
                    
                    Button {
                        showMailView.toggle()
                    } label: {
                        HStack {
                            Image(systemName: "envelope.fill")
                                .resizable()
                                .frame(width: 24, height: 20)
                                .foregroundColor(.rubyWhite)
                            
                            Text("메일")
                                .foregroundColor(.rubyWhite)
                        }
                    }
                    .disabled(!MailView.canSendMail)
                    .sheet(isPresented: $showMailView) {
                        MailView(data: $mailData) { result in
                            print("result")
                        }
                    }
                }
                .frame(height: 80)
                .position(x: UIScreen.screenWidth / 2)
            }
        }
    }
}

extension ContactView {
    func mailto(_ email: String) {
        let mailto = "mailto:\(email)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        print(mailto ?? "")
        if let url = URL(string: mailto!) {
            openURL(url)
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
