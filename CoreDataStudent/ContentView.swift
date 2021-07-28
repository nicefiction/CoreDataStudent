// ContentView.swift
// SOURCE: https://www.hackingwithswift.com/books/ios-swiftui/how-to-combine-core-data-and-swiftui

import SwiftUI
import CoreData



struct ContentView: View {
   
   // MARK: - PROPERTY WRAPPERS
   // @Environment(\.managedObjectContext) private var viewContext
   @Environment(\.managedObjectContext) var moc
   /// Retrieving information from Core Data is done using a fetch request :
   @FetchRequest(entity: Student.entity(),
                 sortDescriptors: []) var students: FetchedResults<Student>
   
   
   
   // MARK: - COMPUTED PROPERTIES -
   
   var body: some View {
      
      NavigationView {
         List {
            ForEach(students) { (student: Student) in
               Text(student.name ?? "N/A")
            }
         }
         Button("Create Students") {
            let firstnames: [String] = [ "Dorothy", "Ozma", "Glinda", "Olivia" ]
            let lastnames: [String] = [ "Gale", "Yellow", "Magenta", "Blue" ]
            
            let randomFirstname: String = firstnames.randomElement() ?? "N/A"
            let randomLastname: String = lastnames.randomElement() ?? "N/A"
            
            let newStudent: Student = Student(context: self.moc)
            newStudent.id = UUID()
            newStudent.name = "\(randomFirstname) \(randomLastname)"
            try? self.moc.save()
         }
         .padding()
         .navigationBarTitle(Text("CoreData Students"))
      }
   }
}





// MARK: - PREVIEWS -

//struct ContentView_Previews: PreviewProvider {
//
//   static var previews: some View {
//
//      ContentView()
//      ContentView().environment(\.managedObjectContext,
//                                PersistenceController.preview.container.viewContext)
//   }
//}
