// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {
  /// لا توجد نتائج اضافية
  internal static let noOtherResulrs = Strings.tr("Localizable", "noOtherResulrs")

  internal enum Consultant {
    /// متاح جداوله
    internal static let isAvailable = Strings.tr("Localizable", "consultant.isAvailable")
    /// متاح الآن
    internal static let isOnline = Strings.tr("Localizable", "consultant.isOnline")
    /// غير متاح جداوله
    internal static let notAvailable = Strings.tr("Localizable", "consultant.notAvailable")
  }

  internal enum ListScreen {
    /// استفسارات عامة
    internal static let title = Strings.tr("Localizable", "listScreen.title")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
