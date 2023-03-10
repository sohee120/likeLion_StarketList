//
//  MoreView.swift
//  starcket
//
//  Created by Sue on 2023/01/05.
//

import SwiftUI

struct MoreView: View {
    @State private var sendOpinionSheet: Bool = false
    @State private var termsofServiceSheet: Bool = false
    @State private var opensourceSheet: Bool = false
    
    func didDismiss() {
        // Handle the dismissing action.
    }
    
    var body: some View {
        List {
            Button {
                sendOpinionSheet.toggle()
            } label: {
                Text("의견 보내기")
            }
            
            
            Button {
                termsofServiceSheet.toggle()
            } label: {
                Text("이용약관 및 개인정보처리 방침 ")
            }
            
            Button {
                opensourceSheet.toggle()
            } label: {
                Text("오픈소스 라이선스")
            }

        }
        .listStyle(.plain)
        .sheet(isPresented: $sendOpinionSheet) {
                SendOpinion(showToggle: $sendOpinionSheet)
                .presentationDetents([.fraction(0.93)])
        }
        .sheet(isPresented: $termsofServiceSheet, onDismiss: didDismiss) {
            WebSheetView(url: "https://glacier-bucket-5c2.notion.site/17a3bda8c13c4bed96dd47049af958cb")
        }
        .sheet(isPresented: $opensourceSheet) {

            WebSheetView(url: "https://glacier-bucket-5c2.notion.site/97fd3519c1ca4bd98201a6dbc208b58e")
        }
        .navigationTitle("기타")
    }
}

struct WebSheetView: View {
    let url: String
    
    var body: some View {
        SafariView(url: URL(string:url)!)
    }
}



struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
