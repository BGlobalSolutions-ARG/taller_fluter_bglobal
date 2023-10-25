abstract class VersionUtil {
  /// Compares a [version] against [other]
  /// returns negative if [version] is ordered before
  /// positive if [version] is ordered after
  /// 0 if its the same
  /// from `cli_notify`
  static int compareSemver(String version, String other) {
    final regExp = RegExp(
      r'^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)(-[a-zA-Z\d][-a-zA-Z.\d]*)?(\+[a-zA-Z\d][-a-zA-Z.\d]*)?$',
    );
    try {
      if (regExp.hasMatch(version) && regExp.hasMatch(other)) {
        final versionMatches = regExp.firstMatch(version);
        final otherMatches = regExp.firstMatch(other);

        var result = 0;

        if (versionMatches == null || otherMatches == null) {
          return result;
        }

        final isPrerelease = otherMatches.group(4) != null ? true : false;
        // Ignore if its pre-release
        if (isPrerelease) {
          return result;
        }

        for (var idx = 1; idx < versionMatches.groupCount; idx++) {
          final versionMatch = versionMatches.group(idx) ?? '';
          final otherMatch = otherMatches.group(idx) ?? '';
          // PreRelease group

          final versionNumber = int.tryParse(versionMatch);
          final otherNumber = int.tryParse(otherMatch);
          if (versionMatch != otherMatch) {
            if (versionNumber == null || otherNumber == null) {
              result = versionMatch.compareTo(otherMatch);
            } else {
              result = versionNumber.compareTo(otherNumber);
            }
            break;
          }
        }

        return result;
      }

      return 0;
    } on Exception catch (_) {
      
      return 0;
    }
  }
}
