//
//  ListView.swift
//  ObservableDemo
//
//  Created by taemmy on 2020/12/21.
//  Copyright © 2020 tm. All rights reserved.
//

import SwiftUI
struct ToDoItem : Identifiable {
    var id = UUID()
    var task : String
    var imageName : String
}

var sectionItem : [String] = ["Setting","Item List"]
var listItem : [ToDoItem] = [ToDoItem(task: "Take out trash", imageName: "just"),
                             ToDoItem(task: "Take out trash", imageName: "just"),
                             ToDoItem(task: "Take out trash", imageName: "just"),
                             ToDoItem(task: "Take out trash", imageName: "just"),
                             ToDoItem(task: "Wash your car", imageName: "just")
]

struct ListView: View {
    @State var toggleStatus = true
    var body: some View {
        //        List{
        //            Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
        //            Text("Hello World!")
        //            Text("Hello World!")
        //            Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
        //            Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
        //        }
        //        List(listItem) { item in
        //            HStack{
        //                Text(item.task)
        //                Text(item.imageName)
        //            }
        //        }
        NavigationView{
            List{
                
                Section(header: Text("Setting")){
                    Toggle(isOn: $toggleStatus) {
                        Text("Allow Notifiication")
                    }
                }
                Section(header: Text("Item List")){
                    ForEach(listItem){
                        item in
                        HStack{
                            NavigationLink(destination: Text(item.task)){
                                Text(item.task)
                                Text(item.imageName)
                            }
                        }
                    }
                .onDelete(perform: deletItem)
                .onMove(perform: moveItem)
                }
            }
            .navigationBarTitle(Text("To Do List"))
            .navigationBarItems(trailing: EditButton())
        }
    }
}
func moveItem(from source: IndexSet, to destination: Int){
    
}
func deletItem(at offsets: IndexSet){
    //데이터 소스에서 삭제 코드
    
}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

