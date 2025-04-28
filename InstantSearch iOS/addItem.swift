//
//  addItem.swift
//  InstantSearch iOS
//
//  Created by 櫻井絵理香 on 2025/04/28.
//

import SwiftUI
import FirebaseFirestore

struct AddItemView: View {

    @State private var itemName: String = ""
    let db = Firestore.firestore()

    var body: some View {
        VStack(spacing: 20) {
            TextField("商品名を入力", text: $itemName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("商品を追加") {
                addItem()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }

    func addItem() {
        let newItem = ["name": itemName]

        db.collection("items").addDocument(data: newItem) { error in
            if let error = error {
                print("エラー: \(error.localizedDescription)")
            } else {
                print("商品を追加しました！")
                itemName = ""
            }
        }
    }
}
