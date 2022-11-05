//
//  NewInfoSheet.swift
//  FGRN
//
//  Created by FAITH CHONG RUI EN stu on 5/11/22.
//

import SwiftUI

struct NewInfoSheet: View {
    @State var infos = ""
    @Binding var questions: [Question]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            TextField("enter extra info", text: $infos)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
            Button("save info") {
                // "do something" code to save the todo
                let info = Question(question: "1", input: infos, questionNumber: 1)
                questions.append(info)
                dismiss()
            }
        }
    }
}

struct NewInfoSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewInfoSheet(questions: .constant([]))
    }
}