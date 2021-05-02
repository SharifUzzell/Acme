
import SwiftUI

struct BrowserPage: View, Identifiable{
  
    let id: UUID = UUID()
    
    @ObservedObject var viewModel = WebViewModel()
    
    var body: some View {
        VStack{
            URLBarView(viewModel: viewModel)
            
            HStack{
                WebView(viewModel: viewModel)
            }
            
            BottomNavBarView(viewModel: viewModel)
                .padding(.bottom, 25)
           
        }
        
        
    }
}


//struct BrowserPage_Previews: PreviewProvider {
//    static var previews: some View {
//        BrowserPage()
//
//        BrowserPage()
//            .preferredColorScheme(.dark)
//    }
//}
