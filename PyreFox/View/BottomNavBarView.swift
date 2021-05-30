import SwiftUI
struct BottomNavBarView: View {
    @ObservedObject var viewModel: WebViewModel
    var body: some View {
        HStack {
            Spacer()
            ZStack {
                HStack {
                    Button(action:{
                        print("LEFT:")
                        viewModel.webViewNavigationPublisher.send(.backward)
                    }) {
                        Image(systemName: "arrow.backward")
                            .font(.system(size:30))
                            .foregroundColor(Color.accentColor)
                            .padding(5)
                        
                    }
                    .padding(.leading, 5)
                    
                    Button(action:{
                        print("RIGHT:")
                        viewModel.webViewNavigationPublisher.send(.forward)
                    }) {
                        Image(systemName: "arrow.forward")
                            .font(.system(size:30))
                            .foregroundColor(Color.accentColor)
                            .padding(5)
                    }
                    .padding(5)
                    .padding(.vertical, 5)

                    Spacer()
                    
                    HStack{
                        Button(action:{
                            print("TAB:")
                        }) {
                            Image(systemName: "square.fill.on.square")
                                .font(.system(size: 35))
                                .foregroundColor(Color.accentColor)
                                .padding(5)
                        }
                    }
                }
                
                Button(action:{
                    print("PLUS:")
                    
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 35))
                        .foregroundColor(Color.accentColor)
                        .padding(5)
                }
                Spacer()
            }
            Spacer()
        }
    }
}

//
//
//struct BottomNavBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        let test : ViewModel = ViewModel()
//
//        BottomNavBarView(viewModel: test).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//            .previewDevice("iPhone 12 Pro")
//
//        BottomNavBarView(viewModel: test).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
//            .previewDevice("iPhone 12 Pro")
//    }
//}
//
//
