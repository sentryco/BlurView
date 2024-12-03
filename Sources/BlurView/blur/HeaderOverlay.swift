#if os(iOS)
import SwiftUI
// import HybridColor
/**
 * This function is used to create a header overlay with a specified height and color saturation. It is commonly used in the UI design of the application.
 * - Description: This function creates a header overlay for a view. The overlay is a rectangle with a specified height and color saturation, typically used to create a frosted glass effect on the header of a view.
 * - Note: if this is set to `safeAreaInsets.top`, it covers the safe area at the top
 * - Note: if height of header is included it covers the header as well
 * - Fixme: ⚠️️ Make headerOverlay etc, add it to a protocol?
 * - Fixme: ⚠️️ Move it to a class? or into Rectangle extension, or view? or make as a modifier?
 * - Fixme: ⚠️️ Or make it a view-modifier?, maybe
 * - Fixme: ⚠️️ We should add the header-overlay from some sort of Container etc, or do we have explate for that elsewhere etc?
 * - Parameters:
 *   - height: The height of the header overlay.
 *   - saturation: The color saturation for the header overlay.
 * - Returns: A view representing the header overlay with the specified height and saturation.
 */
@ViewBuilder public func headerOverlay(height: CGFloat, saturation: Color/* = Color.blackOrWhite.opacity(0.12)*/, shouldIgnoresSafeArea: Bool = true/*, */) -> some View {
   let view = Rectangle() // Create header background (adds the frosted background to header)
      // .background(.green.opacity(0.2)) // debug
      .foregroundColor(.clear)
      // - Fixme: ⚠️️ make this .maxWidth? make sure tests keep running for all platforms etc
      .frame(height: height) // must be in two calls like this
      .frame(
          // There is a small difference between this and heaerheight figure it out later
         maxWidth: .infinity // Set the maximum width of the header overlay to infinity
      )
      // .background(.green) // ⚠️️ debug
      .blurBG(saturation) // 4 and 6 also looks cool we add Blur as a modifier?
      if shouldIgnoresSafeArea {
         view.ignoresSafeArea() // ⚠️️ key to moving bg over safe-area
      } else {
         view
      }
      // Can probably also do: .edgesIgnoringSafeArea(.all)
}
/**
 * Preview
 * - Description: This section provides a preview of the `headerOverlay` function in action. It demonstrates how the function can be used to create a header overlay with a specified height and color saturation. The preview is configured to fit the size of the content and includes padding for better visibility.
 * - Fixme: ⚠️️ Improve the preview, check macos blur-view for better structure etc
 * - Fixme: ⚠️️ The preview doesn't show the effect, fix that
 * - Fixme: ⚠️️ Use modern preview syntax 👈
 */
#Preview {
   headerOverlay(height: 100, saturation: Color.black.opacity(0.12))
//      .previewLayout(.sizeThatFits) // - Fixme: ⚠️️ Why do we need this?
      .padding()
}
#endif
