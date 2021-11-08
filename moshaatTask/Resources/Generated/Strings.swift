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
  /// لاتوجد جلسات
  internal static let noSessions = Strings.tr("Localizable", "noSessions")

  internal enum BookingScreen {
    /// أختر مؤسسة
    internal static let chooseFirm = Strings.tr("Localizable", "bookingScreen.chooseFirm")
    /// أختر الوقت
    internal static let chooseTime = Strings.tr("Localizable", "bookingScreen.chooseTime")
    /// شركة
    internal static let company = Strings.tr("Localizable", "bookingScreen.company")
    /// تأكيد الحجز
    internal static let confirmBooking = Strings.tr("Localizable", "bookingScreen.confirmBooking")
    /// طريقة التواصل
    internal static let contactMethod = Strings.tr("Localizable", "bookingScreen.contactMethod")
    /// أدخل أسم الغرض
    internal static let enterEntityHeadLabel = Strings.tr("Localizable", "bookingScreen.enterEntityHeadLabel")
    /// 
    internal static let enterEntityPlaceHolder = Strings.tr("Localizable", "bookingScreen.enterEntityPlaceHolder")
    /// (بتوقيت المملكة العربية السعودية)
    internal static let ksaTimeZone = Strings.tr("Localizable", "bookingScreen.KSATimeZone")
    /// فى مكان
    internal static let locationMethod = Strings.tr("Localizable", "bookingScreen.locationMethod")
    /// أونلاين
    internal static let onlineMethod = Strings.tr("Localizable", "bookingScreen.onlineMethod")
    /// مشروع
    internal static let project = Strings.tr("Localizable", "bookingScreen.project")
  }

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

  internal enum NoInternet {
    /// تحقق من اتصالك و حاول مرة اخرى
    internal static let checkConnectionLabel = Strings.tr("Localizable", "noInternet.checkConnectionLabel")
    /// لا يوجد اتصال بالانترنت
    internal static let noInternetLabel = Strings.tr("Localizable", "noInternet.noInternetLabel")
    /// محاولة أخرى
    internal static let tryAgainButton = Strings.tr("Localizable", "noInternet.tryAgainButton")
  }

  internal enum ProfileScreen {
    /// نبذة عامة
    internal static let aboutHeader = Strings.tr("Localizable", "profileScreen.aboutHeader")
    /// إهتماماتى
    internal static let interestHeader = Strings.tr("Localizable", "profileScreen.interestHeader")
    /// لا توجد معلومات عن المرشد
    internal static let noConsultantInfo = Strings.tr("Localizable", "profileScreen.noConsultantInfo")
    internal enum SendMsgButton {
      /// ارسال رسالة
      internal static let title = Strings.tr("Localizable", "profileScreen.SendMsgButton.title")
    }
    internal enum SessionsList {
      /// أحجز
      internal static let book = Strings.tr("Localizable", "profileScreen.sessionsList.book")
      /// طلب موعد
      internal static let sessionRequest = Strings.tr("Localizable", "profileScreen.sessionsList.sessionRequest")
      /// الجلسات
      internal static let sessions = Strings.tr("Localizable", "profileScreen.sessionsList.sessions")
      /// تحدث البيانات بداية كل شهر ميلادى
      internal static let update = Strings.tr("Localizable", "profileScreen.sessionsList.update")
    }
    internal enum SessionsListHeader {
      /// التقييم,معلومات عامة,جدول الجلسات
      internal static let tags = Strings.tr("Localizable", "profileScreen.sessionsListHeader.tags")
    }
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
