import 'package:intl/intl.dart';

abstract final class DateTimeHelper {
  static DateTime now() => DateTime.now();

  static DateTime parse(String dateTime) => DateTime.parse(dateTime).toLocal();

  static DateTime? tryParse(String? dateTime) {
    if (dateTime == null) return null;
    return DateTime.tryParse(dateTime)?.toLocal();
  }

  static String? toIso8601String(DateTime? dateTime, [String? defaultValue]) {
    return dateTime?.toUtc().toIso8601String() ?? defaultValue;
  }

  static bool isAfter(DateTime? startDate, DateTime? endDate) {
    if (endDate == null) return true;
    if (startDate != null) {
      return endDate.isAfter(startDate);
    }
    return false;
  }

  /// Returns month and year in format: "10/23"
  static String formatMonthYearShort(DateTime? date) {
    if (date == null) return '';
    return DateFormat('MM/yy').format(date.toLocal());
  }

  /// Returns date in format: "January 1, 2022"
  static String formatFullDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('MMMM d, yyyy').format(date.toLocal());
  }

  /// Returns date in format: "01/01/2022"
  static String formatShortDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('MM/dd/yyyy').format(date.toLocal());
  }

  /// Returns date in format: "01 - 01 - 2022"
  static String formatShortDashDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('MM - dd - yyyy').format(date.toLocal());
  }

  /// Returns date in format: "1st January, 2022"
  static String formatOrdinalDate(DateTime? date) {
    if (date == null) return '';
    final day = DateFormat('d').format(date.toLocal());
    final suffix = _getDaySuffix(int.parse(day));
    // return DateFormat('d').format(date.toLocal()) +
    return day + suffix + DateFormat(' MMMM, yyyy').format(date.toLocal());
  }

  /// Returns time in format: "12:30 PM"
  static String formatTime(DateTime? date) {
    if (date == null) return '';
    return DateFormat('h:mm a').format(date.toLocal());
  }

  /// Returns datetime in format: "January 1, 2022 12:30 PM"
  static String formatFullDateTime(DateTime? date) {
    if (date == null) return '';
    return DateFormat('MMMM d, yyyy h:mm a').format(date.toLocal());
  }

  /// Returns date in relative format: "2 days ago"
  static String formatRelative(DateTime? date) {
    if (date == null) return '';
    return _formatRelativeTime(date.toLocal());
  }

  /// Returns date in relative format: "2 days ago"
  static String fromNow(DateTime createdAt, DateTime updatedAt) {
    String s = _formatRelativeTime(createdAt.toLocal());
    final edited = createdAt.compareTo(updatedAt) != 0;
    if (edited) s += ' • edited';
    return s;
  }

  /// Returns date in "yyyy-MM-dd" format
  static String formatIso(DateTime? date) {
    if (date == null) return '';
    return DateFormat('yyyy-MM-dd').format(date.toLocal());
  }

  /// Returns day of the week: "Monday"
  static String formatDayOfWeek(DateTime? date) {
    if (date == null) return '';
    return DateFormat('EEEE').format(date.toLocal());
  }

  /// Returns month and year: "January 2022"
  static String formatMonthYear(DateTime? date) {
    if (date == null) return '';
    return DateFormat('MMMM yyyy').format(date.toLocal());
  }

  /// Returns month and year: "Jan 2022"
  static String formatShortMonthYear(DateTime? date) {
    if (date == null) return '';
    return DateFormat('MMM yyyy').format(date.toLocal());
  }

  /// Returns date in format: "01 Jan 2022"
  static String formatMediumDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('dd MMM yyyy').format(date.toLocal());
  }

  /// Returns date in ISO 8601 format: "2022-01-01T12:00:00Z"
  static String formatISO8601(DateTime? date) {
    if (date == null) return '';
    return DateFormat('yyyy-MM-ddTHH:mm:ssZ').format(date.toLocal());
  }

  /// Returns a custom format
  static String formatCustom(DateTime? date, String pattern) {
    if (date == null) return '';
    return DateFormat(pattern).format(date.toLocal());
  }

  /// Helper function to format relative time
  static String _formatRelativeTime(DateTime date) {
    final difference = DateTime.now().difference(date);
    if (difference.inDays > 8) {
      return DateFormat('MMMM d, yyyy').format(date);
    } else if (difference.inDays >= 1) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else {
      return 'just now';
    }
  }

  /// Helper function to get day suffix
  static String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
