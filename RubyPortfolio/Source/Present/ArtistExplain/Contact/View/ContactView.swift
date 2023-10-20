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
    @State  var shouldShowToast: Bool = false
    
    
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
                            print("메일보냄")
                            shouldShowToast = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                shouldShowToast = false
                            }
                        }
                    }
                }
                .frame(height: 80)
                .position(x: UIScreen.screenWidth / 2)
                
                Spacer()
                
                if shouldShowToast {
                    Text(" 성공적으로 메일을 보냈습니다. ")
                        .background(Color(red: 1/255, green: 1/255, blue: 1/255, opacity: 0.6))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    
                } else {
                    Text(" 성공적으로 메일을 보냈습니다. ")
                        .background(Color(red: 1/255, green: 1/255, blue: 1/255, opacity: 0.6))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .hidden()
                }
                    
                
                Spacer()
                Spacer()
                Spacer()

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
