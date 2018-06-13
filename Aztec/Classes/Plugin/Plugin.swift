import Foundation

/// Plugin base class.  You can implement a subclass to customize some of the behavior in Aztec.
///
open class Plugin {
    
    open class InputCustomizer {
        
        public init() {}
        
        /// Processes an HTML string right before parsing it to convert it into a nodes tree in
        /// the input conversion process.
        ///
        open func process(inputHTML html: String) -> String { return html }
        
        /// Processes a nodes tree right after it's been parsed from a string, and before finalizing
        /// the input conversion process.
        ///
        open func process(inputHTMLTree tree: RootNode) { return }
        
        open func converter(for element: ElementNode) -> ElementConverter? { return nil }
    }
    
    open class OutputCustomizer {
        
        public init() {}
        
        /// Processes an HTML string right after converting it from a nodes tree in the output
        /// conversion process.
        ///
        open func process(outputHTML html: String) -> String { return html }
        
        /// Processes a nodes tree right before it'll bee converted to a string, and before finalizing
        /// the output conversion process.
        ///
        open func process(outputHTMLTree tree: RootNode) { return }
        
        /// Converts a paragraph property into the ElementNode that represents it.
        /// When a conversion is not implemented, just return nil.
        ///
        open func convert(_ paragraphProperty: ParagraphProperty) -> ElementNode? { return nil }
    }
    
    // MARK: - Customizers
    
    public let inputCustomizer: InputCustomizer?
    public let outputCustomizer: OutputCustomizer?
    
    // MARK: - Initializers
    
    public init(inputCustomizer: InputCustomizer? = nil, outputCustomizer: OutputCustomizer? = nil) {
        self.inputCustomizer = inputCustomizer
        self.outputCustomizer = outputCustomizer
    }
    
    /// Method plugins can use to execute extra code when loaded.
    ///
    public func loaded() {}
    

    // MARK: - Equatable
    
    public static func ==(lhs: Plugin, rhs: Plugin) -> Bool {
        return type(of: lhs) == type(of: rhs)
    }
}
