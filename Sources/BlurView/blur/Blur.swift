#if os(iOS)
import SwiftUI
import UIKit
/**
 * This is the hack to get EffectView to swiftUI (only for iOS)
 * - Description: A SwiftUI view that wraps a UIVisualEffectView for iOS. It applies a blur effect to the background of the view it's applied to, creating a frosted glass effect. The tinting color of the blur effect can be customized.
 * - Note: Used in `HeaderOverlay`
 * - Note: ref: https://stackoverflow.com/questions/56610957/is-there-a-method-to-blur-a-background-in-swiftui/60315146#60315146
 * - Note: ref: https://betterprogramming.pub/build-a-glassmorphism-login-screen-using-swiftui-materials-b909b1527414
 * - Fixme: ⚠️️ Make all this as a view modifier? or?
 * - Fixme: ⚠️️ Move into multiple files?
 */
fileprivate struct BlurView: UIViewRepresentable {
   /**
    * The tinting color for the blur effect.
    * - Description: The color used to tint the blur effect, allowing customization of the blur appearance to match the app's design theme.
    */
   fileprivate var tintingColor: Color
   /**
    * Creates and configures a UIVisualEffectView for the BlurView.
    * - Description: This function creates and configures a UIVisualEffectView instance for the BlurView. It uses the provided context to access necessary information and applies the tinting color to the UIVisualEffectView to achieve the desired blur effect.
    * - Parameter context: The context containing the coordinator and other necessary information for creating the UIVisualEffectView.
    * - Returns: The configured UIVisualEffectView instance.
    */
   fileprivate func makeUIView(context: Context) -> UIVisualEffectView {
      // Initializes an EffectView with the tintingColor converted to a UIColor
      EffectView(tintingColor: .init(tintingColor))
   }
   /**
    * Updates the UIView with the latest state from the context.
    * - Description: This function updates the provided UIVisualEffectView instance with the latest state from the context. It sets the blur effect style to regular, which creates a light blur effect that is appropriate for most use cases.
    * - Parameters:
    *   - uiView: The UIVisualEffectView to be updated.
    *   - context: The context containing the latest state.
    */
   fileprivate func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
      uiView.effect = UIBlurEffect(style: .regular) // Sets the blur effect style to regular
   }
}
/**
 * Modifier helper to make things more readable
 * - Description: The `BlurModifier` is a custom view modifier that applies a `BlurView` as a background to any SwiftUI view. The blur effect uses the specified `tintingColor` to create a frosted glass look, adding visual depth and focus to the content layered on top of it.
 * - Fixme: ⚠️️ Rename to something else later, like?
 */
fileprivate struct BlurModifier: ViewModifier {
   /**
    * The tinting color for the blur effect.
    * - Description: The color used to tint the blur effect, allowing customization of the blur appearance to match the app's design theme.
    */
   fileprivate var tintingColor: Color
   /**
    * Applies the BlurView to the content view.
    * - Description: This modifier wraps the content view with a BlurView, which overlays a UIVisualEffectView configured with a UIBlurEffect. The tintingColor is applied to the blur effect, creating a visually appealing backdrop that enhances the focus on the content.
    * - Parameter content: The content view to apply the BlurView to.
    * - Returns: The modified content view with the BlurView applied.
    */
   fileprivate func body(content: Content) -> some View {
      content
         .background(BlurView(tintingColor: tintingColor)) // This is primary with 0.8 for light mode
   }
}
/**
 * Conventient
 * - Example: To apply a blur effect with a blue tint to a `Text` view, use:
 *   ```swift
 *   Text("Blurred Text")
 *       .blurBG(.blue.opacity(0.5))
 *   ```
 */
extension View {
   /**
    * Applies a blur effect to the background of the view with a specified tint color.
    * - Description: This modifier applies a blur effect to the background of the view, using the specified tint color to achieve a frosted glass appearance. It can enhance the visual hierarchy by softening the background and bringing focus to the foreground content.
    * - Fixme: ⚠️️ Rename to something else later, like?
    * - Parameter tintingColor: The color to tint the blur effect with.
    * - Returns: A view with the blur effect applied to its background.
    */
   public func blurBG(_ tintingColor: Color) -> some View {
      // - Fixme: ⚠️️ We can do .subTitle here with a view-modifer for Text
      let modifier = BlurModifier(tintingColor: tintingColor)
      return self.modifier(modifier)
   }
   /**
    * Adds support for safe-area (when adding blur, the color doesnt seem to spill into the safe-area like regular colors or materials, so we have to start it from the top of the safe-area)
    */
   @ViewBuilder public func blurBackground(_ tintingColor: Color, shouldIgnoresSafeArea: Bool = true) -> some View {
      let view = self.blurBG(tintingColor)
      if shouldIgnoresSafeArea {
         view.ignoresSafeArea() // ⚠️️ key to moving bg over safe-area
      } else {
         view
      } // Can probably also do: .edgesIgnoringSafeArea(.all)
   }
}
/**
 * Preview
 * - Description: This section provides a preview of the `BlurView` modifier in action. It demonstrates how the blur effect with a specified tint color can be applied to a SwiftUI view, in this case, a `Text` view with the text "Hello, World!". The preview is configured to fit the size of the content and includes padding for better visibility.
 * - Fixme: ⚠️️ This needs better structure etc
 * - Fixme: ⚠️️ It doesn't show the effect etc?
 */
#Preview {
   VStack {
      Text("Hello, World!")
         .blurBG(.black.opacity(0.6))
   }
//   .previewLayout(.sizeThatFits)
   .padding()
}
#endif
