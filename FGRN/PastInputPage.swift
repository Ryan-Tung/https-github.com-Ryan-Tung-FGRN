//
//  PastInputPage.swift
//  FGRN
//
//  Created by NICOLE TAN YITONG stu on 14/11/22.
//

import SwiftUI

struct PastInputPage: View {
    
    @State var language: Bool
    @State var isInfoGiven = false
    @EnvironmentObject var inputManager: InputDataStore
    
    var body: some View {
        Text(language ? "电子邮件历史。" : "Email History.")
            .font(.largeTitle)
            .fontWeight(.black)
            .padding()
        List {
            ForEach(inputManager.inputs, id: \.self) { inputStruct in
                NavigationLink {
//                    DisplayInfoPage(questionsArray: inputStruct.input, language: language)
                    DisplayHistoryEmailPage(inputInfo: inputStruct, language: language)
                        .navigationBarHidden(true)
                } label: {
                    Text(inputStruct.name)
                }
            }
            .onDelete { indexSet in
                inputManager.inputs.remove(atOffsets: indexSet)
                inputManager.saveInput()
            }
            .onMove { oldOffset, newOffset in
                inputManager.inputs.move(fromOffsets: oldOffset, toOffset: newOffset)
                inputManager.saveInput()
            }
        }

        .onAppear {
            inputManager.loadInput()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
                    .foregroundColor(.textColor)
            }
        }
    }
}

//struct PastInputPage_Previews: PreviewProvider {
//    static var previews: some View {
//        PastInputPage(language: false)
//    }
//}
